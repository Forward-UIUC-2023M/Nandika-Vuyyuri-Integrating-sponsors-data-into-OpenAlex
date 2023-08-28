import psycopg2 


# def main():
#     print('about to associate the sponsor data with funders')
#     associate();

def local_database():
    connection = psycopg2.connect(
        host="localhost",
        database="postgres",
        user="postgres",
        password="Ten101ten!"
    )
    connection.autocommit = True
    return connection


def openalex_database():
    connection = psycopg2.connect(
        host="Hawk5.csl.illinois.edu",
        database="postgres",
        user="pzl2",
        password="postgres"
    )
    return connection

def match_by_country_code(sponsor_row, funder_db):
    country_code = sponsor_row[3]  # assumes the country code is the fourth element in the row
    funder_cursor = funder_db.cursor()
    funder_cursor.execute("SELECT id, display_name, homepage_url FROM openalex.funders WHERE country_code = %s", (country_code,))
    funder = funder_cursor.fetchone()

    if funder != None:
        print("Matched by country code  : " + country_code)
        return funder[0]
    
# def match_by_alternate_title(sponsor_row, funder_db):
#     name = sponsor_row[1]
#     funder_cursor = funder_db.cursor()

#     # Checking if the sponsor's name matches any alternate titles in the global database
#     funder_cursor.execute("""
#     SELECT f.id, f.display_name, f.homepage_url 
#     FROM openalex.funders f 
#     JOIN alternate_titles at ON f.id = at.funder_id
#     WHERE lower(at.title) = lower(%s)
#     """, (name,))

#     funder = funder_cursor.fetchone()
#     if funder:
#         print(f"Matched by alternate title: {name}")
#         return funder[0]
#     return None



def associate(sponsor_db, funder_db):

    matchedByName = 0
    matchedByUrl = 0
    matchedByTrigram = 0
    matchedByMetaphone = 0
    matchedByPartialName = 0
    matchedByAltTitle = 0
    unmatched = 0

    sponsor_cursor = sponsor_db.cursor() 
    sponsor_cursor.execute("select s.id, s.name, s.url, s.country, w.id from sponsor s left join world w on s.country = w.value")
       
    for row in sponsor_cursor.fetchall():
        sponsor_id = row[0]
        country_code = row[4]

        funder_id = match_by_name(row, funder_db)
        if(funder_id != None):
            matchedByName += 1
            update(sponsor_id, sponsor_db, funder_id, funder_db)
            continue

        funder_id = match_by_url(row, funder_db)
        if(funder_id != None):
            matchedByUrl += 1
            update(sponsor_id, sponsor_db, funder_id, funder_db)
            continue

        funder_id = match_by_trigram(row, funder_db, country_code)
        if(funder_id != None):
            matchedByTrigram += 1
            update(sponsor_id, sponsor_db, funder_id, funder_db)
            continue

        funder_id = match_by_metaphone(row, funder_db, country_code)
        if(funder_id != None):
            matchedByMetaphone += 1
            update(sponsor_id, sponsor_db, funder_id, funder_db)
            continue

        funder_id = match_by_partial_name(row, funder_db, country_code)
        if(funder_id != None):
            matchedByPartialName += 1
            update(sponsor_id, sponsor_db, funder_id, funder_db)
            continue

        funder_id = match_by_alt_name(row, funder_db)
        if(funder_id != None):
            matchedByAltTitle += 1
            update(sponsor_id, sponsor_db, funder_id, funder_db)
            continue
       
        print("Unmatched by any  : " + row[1])
        unmatched += 1


    print("Matched by Name :" + str(matchedByName))
    print("Matched by Alternate Name :" + str(matchedByAltTitle))
    print("Matched by Url :" + str(matchedByUrl))
    print("Matched by Trigram :" + str(matchedByTrigram))
    print("Matched by Metaphone :" + str(matchedByMetaphone))
    print("Matched by Partial Name :" + str(matchedByPartialName))
    print("Unmatched : " + str(unmatched))


def match_by_name(sponsor_row, funder_db):
    name = sponsor_row[1]
    funder_cursor = funder_db.cursor()
    funder_cursor.execute("select id, display_name, homepage_url from openalex.funders where lower(display_name) = lower(%s)", (name,))
    funder = funder_cursor.fetchone()

    if funder != None:
        print("Matched by name  : " + name)
        return funder[0]


def match_by_url(sponsor_row, funder_db):
    url = sponsor_row[2]
    url = url.rstrip('/') + "%"
    funder_cursor = funder_db.cursor()
    funder_cursor.execute("select id, display_name, homepage_url from openalex.funders where homepage_url ilike %s", (url,))
    funder = funder_cursor.fetchone()  

    if funder != None:
        print("Matched by url  : " + url)
        return funder[0]

def match_by_trigram(sponsor_row, funder_db, country_code):
    name = sponsor_row[1]

    funder_cursor = funder_db.cursor()
    funder_cursor.execute("select id, display_name, homepage_url, country_code from openalex.funders where country_code = %s and SIMILARITY(display_name, %s) > 0.8 limit 1", (country_code, name,))
    funder = funder_cursor.fetchone()

    if funder != None:
        print("Matched by trigram  : " + name + " -> " + funder[1])
        return funder[0]

def match_by_metaphone(sponsor_row, funder_db, country_code):
    name = sponsor_row[1]

    funder_cursor = funder_db.cursor()
    funder_cursor.execute("select id, display_name, homepage_url from openalex.funders where country_code = %s and METAPHONE(display_name, 25) = METAPHONE(%s, 25) limit 1", (country_code, name,))
    funder = funder_cursor.fetchone()

    if funder != None:
        print("Matched by metaphone  : " + name + " -> " + funder[1])
        return funder[0]


def match_by_partial_name(sponsor_row, funder_db, country_code):
    name = sponsor_row[1]

    if len(name.split()) < 3:
        return
    
    name_pattern = "%" + name + "%"
    funder_cursor = funder_db.cursor()
    funder_cursor.execute("select id, display_name, homepage_url from openalex.funders where country_code = %s and display_name ilike  %s limit 1", (country_code, name_pattern,))
    funder = funder_cursor.fetchone()

    if funder != None:
        print("Matched by partial name  : " + name + " -> " + funder[1])
        return funder[0]

def match_by_alt_name(sponsor_row, funder_db):
    name = sponsor_row[1]
    funder_cursor = funder_db.cursor()
    funder_cursor.execute("select id, display_name, homepage_url from openalex.funders where position(lower(%s) IN lower(alternate_titles)) > 0 limit 1", (name,))
    funder = funder_cursor.fetchone()

    if funder != None:
        print("Matched by alternate name  : " + name) 
        return funder[0]
    

def update(sponsorId, sponsorDb, funderId, funderDb):
    sponsor_cursor = sponsorDb.cursor() 
    funder_cursor = funderDb.cursor()
    funder_cursor.execute("select ror, doi, wikidata from openalex.funders_ids where funder_id = %s", (funderId,))
    funder = funder_cursor.fetchone()
    if funder != None:
        ror = funder[0]
        doi = funder[1]
        wiki = funder[2]
        sponsor_cursor.execute("update sponsor set openalex_id = %s, wikidata_id = %s, ror_id = %s, doi_id = %s where id = %s", (funderId, wiki, ror, doi,sponsorId,))


def main():
    sponsorDb = local_database()
    funderDb = openalex_database()
    associate(sponsorDb, funderDb)

if __name__ == "__main__":
    main()
