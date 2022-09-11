import os
import requests
from datetime import datetime, timedelta

from selenium import webdriver
from selenium.webdriver.common.by import By

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from dotenv import load_dotenv

load_dotenv()

''' To retrieve total number of pages on the website, I can use regex like below, but taking into account that 
it is stationary number I just preferred to hardcode it. 

total_pgs_str = driver.find_element(By.CLASS_NAME, "resultsShowingCount-1707762110")
total_pgs = (re.search("of(.*)results", total_pgs_str.text)).group(1)
MAX_PAGE_NUM = int(total_pgs)//40
'''


TODAY = datetime.now().strftime("%d-%m-%Y")
YESTERDAY = (datetime.now() - timedelta(1)).strftime("%d-%m-%Y")
CHROME_DRIVER_PATH = "chromedriver"

MAX_PAGE_NUM = 16
PASSWORD = os.getenv('PASSWORD')
# Scheme: "postgresql+psycopg2://<USERNAME>:<PASSWORD>@<IP_ADDRESS>:<PORT>/<DATABASE_NAME>"
DATABASE_URI = f'postgresql+psycopg2://postgres:{PASSWORD}@localhost:5432/apartments'

Base = declarative_base()
engine = create_engine(DATABASE_URI)
Session = sessionmaker(bind=engine)  # To interact with the new table created
s = Session()
driver = webdriver.Chrome(executable_path=CHROME_DRIVER_PATH)


def recreate_database():
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)


class Apartment(Base):
    __tablename__ = "apartments"
    id = Column(Integer(), primary_key=True)
    Image = Column(String())
    Title = Column(String(), nullable=False)
    Date = Column(String())
    Location = Column(String())
    Bedroom = Column(String())
    Description = Column(String())
    Price = Column(String())
    Currency = Column(String())

    def __repr__(self):
        return f"<Apartment(image='{self.Image}', title='{self.Title}', date='{self.Date}', " \
               f"location='{self.Location}', bedroom='{self.Bedroom}', description='{self.Description}', " \
               f"price='{self.Price}', currency='{self.Currency}')>"


recreate_database()  # Change it to Base.metadata.create_all(engine) if no need to delete previous data in the table

for num in range(1, MAX_PAGE_NUM + 1):
    page_num = f"page-{num}"
    kijiji_URL = f"https://www.kijiji.ca/b-apartments-condos/city-of-toronto/{page_num}/c37l1700273"
    driver.get(kijiji_URL)

    # Pars & retrieve data, get list of selenium objects.
    images = driver.find_elements(By.CSS_SELECTOR, ".image img")
    titles = driver.find_elements(By.CSS_SELECTOR, '.title a')
    dates = driver.find_elements(By.CLASS_NAME, "date-posted")
    locations = driver.find_elements(By.CSS_SELECTOR, ".location span:not(.date-posted)")
    bedrooms = driver.find_elements(By.CLASS_NAME, "bedrooms")
    descriptions = driver.find_elements(By.CLASS_NAME, "description")
    prices = driver.find_elements(By.CLASS_NAME, "price")
    currencies = driver.find_elements(By.CLASS_NAME, "price")

    # Convert selenium objects to strings & return readable data.
    images = [img.get_attribute('data-src') if img else img.get_attribute('src') for img in images]
    titles = [title.text for title in titles]
    dates = [TODAY if "ago" in date.text else YESTERDAY if "Yesterday" in date.text else date.text.replace('/', '-') for
             date in dates]
    locations = [loc.text for loc in locations]
    bedrooms = [bed.text for bed in bedrooms]
    descriptions = [des.text for des in descriptions]
    prices = [price.text[1:] if price.text != "Please Contact" else "n/a" for price in prices]
    currencies = [cur.text[0] for cur in currencies]

    for i in range(len(titles)):
        apartment = Apartment(
            Image=images[i],
            Title=titles[i],
            Date=dates[i],
            Location=locations[i],
            Bedroom=bedrooms[i],
            Description=descriptions[i],
            Price=prices[i],
            Currency=currencies[i]
        )
        s.add(apartment)
    s.commit()

    # ************** Upload data into Google Sheet **************
    SHEET_ENDPOINT = "https://api.sheety.co/38e04257acb33302247cfa32529cf529/apartments/add"
    try:
        for i in range(len(titles)):
            body = {
                "add": {             # Don't forget to change 'add' to your sheet name
                    "id": i + 1,
                    "image": images[i],
                    "title": titles[i],
                    "date": dates[i],
                    "location": locations[i],
                    "bedroom": bedrooms[i],
                    "description": descriptions[i],
                    "price": prices[i],
                    "currency": currencies[i]
                }
            }
            sheet_response = requests.post(url=SHEET_ENDPOINT, json=body)
    except requests.exceptions.MissingSchema:
        print('Invalid SHEET_ENDPOINT URL. Valid URL structure is https://api.sheety.co/username/projectName/sheetName')

s.close()

driver.quit()