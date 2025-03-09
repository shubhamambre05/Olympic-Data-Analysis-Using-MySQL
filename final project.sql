create database proje2024;
use proje2024;

create table olympics(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(500),
NOC varchar(300),
Games varchar(1000),
Year int,
Season varchar(500),
City varchar(300),
Sport varchar(500),
Event varchar(2000),
Medal varchar(500)
);

show variables like "secure_file_priv";

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes_Cleaned.csv"
into table olympics
fields terminated by ","
enclosed by '"'
lines terminated by "\r\n"
ignore 1 rows;
select * from olympics;

-- SQL PROJECT

-- 1. Show how many medal counts present for entire data

select count(*) from olympics
where medal <> 'nonmedal';
 
-- 2. Show count of unique sports present in Olympics

select distinct(sport),count(*) from olympics
group by sport;

-- 3. Show how many different medals won by team India

select Team,medal,count(medal) as countmedal from olympics
where Team= "India" and medal <>"Nomedal"
group by medal,Team
order by countmedal desc;
 
-- 4. Show event wise medals won by India show from highest to lowest medals won in order

select * from olympics;
select Team,Event,Medal,count(medal) as medalcount from olympics
where (Team="India"and Medal<>"Nomedal")
group by event ,team,medal
order by medalcount desc;

-- 5. Show event wise medals won by India in order of year
select Team,Event,medal,year,count(medal) as medalcount from olympics
where(Team="India"and Medal<>"Nomedal")
group by medal,event,year
order by medalcount;

-- 6. show country who won maximum medals.

select NOC, Team,medal,count(medal) as medalcount from olympics 
where medal<>"NoMedal"
group by medal,noc,team
order by medalcount desc;


-- 7.show top 10 countries whowon gold
select Team,medal,count(medal) as countmedal from olympics 
where medal="gold" 
group by team,medal
order by countmedal desc
limit 10;



--  8. show in which year did United states won most gold medal

select* from olympics;
select Team,year,count(*),max(medal) as most_won_medal from olympics
where ( team= "united states" and medal="gold")
group by team,medal,year
order by count(*) desc
limit 1;


-- 9. In which sports United States has most medals.

select * from olympics;
select Team, sport,count(medal),max(medal)as maxmedal from olympics
where Team ="united states" and medal <>"Nomedal"
group by sport,team
order by count(medal) desc;

-- 10. Find top three players who won most medals along with their sports and country

select * from olympics;
select Name,Team,sport,medal,count(medal) as countmedal from olympics
group by Name,Team,sport,medal
order by countmedal desc
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.

select * from olympics;
select Name,Team,sport,medal,count(medal) as countmedal from olympics
where (sport="Cycling" and medal="gold" and medal<>"NoMedal")
group by Name,Team,sport
order by countmedal desc
limit 10;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.

select * from olympics;
select Name,Team,sport,medal, count(medal)as countmedal from olympics
where (sport="Basketball" and medal <>"NoMedal")
group by Name ,Team,sport,medal
order by countmedal desc
limit 10;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards

select * from olympics;
select Name,sport,medal,count(medal) as countmedal from olympics
where (Name="Teresa Edwards" and sport="Basketball")
group by Name,sport,medal
order by countmedal desc;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel

select * from olympics;
select Name,Sex,year,medal,count(medal) as countmedal from olympics
where medal<>"NoMedal"
group by Name,Sex,year,medal
order by countmedal desc;










