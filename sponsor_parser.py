import xml.etree.ElementTree as ET
import psycopg2 

DATA_FILE = 'sponsors.xml'

def main():
    print('about to parse the file')
    execute_load();

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
    sponsors_tree = ET.parse(DATA_FILE)
    sponsors_root = sponsors_tree.getroot()
    print(sponsors_root)

    for sponsor in sponsors_root.findall('sponsor'): 
        insert_sponsor(connection, sponsor)


def get_value(parent, child):
    value = None
    node = parent.find(child)
    if node is not None:
        value = node.text
    return value

def insert_sponsor(connection, sponsor):
    id = sponsor.attrib.get('id')
    name = get_value(sponsor, 'sponsor_name')
    address = get_value(sponsor,'sponsor_address')
    country = get_value(sponsor, 'country')
    email = get_value(sponsor, 'sponsor_email')
    url = get_value(sponsor, 'sponsor_url') 
    parent_id = get_value(sponsor,'parent_id')


    print('Processing sponsor with id: ' + id)
    cursor = connection.cursor()
    cursor.execute("""INSERT INTO sponsor 
        (sponsor_id, name, address, country, email, url, parent_id) 
        VALUES (%s, %s, %s, %s, %s, %s, %s)""", 
        (id, name, address, country, email, url, parent_id))


 
if __name__ == "__main__":
    main()

