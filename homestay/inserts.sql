-- INSERT INTO TableName(a1,...,an) VALUES (--data--);

-- Insert 5 branches
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('481','659','United States');
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('530','709','Canada');
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('873','754','Australia');
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('794','929','United Kingdom');
INSERT INTO homestay.branch(branch_id,manager_id,country) VALUES ('386','483','Germany');


-- Insert 5 managers
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('659','481','Steve','Smith','713 Kinney Street','Agawam','Massachusetts','United States','c4wd6h@hotmail.com','413-531-5936','','','manager',60000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('709','530','Greg','Anderson','3574 Blanshard Avenue','Victoria','British Columbia','Canada','djq9rklh@rogers.ca','250-360-3357','','','manager',40000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('754','873','Eva','Ferres','23 Auricht Road','Padthaway','South Australia','Australia','5bvd5@gmail.com','(08) 8758 2362','','','manager',50000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('929','794','Ethan','Coleman','95 Constitution St','Llangybi','','United Kingdom','vowre@hotmail.com','079 3612 5465','','','manager',45000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('483','386','Doreen','Werfel','Chausseestr. 89','Hammer','Mecklenburg-Vorpommern','Germany','ldsvn@gmail.com','03976 12 36 70','','','manager',45000);


-- Insert 10 other employees
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('184','481','Nellie','Ruel','1862  Gandy Street','Saint Louis','Missouri','United States','eeo@hotmail.com','314-994-4147','','','representative',40000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('552','481','Daniel','Sweeney','1737 Fowler Avenue','Newnan','Georgia','United States','7mxzel6@gmail.com','770-253-4522','','','customer service',20000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('368','481','Mary','Neil','4556  Edsel Road','Los Angeles','California','United States','dje@hotmail.com','818-417-3149','','','human resources',10000);

INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('537','530','Robert','Clark','3731 St Jean Baptiste Street','Sayabec','Quebec','Canada','23hf@hotmail.com','418-536-4062','','','representative',20000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('520','530','Scott','Gonzales','1067 Carling Avenue','Ottawa','Ontario','Canada','sijv@gmail.com','613-286-1766','','','human resources',30000);

INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('843','873','Madison','Hyland','22 Cambridge Street','Penrith','New South Wales','Australia','293dk@gmail.com','(02) 4771 9248','','','representative',25000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('850','873','Samantha','Tompson','24 Elizabeth Street','North Deep Creek','Queensland','Australia','pskd@gmail.com','(07) 5330 8227','','','customer service',13000);

INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('885','794','Niamh','Barber','54 Shore Street','Stoke Charity','','United Kingdom','jdojn@gmail.com','077 7864 8757','','','representative',22000);

INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('962','386','Martin','Burger','Budapester Strasse 10','Lengenbostel','Niedersachsen','Germany','pemdkd@gmail.com','04282 70 16 40','','','representative',15000);
INSERT INTO homestay.employee(employee_id,branch_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt,job_position,salary)
VALUES ('282','386','Sabrina','Lehrer','Neue Robstr. 12','Esslingen Serach','Baden-Württemberg','Germany','fnsnekvj@gmail.com','0711 99 26 37','','','information technology',35000);


-- Insert 10 hosts
INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('669','983','184','Helen','Acton','1720 Coolidge Street','Columbia Falls','Montana','United States','eokm@yahoo.com','406-892-1832','','');
INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('385','276','184','Hector','Boyer','136 Bombardier Way','Mcarthur','California','United States','ufvo@gmail.com','734-956-7710','','');
INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('945','584','184','Tommy','Nicoll','3730 Blackwell Street','Dutch Harbor','Alaska','United States','sjbij@gmail.com','907-359-8821','','');

INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('980','771','537','Eli','Perez','3176 Reserve St','Elgin','Ontario','Canada','msp@gmail.com','613-359-7833','','');
INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('114','271','537','Shelley','Groh','4301 Township Rd','Fort Mcmurray','Alberta','Canada','apnwj@gmail.com','780-598-4082','','');
INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('490','699','537','Ruby','Karcher','2475 Heritage Drive','Calgary','Alberta','Canada','pemvkdml@gmail.com','403-771-4510','','');

INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('921','842','843','Katie','Martinovich','42 Davis Street','Mcdowall','Queensland','Australia','qpowjn@hotmail.com','(07) 3159 7877','','');
INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('247','790','843','Charles','Zahel','53 Magnolia Drive','Bexley South','New South Wales','Australia','oveovje@gmail.com','(02) 6265 9244','','');

INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('197','308','885','Luke','Herbert','36 Traill Street','Rosewarne','','United Kingdom','eydodij@gmail.com','079 6758 5000','','');

INSERT INTO homestay.host(host_id,guest_id,rep_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('932','858','962','Sebastian','Winkel','Schönhauser Allee 81','Villingen-Schwenningen Mühlhausen','Baden-Württemberg','Germany','wwwww4@gmail.com','07721 51 60 07','','');


-- Insert 10 guests that are hosts
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('983','Helen','Acton','1720 Coolidge Street','Columbia Falls','Montana','United States','eokm@yahoo.com','406-892-1832','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('276','Hector','Boyer','136 Bombardier Way','Mcarthur','California','United States','ufvo@gmail.com','734-956-7710','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('584','Tommy','Nicoll','3730 Blackwell Street','Dutch Harbor','Alaska','United States','sjbij@gmail.com','907-359-8821','','');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('771','Eli','Perez','3176 Reserve St','Elgin','Ontario','Canada','msp@gmail.com','613-359-7833','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('271','Shelley','Groh','4301 Township Rd','Fort Mcmurray','Alberta','Canada','apnwj@gmail.com','780-598-4082','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('699','Ruby','Karcher','2475 Heritage Drive','Calgary','Alberta','Canada','pemvkdml@gmail.com','403-771-4510','','');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('842','Katie','Martinovich','42 Davis Street','Mcdowall','Queensland','Australia','qpowjn@hotmail.com','(07) 3159 7877','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('790','Charles','Zahel','53 Magnolia Drive','Bexley South','New South Wales','Australia','oveovje@gmail.com','(02) 6265 9244','','');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('308','Luke','Herbert','36 Traill Street','Rosewarne','','United Kingdom','eydodij@gmail.com','079 6758 5000','','');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('858','Sebastian','Winkel','Schönhauser Allee 81','Villingen-Schwenningen Mühlhausen','Baden-Württemberg','Germany','wwwww4@gmail.com','07721 51 60 07','','');


-- Insert 10 guests
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('912','Ian','Sanders','1946 Emeral Dreams Drive','Durand','Illinois','United States','rejoef@hotmail.com','815-248-7508','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('711','David','Gonzales','966 Burning Memory Lane','Manly','Iowa','United States','ajnvo@gmail.com','215-299-3897','','');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('995','Larry','Whisenhunt','2762 A Avenue','Edmonton','Alberta','Canada','eapaa@gmail.com','780-401-1415','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('747','William','Goines','3642 Brand Road','Saskatoon','Saskatchewan','Canada','83joo@hotmail.com','306-374-2902','','');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('608','Owen','Muskett','57 Glen William Road','East Trinity','Queensland','Australia','vwhbwo2@gmail.com','(07) 4092 7671','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('971','Bethany','Langler','52 Ranworth Road','Parkwood','Western Australia','Australia','rjeo99@gmail.com','(08) 9315 8432','','');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('225','Corey','Patterson','70 Argyll Road','Llanddaniel Fab','','United Kingdom','1got7@gmail.com','079 2497 1003','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('718','Jay','Lord','71 Netherpark Crescent','Stirchley','','United Kingdom','kjqkvpl@gmail.com','077 2963 3418','','');

INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('673','Ulrike','Lehrer','Schmarjestrasse 63','Wiesenburg','Freistaat Sachsen','Germany','soi3j33@gmail.com','033848 94 64','','');
INSERT INTO homestay.guest(guest_id,first_name,last_name,street_address,city,state_province,country,email,phone,password_hash,salt)
VALUES ('898','Katharina','Eiffel','Kantstrabe 76','Freiberg','Freistaat Sachsen','Germany','di2jo1e2o@gmail.com','03731 23 61 58','','');


-- Insert 10 Pricings
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('418','apartment','shared room',FALSE,FALSE,150); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('740','bungalow','private room',TRUE,TRUE,300); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('175','condo','shared room',FALSE,TRUE,200); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('429','cabin','shared room',TRUE,FALSE,300); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('691','lodge','unique space',TRUE,TRUE,500); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('241','mansion','private room',FALSE,TRUE,5000); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('672','single-family house','private room',FALSE,TRUE,300); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('181','tiny home','unique space',TRUE,FALSE,200); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('531','townhome','shared room',FALSE,FALSE,200); --
INSERT INTO homestay.pricing(pricing_id,property_type,room_type,pets_allowed,amentities,rate)
VALUES ('144','vacation cottage','private room',TRUE,TRUE,700); --


-- Insert 10 properties
-- TO_DATE(''.'DD/MM/YYYY')
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('217','669','241',8,'queen',FALSE,'A mansion with no pets allowed and with amentities.','1810 Poe Road','Houston','Texas','United States',TO_DATE('14/07/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('501','385','429',2,'bunk',FALSE,'A cabin.','1098 Elk Avenue','South Lake Tahoe','California','United States',TO_DATE('01/06/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('258','945','740',4,'single',TRUE,'A bungalow in the middle of somewhere better.','4011 Better Street','Overland Park','Kansas','United States',TO_DATE('18/07/2020','DD/MM/YYYY'));

INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('430','980','691',4,'single',TRUE,'A lodge. Enjoy.','2987 Edson Drive','Hinton','Alberta','Canada',TO_DATE('03/10/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('224','114','672',2,'single',FALSE,'This is a home.','3758 Bridgeport Rd','Milton','Ontario','Canada',TO_DATE('29/08/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('937','490','175',4,'bunk',FALSE,'We provide amentities.','2258 Port Washington Road','Barons','Alberta','Canada',TO_DATE('07/06/2020','DD/MM/YYYY'));

INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('543','921','144',6,'queen',TRUE,'Vacation home!','80 Gloucester Avenue','Brompton','South Australia','Australia',TO_DATE('22/12/2020','DD/MM/YYYY'));
INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('722','247','531',4,'bunk',FALSE,'Enjoy this town.','51 Edward Bennett Drive','Cabarita','New South Wales','Australia',TO_DATE('07/07/2020','DD/MM/YYYY'));

INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('194','197','418',2,'single',TRUE,'Great view.','68 Holgate Rd','Ramsholt','','United Kingdom',TO_DATE('18/10/2020','DD/MM/YYYY'));

INSERT INTO homestay.property(property_id,host_id,pricing_id,max_guests,bed_type,wheelchair_accessible,about,street_address,city,state_province,country,available_date)
VALUES ('135','932','181',2,'other',FALSE,'One of a kind.','Rathausstrasse 3','Donauwörth','Freistaat Bayern','Germany',TO_DATE('18/08/2020','DD/MM/YYYY'));


-- Insert 10 Agreements, Payments, and Reviews
INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('466','995','669','217',TO_DATE('14/04/2019','DD/MM/YYYY'),TO_DATE('24/05/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('466','669','995','cash',205000,'completed');
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('466',4,'The host was available for questions and concerns.','Some rooms were dusty.','The experience was nice.','Debatably not worth the capitalism.');

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('729',guest_id,'197','194',TO_DATE('10/06/2019','DD/MM/YYYY'),TO_DATE('07/09/2019','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('729','197',guest_id,method,amount,transaction_status);
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('729',rating,communication_comment,cleanliness_comment,value_comment,other_comment);

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('662',guest_id,host_id,property_id,TO_DATE('','DD/MM/YYYY'),TO_DATE('','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('662',host_id,guest_id,method,amount,transaction_status);
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('662',rating,communication_comment,cleanliness_comment,value_comment,other_comment);

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('961',guest_id,host_id,property_id,TO_DATE('','DD/MM/YYYY'),TO_DATE('','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('961',host_id,guest_id,method,amount,transaction_status);
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('961',rating,communication_comment,cleanliness_comment,value_comment,other_comment);

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('572',guest_id,host_id,property_id,TO_DATE('','DD/MM/YYYY'),TO_DATE('','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('572',host_id,guest_id,method,amount,transaction_status);
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('572',rating,communication_comment,cleanliness_comment,value_comment,other_comment);

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('930',guest_id,host_id,property_id,TO_DATE('','DD/MM/YYYY'),TO_DATE('','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('930',host_id,guest_id,method,amount,transaction_status);
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('930',rating,communication_comment,cleanliness_comment,value_comment,other_comment);

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('675',guest_id,host_id,property_id,TO_DATE('','DD/MM/YYYY'),TO_DATE('','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('675',host_id,guest_id,method,amount,transaction_status);
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('675',rating,communication_comment,cleanliness_comment,value_comment,other_comment);

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('290',guest_id,host_id,property_id,TO_DATE('','DD/MM/YYYY'),TO_DATE('','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('290',host_id,guest_id,method,amount,transaction_status);
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('290',rating,communication_comment,cleanliness_comment,value_comment,other_comment);

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('981',guest_id,host_id,property_id,TO_DATE('','DD/MM/YYYY'),TO_DATE('','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('981',host_id,guest_id,method,amount,transaction_status);
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('981',rating,communication_comment,cleanliness_comment,value_comment,other_comment);

INSERT INTO homestay.agreement(agreement_id,guest_id,host_id,property_id,begin_date,end_date)
VALUES ('467',guest_id,host_id,property_id,TO_DATE('','DD/MM/YYYY'),TO_DATE('','DD/MM/YYYY'));
INSERT INTO homestay.payment(agreement_id,host_id,guest_id,method,amount,transaction_status)
VALUES ('467',host_id,guest_id,method,amount,transaction_status);
INSERT INTO homestay.review(agreement_id,rating,communication_comment,cleanliness_comment,value_comment,other_comment)
VALUES ('467',rating,communication_comment,cleanliness_comment,value_comment,other_comment);
