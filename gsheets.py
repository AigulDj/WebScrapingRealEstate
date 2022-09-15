from __future__ import print_function
from distutils.util import execute
from googleapiclient.discovery import build
# from googleapiclient.errors import HttpError
from google.oauth2 import service_account


class GoogleSheets:
    def __init__(self):
        self.SCOPES = ['https://www.googleapis.com/auth/spreadsheets']
        self.SERVICE_ACCOUNT_FILE = 'keys.json'
        self.creds = None
        self.creds = service_account.Credentials.from_service_account_file(self.SERVICE_ACCOUNT_FILE,
                                                                           scopes=self.SCOPES)

        self.service = build('sheets', 'v4', credentials=self.creds)
        self.SPREADSHEET_ID = '1wE2kuOx2FPzp9F89Qxj0HVPTa-1rn67MQLSIVawZSC8'
        self.sheet = self.service.spreadsheets()
        # result = sheet.values().get(spreadsheetId=SAMPLE_SPREADSHEET_ID,
        # range = "Sheet1!A1:I50").execute()

    def append_data(self, images, titles, dates, locations, bedrooms, descriptions, prices, currencies):
        values = (images, titles, dates, locations, bedrooms, descriptions, prices, currencies)

        value_range_body = {
            'majorDimension': 'COLUMNS',
            'values': values
        }

        request = self.sheet.values().append(spreadsheetId=self.SPREADSHEET_ID, range="Sheet1!A2",
                                             valueInputOption="USER_ENTERED", body=value_range_body)
        response = request.execute()

