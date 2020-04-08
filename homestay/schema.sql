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
    rep_id VARCHAR(32) NOT NULL,
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
    FOREIGN KEY (guest_id) REFERENCES homestay.guest,
    FOREIGN KEY (rep_id) REFERENCES homestay.employee(employee_id)
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
