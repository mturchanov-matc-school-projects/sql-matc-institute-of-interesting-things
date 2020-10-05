--04/21/20  
--Mykhailo Turchanov  
--Project 04  
--Script for creating tables  

-- SELECT * 
-- FROM   items 
--        LEFT OUTER JOIN item_location 
--                     ON items.itemid = item_location.itemid 
--        LEFT OUTER JOIN locations 
--                     ON item_location.locationid = locations.locationid; 

ALTER TABLE items 
  ADD datedamaged DATE NULL; 

INSERT INTO items 
VALUES     (6,'Nixon Self-Portrait','',12700.00,'18-DEC-2018',0,NULL); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (8,'Room A14','right wall, plexi-case 14','19-DEC-2018'); 

INSERT INTO item_location 
VALUES     (6,8); 

INSERT INTO items 
VALUES     (7,'1900''s American Jazz Trombone','donated by Lucky Burnside ', 
            25000.00, 
            '08-DEC-1995',0,NULL); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (9,'Room A14','display stand 8','05-JAN-1996'); 

INSERT INTO item_location 
VALUES     (7,9); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (10,'Room A14','display stand 11','11-JUN-1999'); 

INSERT INTO item_location 
VALUES     (7,10); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (11,'Room B7','on the shelves along the left wall','09-SEP-2007'); 

INSERT INTO item_location 
VALUES     (7,11); 

INSERT INTO items 
VALUES     (8,'Velociraptor Tooth','',2500,'12-DEC-1991',0,NULL); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (12,'Room A14','display stand 8','11-JUN-1999'); 

INSERT INTO item_location 
VALUES     (8,12); 

INSERT INTO items 
VALUES     (9,'Trilobite Fossil','',150,'07-JUN-2007',0,NULL); 

INSERT INTO locations 
            (locationid,storagetype,description,datewhenput) 
VALUES     (13,'Room A14','display stand 11','09-SEP-2007'); 

INSERT INTO item_location 
VALUES     (9,13); 

-- average worth value on each room  
SELECT storagetype,Avg(worthvalue) averageValue 
FROM   items 
       INNER JOIN item_location 
               ON items.itemid = item_location.itemid 
       LEFT JOIN locations 
              ON item_location.locationid = locations.locationid 
WHERE  storagetype LIKE '%Room%' 
GROUP  BY storagetype 
ORDER  BY storagetype; 

--  Create a SQL statement that displays the artifacts  
--      and the number of days they have been on displayy 
SELECT NAME,Round(( CURRENT_DATE - locations.datewhenput )) Days 
FROM   items 
       INNER JOIN (SELECT itemid,Min(locationid) locationID 
                   FROM   item_location 
                   GROUP  BY itemid)item_location 
               ON items.itemid = item_location.itemid 
       LEFT JOIN locations 
              ON item_location.locationid = locations.locationid 
WHERE  items.islost = 0 
UNION 
SELECT NAME,Round(( lost_items.datalost - locations.datewhenput )) Days 
FROM   items 
       INNER JOIN lost_items 
               ON items.itemid = lost_items.itemid 
       INNER JOIN (SELECT itemid,Min(locationid) locationID 
                   FROM   item_location 
                   GROUP  BY itemid)item_location 
               ON items.itemid = item_location.itemid 
       LEFT JOIN locations 
              ON item_location.locationid = locations.locationid 
WHERE  items.islost = 1; 

--  Create a SQL statement that displays a report of the items currently on display.       
SELECT NAME,storagetype,locations.description 
FROM   items 
       INNER JOIN (SELECT itemid,Max(locationid) locationID 
                   FROM   item_location 
                   GROUP  BY itemid)item_location 
               ON items.itemid = item_location.itemid 
       LEFT JOIN locations 
              ON item_location.locationid = locations.locationid 
WHERE  items.islost = 0; 

--that sets the date damaged column to February 4,  
--    2003 for all the items that were in room A14 on that date     
UPDATE items 
SET    datedamaged = '02-04-2003' 
WHERE  itemid IN (SELECT itemid 
                  FROM   item_location 
                  WHERE  items.itemid = item_location.itemid 
                         AND locationid = (SELECT locationid 
                                           FROM   locations 
                                           WHERE  item_location.locationid = 
                                                  locations.locationid 
                                                  AND storagetype LIKE 
                                                      '%Room A14%' 
                                                  AND '02-04-2003' BETWEEN 
                                                      datewhenput 
                                                      AND 
                                                     (SELECT NVL(datewhenput, CURRENT_DATE) 
                                                      FROM locations 
                                                      WHERE locations.locationid = item_location.locationid + 1)
                                            )
                  ); 