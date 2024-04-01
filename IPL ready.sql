--task 1--
--Select the top 20 rows of the deliveries table after ordering them by id, inning, over, ball in ascending order.

select * from deliveries limit 20; 

--task 2--
--Select the top 20 rows of the matches table.

select * from matches limit 20; 

--task 3--
--Fetch data of all the matches played on 2nd May 2013 from the matches table..

select * from matches where date = '02-05-2013'; 


--task 4--
--Fetch data of all the matches where the result mode is ‘runs’ and margin of victory is more than 100 runs.

select * from matches where result_mode = 'runs' and result_margin > 100; 


--task 5--
--Fetch data of all the matches where the final scores of both teams tied and order it in descending order of the date.

select * from matches where result_mode ='tie' order by date desc; 

--task 6--
--Get the count of cities that have hosted an IPL match.

select count (distinct city) from matches; 

--task 7--
--Create table deliveries_v02 with all the columns of the table ‘deliveries’ and an additional column ball_result containing values boundary, dot or other depending on the total_run (boundary for >= 4, dot for 0 and other for any other number)

create table deliveries_v02 as select *,  
    CASE WHEN total_runs >= 4 then 'boundary'  
         WHEN total_runs = 0 THEN 'dot' 
   else 'other' 
     END as ball_result  
   FROM deliveries;
   
--task 8 --
--Write a query to fetch the total number of boundaries and dot balls from the deliveries_v02 table.

select ball_result, count (*) from deliveries_v02 group by ball_result; 


--task 9--
--Write a query to fetch the total number of boundaries scored by each team from the deliveries_v02 table and order it in descending order of the number of boundaries scored.

select batting_team, count(*) from deliveries_v02 where ball_result = 'boundary' group by 
batting_team order by count desc;

--task 10--
--Write a query to fetch the total number of dot balls bowled by each team and order it in descending order of the total number of dot balls bowled.

select bowling_team, count(*) from deliveries_v02 where ball_result = 'dot' group by bowling_team 
order by count desc; 


--task 11--
--Write a query to fetch the total number of dismissals by dismissal kinds where dismissal kind is not NA

select dismissal_kind, count (*) from deliveries where dismissal_kind <> 'NA' group by dismissal_kind 
order by count desc; 

--task 12--
--Write a query to get the top 5 bowlers who conceded maximum extra runs from the deliveries table

select bowler, sum(extra_runs) as total_extra_runs from deliveries group by bowler order by 
total_extra_runs desc limit 5; 

--task 13--
--Write a query to create a table named deliveries_v03 with all the columns of deliveries_v02 table and two additional column (named venue and match_date) of venue and date from table matches

create table  deliveries_v03 AS SELECT a.*, b.venue, b.match_date from  
deliveries_v02 as a  
left join (select max(venue) as venue, max(date) as match_date, match_id from matches group by 
match_id) as b 
on a.match_id = b.match_id; 


--task 14--
--Write a query to fetch the total runs scored for each venue and order it in the descending order of total runs scored.

select venue, sum(total_runs) as runs from deliveries_v03 group by venue order by runs desc; 


--task 15--
--Write a query to fetch the year-wise total runs scored at Eden Gardens and order it in the descending order of total runs scored.

select extract(year from match_date) as IPL_year, sum(total_runs) as runs from  deliveries_v03  
where venue = 'Eden Gardens' group by IPL_year order by runs desc; 

--task 16--
--Get unique team1 names from the matches table, you will notice that there are two entries for Rising Pune Supergiant one with Rising Pune Supergiant and another one with Rising Pune Supergiants.  Your task is to create a matches_corrected table with two additional columns team1_corr and team2_corr containing team names with replacing Rising Pune Supergiants with Rising Pune Supergiant. Now analyse these newly created columns.

select distinct team1 from matches; 
 
create table matches_corrected as select *, replace(team1, 'Rising Pune Supergiants', 'Rising Pune 
Supergiant') as team1_corr 
, replace(team2, 'Rising Pune Supergiants', 'Rising Pune Supergiant') as team2_corr from matches; 
 
select distinct team1_corr from matches_corrected;


--task 17--
--Create a new table deliveries_v04 with the first column as ball_id containing information of match_id, inning, over and ball separated by ‘-’ (For ex. 335982-1-0-1 match_id-inning-over-ball) and rest of the columns same as deliveries_v03)

create table deliveries_v04 as select concat(match_id,'-',inning,'-',over,'-',ball) as ball_id, * from 
deliveries_v03; 

--task 18--
--Compare the total count of rows and total count of distinct ball_id in deliveries_v04;

select * from deliveries_v04 limit 20; 
select count(distinct ball_id) from deliveries_v04; 
select count(*) from deliveries_v04; 

--task 19--
--Create table deliveries_v05 with all columns of deliveries_v04 and an additional column for row number partition over ball_id. (HINT : Syntax to add along with other columns,  row_number() over (partition by ball_id) as r_num)

drop table deliveries_v05; 
create table deliveries_v05 as select *, row_number() over (partition by ball_id) as r_num from 
deliveries_v04; 


--task 20--
--Use the r_num created in deliveries_v05 to identify instances where ball_id is repeating. (HINT : select * from deliveries_v05 WHERE r_num=2;)

select count(*) from deliveries_v05; 
select sum(r_num) from deliveries_v05; 
select * from deliveries_v05 order by r_num  limit 20; 
select * from deliveries_v05 WHERE r_num=2;

--Task 21--
--Use subqueries to fetch data of all the ball_id which are repeating. (HINT: SELECT * FROM deliveries_v05 WHERE ball_id in (select BALL_ID from deliveries_v05 WHERE r_num=2);

SELECT * FROM deliveries_v05 WHERE ball_id in (select BALL_ID from deliveries_v05 WHERE 
r_num=2); 


--task 22 


