import sqlalchemy
import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, sessionmaker


def create_tables(_engine):
    Base.metadata.create_all(_engine)


DNS = 'postgresql+psycopg2://postgres:postgres@127.0.0.1:5432/pg'
engine = sqlalchemy.create_engine(DNS)

Session = sessionmaker(bind=engine)
session = Session()
Base = declarative_base()


class Stock(Base):
    __tablename__ = "stock"

    id = sq.Column(sq.Integer, primary_key=True)
    id_book = sq.Column(sq.Integer, sq.ForeignKey("book.id"), nullable=False)
    id_shop = sq.Column(sq.Integer, sq.ForeignKey("shop.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)

    def __init__(self, _id, id_book, id_shop, count):
        self.id = _id
        self.id_book = id_book
        self.id_shop = id_shop
        self.count = count


class Book(Base):
    __tablename__ = "book"

    id = sq.Column(sq.Integer, primary_key=True)
    title = sq.Column(sq.Text, nullable=False)
    id_publisher = sq.Column(sq.Integer, sq.ForeignKey("publisher.id"), nullable=False)

    def __init__(self, _id, title, id_publisher):
        self.id = _id
        self.title = title
        self.id_publisher = id_publisher


class Publisher(Base):
    __tablename__ = "publisher"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.Text, nullable=False)

    def __init__(self, _id, name):
        self.id = _id
        self.name = name


class Shop(Base):
    __tablename__ = "shop"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.Text, nullable=False)

    def __init__(self, _id, name):
        self.id = _id
        self.name = name


class Sale(Base):
    __tablename__ = "sale"

    id = sq.Column(sq.Integer, primary_key=True)
    price = sq.Column(sq.Text, nullable=False)
    date_sale = sq.Column(sq.DateTime, nullable=False)  # Change this line
    id_stock = sq.Column(sq.Integer, sq.ForeignKey("stock.id"), nullable=False)
    count = sq.Column(sq.Text, nullable=False)

    def __init__(self, _id, price, date_sale, id_stock, count):
        self.id = _id
        self.price = price
        self.date_sale = date_sale
        self.id_stock = id_stock
        self.count = count


def get_shops(request):
    result_request = session.query(
        Book.title, Shop.name, Sale.price, Sale.date_sale,
    ).select_from(Shop).join(Stock).join(Book).join(Publisher).join(Sale)

    # if request.isdigit():
    if request.isnumeric():
        result_request = result_request.filter(Publisher.id == request)
    else:
        result_request = result_request.filter(Publisher.name == request)

    result_request = result_request.all()

    for book_name, shop_name, cost_sale, sale_date in result_request:
        print(
            f"{book_name: <40} | "
            f"{shop_name: <10} | "
            f"{cost_sale: <8} | "
            f"{sale_date}"
        )


def main():
    create_tables(engine)

    publisher1 = Publisher(1, 'Пушкин')
    publisher2 = Publisher(2, 'Чехов')
    publisher3 = Publisher(3, 'Толстой')

    session.add(publisher1)
    session.add(publisher2)
    session.add(publisher3)
    session.commit()

    book1 = Book(_id=1, title='Капитанская дочь', id_publisher=1)
    book2 = Book(_id=2, title='Руслан и Людмила', id_publisher=1)
    book3 = Book(_id=3, title='Война и Мир', id_publisher=3)
    book4 = Book(_id=4, title='Вишневый сад', id_publisher=2)

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

    stock1 = Stock(_id=1, id_book=1, id_shop=shop1.id, count=1)
    stock2 = Stock(_id=2, id_book=2, id_shop=shop1.id, count=1)
    stock3 = Stock(_id=3, id_book=3, id_shop=shop2.id, count=1)
    stock4 = Stock(_id=4, id_book=4, id_shop=shop2.id, count=1)

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

    while True:
        input_request = input("Введите имя или ID публициста: ")
        if input_request == '0':
            break
        get_shops(input_request)
