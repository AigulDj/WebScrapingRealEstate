import os
from dotenv import load_dotenv

load_dotenv()

PASSWORD = os.getenv('PASSWORD')

class Config:
    def __init__(self):
        # Scheme: "postgresql+psycopg2://<USERNAME>:<PASSWORD>@<IP_ADDRESS>:<PORT>/<DATABASE_NAME>"
        self.DATABASE_URI = f'postgresql+psycopg2://postgres:{PASSWORD}@localhost:5432/apartments'