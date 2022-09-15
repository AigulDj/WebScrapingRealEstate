from googleapiclient.discovery import build
from google.oauth2 import service_account

import os
from datetime import datetime, timedelta

from selenium import webdriver
from selenium.webdriver.common.by import By

from dotenv import load_dotenv

load_dotenv()

MAX_PAGE_NUM = 1
TODAY = datetime.now().strftime("%d-%m-%Y")
YESTERDAY = (datetime.now() - timedelta(1)).strftime("%d-%m-%Y")
PASSWORD = os.getenv('PASSWORD')
CHROME_DRIVER_PATH = "chromedriver"

driver = webdriver.Chrome(executable_path=CHROME_DRIVER_PATH)

for num in range(1, MAX_PAGE_NUM + 1):
    page_num = f"page-{num}"
    KIJIJI_URL = f"https://www.kijiji.ca/b-apartments-condos/city-of-toronto/{page_num}/c37l1700273"
    driver.get(KIJIJI_URL)

    # Pars & retrieve data, get list of selenium objects.
    images = driver.find_elements(By.CSS_SELECTOR, ".image img")
    titles = driver.find_elements(By.CSS_SELECTOR, '.title a')
    dates = driver.find_elements(By.CLASS_NAME, "date-posted")
    locations = driver.find_elements(By.CSS_SELECTOR, ".location span:not(.date-posted)")
    bedrooms = driver.find_elements(By.CLASS_NAME, "bedrooms")
    descriptions = driver.find_elements(By.CLASS_NAME, "description")
    prices = driver.find_elements(By.CLASS_NAME, "price")
    currencies = driver.find_elements(By.CLASS_NAME, "price")

    driver.quit()

    # Convert selenium objects to strings & return readable data.
    images = [img.get_attribute('data-src') if True else "n/a" for img in images]
    titles = [title.text for title in titles]
    dates = [TODAY if "ago" in date.text else YESTERDAY if "Yesterday" in date.text else date.text.replace('/', '-') for
             date in dates]
    locations = [loc.text for loc in locations]
    bedrooms = [bed.text for bed in bedrooms]
    descriptions = [des.text for des in descriptions]
    prices = [price.text[1:] if price.text != "Please Contact" else "n/a" for price in prices]
    currencies = [cur.text[0] for cur in currencies]

    # Google Sheets ************************************************************************
    SERVICE_ACCOUNT_FILE = 'keys.json'
    SCOPES = ['https://www.googleapis.com/auth/spreadsheets']
    creds = None
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)

    service = build('sheets', 'v4', credentials=creds)
    SPREADSHEET_ID = '1wE2kuOx2FPzp9F89Qxj0HVPTa-1rn67MQLSIVawZSC8'
    sheet = service.spreadsheets()

    values = [images, titles, dates, locations, bedrooms, descriptions, prices, currencies]

    value_range_body = {
        'majorDimension': 'COLUMNS',
        'values': values
    }

    request = sheet.values().append(spreadsheetId=SPREADSHEET_ID, range="Sheet1!A2",
                                    valueInputOption="USER_ENTERED", body=value_range_body)
    response = request.execute()



