{{ config(materialized='table') }}

select 
	distinct film.film_id,
	film.title as title_film,
	film.description,
	film.release_year,
	category.name as category_film,
	film.length as langth_film,
	film.rating as rating_film,
	film.rental_duration as rental_duration_film,
	film.rental_rate as rental_rate_film,
	film.replacement_cost as replacement_cost_film,
	language.name as subtitles,
	film.special_features as special_features_film,
	film.fulltext as fulltext_film
from public.category 
	inner join public.film_category ON category.category_id = film_category.category_id
	inner join public.film ON film_category.film_id = film.film_id
	inner join public.language ON film.language_id = language.language_id
	inner join public.film_actor ON film.film_id = film_actor.film_id
	inner join public.actor ON film_actor.actor_id = actor.actor_id
order by film.film_id
