from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from config import Config



Base = declarative_base()
engine = create_engine(Config().DATABASE_URI)


class Crud:
    def __init__(self):
        # To interact with the new table 
        self.Session = sessionmaker(bind=engine)

    def recreate_database(self):
        """Deletes data table if it exists and creates a new one.
        """
        Base.metadata.drop_all(engine)
        Base.metadata.create_all(engine)


class Apartment(Base):
    """Creates table named 'apartments' with column names as given variables.
    Be sure to pre-create a database in your PostgreSQL.
    """
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


# # Change it to Base.metadata.create_all(engine) if no need to delete previous data in the table
# Crud.recreate_database()  