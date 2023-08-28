import xml.etree.ElementTree as ET
import psycopg2
from datetime import datetime

DATA_FILE = 'grants.xml'

def main():
    print('About to parse the file')
    execute_load()

def connect_database():
    connection = psycopg2.connect(
        host="localhost",
        database="postgres",
        user="postgres",
        password="Ten101ten!"
    )
    connection.autocommit = True
    return connection

def execute_load():
    connection = connect_database()
    grants_tree = ET.parse(DATA_FILE)
    grants_root = grants_tree.getroot()
    print(grants_root)

    for grant in grants_root.findall('grant'):
        insert_grant(connection, grant)

def get_value(parent, child):
    value = None
    node = parent.find(child)
    if node is not None:
        value = node.text
    return value

def insert_grant(connection, grant):
    id = grant.attrib.get('id')
    title = get_value(grant, 'title')
    url = get_value(grant, 'url')
    amount_info = get_value(grant, 'amount_info')
    #grant_type = get_value(grant, 'grant_type')
    #submit_date = get_value(grant, 'submit_date')
    #last_updated = get_value(grant, 'last_updated')
    status_type = get_value(grant, 'status')

    print('Processing grant with id:', id)
    cursor = connection.cursor()
    cursor.execute("""INSERT INTO GRANTS
        (ID, TITLE, URL, STATUS_TYPE)
        VALUES (%s, %s, %s, %s)""",
                   (id, title, url, status_type))

    # Insert into child tables
    deadlines = grant.findall('deadlines/deadline')
    for deadline in deadlines:
        deadline_type = deadline.attrib['type']
        deadline_date = deadline.text
        print(deadline_type) 
        print(deadline_date)      
        cursor.execute("""INSERT INTO GRANTS_DEADLINES
            (GRANT_ID, TYPE, DEADLINE)
            VALUES (%s, %s, to_timestamp(%s, 'yyyy-mm-dd hh24:mi:ss'))""",
                       (id, deadline_type, deadline_date))

    amounts = grant.findall('amounts/amount')
    for amount in amounts:
        confirmed = amount.attrib['confirmed'] 
        currency = amount.attrib['currency']
        amount_type =amount.attrib['type']
        amount_value = amount.text
        cursor.execute("""INSERT INTO GRANTS_AMOUNTS
            (GRANT_ID, CONFIRMED, CURRENCY, TYPE, AMOUNT)
            VALUES (%s, %s, %s, %s, %s)""",
                       (id, confirmed, currency, amount_type, amount_value))

    sponsors = grant.findall('sponsors/sponsor_id')
    for sponsor in sponsors:
        sponsor_id = sponsor.text
        cursor.execute("""INSERT INTO GRANTS_SPONSORS
            (GRANT_ID, SPONSOR_ID)
            VALUES (%s, %s)""",
                       (id, sponsor_id))

if __name__ == "__main__":
    main()