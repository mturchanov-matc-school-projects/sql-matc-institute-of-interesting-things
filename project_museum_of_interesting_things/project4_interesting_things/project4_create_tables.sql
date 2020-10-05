--04/23/20 
--Mykhailo Turchanov 
--Project 04 
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

CREATE TABLE nmuseum_items 
  ( 
     itemid NUMBER(18),description VARCHAR2(200), 
     CONSTRAINT nmuseum_items_itemid_pk PRIMARY KEY(itemid) 
  ); 

CREATE TABLE employees 
  ( 
     employeeid NUMBER(12),position VARCHAR2(50) NULL,firstname VARCHAR2(100), 
     middlename VARCHAR2(100) NULL,lastname VARCHAR2(100),salary DECIMAL(10, 2), 
     address VARCHAR2(100),city VARCHAR2(50),state CHAR(2), 
     zipaddress VARCHAR2(14),withus NUMBER(1) DEFAULT 0 NOT NULL, 
     CONSTRAINT employee#_employeeid_pk PRIMARY KEY(employeeid) 
  ); 

CREATE TABLE employee_phone_numbers 
  ( 
     employeeid NUMBER(12),phonenumber NUMBER(12), 
     CONSTRAINT emp_phone_num#_empid_pk PRIMARY KEY(employeeid), 
     CONSTRAINT emp_phone_num#_employees#_fk FOREIGN KEY(employeeid) REFERENCES 
     employees(employeeid) 
  ); 

CREATE TABLE emp_appraise_nm_items 
  ( 
     employeeid NUMBER(12),nonmuseumitemid NUMBER(12),worthvalue NUMBER(10, 2), 
     CONSTRAINT emp_appr_nmitems_emp#item#_pk PRIMARY KEY(employeeid, 
     nonmuseumitemid), 
     CONSTRAINT emp_appr_nmitems_employeeid_fk FOREIGN KEY(employeeid) 
     REFERENCES employees(employeeid), 
     CONSTRAINT emp_appr_nmitems_itemid_fk FOREIGN KEY(nonmuseumitemid) 
     REFERENCES nmuseum_items(itemid) 
  ); 

CREATE TABLE locations 
  ( 
     locationid NUMBER(12),storagetype VARCHAR2(100) DEFAULT 'Storage', 
     description VARCHAR2(200) NULL,datewhenput DATE, 
     CONSTRAINT locations#locationid_pk PRIMARY KEY(locationid) 
  ); 

CREATE TABLE items 
  ( 
     itemid NUMBER(12),NAME VARCHAR2(100) NOT NULL, 
     description VARCHAR2(250) NULL,worthvalue NUMBER(12, 2),dateaquired DATE, 
     islost NUMBER(1) DEFAULT 0 NOT NULL, 
     CONSTRAINT items#itemid_pk PRIMARY KEY(itemid) 
  ); 

CREATE TABLE emp_appraise_mitems 
  ( 
     employeeid NUMBER(12),museumitemid NUMBER(12), 
     CONSTRAINT emp_appr_mitems_emp#item#_pk PRIMARY KEY(employeeid, 
     museumitemid), 
     CONSTRAINT emp_appr_mitems_employeeid_fk FOREIGN KEY(employeeid) REFERENCES 
     employees(employeeid), 
     CONSTRAINT emp_appr_mitems_itemid_fk FOREIGN KEY(museumitemid) REFERENCES 
     items(itemid) 
  ); 

CREATE TABLE item_location 
  ( 
     itemid NUMBER(12),locationid NUMBER(12), 
     CONSTRAINT item_location_pk PRIMARY KEY(locationid, itemid), 
     CONSTRAINT item_location_locationid_fk FOREIGN KEY(locationid) REFERENCES 
     locations(locationid), 
     CONSTRAINT item_location_itemid_fk FOREIGN KEY(itemid) REFERENCES items( 
     itemid) 
  ); 

CREATE TABLE lost_items 
  ( 
     itemid NUMBER(12),datalost DATE, 
     CONSTRAINT lost_items#_itemid_pk PRIMARY KEY(itemid), 
     CONSTRAINT lost_items#_items#_itemid_fk FOREIGN KEY(itemid) REFERENCES 
     items(itemid) 
  ); 