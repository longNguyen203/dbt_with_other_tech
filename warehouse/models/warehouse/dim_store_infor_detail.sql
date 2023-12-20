{{ config(materialized='table') }}

select 
	store.store_id,
	dim_employee_infor_detail.staff_fullname as manager_staff,
	address.address as address_of_store
from public.address 
    inner join public.store on address.address_id = store.address_id
	inner join {{ ref("dim_employee_infor_detail") }} on store.store_id = dim_employee_infor_detail.store_id