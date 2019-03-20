-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
--Indicates as follows
--Average users before change | Average users after change
SELECT (SELECT round(AVG("#Ofusers"),2) from (SELECT count(distinct(user_id)) as '#Ofusers', (date(datetime(login_timestamp, 'unixepoch'))) as 'dt' from login_history group by dt) where dt < "2018-06-02") as 'Before Feature Change', (SELECT round(AVG("#Ofusers"),2) from (SELECT count(distinct(user_id)) as '#Ofusers',(date(datetime(login_timestamp, 'unixepoch'))) as 'dt' from login_history group by dt) where dt >= "2018-06-02") as 'After Feature Change'; 



-- PART 2: Create a SQL query that indicates the number of status changes by card
--Indicates as follows
--CardID | CardName | NumberOfChanges
-- 3.63 | 11.8
SELECT a.cardid as 'Card Id', b.name as 'Card Name', count(a.cardid) as '# of Status Changes starting with Null' from card_change_history a, card b where a.cardID = b.id group by cardID order by cardID;






