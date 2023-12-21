{{ config(materialized='table') }}

select 
	actor_id,
	first_name,
	last_name,
	first_name || ' ' || last_name as full_name
from public.actor