# IPL data analysis using SQL
![](https://crickettimes.com/wp-content/uploads/2023/03/IPL-2023-broadcast-and-streaming-details.jpg)
## project overview 
  the SQL projects aims to analyze ball by ball data to provide insights into aspect of 
  match performance , including runs , wickets , and player performsnce . project address
  performance of match and stats of player through advance SQl techniques .

## key features 
  * Data cleaning, feature engineering, and preprocessing using SQL.
  * Utilization of advanced SQL queries to answer pivotal business questions.
  * Extraction of actionable insights on sales distribution, customer profitability, and 
    product efficacy.
  * Proficiency demonstrated in trend analysis and profitability assessment through SQL- 
    driven methodologies.

## Questions Resolved
1. Select the top 20 rows of the deliveries table after ordering them by id, inning, over, ball in ascending order.
2. Select the top 20 rows of the matches table.
3. Fetch data of all the matches played on 2nd May 2013 from the matches table.
4. Fetch data of all the matches where the result mode is ‘runs’ and margin of victory is more than 100 runs.
5. Fetch data of all the matches where the final scores of both teams tied and order it in descending order of the date.
6. Get the count of cities that have hosted an IPL match.
7. Create table deliveries_v02 with all the columns of the table ‘deliveries’ and an additional column ball_result containing values boundary, dot or other depending on the total_run (boundary for >= 4, dot for 0 and other for any other number)
8. Write a query to fetch the total number of boundaries and dot balls from the deliveries_v02 table.
9. Write a query to fetch the total number of boundaries scored by each team from the deliveries_v02 table and order it in descending order of the number of boundaries scored.
10. Write a query to fetch the total number of dot balls bowled by each team and order it in descending order of the total number of dot balls bowled.
11. Write a query to fetch the total number of dismissals by dismissal kinds where dismissal kind is not NA
12. Write a query to get the top 5 bowlers who conceded maximum extra runs from the deliveries table
13. Write a query to create a table named deliveries_v03 with all the columns of deliveries_v02 table and two additional column (named venue and match_date) of venue and date from table matches
14. Write a query to fetch the total runs scored for each venue and order it in the descending order of total runs scored.
15. Write a query to fetch the year-wise total runs scored at Eden Gardens and order it in the descending order of total runs scored.
16. Compare the total count of rows and total count of distinct ball_id in deliveries_v04;
17. Use the r_num created in deliveries_v05 to identify instances where ball_id is repeating. (HINT : select * from deliveries_v05 WHERE r_num=2;)
18. Use subqueries to fetch data of all the ball_id which are repeating. (HINT: SELECT * FROM deliveries_v05 WHERE ball_id in (select BALL_ID from deliveries_v05 WHERE r_num=2);


## Requirements
* SQL database management system (e.g., MySQL, PostgreSQL).
* Basic understanding of SQL querying and data manipulation techniques.














