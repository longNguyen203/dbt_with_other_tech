{{ config(materialized='table') }}

select 
	staff_id,
    store_id,
	first_name,
	last_name,
	first_name || ' ' || last_name as staff_fullname,
	email as email_of_employee,
	active as active_bool,
	username,
	password
from public.staff