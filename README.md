# Nandika-Vuyyuri-Integrating-sponsors-data-into-OpenAlex

# <Integrating Sponsors and Grants data into OpenAlex Database>

## Overview

My task for the summer was to integrate grant data and sponsor data with OpenAlex in PostgresQL, specifically I incorporate sponsors data (sponsors.xml) and grants data (grants.xml) into the OpenAlex database. The main purpose of this project is to enrich the academic database by improving search and filtering as well as analysis and metrics. 


## Steps

1. Created a parser for both grants.xml and sponsors.xml that establishes a PostgreSQL database (grant_parser.py and sponsor_openalex_parser.py).
2. Manually creted tables for the sponsor's data to create the local database schema (table file).
3. Received the OpenAlex database and created parser_with_fuzzy_final.py that connects to both local and OpenAlex database and then wrote 2 functions: match_by_name and match_by_url. These two functions check if the display_names and homepage_urls from the OpenAlex database and local database match identically.
4. Implemented 3 machine learning name-matching functions: Trigram matching(compares sets of three consecutive characters in two strings), Metaphone matching(matches similar sounding names by converting them into a standardized phonetic code and then comparing the code of the two strings), and partial-name-matching(checks if a smaller string exists in the longer string).
5. Utilized the country_code attribute to reassure that when there is a match between the OpenAlex database and local database through one of the machine learning matching functions, they share the same country code
6. Implemented function: match_by_alt_name that checks if there is any matching from the names of the local database to the alternate_titles from the OpenAlex database 



## Demo video

https://drive.google.com/file/d/12kvZ_yFRYCEPb5AcOiJJHcUMN9wbqwGh/view?usp=drive_link
## Google Drive 

Contains grants data (grants.xml, grants.xsd) and sponsors data (sponsors.xml, sponsors.xsd)

https://drive.google.com/drive/folders/1V2XuypKN1VQiJgIEk2yBLA6F5TxaaK5E?usp=drive_link


## Research Report

https://drive.google.com/file/d/1V8Y1O3UNgSerpdpr3Bb_aci82tecYQG6/view?usp=drive_link

## Issues and Future Work

* Low rate of matching (could also be due to a low rate of true matching data)
* Limitations regarding machine learning model; does not guarantee an accurate match, report includes examples of possible incorrect matches as examples
* As of Summer 2023, OpenAlex doesn't contain grants data so I was not able to integrate the grants data from the local database
