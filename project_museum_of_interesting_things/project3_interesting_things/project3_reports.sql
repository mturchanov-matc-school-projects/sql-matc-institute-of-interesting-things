--Find total amount of all lost items:

--version 1
--generally, the column isLost could be dismissed 
--      because subquery can do the same thing
SELECT SUM(worthValue) lost_items_total_amount
FROM items WHERE isLost = 1;

--vers2
SELECT SUM(worthValue) lost_items_total_amount
FROM items WHERE itemID IN
    (SELECT itemID 
    FROM lost_items);
    


--displaying the artifact description, the room, the detailed location , 
-- the value of the artifact, the date acquired, the date at the current location and the date lost (if any).
SELECT name,storageType storage_type,locations.description,
    worthValue worth_value,dateAquired date_aquired,
    dateWhenPut date_when_put,dataLost date_lost
        FROM items
        INNER JOIN item_location 
        ON items.itemID=item_location.itemID
            LEFT JOIN locations
            ON item_location.locationID = locations.locationID
                LEFT JOIN lost_items
                ON items.itemID = lost_items.itemID
                    WHERE storageType != 'Storage';