{{ config(materialized='table') }}

select 
	dim_customer_infor_detail.customer_id,
	dim_employee_infor_detail.staff_id as employee_id,
	dim_store_infor_detail.store_id,
	dim_film_infor_detail.film_id,
	dim_actor_infor_detail.actor_id,
	inventory.inventory_id,
	rental.rental_id as lease_id,
	payment.payment_id,
	rental.rental_date as lease_date,
	rental.return_date,
	payment.amount,
	payment.payment_date
from public.inventory 
	inner join public.rental on inventory.inventory_id = rental.inventory_id
	inner join public.payment on rental.rental_id = payment.rental_id
	inner join {{ ref("dim_customer_infor_detail") }} on payment.customer_id = dim_customer_infor_detail.customer_id
	inner join {{ ref("dim_employee_infor_detail") }} on rental.staff_id = dim_employee_infor_detail.staff_id
	inner join {{ ref("dim_film_infor_detail") }} on inventory.film_id = dim_film_infor_detail.film_id
	left join {{ ref("dim_store_infor_detail") }} on dim_customer_infor_detail.customer_fullname = dim_store_infor_detail.manager_staff
	right join public.film_actor on dim_film_infor_detail.film_id = film_actor.film_id
	inner join {{ ref("dim_actor_infor_detail") }} on film_actor.actor_id = dim_actor_infor_detail.actor_id