--03/29/20
--Mykhailo Turchanov
--Project 03
--Script for creating tables

DROP TABLE emp_appraise_nm_items;
DROP TABLE nmuseum_items;
DROP TABLE item_location;
DROP TABLE locations;
DROP TABLE lost_items;

DROP TABLE emp_appraise_mitems;
DROP TABLE employee_phone_numbers;
DROP TABLE items;
DROP TABLE employees;

CREATE TABLE nmuseum_items (
    itemID NUMBER(12),
    description VARCHAR2(200),
    CONSTRAINT nmuseum_items_itemID_pk PRIMARY KEY(itemID)
);

CREATE TABLE employees (
    employeeID NUMBER(12),
    position VARCHAR2(50) NULL,
    firstName VARCHAR2(100),
    middleName VARCHAR2(100) NULL,
    lastName VARCHAR2(100),
    salary DECIMAL(10,2),
    address VARCHAR2(100),
    city VARCHAR2(50),
    state CHAR(2),
    zipAddress VARCHAR2(14),
    withUs NUMBER(1) DEFAULT 0 NOT NULL,
    CONSTRAINT employee#_employeeID_pk PRIMARY KEY(employeeID)
);

CREATE TABLE employee_phone_numbers (
    employeeID NUMBER(12),
    phoneNumber NUMBER(12),
    CONSTRAINT emp_phone_num#_empID_pk PRIMARY KEY(employeeID),
    CONSTRAINT emp_phone_num#_employees#_fk FOREIGN KEY(employeeID)
        REFERENCES employees(employeeID)
);

CREATE TABLE emp_appraise_nm_items (
    employeeID NUMBER(12),
    nonmuseumItemID NUMBER(12),
    worthValue NUMBER(10,2),
    CONSTRAINT emp_appr_nmitems_emp#item#_pk PRIMARY KEY(employeeID,nonmuseumItemID),
    CONSTRAINT emp_appr_nmitems_employeeID_fk FOREIGN KEY(employeeID)
        REFERENCES employees(employeeID),
    CONSTRAINT emp_appr_nmitems_itemID_fk FOREIGN KEY(nonmuseumItemID)
        REFERENCES nmuseum_items(itemID)
);


CREATE TABLE locations (
    locationID NUMBER(12),
    storageType VARCHAR2(100) DEFAULT 'Storage',
    description VARCHAR2(200) NULL,
    dateWhenPut date,
    CONSTRAINT locations#locationID_pk PRIMARY KEY(locationID)    
);

CREATE TABLE items (
    itemID NUMBER(12),
    name VARCHAR2(100) NOT NULL,
    description VARCHAR2(250) NULL,
    worthValue NUMBER(12,2),
    dateAquired DATE,
    isLost NUMBER(1) DEFAULT 0 NOT NULL,
    CONSTRAINT items#itemID_pk PRIMARY KEY(itemID)
);

CREATE TABLE emp_appraise_mitems (
    employeeID NUMBER(12),
    museumItemID NUMBER(12),
    CONSTRAINT emp_appr_mitems_emp#item#_pk PRIMARY KEY(employeeID,museumItemID),
    CONSTRAINT emp_appr_mitems_employeeID_fk FOREIGN KEY(employeeID)
        REFERENCES employees(employeeID),
    CONSTRAINT emp_appr_mitems_itemID_fk FOREIGN KEY(museumItemID)
        REFERENCES items(itemID)
);

CREATE TABLE item_location (
    itemID NUMBER(12),
    locationID NUMBER(12),
    CONSTRAINT item_location_pk PRIMARY KEY(locationID,itemID),
    CONSTRAINT item_location_locationID_fk FOREIGN KEY(locationID)
        REFERENCES locations(locationID),
     CONSTRAINT item_location_itemID_fk FOREIGN KEY(itemID)
        REFERENCES items(itemID)
);

CREATE TABLE lost_items (
    itemID NUMBER(12),
    dataLost date,
    CONSTRAINT lost_items#_itemID_pk PRIMARY KEY(itemID),
    CONSTRAINT lost_items#_items#_itemID_fk FOREIGN KEY(itemID)
        REFERENCES items(itemID)
);