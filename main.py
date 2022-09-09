import os
# import time
from datetime import datetime, timedelta

from selenium import webdriver
from selenium.webdriver.common.by import By

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from dotenv import load_dotenv


load_dotenv()

MAX_PAGE_NUM = 21
TODAY = datetime.now().strftime("%d/%m/%Y")
YESTERDAY = (datetime.now() - timedelta(1)).strftime("%d/%m/%Y")
PASSWORD = os.getenv('PASSWORD')
CHROME_DRIVER_PATH = "chromedriver"
# Scheme: "postgres+psycopg2://<USERNAME>:<PASSWORD>@<IP_ADDRESS>:<PORT>/<DATABASE_NAME>"
DATABASE_URI = f'postgresql+psycopg2://postgres:{PASSWORD}@localhost:5432/apartments'

Base = declarative_base()
engine = create_engine(DATABASE_URI)
Session = sessionmaker(bind=engine)
s = Session()
driver = webdriver.Chrome(executable_path=CHROME_DRIVER_PATH)


# *************************** MODELS ***************************

class Apartment(Base):
    __tablename__ = "apartments"
    id = Column(Integer(), primary_key=True)
    image = Column(String())
    title = Column(String(), nullable=False)
    date = Column(String())
    location = Column(String())
    bedroom = Column(String())
    description = Column(String())
    price = Column(String())
    currency = Column(String())

    def __repr__(self):
        return f"<Apartment(image='{self.image}', title='{self.title}', date='{self.date}', " \
               f"location='{self.location}', bedroom='{self.bedroom}', description='{self.description}', " \
               f"price='{self.price}', currency='{self.currency}')>"


Base.metadata.create_all(engine)

# *************************** CONFIG CRUD ***************************

for num in range(1, MAX_PAGE_NUM + 1):
    page_num = f"page-{num}"
    KIJIJI_URL = f"https://www.kijiji.ca/b-apartments-condos/city-of-toronto/{page_num}c37l1700273"
    driver.get(KIJIJI_URL)
    # time.sleep(10)

# Pars & retrieve data, get selenium objects.
    images = driver.find_elements(By.CSS_SELECTOR, ".image img")
    titles = driver.find_elements(By.CSS_SELECTOR, '.title a')
    dates = driver.find_elements(By.CLASS_NAME, "date-posted")
    locations = driver.find_elements(By.CSS_SELECTOR, ".location span:not(.date-posted)")
    beds = driver.find_elements(By.CLASS_NAME, "bedrooms")
    descriptions = driver.find_elements(By.CLASS_NAME, "description")
    prices = driver.find_elements(By.CLASS_NAME, "price")
    currencies = driver.find_elements(By.CLASS_NAME, "price")

# Convert selenium objects into strings & return readable data.
    image = [img.get_attribute('data-src') if True else "n/a" for img in images]
    title = [title.text for title in titles]
    date = [TODAY if "ago" in date.text else YESTERDAY if "Yesterday" in date.text else date.text for date in dates]
    location = [loc.text for loc in locations]
    bedroom = [bed.text for bed in beds]
    description = [des.text for des in descriptions]
    price = [price.text[1:] if price.text != "Please Contact" else "n/a" for price in prices]
    currency = [cur.text[0] for cur in currencies]

    for i in range(len(title) - 1):
        apartment = Apartment(
                image=image[i],
                title=title[i],
                date=date[i],
                location=location[i],
                bedroom=bedroom[i],
                description=description[i],
                price=price[i],
                currency=currency[i]
        )
        s.add(apartment)
        s.commit()
s.close()

driver.quit()
