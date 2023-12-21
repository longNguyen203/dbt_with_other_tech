{{ config(materialized='table') }}

select
	customer.customer_id,
	customer.first_name || ' ' || customer.last_name as customer_fullname,
	customer.email as email_of_customer,
	address.address as address_of_customer,
	customer.activebool as active_bool,
	customer.active as active_number,
	customer.create_date,
	address.phone as phone_of_customer,
	address.address2 as address_of_customer2,
	address.district,
	address.postal_code,
	city.city as city_customer,
	country.country as country_customer
from public.customer
	inner join public.address on customer.address_id = address.address_id
	inner join public.city on address.city_id = city.city_id
	inner join public.country on city.country_id = country.country_id
order by customer.customer_id