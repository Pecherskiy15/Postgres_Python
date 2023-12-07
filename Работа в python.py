import psycopg2

def createtables():
    with psycopg2.connect(database = 'test_base', user = 'postgres', password = '12345') as conn:
        with conn.cursor() as cur:
            cur.execute("""
                CREATE TABLE IF NOT EXISTS Clients(
                                    id SERIAL PRIMARY KEY, 
                                    name VARCHAR(40) NOT NULL,
                                    lastname VARCHAR(40) NOT NULL,
                                    email text UNIQUE NOT NULL 
                                    );""")
            cur.execute("""
                CREATE TABLE IF NOT EXISTS Telephone_numbers(
                                    id SERIAL PRIMARY KEY, 
                                    number text UNIQUE NOT NULL,
                                    id_of_client int4 NOT NULL REFERENCES Clients(id)
                                    );""")
            conn.commit()

def add_client(name, lastname, email, number):
    with psycopg2.connect(database = 'test_base', user = 'postgres', password = '12345') as conn:
        with conn.cursor() as cur:
            cur.execute("""
            INSERT INTO Clients(name, lastname, email) 
            VALUES(%s, %s, %s);
            """, (name, lastname, email))
            cur.execute("""
            INSERT INTO Telephone_numbers(number) 
            VALUES(%s);
            """, (number))            
            conn.commit()

def add_number(search_email, search_name, search_lastname, number):
    with psycopg2.connect(database = 'test_base', user = 'postgres', password = '12345') as conn:
        with conn.cursor() as cur:
            cur.execute("""
            INSERT INTO Telephone_numbers(number, id_of_client)
            VALUES(%s, (SELECT id FROM Clients
            WHERE name=%s and lastname=%s and email=%s));
            """, (number, search_name, search_lastname, search_email))
            conn.commit()

def change_info(changed_name, changed_lastname, changed_email, id, change_number):
    with psycopg2.connect(database = 'test_base', user = 'postgres', password = '12345') as conn:
        with conn.cursor() as cur: 
            cur.execute("""
            UPDATE Clients SET name=%s,  lastname=%s, email=%s
            WHERE id=%s RETURNING id;
            """, (changed_name, changed_lastname, changed_email, id))
            print(cur.fetchall())
            if change_number != None:
                cur.execute("""
                UPDATE Telephone_numbers SET number=%s
                WHERE id_of_client=%s;
                """, (change_number, id))
                conn.commit()

def delete_num(name, lastname, email):
    with psycopg2.connect(database = 'test_base', user = 'postgres', password = '12345') as conn:
        with conn.cursor() as cur:
            cur.execute("""
            DELETE FROM Telephone_numbers
            WHERE id_of_client=(SELECT id FROM Clients
            WHERE name=%s and lastname=%s and email=%s);
            """, (name, lastname, email))
            conn.commit()

def delete_client(name, lastname, email):
    with psycopg2.connect(database = 'test_base', user = 'postgres', password = '12345') as conn:
        with conn.cursor() as cur:
            cur.execute("""
            DELETE FROM Telephone_numbers
            WHERE id_of_client=(SELECT id FROM Clients
            WHERE name=%s and lastname=%s and email=%s);
            """, (name, lastname, email)) 
            cur.execute("""
            DELETE FROM Clients
            WHERE name=%s and lastname=%s and email=%s;
            """, (name, lastname, email))
            conn.commit()
            
def search_client(name, lastname=None, email=None):
    with psycopg2.connect(database = 'test_base', user = 'postgres', password = '12345') as conn:
        with conn.cursor() as cur:
            cur.execute("""
            SELECT id, name, lastname, email FROM Clients
            WHERE name=%s;
            """, (name,))
            for element in cur.fetchall():
                info_cur = element
        with conn.cursor() as cur:
            cur.execute("""
            SELECT id, name, lastname, email FROM Clients
            WHERE name=%s;
            """, (name,))
            curlen = len(cur.fetchall())
        if curlen > 1:
            with conn.cursor() as curs:
                curs.execute("""
                SELECT id, name, lastname, email FROM Clients
                WHERE name=%s and lastname=%s;
                """, (name, lastname))
                for element in curs.fetchall():
                    info_curs = element
            with conn.cursor() as curs:
                curs.execute("""
                SELECT id, name, lastname, email FROM Clients
                WHERE name=%s and lastname=%s;
                """, (name, lastname))
                curlen_1 = len(curs.fetchall())
            if curlen_1 > 1:
                with conn.cursor() as cursor:
                    cursor.execute("""
                    SELECT id, name, lastname, email FROM Clients
                    WHERE name=%s and lastname=%s and email=%s;
                    """, (name, lastname, email))
                    for element in cursor.fetchall():
                        info_cursor = element
                    return info_cursor
            else:
                return info_curs
        else:
            return info_cur

def search_by_number(number):
    with psycopg2.connect(database = 'test_base', user = 'postgres', password = '12345') as conn:
        with conn.cursor() as cur:
            cur.execute("""
            SELECT id_of_client FROM Telephone_numbers
            WHERE number=%s;
            """, (number,))
            id_of_client = cur.fetchall()
            cur.execute("""
            SELECT name, lastname FROM Clients
            WHERE id=%s;
            """, (id_of_client,))
            info_client = cur.fetchall()
            return info_client
        
if __name__ == "__main__":
    createtables()
    add_client('Игорь', 'Петров', 'Зуекщмшпщк@mail.ru', '89112394856')
    add_client('Светлана', 'Потапова', 'Sv_p@mail.ru', '89272767773')
    add_client('Андрей', 'Сидоров', 'Sidr@mail.ru', '89273771174')
    add_number('Валерий', 'Исаков', 'Isakov@mail.ru', '89277777775')
    delete_client('Александр', 'Малютин', 'Malutin@mail.ru')
    delete_num('Дмитрий', 'Макаров', 'Makarov@mail.ru')
    search_client('Сергей', 'Степанов', 'Stepanov@mail.ru')
    search_by_number('89112394856')
