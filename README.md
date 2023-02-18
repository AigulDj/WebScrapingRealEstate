# WebScraping Real Estate

Web scraping of [kijiji](https://www.kijiji.ca/b-apartments-condos/city-of-toronto/c37l1700273) website
to collect all the data of apartment rental ads from multiple pages.

### Tools used:
- Python
- Selenium 
- SQLAlchemy
- PostgreSQL
- Google Sheets API 

### How to Install and Run the Project

To start and run the project you have to:
1. Install the requirements (pip install -r requirements.txt)
2. Change the value of the PASSWORD variable to your own PostgreSQL server password, if you have different database settings, use the scheme to construct the URI
3. Control the amount of data retrieved by changing the value of MAX_PAGE_NUM
4. Run main.py

To upload data to google sheets you need to create your own:
1. Create a Google spreadsheet with the following head row: Image, Title, Date, Location, Bedroom, Description, Price, Currency.
2. Obtain the SPREADSHEET_ID and SERVICE_ACCOUNT_FILE (a file that contains the private key, etc.) by following the [Develop on Google Workspace](https://developers.google.com/workspace/guides/get-started) guide or other sources. 
3. Use the obtained credentials to upload the data to the Google spreadsheet.
