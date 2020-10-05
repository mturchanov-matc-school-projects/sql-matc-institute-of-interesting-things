--03/29/20 
--Mykhailo Turchanov 
--Project 03 
--Script for inserting data 
--Inserting queries from details 
INSERT INTO items 
VALUES     (1,'mummy','in Glass Case',1900000.00,'30-APR-2005',0); 

INSERT INTO locations 
            (locationid,storagetype,datewhenput) 
VALUES     (1,'Room Rotunda','19-AUG-2019'); 

INSERT INTO item_location 
VALUES     (1,1); 

INSERT INTO items 
VALUES     (2,'Mongol Statue','27 feet',3400000.00,'08-APR-1993',0); 

INSERT INTO locations 
            (locationid,storagetype,datewhenput) 
VALUES     (2,'Room Rotunda','30-OCT-2017'); 

INSERT INTO item_location 
VALUES     (2,2); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (3,'Room Foyer','It was moved to make room for the mummy.', 
            '19-AUG-2019'); 

INSERT INTO item_location 
VALUES     (2,3); 

INSERT INTO items 
VALUES     (3,'Mesopotamian dish','',125000.50,'02-MAR-1992',0); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (4,'Room 39','in the glass case C3 on the upper right.','22-APR-2004' 
); 

INSERT INTO item_location 
VALUES     (3,4); 

UPDATE items 
SET    islost = 1 
WHERE  itemid = 3; 

INSERT INTO lost_items 
VALUES     (3,'09-SEP-2007'); 

INSERT INTO items 
VALUES     (4,'Hittite bracelet','',3200.00,'15-JAN-1987',0); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (5,'room 39','in the glass case C3 on the upper right.','01-MAR-2011' 
); 

INSERT INTO item_location 
VALUES     (4,5); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (6,'room B7','in the shelves along the left wall','19-AUG-2019'); 

INSERT INTO item_location 
VALUES     (4,6); 

INSERT INTO items 
VALUES     (5,'Australian coins','Ancient ',3000,'11-FEB-1992',0); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (7,'room B7','in drawer D1','11-FEB-1993'); 

INSERT INTO item_location 
VALUES     (5,7); 

UPDATE items 
SET    islost = 1 
WHERE  itemid = 5; 

INSERT INTO lost_items 
VALUES     (5,'05-SEP-1997'); 