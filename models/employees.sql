with calc_employee as (
select 
cast(extract(year from current_date) as integer) - cast(extract(year from birth_date) as integer) as age,
cast(extract(year from current_date) as integer) - cast(extract(year from hire_date) as integer) as lengthofservice,
first_name || ' ' || last_name as name
,*
from {{source('sources', 'employees')}}
)
select * from calc_employee