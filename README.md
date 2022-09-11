# AigulDjon_Data-Ox_Test
Test Project

Web scraping of 'https://www.kijiji.ca/b-apartments-condos/city-of-toronto/c37l1700273' website
to collect all website's ads data from multiple pages.

# Tools used:
- Python
- Selenium webdriver
- SQLAlchemy
- PostgreSQL

For this project you will have to:

- To install all of the requirements, you can use the following command: pip install -r requirements.txt.
- Be sure that the version of Chromedriver in the root folder matches the version of Chrome on your computer. 
- Change the value of the <PASSWORD> var on your own postgreSQL server password, if you have different DB params use Schema to build URI.
- You can control the amount of data retrieved by changing the value of <MAX_PAGE_NUM>.
- After you install all of the requirements, you should run the main.py.

To upload data to google sheets I used https://sheety.co/. To use that service you have to:

- Log into Sheety with your Google Account (the same account that owns the Google Sheet you where you are going to upload data). Make sure the email matches your Google Sheet and Sheety Account.
- Using the Sheety Documentations ( https://sheety.co/docs/project ) get your own Sheety API URL (https://api.sheety.co/username/projectName/sheetName) and use it as a value of <SHEET_ENDPOINT> variable.




