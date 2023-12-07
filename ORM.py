import sqlalchemy
import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, relationship, sessionmaker


class Stock(Base):
    __tablename__ = "stock"

    id = sq.Column(sq.Integer, primary_key=True)
    id_book = sq.Column(sq.Integer, sq.ForeignKey("book.id"), nullable=False)
    id_shop = sq.Column(sq.Integer, sq.ForeignKey("shop.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)


class Book(Base):
    __tablename__ = "book"

    id = sq.Column(sq.Integer, primary_key=True)
    title = sq.Column(sq.Text, nullable=False)
    id_publisher = sq.Column(sq.Integer, sq.ForeignKey("publisher.id"), nullable=False)


class Publisher(Base):
    __tablename__ = "publisher"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.Text, nullable=False)

class Shop(Base):
    __tablename__ = "shop"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.Text, nullable=False)

class Sale(Base):
    __tablename__ = "sale"

    id = sq.Column(sq.Integer, primary_key=True)
    price = sq.Column(sq.Text, nullable=False)
    date_sale = sq.Column(sq.Text, nullable=False)
    id_stock = sq.Column(sq.Integer, sq.ForeignKey("stock.id"), nullable=False)
    count = sq.Column(sq.Text, nullable=False)


DNS = 'postgresql://postgres:12345@localhost:5432/postgres'
engine = sqlalchemy.create_engine(DNS)
Session = sessionmaker(bind=engine)
session = Session()
Base = declarative_base()

publisherl = Publisher(1,'Пушкин')
publisher2 = Publisher(2,'Чехов')
publisher3 = Publisher(3, 'Толстой')

session.add(publisherl)
session.add(publisher2)
session.add(publisher3)
session.commit()

book1 = Book(1, 'Капитанская дочь', 1)
book2 = Book(2, 'Руслан и Людмида', 1)
book3 = Book(3, 'Война и Мир', 3)
book4 = Book(4, 'Вишневый сад', 2)

session.add(book1)
session.add(book2)
session.add(book3)
session.add(book4)
session.commit()

shop1 = Shop(1, 'Буквоед')
shop2 = Shop(2, 'Книги и Книжечки')

session.add(shop1)
session.add(shop2)

session.commit()

stock1 = Stock(1, 1, 1, 1)
stock2 = Stock(2, 2, 1, 1)
stock3 = Stock(3, 3, 2, 1)
stock4 = Stock(4, 4, 2, 1)

session.add(stock1)
session.add(stock2)
session.add(stock3)
session.add(stock4)

session.commit()

sale1 = Sale(1, 300, '11.09.2021', 1, 1)
sale2 = Sale(2, 200, '11.09.2021', 2, 1)
sale3 = Sale(3, 100, '11.09.2021', 3, 1)
sale4 = Sale(4, 150, '11.09.2021', 4, 1)

session.add(sale_1)
session.add(sale_2)
session.add(sale_3)
session.add(sale_4)

session.commit()

request1 = input()
result = session.query(Book, Shop, Sale).filter(Publisher.name == request1).filter(Publisher.id == Book.id).filter(Book.id == Stock.id).filter(Stock.id == Shop.id).filter(Stock.id == Sale.id).all()
for res in result:
    print(f'{res[0]} | {res[1]} | {res[2]}')


session.close()
