from googleapiclient.discovery import build
from google.oauth2 import service_account


class GoogleSheets:
    """This class builds connection with previously created google sheet.
    There is a method 'append data' which append web scraped data to the connected google sheet.
    """
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

    def append_data(self, data):
        """This function appends values to the spreadsheet.
        For more info visit 'https://developers.google.com/sheets/api/reference/rest/v4/spreadsheets.values'
        :param data: lists of selenium objects converted to strings
        """
        value_range_body = {
            'majorDimension': 'COLUMNS',
            'values': data
        }
        request = self.sheet.values().append(spreadsheetId=self.SPREADSHEET_ID, range="Sheet1",
                                             valueInputOption="USER_ENTERED", body=value_range_body)
        response = request.execute()
