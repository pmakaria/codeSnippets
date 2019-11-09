--Oracle
--find a date from a week number (start and end of week)

--add number of weeks *7 (so that it returns the Monday of the week we are looking for)
--add or subtract number of days, in order to get another day 
--(Subtract 1 to get Sun as the first day and add 5 to get Sat as the last day)

--wk number format: YYYYWW


--Start of the week (first day Sunday)
select (TRUNC(TO_DATE(SUBSTR('201945',1,4) || '0110','YYYYMMDD'),'IYYY')  + (SUBSTR('201945',5) - 1) * 7  - 1)as wk_start_date
from dual


--End of the week (last day Saturday)
select (TRUNC(TO_DATE(SUBSTR('201945',1,4) || '0110','YYYYMMDD'),'IYYY')  + (SUBSTR('201945',5) - 1) * 7  + 5)as wk_end_date
from dual
