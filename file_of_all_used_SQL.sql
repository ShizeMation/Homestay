-- This file contains a compilation of all the SQL code used throughout the
-- project. This code can be found within other files of the project (aside from
-- the QUERIES THE ENTERPRISE IS INTERESTED IN section).



-- CREATION OF TABLES ----------------------------------------------------------
CREATE SCHEMA homestay AUTHORIZATION postgres;

GRANT ALL ON SCHEMA homestay TO postgres;

CREATE TABLE homestay.guest (
    guest_id VARCHAR(32) PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    street_address VARCHAR(40) NOT NULL,
    city VARCHAR(40) NOT NULL,
    state_province VARCHAR(40) NOT NULL,
    country VARCHAR(40) NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    phone VARCHAR(16) NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    salt VARCHAR(64) NOT NULL
);

CREATE TABLE homestay.branch (
    branch_id VARCHAR(32) PRIMARY KEY,
    manager_id VARCHAR(32) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE homestay.employee (
    employee_id VARCHAR(32) PRIMARY KEY,
    branch_id VARCHAR(32) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state_province VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    phone VARCHAR(16) NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    salt VARCHAR(64) NOT NULL,
    job_position VARCHAR(30) NOT NULL CHECK (
        job_position = 'representative' OR
        job_position = 'customer service' OR
        job_position = 'human resources' OR
        job_position = 'information technology' OR
        job_position = 'manager'
    ),
    salary NUMERIC(8,2) NOT NULL CHECK (salary >= 0),
    FOREIGN KEY (branch_id) REFERENCES homestay.branch
);

CREATE TABLE homestay.host (
    host_id VARCHAR(32) PRIMARY KEY,
    guest_id VARCHAR(32) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state_province VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    phone VARCHAR (16) NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    salt VARCHAR(64) NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES homestay.guest
);

CREATE TABLE homestay.pricing (
    pricing_id VARCHAR(32) PRIMARY KEY,
    property_type VARCHAR(20) NOT NULL CHECK (
        property_type = 'apartment' OR
        property_type = 'bungalow' OR
        property_type = 'condo' OR
        property_type = 'cabin' OR
        property_type = 'lodge' OR
        property_type = 'mansion' OR
        property_type = 'single-family house' OR
        property_type = 'tiny home' OR
        property_type = 'townhome' OR
        property_type = 'vacation cottage' OR
        property_type = 'other'
    ),
    room_type VARCHAR(20) NOT NULL CHECK (
        room_type = 'shared room' OR
        room_type = 'private room' OR
        room_type = 'unique space'
    ),
    pets_allowed BOOLEAN NOT NULL,
    amenities BOOLEAN NOT NULL,
    rate NUMERIC(8,2) NOT NULL
);

CREATE TABLE homestay.property (
    property_id VARCHAR(32) PRIMARY KEY,
    host_id VARCHAR(32) NOT NULL,
    pricing_id VARCHAR(32) NOT NULL,
    max_guests INTEGER NOT NULL CHECK (max_guests >= 1),
    bed_type VARCHAR(10) NOT NULL CHECK (
        bed_type = 'single' OR
        bed_type = 'queen' OR
        bed_type = 'bunk' OR
        bed_type = 'other'
    ),
    wheelchair_accessible BOOLEAN NOT NULL,
    about VARCHAR(500) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state_province VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    available_date DATE NOT NULL,
    FOREIGN KEY (host_id) REFERENCES homestay.host,
    FOREIGN KEY (pricing_id) REFERENCES homestay.pricing
);

CREATE TABLE homestay.agreement (
    agreement_id VARCHAR(32) PRIMARY KEY,
    guest_id VARCHAR(32) NOT NULL,
    host_id VARCHAR(32) NOT NULL,
    property_id VARCHAR(32) NOT NULL,
    begin_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date > begin_date),
    FOREIGN KEY (guest_id) REFERENCES homestay.guest,
    FOREIGN KEY (host_id) REFERENCES homestay.host,
    FOREIGN KEY (property_id) REFERENCES homestay.property
);

CREATE TABLE homestay.payment (
    agreement_id VARCHAR(32) PRIMARY KEY,
    host_id VARCHAR(32) NOT NULL,
    guest_id VARCHAR(32) NOT NULL,
    method VARCHAR(40) NOT NULL CHECK (
        method = 'cash' OR
        method = 'check' OR
        method = 'credit card' OR
        method = 'debit card'
    ),
    amount NUMERIC(8,2) NOT NULL CHECK (amount >= 0),
    transaction_status VARCHAR(10) NOT NULL CHECK (
        transaction_status = 'completed' OR
        transaction_status = 'pending'
    ),
    FOREIGN KEY (agreement_id) REFERENCES homestay.agreement,
    FOREIGN KEY (host_id) REFERENCES homestay.host,
    FOREIGN KEY (guest_id) REFERENCES homestay.guest
);

CREATE TABLE homestay.review (
    agreement_id VARCHAR(32) PRIMARY KEY,
    rating SMALLINT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    communication_comment VARCHAR(500) NOT NULL,
    cleanliness_comment VARCHAR(500) NOT NULL,
    value_comment VARCHAR(500) NOT NULL,
    other_comment VARCHAR(500) NOT NULL,
    FOREIGN KEY (agreement_id) REFERENCES homestay.agreement
);



-- INSERTION OF DATA -----------------------------------------------------------

-- Insert 10 guests that are hosts
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('983','Helen','Acton','1720 Coolidge Street','Columbia Falls','Montana','United States','eokm@yahoo.com','406-892-1832','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('276','Hector','Boyer','136 Bombardier Way','Mcarthur','California','United States','ufvo@gmail.com','734-956-7710','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('584','Tommy','Nicoll','3730 Blackwell Street','Dutch Harbor','Alaska','United States','sjbij@gmail.com','907-359-8821','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('771','Eli','Perez','3176 Reserve St','Elgin','Ontario','Canada','msp@gmail.com','613-359-7833','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('271','Shelley','Groh','4301 Township Rd','Fort Mcmurray','Alberta','Canada','apnwj@gmail.com','780-598-4082','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('699','Ruby','Karcher','2475 Heritage Drive','Calgary','Alberta','Canada','pemvkdml@gmail.com','403-771-4510','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('842','Katie','Martinovich','42 Davis Street','Mcdowall','Queensland','Australia','qpowjn@hotmail.com','(07) 3159 7877','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('790','Charles','Zahel','53 Magnolia Drive','Bexley South','New South Wales','Australia','oveovje@gmail.com','(02) 6265 9244','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('308','Luke','Herbert','36 Traill Street','Rosewarne','','United Kingdom','eydodij@gmail.com','079 6758 5000','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('858','Sebastian','Winkel','Schönhauser Allee 81','Villingen-Schwenningen Mühlhausen','Baden-Württemberg','Germany','wwwww4@gmail.com','07721 51 60 07','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');


-- Insert 10 guests
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('912','Ian','Sanders','1946 Emeral Dreams Drive','Durand','Illinois','United States','rejoef@hotmail.com','815-248-7508','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('711','David','Gonzales','966 Burning Memory Lane','Manly','Iowa','United States','ajnvo@gmail.com','215-299-3897','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('995','Larry','Whisenhunt','2762 A Avenue','Edmonton','Alberta','Canada','eapaa@gmail.com','780-401-1415','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('747','William','Goines','3642 Brand Road','Saskatoon','Saskatchewan','Canada','83joo@hotmail.com','306-374-2902','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('608','Owen','Muskett','57 Glen William Road','East Trinity','Queensland','Australia','vwhbwo2@gmail.com','(07) 4092 7671','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('971','Bethany','Langler','52 Ranworth Road','Parkwood','Western Australia','Australia','rjeo99@gmail.com','(08) 9315 8432','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('225','Corey','Patterson','70 Argyll Road','Llanddaniel Fab','','United Kingdom','1got7@gmail.com','079 2497 1003','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('718','Jay','Lord','71 Netherpark Crescent','Stirchley','','United Kingdom','kjqkvpl@gmail.com','077 2963 3418','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('673','Ulrike','Lehrer','Schmarjestrasse 63','Wiesenburg','Freistaat Sachsen','Germany','soi3j33@gmail.com','033848 94 64','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('898','Katharina','Eiffel','Kantstrabe 76','Freiberg','Freistaat Sachsen','Germany','di2jo1e2o@gmail.com','03731 23 61 58','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');


-- Insert 5 branches
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('481','659','United States');
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('530','709','Canada');
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('873','754','Australia');
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('794','929','United Kingdom');
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('386','483','Germany');


-- Insert 5 managers
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('659','481','Steve','Smith','713 Kinney Street','Agawam','Massachusetts','United States','c4wd6h@hotmail.com','413-531-5936','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','manager',60000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('709','530','Greg','Anderson','3574 Blanshard Avenue','Victoria','British Columbia','Canada','djq9rklh@rogers.ca','250-360-3357','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','manager',40000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('754','873','Eva','Ferres','23 Auricht Road','Padthaway','South Australia','Australia','5bvd5@gmail.com','(08) 8758 2362','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','manager',50000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('929','794','Ethan','Coleman','95 Constitution St','Llangybi','','United Kingdom','vowre@hotmail.com','079 3612 5465','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','manager',45000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('483','386','Doreen','Werfel','Chausseestr. 89','Hammer','Mecklenburg-Vorpommern','Germany','ldsvn@gmail.com','03976 12 36 70','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','manager',45000);


-- Insert 10 other employees
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('184','481','Nellie','Ruel','1862  Gandy Street','Saint Louis','Missouri','United States','eeo@hotmail.com','314-994-4147','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','representative',40000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('552','481','Daniel','Sweeney','1737 Fowler Avenue','Newnan','Georgia','United States','7mxzel6@gmail.com','770-253-4522','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','customer service',20000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('368','481','Mary','Neil','4556  Edsel Road','Los Angeles','California','United States','dje@hotmail.com','818-417-3149','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','human resources',10000);

INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('537','530','Robert','Clark','3731 St Jean Baptiste Street','Sayabec','Quebec','Canada','23hf@hotmail.com','418-536-4062','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','representative',20000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('520','530','Scott','Gonzales','1067 Carling Avenue','Ottawa','Ontario','Canada','sijv@gmail.com','613-286-1766','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','human resources',30000);

INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('843','873','Madison','Hyland','22 Cambridge Street','Penrith','New South Wales','Australia','293dk@gmail.com','(02) 4771 9248','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','information technology',25000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('850','873','Samantha','Tompson','24 Elizabeth Street','North Deep Creek','Queensland','Australia','pskd@gmail.com','(07) 5330 8227','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','customer service',13000);

INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('885','794','Niamh','Barber','54 Shore Street','Stoke Charity','','United Kingdom','jdojn@gmail.com','077 7864 8757','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','representative',22000);

INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('962','386','Martin','Burger','Budapester Strasse 10','Lengenbostel','Niedersachsen','Germany','pemdkd@gmail.com','04282 70 16 40','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','human resources',15000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('282','386','Sabrina','Lehrer','Neue Robstr. 12','Esslingen Serach','Baden-Württemberg','Germany','fnsnekvj@gmail.com','0711 99 26 37','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9','information technology',35000);


-- Insert 10 hosts
INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('669','983','Helen','Acton','1720 Coolidge Street','Columbia Falls','Montana','United States','eokm@yahoo.com','406-892-1832','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('385','276','Hector','Boyer','136 Bombardier Way','Mcarthur','California','United States','ufvo@gmail.com','734-956-7710','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('945','584','Tommy','Nicoll','3730 Blackwell Street','Dutch Harbor','Alaska','United States','sjbij@gmail.com','907-359-8821','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('980','771','Eli','Perez','3176 Reserve St','Elgin','Ontario','Canada','msp@gmail.com','613-359-7833','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('114','271','Shelley','Groh','4301 Township Rd','Fort Mcmurray','Alberta','Canada','apnwj@gmail.com','780-598-4082','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('490','699','Ruby','Karcher','2475 Heritage Drive','Calgary','Alberta','Canada','pemvkdml@gmail.com','403-771-4510','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('921','842','Katie','Martinovich','42 Davis Street','Mcdowall','Queensland','Australia','qpowjn@hotmail.com','(07) 3159 7877','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');
INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('247','790','Charles','Zahel','53 Magnolia Drive','Bexley South','New South Wales','Australia','oveovje@gmail.com','(02) 6265 9244','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('197','308','Luke','Herbert','36 Traill Street','Rosewarne','','United Kingdom','eydodij@gmail.com','079 6758 5000','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');

INSERT INTO homestay.host(host_id,guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('932','858','Sebastian','Winkel','Schönhauser Allee 81','Villingen-Schwenningen Mühlhausen','Baden-Württemberg','Germany','wwwww4@gmail.com','07721 51 60 07','ce04575ac62be1cc3b003ec85ab4e5fd20201803318ebe6b449bce0eee53750c','c1ffae48acac218f4e95450160f74b9e60c0d90e6fbc014208f8168845d5c7f9');


-- Insert 10 Pricings
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('418','apartment','shared room',FALSE,FALSE,150); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('740','bungalow','private room',TRUE,TRUE,300); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('175','condo','shared room',FALSE,TRUE,200); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('429','cabin','shared room',TRUE,FALSE,300); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('691','lodge','unique space',TRUE,TRUE,500); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('241','mansion','private room',FALSE,TRUE,5000); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('672','single-family house','private room',FALSE,TRUE,300); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('181','tiny home','unique space',TRUE,FALSE,200); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('531','townhome','shared room',FALSE,FALSE,200); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amenities,rate)
VALUES ('144','vacation cottage','private room',TRUE,TRUE,700); --


-- Insert 10 properties
-- TO_DATE(''.'DD/MM/YYYY')
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('217','669','241',8,'queen',FALSE,'A mansion with no pets allowed and with amenities.','1810 Poe Road','Houston','Texas','United States',TO_DATE('14/07/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('501','385','429',2,'bunk',FALSE,'A cabin.','1098 Elk Avenue','South Lake Tahoe','California','United States',TO_DATE('01/06/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('258','945','740',4,'single',TRUE,'A bungalow in the middle of somewhere better.','4011 Better Street','Overland Park','Kansas','United States',TO_DATE('18/07/2020','DD/MM/YYYY'));

INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('430','980','691',4,'single',TRUE,'A lodge. Enjoy.','2987 Edson Drive','Hinton','Alberta','Canada',TO_DATE('03/10/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('224','114','672',2,'single',FALSE,'This is a home.','3758 Bridgeport Rd','Milton','Ontario','Canada',TO_DATE('29/08/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('937','490','175',4,'bunk',FALSE,'We provide amenities.','2258 Port Washington Road','Barons','Alberta','Canada',TO_DATE('07/06/2020','DD/MM/YYYY'));

INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('543','921','144',6,'queen',TRUE,'Vacation home!','80 Gloucester Avenue','Brompton','South Australia','Australia',TO_DATE('22/12/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('722','247','531',4,'bunk',FALSE,'Enjoy this town.','51 Edward Bennett Drive','Cabarita','New South Wales','Australia',TO_DATE('07/07/2020','DD/MM/YYYY'));

INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('194','197','418',2,'single',TRUE,'Great view.','68 Holgate Rd','Ramsholt','','United Kingdom',TO_DATE('18/10/2020','DD/MM/YYYY'));

INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('135','932','181',2,'other',FALSE,'One of a kind.','Rathausstrasse 3','Donauwörth','Freistaat Bayern','Germany',TO_DATE('18/08/2020','DD/MM/YYYY'));


-- Insert 11 Agreements, Payments, and Reviews
INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('466','995','669','217',TO_DATE('14/04/2019','DD/MM/YYYY'),TO_DATE('24/05/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('466','669','995','cash',205000,'completed');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('466',4,'The host was available for questions and concerns.','Some rooms were dusty.','The experience was nice.','Debatably not worth the capitalism.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('477','995','197','194',TO_DATE('12/07/2019','DD/MM/YYYY'),TO_DATE('19/07/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('477','197','995','debit card',1200,'completed');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('477',3,'The host was available occasionally.','Somewhat clean.','It was okay.','No comment.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('729','842','197','194',TO_DATE('10/06/2019','DD/MM/YYYY'),TO_DATE('07/09/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('729','197','842','credit card',13500,'completed');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('729',3,'The host was available at all time','It was fairly clean.','It was reasonably comfortable.','Neighbours were loud.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('467','747','197','194',TO_DATE('16/01/2020','DD/MM/YYYY'),TO_DATE('05/04/2020','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('467','197','747','debit card',66900,'pending');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('467',2,'The host was only avaible during the day.','It was fair.','It was smaller than expected','The walls were thin.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('662','971','385','501',TO_DATE('12/06/2019','DD/MM/YYYY'),TO_DATE('23/07/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('662','385','971','check',12600,'pending');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('662',1,'The host was available sometimes.','It was not bad.','The location was not great.','There was bugs.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('961','858','980','430',TO_DATE('21/08/2019','DD/MM/YYYY'),TO_DATE('24/08/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('961','980','858','cash',2000,'completed');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('961',5,'The host was very nice.','The place was clean.','Would come again.','Would recommend.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('572','673','980','430',TO_DATE('26/08/2019','DD/MM/YYYY'),TO_DATE('07/09/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('572','980','673','debit card',6500,'completed');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('572',4,'The host was available.','It was generally clean.','The surroundings were nice.','No further comment.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('930','912','114','224',TO_DATE('03/09/2019','DD/MM/YYYY'),TO_DATE('27/10/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('930','114','912','cash',16500,'completed');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('930',3,'Host was okay.','Generally clean.','It was fine.','No comment.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('290','718','247','722',TO_DATE('07/12/2019','DD/MM/YYYY'),TO_DATE('27/12/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('290','247','718','credit card',4200,'pending');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('290',3,'The host was nice.','It was clean.','It was okay but would not go again.','No bus stops nearby.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('981','983','932','135',TO_DATE('06/02/2020','DD/MM/YYYY'),TO_DATE('13/02/2020','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('981','932','983','debit card',1600,'pending');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('981',4,'It was hard to reach the host.','It was clean.','Would come again.','Wished there was a more convenient bed.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('675','608','490','937',TO_DATE('13/02/2020','DD/MM/YYYY'),TO_DATE('08/03/2020','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('675','490','608','credit card',5000,'pending');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('675',2,'Sometimes the host does not respond.','It is okay.','Not my style.','No comment.');



-- OTHER SQL CODE USED WITHIN THE APPLICATION ----------------------------------

INSERT INTO homestay.guest VALUES (<field_name>,<field_name>,<field_name>,<field_name>,<field_name>,<field_name>,<field_name>,<field_name>,<field_name>,<field_name>,<field_name>);

SELECT guest_id, password_hash, salt FROM homestay.guest WHERE (email = <field_name>);

SELECT first_name, last_name FROM homestay.guest WHERE (guest_id = <field_name>);

SELECT property_id, max_guests, bed_type, about, street_address, city, state_province, country, available_date FROM homestay.property;

SELECT * FROM homestay.property WHERE (property_id = <field_name>);

SELECT first_name, last_name FROM homestay.host WHERE (host_id = <field_name>);

SELECT * FROM homestay.pricing WHERE (pricing_id = <field_name>);



-- QUERIES THE ENTERPRISE IS INTERESTED IN -------------------------------------

-- 1:
SELECT concat(G.first_name, ' ', G.last_name) as guest_name,
       Price.property_type as rental_price,
       A.begin_date as signing_date,
       B.country as branch,
       Pay.method as payment_type,
       Pay.transaction_status as status
FROM homestay.guest as G, homestay.pricing as Price, homestay.payment as Pay,
     homestay.agreement as A, homestay.host as H, homestay.branch as B,
     homestay.property as P
WHERE G.guest_id = A.guest_id
      AND Pay.agreement_id = A.agreement_id
      AND P.property_id = A.property_id
      AND Price.pricing_id = P.pricing_id
      AND H.host_id = A.host_id
      AND B.country = P.country
ORDER BY payment_type asc, signing_date desc;

-- 2:
CREATE VIEW GuestListView as
SELECT G.guest_id, G.first_name, G.last_name,
       G.street_address, G.city, G.state_province,
       G.country, G.email, G.phone
FROM homestay.guest as G, homestay.branch as B
WHERE G.country = B.country
ORDER BY B.branch_id, G.guest_id;

-- 3:
SELECT *
FROM homestay.property as P
WHERE P.property_id IN
      (SELECT P.property_id
       FROM homestay.agreement as A,
            homestay.property as P,
            homestay.pricing as Price,
            homestay.payment as Pay
       WHERE A.property_id = P.property_id
             AND A.agreement_id = Pay.agreement_id
             AND Pay.transaction_status = 'completed'
             AND Price.pricing_id = P.pricing_id
             AND Price.rate = (SELECT min(homestay.pricing.rate) FROM homestay.pricing));

-- 4:
SELECT P.*
FROM homestay.property as P, homestay.agreement as A,
     homestay.branch as B, homestay.review as R
WHERE P.property_id = A.property_id
      AND R.agreement_id = A.agreement_id
      AND B.country = P.country
ORDER BY B.branch_id, R.rating;

-- 5:
SELECT DISTINCT *
FROM homestay.property as P
WHERE P.property_id NOT IN
      (SELECT P.property_id
       FROM homestay.property as P, homestay.agreement as A
       WHERE A.property_id = P.property_id);

-- 6:
SELECT P.*
FROM homestay.property as P, homestay.agreement as A
WHERE P.property_id = A.property_id
      AND 10 in (SELECT DATE_PART('day',date_trunc('day',dd):: date)
                 FROM generate_series(A.begin_date::date,A.end_date::date,'1 day'::interval)dd);

-- 7:
SELECT E.employee_id as ids, concat(E.first_name,' ',E.last_name) as name,
       E.branch_id, B.country as branch_name, E.salary
FROM homestay.employee as E, homestay.branch as B
WHERE B.branch_id = E.branch_id AND (E.salary >= 15000)
ORDER BY B.manager_id, E.employee_id;

-- 8:
SELECT Price.property_type as property_type,
       H.host_id as host,
       Pay.amount as amount_paid,
       Pay.method as payment_type
FROM homestay.pricing as Price, homestay.host as H,
     homestay.payment as Pay, homestay.agreement as A,
     homestay.property as P
WHERE '<insert guest_id here>' = A.guest_id
      AND Pay.agreement_id = A.agreement_id
      AND A.host_id = H.host_id
      AND A.property_id = P.property_id
      AND Price.pricing_id = P.pricing_id;

-- 9:
UPDATE homestay.guest SET phone = '<insert new phone number here>' WHERE guest_id = '<insert guest_id here>';

-- 10:
CREATE FUNCTION FirstNameFirst(first_name VARCHAR(40),last_name
  VARCHAR(40)) RETURNS VARCHAR(81) AS $$
  BEGIN
  RETURN concat(first_name, ' ', last_name);
  END; $$
  LANGUAGE PLPGSQL;
