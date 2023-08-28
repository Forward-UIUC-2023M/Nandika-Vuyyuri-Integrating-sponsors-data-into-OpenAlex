
//reference table for sponsor type

CREATE TABLE SPONSOR_TYPE (
   ID INT PRIMARY KEY NOT NULL,
   NAME           VARCHAR(255) NOT NULL
);


insert into SPONSOR_TYPE(ID, NAME) values (1, 'Corporation');
insert into SPONSOR_TYPE(ID, NAME) values (2, 'Foundation');


Sponsor table.


CREATE TABLE SPONSOR (
   ID BIGSERIAL PRIMARY KEY,
   NAME VARCHAR(500) NOT NULL,
   ADDRESS VARCHAR(500) NOT NULL,
   COUNTRY VARCHAR(200),
   EMAIL VARCHAR(500),
   URL VARCHAR(1000),
   PARENT_ID INT,
   TYPE_ID INT,
   CREATED DATE,
   LAST_UPDATED DATE,
   SPONSOR_ID BIGINT,
   OPENALEX_ID VARCHAR(100),
   WIKIDATA_ID VARCHAR(100),
   DOI_ID VARCHAR(100),
   GRANTS_COUNT INT,
   WORKS_COUNT INT,
   CITATION_COUNT INT
);

alter table SPONSOR add ror_id varchar(100);

// reference tables for grant 



//child tables for grants
CREATE TABLE GRANTS_DEADLINES (
    GRANT_ID INT NOT NULL,
    TYPE VARCHAR(25) NOT NULL,
    DEADLINE DATE NOT NULL
);

CREATE TABLE GRANTS_AMOUNTS (
    GRANT_ID INT NOT NULL,
    CONFIRMED INT NOT NULL,
    CURRENCY VARCHAR(5) NOT NULL,
    TYPE VARCHAR(25) NOT NULL,
    AMOUNT DECIMAL NOT NULL
);
       

CREATE TABLE GRANTS_SPONSORS (
    GRANT_ID INT NOT NULL,
    SPONSOR_ID INT NOT NULL
);


// grant table
CREATE TABLE GRANTS (
   ID INT PRIMARY KEY NOT NULL,
   TITLE           VARCHAR(500),
   URL             VARCHAR(500) NOT NULL,
   STATUS_TYPE      VARCHAR(25),
   
);

CREATE TABLE WORLD (
  ID INT PRIMARY KEY NOT NULL,
  ALPHA_2 char(2),
  ALPHA_3 char(3),
  NAME varchar(75)
);

CREATE TABLE world (
    id VARCHAR(64) NOT NULL, 
    value VARCHAR(64) NOT NULL, 
    PRIMARY KEY(id)
);

INSERT INTO "world" ("id", "value") VALUES (E'AF', E'Afghanistan');
INSERT INTO "world" ("id", "value") VALUES (E'AX', E'Åland Islands');
INSERT INTO "world" ("id", "value") VALUES (E'AL', E'Albania');
INSERT INTO "world" ("id", "value") VALUES (E'DZ', E'Algeria');
INSERT INTO "world" ("id", "value") VALUES (E'AS', E'American Samoa');
INSERT INTO "world" ("id", "value") VALUES (E'AD', E'Andorra');
INSERT INTO "world" ("id", "value") VALUES (E'AO', E'Angola');
INSERT INTO "world" ("id", "value") VALUES (E'AI', E'Anguilla');
INSERT INTO "world" ("id", "value") VALUES (E'AQ', E'Antarctica');
INSERT INTO "world" ("id", "value") VALUES (E'AG', E'Antigua & Barbuda');
INSERT INTO "world" ("id", "value") VALUES (E'AR', E'Argentina');
INSERT INTO "world" ("id", "value") VALUES (E'AM', E'Armenia');
INSERT INTO "world" ("id", "value") VALUES (E'AW', E'Aruba');
INSERT INTO "world" ("id", "value") VALUES (E'AU', E'Australia');
INSERT INTO "world" ("id", "value") VALUES (E'AT', E'Austria');
INSERT INTO "world" ("id", "value") VALUES (E'AZ', E'Azerbaijan');
INSERT INTO "world" ("id", "value") VALUES (E'BS', E'Bahamas');
INSERT INTO "world" ("id", "value") VALUES (E'BH', E'Bahrain');
INSERT INTO "world" ("id", "value") VALUES (E'BD', E'Bangladesh');
INSERT INTO "world" ("id", "value") VALUES (E'BB', E'Barbados');
INSERT INTO "world" ("id", "value") VALUES (E'BY', E'Belarus');
INSERT INTO "world" ("id", "value") VALUES (E'BE', E'Belgium');
INSERT INTO "world" ("id", "value") VALUES (E'BZ', E'Belize');
INSERT INTO "world" ("id", "value") VALUES (E'BJ', E'Benin');
INSERT INTO "world" ("id", "value") VALUES (E'BM', E'Bermuda');
INSERT INTO "world" ("id", "value") VALUES (E'BT', E'Bhutan');
INSERT INTO "world" ("id", "value") VALUES (E'BO', E'Bolivia');
INSERT INTO "world" ("id", "value") VALUES (E'BA', E'Bosnia & Herzegovina');
INSERT INTO "world" ("id", "value") VALUES (E'BW', E'Botswana');
INSERT INTO "world" ("id", "value") VALUES (E'BV', E'Bouvet Island');
INSERT INTO "world" ("id", "value") VALUES (E'BR', E'Brazil');
INSERT INTO "world" ("id", "value") VALUES (E'IO', E'British Indian Ocean Territory');
INSERT INTO "world" ("id", "value") VALUES (E'VG', E'British Virgin Islands');
INSERT INTO "world" ("id", "value") VALUES (E'BN', E'Brunei');
INSERT INTO "world" ("id", "value") VALUES (E'BG', E'Bulgaria');
INSERT INTO "world" ("id", "value") VALUES (E'BF', E'Burkina Faso');
INSERT INTO "world" ("id", "value") VALUES (E'BI', E'Burundi');
INSERT INTO "world" ("id", "value") VALUES (E'KH', E'Cambodia');
INSERT INTO "world" ("id", "value") VALUES (E'CM', E'Cameroon');
INSERT INTO "world" ("id", "value") VALUES (E'CA', E'Canada');
INSERT INTO "world" ("id", "value") VALUES (E'CV', E'Cape Verde');
INSERT INTO "world" ("id", "value") VALUES (E'BQ', E'Caribbean Netherlands');
INSERT INTO "world" ("id", "value") VALUES (E'KY', E'Cayman Islands');
INSERT INTO "world" ("id", "value") VALUES (E'CF', E'Central African Republic');
INSERT INTO "world" ("id", "value") VALUES (E'TD', E'Chad');
INSERT INTO "world" ("id", "value") VALUES (E'CL', E'Chile');
INSERT INTO "world" ("id", "value") VALUES (E'CN', E'China');
INSERT INTO "world" ("id", "value") VALUES (E'CX', E'Christmas Island');
INSERT INTO "world" ("id", "value") VALUES (E'CC', E'Cocos (Keeling) Islands');
INSERT INTO "world" ("id", "value") VALUES (E'CO', E'Colombia');
INSERT INTO "world" ("id", "value") VALUES (E'KM', E'Comoros');
INSERT INTO "world" ("id", "value") VALUES (E'CG', E'Congo - Brazzaville');
INSERT INTO "world" ("id", "value") VALUES (E'CD', E'Congo - Kinshasa');
INSERT INTO "world" ("id", "value") VALUES (E'CK', E'Cook Islands');
INSERT INTO "world" ("id", "value") VALUES (E'CR', E'Costa Rica');
INSERT INTO "world" ("id", "value") VALUES (E'CI', E'Côte d’Ivoire');
INSERT INTO "world" ("id", "value") VALUES (E'HR', E'Croatia');
INSERT INTO "world" ("id", "value") VALUES (E'CU', E'Cuba');
INSERT INTO "world" ("id", "value") VALUES (E'CW', E'Curaçao');
INSERT INTO "world" ("id", "value") VALUES (E'CY', E'Cyprus');
INSERT INTO "world" ("id", "value") VALUES (E'CZ', E'Czechia');
INSERT INTO "world" ("id", "value") VALUES (E'DK', E'Denmark');
INSERT INTO "world" ("id", "value") VALUES (E'DJ', E'Djibouti');
INSERT INTO "world" ("id", "value") VALUES (E'DM', E'Dominica');
INSERT INTO "world" ("id", "value") VALUES (E'DO', E'Dominican Republic');
INSERT INTO "world" ("id", "value") VALUES (E'EC', E'Ecuador');
INSERT INTO "world" ("id", "value") VALUES (E'EG', E'Egypt');
INSERT INTO "world" ("id", "value") VALUES (E'SV', E'El Salvador');
INSERT INTO "world" ("id", "value") VALUES (E'GQ', E'Equatorial Guinea');
INSERT INTO "world" ("id", "value") VALUES (E'ER', E'Eritrea');
INSERT INTO "world" ("id", "value") VALUES (E'EE', E'Estonia');
INSERT INTO "world" ("id", "value") VALUES (E'SZ', E'Eswatini');
INSERT INTO "world" ("id", "value") VALUES (E'ET', E'Ethiopia');
INSERT INTO "world" ("id", "value") VALUES (E'FK', E'Falkland Islands');
INSERT INTO "world" ("id", "value") VALUES (E'FO', E'Faroe Islands');
INSERT INTO "world" ("id", "value") VALUES (E'FJ', E'Fiji');
INSERT INTO "world" ("id", "value") VALUES (E'FI', E'Finland');
INSERT INTO "world" ("id", "value") VALUES (E'FR', E'France');
INSERT INTO "world" ("id", "value") VALUES (E'GF', E'French Guiana');
INSERT INTO "world" ("id", "value") VALUES (E'PF', E'French Polynesia');
INSERT INTO "world" ("id", "value") VALUES (E'TF', E'French Southern Territories');
INSERT INTO "world" ("id", "value") VALUES (E'GA', E'Gabon');
INSERT INTO "world" ("id", "value") VALUES (E'GM', E'Gambia');
INSERT INTO "world" ("id", "value") VALUES (E'GE', E'Georgia');
INSERT INTO "world" ("id", "value") VALUES (E'DE', E'Germany');
INSERT INTO "world" ("id", "value") VALUES (E'GH', E'Ghana');
INSERT INTO "world" ("id", "value") VALUES (E'GI', E'Gibraltar');
INSERT INTO "world" ("id", "value") VALUES (E'GR', E'Greece');
INSERT INTO "world" ("id", "value") VALUES (E'GL', E'Greenland');
INSERT INTO "world" ("id", "value") VALUES (E'GD', E'Grenada');
INSERT INTO "world" ("id", "value") VALUES (E'GP', E'Guadeloupe');
INSERT INTO "world" ("id", "value") VALUES (E'GU', E'Guam');
INSERT INTO "world" ("id", "value") VALUES (E'GT', E'Guatemala');
INSERT INTO "world" ("id", "value") VALUES (E'GG', E'Guernsey');
INSERT INTO "world" ("id", "value") VALUES (E'GN', E'Guinea');
INSERT INTO "world" ("id", "value") VALUES (E'GW', E'Guinea-Bissau');
INSERT INTO "world" ("id", "value") VALUES (E'GY', E'Guyana');
INSERT INTO "world" ("id", "value") VALUES (E'HT', E'Haiti');
INSERT INTO "world" ("id", "value") VALUES (E'HM', E'Heard & McDonald Islands');
INSERT INTO "world" ("id", "value") VALUES (E'HN', E'Honduras');
INSERT INTO "world" ("id", "value") VALUES (E'HK', E'Hong Kong SAR China');
INSERT INTO "world" ("id", "value") VALUES (E'HU', E'Hungary');
INSERT INTO "world" ("id", "value") VALUES (E'IS', E'Iceland');
INSERT INTO "world" ("id", "value") VALUES (E'IN', E'India');
INSERT INTO "world" ("id", "value") VALUES (E'ID', E'Indonesia');
INSERT INTO "world" ("id", "value") VALUES (E'IR', E'Iran');
INSERT INTO "world" ("id", "value") VALUES (E'IQ', E'Iraq');
INSERT INTO "world" ("id", "value") VALUES (E'IE', E'Ireland');
INSERT INTO "world" ("id", "value") VALUES (E'IM', E'Isle of Man');
INSERT INTO "world" ("id", "value") VALUES (E'IL', E'Israel');
INSERT INTO "world" ("id", "value") VALUES (E'IT', E'Italy');
INSERT INTO "world" ("id", "value") VALUES (E'JM', E'Jamaica');
INSERT INTO "world" ("id", "value") VALUES (E'JP', E'Japan');
INSERT INTO "world" ("id", "value") VALUES (E'JE', E'Jersey');
INSERT INTO "world" ("id", "value") VALUES (E'JO', E'Jordan');
INSERT INTO "world" ("id", "value") VALUES (E'KZ', E'Kazakhstan');
INSERT INTO "world" ("id", "value") VALUES (E'KE', E'Kenya');
INSERT INTO "world" ("id", "value") VALUES (E'KI', E'Kiribati');
INSERT INTO "world" ("id", "value") VALUES (E'KW', E'Kuwait');
INSERT INTO "world" ("id", "value") VALUES (E'KG', E'Kyrgyzstan');
INSERT INTO "world" ("id", "value") VALUES (E'LA', E'Laos');
INSERT INTO "world" ("id", "value") VALUES (E'LV', E'Latvia');
INSERT INTO "world" ("id", "value") VALUES (E'LB', E'Lebanon');
INSERT INTO "world" ("id", "value") VALUES (E'LS', E'Lesotho');
INSERT INTO "world" ("id", "value") VALUES (E'LR', E'Liberia');
INSERT INTO "world" ("id", "value") VALUES (E'LY', E'Libya');
INSERT INTO "world" ("id", "value") VALUES (E'LI', E'Liechtenstein');
INSERT INTO "world" ("id", "value") VALUES (E'LT', E'Lithuania');
INSERT INTO "world" ("id", "value") VALUES (E'LU', E'Luxembourg');
INSERT INTO "world" ("id", "value") VALUES (E'MO', E'Macao SAR China');
INSERT INTO "world" ("id", "value") VALUES (E'MG', E'Madagascar');
INSERT INTO "world" ("id", "value") VALUES (E'MW', E'Malawi');
INSERT INTO "world" ("id", "value") VALUES (E'MY', E'Malaysia');
INSERT INTO "world" ("id", "value") VALUES (E'MV', E'Maldives');
INSERT INTO "world" ("id", "value") VALUES (E'ML', E'Mali');
INSERT INTO "world" ("id", "value") VALUES (E'MT', E'Malta');
INSERT INTO "world" ("id", "value") VALUES (E'MH', E'Marshall Islands');
INSERT INTO "world" ("id", "value") VALUES (E'MQ', E'Martinique');
INSERT INTO "world" ("id", "value") VALUES (E'MR', E'Mauritania');
INSERT INTO "world" ("id", "value") VALUES (E'MU', E'Mauritius');
INSERT INTO "world" ("id", "value") VALUES (E'YT', E'Mayotte');
INSERT INTO "world" ("id", "value") VALUES (E'MX', E'Mexico');
INSERT INTO "world" ("id", "value") VALUES (E'FM', E'Micronesia');
INSERT INTO "world" ("id", "value") VALUES (E'MD', E'Moldova');
INSERT INTO "world" ("id", "value") VALUES (E'MC', E'Monaco');
INSERT INTO "world" ("id", "value") VALUES (E'MN', E'Mongolia');
INSERT INTO "world" ("id", "value") VALUES (E'ME', E'Montenegro');
INSERT INTO "world" ("id", "value") VALUES (E'MS', E'Montserrat');
INSERT INTO "world" ("id", "value") VALUES (E'MA', E'Morocco');
INSERT INTO "world" ("id", "value") VALUES (E'MZ', E'Mozambique');
INSERT INTO "world" ("id", "value") VALUES (E'MM', E'Myanmar (Burma)');
INSERT INTO "world" ("id", "value") VALUES (E'NA', E'Namibia');
INSERT INTO "world" ("id", "value") VALUES (E'NR', E'Nauru');
INSERT INTO "world" ("id", "value") VALUES (E'NP', E'Nepal');
INSERT INTO "world" ("id", "value") VALUES (E'NL', E'Netherlands');
INSERT INTO "world" ("id", "value") VALUES (E'NC', E'New Caledonia');
INSERT INTO "world" ("id", "value") VALUES (E'NZ', E'New Zealand');
INSERT INTO "world" ("id", "value") VALUES (E'NI', E'Nicaragua');
INSERT INTO "world" ("id", "value") VALUES (E'NE', E'Niger');
INSERT INTO "world" ("id", "value") VALUES (E'NG', E'Nigeria');
INSERT INTO "world" ("id", "value") VALUES (E'NU', E'Niue');
INSERT INTO "world" ("id", "value") VALUES (E'NF', E'Norfolk Island');
INSERT INTO "world" ("id", "value") VALUES (E'KP', E'North Korea');
INSERT INTO "world" ("id", "value") VALUES (E'MK', E'North Macedonia');
INSERT INTO "world" ("id", "value") VALUES (E'MP', E'Northern Mariana Islands');
INSERT INTO "world" ("id", "value") VALUES (E'NO', E'Norway');
INSERT INTO "world" ("id", "value") VALUES (E'OM', E'Oman');
INSERT INTO "world" ("id", "value") VALUES (E'PK', E'Pakistan');
INSERT INTO "world" ("id", "value") VALUES (E'PW', E'Palau');
INSERT INTO "world" ("id", "value") VALUES (E'PS', E'Palestinian Territories');
INSERT INTO "world" ("id", "value") VALUES (E'PA', E'Panama');
INSERT INTO "world" ("id", "value") VALUES (E'PG', E'Papua New Guinea');
INSERT INTO "world" ("id", "value") VALUES (E'PY', E'Paraguay');
INSERT INTO "world" ("id", "value") VALUES (E'PE', E'Peru');
INSERT INTO "world" ("id", "value") VALUES (E'PH', E'Philippines');
INSERT INTO "world" ("id", "value") VALUES (E'PN', E'Pitcairn Islands');
INSERT INTO "world" ("id", "value") VALUES (E'PL', E'Poland');
INSERT INTO "world" ("id", "value") VALUES (E'PT', E'Portugal');
INSERT INTO "world" ("id", "value") VALUES (E'PR', E'Puerto Rico');
INSERT INTO "world" ("id", "value") VALUES (E'QA', E'Qatar');
INSERT INTO "world" ("id", "value") VALUES (E'RE', E'Réunion');
INSERT INTO "world" ("id", "value") VALUES (E'RO', E'Romania');
INSERT INTO "world" ("id", "value") VALUES (E'RU', E'Russia');
INSERT INTO "world" ("id", "value") VALUES (E'RW', E'Rwanda');
INSERT INTO "world" ("id", "value") VALUES (E'WS', E'Samoa');
INSERT INTO "world" ("id", "value") VALUES (E'SM', E'San Marino');
INSERT INTO "world" ("id", "value") VALUES (E'ST', E'São Tomé & Príncipe');
INSERT INTO "world" ("id", "value") VALUES (E'SA', E'Saudi Arabia');
INSERT INTO "world" ("id", "value") VALUES (E'SN', E'Senegal');
INSERT INTO "world" ("id", "value") VALUES (E'RS', E'Serbia');
INSERT INTO "world" ("id", "value") VALUES (E'SC', E'Seychelles');
INSERT INTO "world" ("id", "value") VALUES (E'SL', E'Sierra Leone');
INSERT INTO "world" ("id", "value") VALUES (E'SG', E'Singapore');
INSERT INTO "world" ("id", "value") VALUES (E'SX', E'Sint Maarten');
INSERT INTO "world" ("id", "value") VALUES (E'SK', E'Slovakia');
INSERT INTO "world" ("id", "value") VALUES (E'SI', E'Slovenia');
INSERT INTO "world" ("id", "value") VALUES (E'SB', E'Solomon Islands');
INSERT INTO "world" ("id", "value") VALUES (E'SO', E'Somalia');
INSERT INTO "world" ("id", "value") VALUES (E'ZA', E'South Africa');
INSERT INTO "world" ("id", "value") VALUES (E'GS', E'South Georgia & South Sandwich Islands');
INSERT INTO "world" ("id", "value") VALUES (E'KR', E'South Korea');
INSERT INTO "world" ("id", "value") VALUES (E'SS', E'South Sudan');
INSERT INTO "world" ("id", "value") VALUES (E'ES', E'Spain');
INSERT INTO "world" ("id", "value") VALUES (E'LK', E'Sri Lanka');
INSERT INTO "world" ("id", "value") VALUES (E'BL', E'St. Barthélemy');
INSERT INTO "world" ("id", "value") VALUES (E'SH', E'St. Helena');
INSERT INTO "world" ("id", "value") VALUES (E'KN', E'St. Kitts & Nevis');
INSERT INTO "world" ("id", "value") VALUES (E'LC', E'St. Lucia');
INSERT INTO "world" ("id", "value") VALUES (E'MF', E'St. Martin');
INSERT INTO "world" ("id", "value") VALUES (E'PM', E'St. Pierre & Miquelon');
INSERT INTO "world" ("id", "value") VALUES (E'VC', E'St. Vincent & Grenadines');
INSERT INTO "world" ("id", "value") VALUES (E'SD', E'Sudan');
INSERT INTO "world" ("id", "value") VALUES (E'SR', E'Suriname');
INSERT INTO "world" ("id", "value") VALUES (E'SJ', E'Svalbard & Jan Mayen');
INSERT INTO "world" ("id", "value") VALUES (E'SE', E'Sweden');
INSERT INTO "world" ("id", "value") VALUES (E'CH', E'Switzerland');
INSERT INTO "world" ("id", "value") VALUES (E'SY', E'Syria');
INSERT INTO "world" ("id", "value") VALUES (E'TW', E'Taiwan');
INSERT INTO "world" ("id", "value") VALUES (E'TJ', E'Tajikistan');
INSERT INTO "world" ("id", "value") VALUES (E'TZ', E'Tanzania');
INSERT INTO "world" ("id", "value") VALUES (E'TH', E'Thailand');
INSERT INTO "world" ("id", "value") VALUES (E'TL', E'Timor-Leste');
INSERT INTO "world" ("id", "value") VALUES (E'TG', E'Togo');
INSERT INTO "world" ("id", "value") VALUES (E'TK', E'Tokelau');
INSERT INTO "world" ("id", "value") VALUES (E'TO', E'Tonga');
INSERT INTO "world" ("id", "value") VALUES (E'TT', E'Trinidad & Tobago');
INSERT INTO "world" ("id", "value") VALUES (E'TN', E'Tunisia');
INSERT INTO "world" ("id", "value") VALUES (E'TR', E'Turkey');
INSERT INTO "world" ("id", "value") VALUES (E'TM', E'Turkmenistan');
INSERT INTO "world" ("id", "value") VALUES (E'TC', E'Turks & Caicos Islands');
INSERT INTO "world" ("id", "value") VALUES (E'TV', E'Tuvalu');
INSERT INTO "world" ("id", "value") VALUES (E'UM', E'U.S. Outlying Islands');
INSERT INTO "world" ("id", "value") VALUES (E'VI', E'U.S. Virgin Islands');
INSERT INTO "world" ("id", "value") VALUES (E'UG', E'Uganda');
INSERT INTO "world" ("id", "value") VALUES (E'UA', E'Ukraine');
INSERT INTO "world" ("id", "value") VALUES (E'AE', E'United Arab Emirates');
INSERT INTO "world" ("id", "value") VALUES (E'GB', E'United Kingdom');
INSERT INTO "world" ("id", "value") VALUES (E'US', E'United States');
INSERT INTO "world" ("id", "value") VALUES (E'UY', E'Uruguay');
INSERT INTO "world" ("id", "value") VALUES (E'UZ', E'Uzbekistan');
INSERT INTO "world" ("id", "value") VALUES (E'VU', E'Vanuatu');
INSERT INTO "world" ("id", "value") VALUES (E'VA', E'Vatican City');
INSERT INTO "world" ("id", "value") VALUES (E'VE', E'Venezuela');
INSERT INTO "world" ("id", "value") VALUES (E'VN', E'Vietnam');
INSERT INTO "world" ("id", "value") VALUES (E'WF', E'Wallis & Futuna');
INSERT INTO "world" ("id", "value") VALUES (E'EH', E'Western Sahara');
INSERT INTO "world" ("id", "value") VALUES (E'YE', E'Yemen');
INSERT INTO "world" ("id", "value") VALUES (E'ZM', E'Zambia');
INSERT INTO "world" ("id", "value") VALUES (E'ZW', E'Zimbabwe');

