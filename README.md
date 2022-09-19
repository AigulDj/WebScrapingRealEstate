# AigulDjon_Data-Ox_Test
## Test Project

Web scraping of [kijiji](https://www.kijiji.ca/b-apartments-condos/city-of-toronto/c37l1700273) website
to collect all the data of apartment rental ads from multiple pages.

## Tools used:
- Python
- Selenium 
- SQLAlchemy
- PostgreSQL
- Google Sheets API 

## How to Install and Run the Project (without using Dockerfile)

To start and run the project you have to:
- Install the requirements (pip install -r requirements.txt)
- Change the value of the PASSWORD variable to your own PostgreSQL server password, if you have different database settings, use the scheme to construct the URI
- Control the amount of data retrieved by changing the value of MAX_PAGE_NUM
- Run main.py

To upload data to google sheets you need to create your own:
- Google spreadsheet. Fill in the head row (id	Image	Title	Date	Location	Bedroom	Description	Price	Currency)
- SPREADSHEET_ID
- SERVICE_ACCOUNT_FILE (file that contains the private key etc )
Use [Develop on Google Workspace](https://developers.google.com/workspace/guides/get-started) overview or other sources to get all the above credentials
