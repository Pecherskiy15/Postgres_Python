import sqlalchemy
import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, sessionmaker, DeclarativeBase

DNS = 'postgresql+psycopg2://postgres:postgres@localhost:5432/postgres'
engine = sqlalchemy.create_engine(DNS)
Session = sessionmaker(bind=engine)
session = Session()
Base = DeclarativeBase

class Base(DeclarativeBase):
    pass

class Stock(Base):
    __tablename__ = "stock"

    id = sq.Column(sq.Integer, primary_key=True)
    id_book = sq.Column(sq.Integer, sq.ForeignKey("book.id"), nullable=False)
    id_shop = sq.Column(sq.Integer, sq.ForeignKey("shop.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)

    def __init__(self, id, id_book, id_shop, count):
        self.id = id
        self.id = id_book
        self.id_shop = id_shop
        self.count = count

class Book(Base):
    __tablename__ = "book"

    id = sq.Column(sq.Integer, primary_key=True)
    title = sq.Column(sq.Text, nullable=False)
    id_publisher = sq.Column(sq.Integer, sq.ForeignKey("publisher.id"), nullable=False)

    def __init__(self, id, title, id_publisher):
        self.id = id
        self.title = title
        self.id_publisher = id_publisher


class Publisher(Base):
    __tablename__ = "publisher"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.Text, nullable=False)

    def __init__(self, id, name):
        self.id = id
        self.name = name

class Shop(Base):
    __tablename__ = "shop"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.Text, nullable=False)

    def __init__(self, id, name):
        self.id = id
        self.name = name

class Sale(Base):
    __tablename__ = "sale"

    id = sq.Column(sq.Integer, primary_key=True)
    price = sq.Column(sq.Text, nullable=False)
    date_sale = sq.Column(sq.Text, nullable=False)
    id_stock = sq.Column(sq.Integer, sq.ForeignKey("stock.id"), nullable=False)
    count = sq.Column(sq.Text, nullable=False)

    def __init__(self, id, price, date_sale, id_stock, count):
        self.id = id
        self.price = price
        self.date_sale = date_sale
        self.id_stock = id_stock
        self.count = count

def get_shops(request):
    result_request = session.query(
        Book.title, Shop.name, Sale.price, Sale.date_sale,
    ).select_from(Shop).join(Stock).join(Book).join(Publisher).join(Sale)
    if request.isdigit():
        result_request2 = session.query(Publisher).filter(Publisher.id == result_request).all()
    else:
        result_request2 = session.query(Publisher).filter(Publisher.name == result_request).all()
    for book_name, shop_name, cost_sale, sale_date in result_request2:
        print(f"{book_name: <40} | {shop_name: <10} | {cost_sale: <8} | {sale_date.strftime('%d-%m-%Y')}")

def main():
    publisher1 = Publisher(1, 'Пушкин')
    publisher2 = Publisher(2, 'Чехов')
    publisher3 = Publisher(3, 'Толстой')

    session.add(publisher1)
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

    session.add(sale1)
    session.add(sale2)
    session.add(sale3)
    session.add(sale4)

    session.commit()


if __name__ == '__main__':
    main()
    input_request = input("Введите имя или ID публициста: ")
    get_shops(input_request)
