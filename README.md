# AigulDjon_Data-Ox_Test
## Test Project

Web scraping of [kijiji](https://www.kijiji.ca/b-apartments-condos/city-of-toronto/c37l1700273) website
to collect all the data of apartment rental ads from multiple pages.

## Tools used:
- Python
- Selenium webdriver
- SQLAlchemy
- PostgreSQL

## How to Install and Run the Project

To start and project you have to:
- Install the requirements (pip install -r requirements.txt)
- The version of Chromedriver in the root folder must match the version of Chrome on your computer 
- Change the value of the PASSWORD variable to your own PostgreSQL server password, if you have different database settings, use the scheme to construct the URI
- Control the amount of data retrieved by changing the value of MAX_PAGE_NUM
- Run main.py

To upload data to google sheets I used [Sheety](https://sheety.co/). To use that service you have to:
- Create google sheet and fill the head row (id	Image	Title	Date	Location	Bedroom	Description	Price	Currency)
- Log into Sheety with your Google Account (the same account that owns the Google Sheet you where you are going to upload data). Make sure the email matches your Google Sheet and Sheety Account.
- Using the [Sheety Documentations](https://sheety.co/docs/project) get your own Sheety API URL which looks like '//api.sheety.co/username/projectName/sheetName' and use it as a value of SHEET_ENDPOINT variable.




