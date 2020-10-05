--03/29/20
--Mykhailo Turchanov
--Project 03
--Script for inserting data


--Inserting queries from details

INSERT INTO items VALUES(1,'mummy','in Glass Case',1900000.00,'30-04-2005',0);
INSERT INTO locations(locationID,storageType,dateWhenPut) VALUES(1,'Room Rotunda','19-08-2019');
INSERT INTO item_location VALUES(1,1);
--
INSERT INTO items VALUES(2,'Mongol Statue','27 feet',3400000.00,'30-04-2005',0);
INSERT INTO locations(locationID,storageType,dateWhenPut) VALUES(2,'Room Rotunda','30-10-2017');
INSERT INTO item_location VALUES(2,2);

INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(3,'Room Foyer','It was moved to make room for the mummy.','30-10-2017');
INSERT INTO item_location VALUES(2,3);

INSERT INTO items VALUES(3,'Mesopotamian dish','',125000.50,'02-03-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut)
    VALUES(4,'Room 39','in the glass case C3 on the upper right.','22-04-2004');
INSERT INTO item_location VALUES(3,4);
UPDATE items SET isLost = 1 WHERE itemID = 3;
INSERT INTO lost_items VALUES(3,'07-09-2007');

INSERT INTO items VALUES(4,'Hittite bracelet','',3200.00,'15-01-1987',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut)
    VALUES(5,'room 39','in the glass case C3 on the upper right.','01-03-2011');
INSERT INTO item_location VALUES(4,5);
INSERT INTO locations(locationID,storageType,description,dateWhenPut)
    VALUES(6,'room B7','in the shelves along the left wall','19-08-2019');
INSERT INTO item_location VALUES(4,6);

INSERT INTO items VALUES(5,'Australian coins','Ancient ',3000,'02-11-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut)
    VALUES(7,'room B7','in drawer D1','11-02-1993');
INSERT INTO item_location VALUES(5,7);
UPDATE items SET isLost = 1 WHERE itemID = 5;
INSERT INTO lost_items VALUES(5,'05-09-1997');


--remaining artifacts

INSERT INTO items VALUES(6,'Hittite Bracelet','',9999,'02-01-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(8,'Storage','drawer B7','02-01-1992');
INSERT INTO item_location VALUES(6,8);

INSERT INTO items VALUES(7,'Nixon Self-Portrait','',20000,'01-01-1988',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(9,'Storage','drawer A3 to the left side','01-01-1988');
INSERT INTO item_location VALUES(7,9);

INSERT INTO items VALUES(8,'American Jazz Trombone','1900s',50,'07-04-2000',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(10,'Storage','red case','07-04-2000');
INSERT INTO item_location VALUES(8,10);

INSERT INTO items VALUES(9,'Velociraptor Tooth','',300,'06-06-1950',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(11,'Storage','drawer A9','06-06-1950');
INSERT INTO item_location VALUES(9,11);

INSERT INTO items VALUES(10,'Trilobite Fossil','',1230.50,'02-03-2012',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(12,'Storage','drawer F1','30-10-2007');
INSERT INTO item_location VALUES(10,12);

INSERT INTO items VALUES(11,'Lucy','',5000.50,'02-03-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(13,'Storage','drawer F2','30-10-2012');
INSERT INTO item_location VALUES(11,13);

INSERT INTO items VALUES(12,'Ancient Antarctic Hut','',9999,'02-01-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(14,'Storage','drawer F7','02-08-1991');
INSERT INTO item_location VALUES(12,14);

INSERT INTO items VALUES(13,'Jimis Second Electric Guitart','',9999,'02-01-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(15,'Storage','drawer F6','02-03-1952');
INSERT INTO item_location VALUES(13,15);

INSERT INTO items VALUES(14,'1870s Harmonica','',9999,'02-01-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(16,'Storage','drawer B12','07-03-1982');
INSERT INTO item_location VALUES(14,16);

INSERT INTO items VALUES(15,'Moon Rock','',9999,'02-01-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(17,'Storage','drawer F4','06-01-1991');
INSERT INTO item_location VALUES(15,17);

INSERT INTO items VALUES(16,'Neil Armstrong Boot','',9999,'02-01-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(18,'Storage','drawer C1','10-02-1995');
INSERT INTO item_location VALUES(16,18);

INSERT INTO items VALUES(17,'Railroad Ceremonial Bronze Spike','',9999,'02-01-1992',0);
INSERT INTO locations(locationID,storageType,description,dateWhenPut) 
    VALUES(19,'Storage','case V1','11-08-1999');
INSERT INTO item_location VALUES(17,19);