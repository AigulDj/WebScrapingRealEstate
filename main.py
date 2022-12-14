from datetime import datetime, timedelta

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By

from gsheets import GoogleSheets

from models import Apartment, Crud

MAX_PAGE_NUM = 1
TODAY = datetime.now().strftime("%d-%m-%Y")
YESTERDAY = (datetime.now() - timedelta(1)).strftime("%d-%m-%Y")
CHROME_DRIVER_PATH = "chromedriver"
gsheet = GoogleSheets()


def set_chrome_options():
    """Sets chrome options for Selenium.
    Chrome options for headless browser is enabled.
    """
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    return chrome_options

s = Crud().Session()

# Change it to Base.metadata.create_all(engine) if no need to delete previous data in the table
Crud().recreate_database()  
driver = webdriver.Chrome(options=set_chrome_options())

for num in range(1, MAX_PAGE_NUM + 1):
    page_num = f"page-{num}"
    kijiji_URL = f"https://www.kijiji.ca/b-apartments-condos/city-of-toronto/{page_num}/c37l1700273"
    driver.get(kijiji_URL)

    # Parse & retrieve data, get list of selenium objects.
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

    # ************** Save to DB **************
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

    # ************** Save to Google Sheet **************
    data = [images, titles, dates, locations, bedrooms, descriptions, prices, currencies]
    gsheet.append_data(data)

s.close()
driver.quit()
