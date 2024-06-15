# Selecting and using our Database
USE superstore;

# Exploring all tables in Database
SHOW TABLES;

# Querying each table
SELECT * FROM category_lookup;

SELECT * FROM territory_lookup;

SELECT * FROM transaction_lookup;

/*We can see that all the tables have table id's which acts as a primary key
for their respective tables. Let's join all the tables based on their id's to
create our final dataset ready for further analysis.
*/

# Creating view for final table
CREATE VIEW SuperStore AS
SELECT tran.`Ship Mode`, tran.Segment, 
ter.Country, ter.City, ter.State, ter.`Postal Code`, ter.Region,
cat.Category, cat.`Sub-Category`,
tran.Sales, tran.Quantity, tran.Discount, tran.Profit
FROM transaction_lookup AS tran
LEFT JOIN territory_lookup AS ter USING (Territory_ID)
LEFT JOIN category_lookup AS cat USING (Category_ID)
ORDER BY tran.transaction_ID;

# Counting rows of final table to check if it matches transaction table rows
SELECT COUNT(*) FROM SuperStore;

# TOP 10 rows from dataset
SELECT * FROM SuperStore LIMIT 10;

/* Everthing looks good. Now, we can export dataset for analysis.*/


