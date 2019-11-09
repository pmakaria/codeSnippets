--Oracle
--Find week number (within year) from date
select to_char(to_Date('01022014','ddmmyyyy'),'IW') wk from dual
