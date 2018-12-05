#select first_name, last_name from actor;
#cREATE or replace VIEW twob AS SELECT concat(upper(first_name) , ' ', upper(last_name)) actor_name FROM actor;
#select actor_id, first_name, last_name from actor where first_name = "Joe";
#select * from actor where last_name like "%GEN%";
#select * from actor where last_name like "%LI%" order by last_name, first_name;
#SELECT country_id, country FROM country WHERE country in ( "china", "afghanistan", "bangladesh" );
#alter table actor add column description blob;
#alter table actor drop column description;
#select count(last_name), last_name from actor group by last_name;
#select count(last_name), last_name from actor group by last_name having count(last_name) > 1;
#update actor set first_name = 'harpo' where first_name = "groucho" and last_name = "Williams";
#update actor set first_name = 'Groucho' where first_name = "harpo";
#describe address;
#select staff.first_name, staff.last_name, address.address FROM staff LEFT JOIN (address) ON (staff.address_id = address.address_id);
#select sum(payment.amount), staff.last_name from staff left join (payment) on (staff.staff_id = payment.staff_id) group by staff.last_name;
#select * from film
#select film.title, count(film_actor.actor_id) from film inner join (film_actor) on (film_actor.film_id = film.film_id) group by film.title;
#select count(inventory.film_id), film.title from inventory  left join film on (film.film_id = inventory.film_id) where film.title = "Hunchback Impossible" group by film.film_id ;
#select * from payment;
#select * from customer;
#6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:
#select customer.first_name, customer.last_name, sum(payment.amount) from payment left join customer on (customer.customer_id = payment.customer_id) group by (customer.customer_id) order by (customer.last_name);
#select film.title from film where left(film.title, 1) = 'K' or left(film.title, 1) = 'Q';
#select actor.last_name from actor where actor.actor_id in (select film_actor.actor_id from film_actor left join film on (film.film_id = film_actor.film_id) where film.title = "Alone Trip");
#7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.
#select last_name, email from customer left join (address) on(address.address_id = customer.address_id) left join city on (city.city_id = address.city_id) left join country on (country.country_id = city.country_id) where country.country = 'Canada'
#7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
#select film.title from film left join film_category on (film.film_id= film_category.film_id) left join category on (film_category.category_id = category.category_id) where category.name = "Family"
#7e. Display the most frequently rented movies in descending order.
#select film.title, count(rental.inventory_id) as Rentals from rental left join inventory on (rental.inventory_id = inventory.inventory_id) left join film on (inventory.film_id = film.film_id) group by film.film_id order by Rentals desc
#7f. Write a query to display how much business, in dollars, each store brought in.
#select store.store_id, sum(payment.amount) from store left join staff on (staff.store_id = store.store_id) left join payment on (payment.staff_id = staff.staff_id)  group by store.store_id
#7g. Write a query to display for each store its store ID, city, and country.
#select store.store_id, city.city, country.country from store left join address on (address.address_id = store.address_id) left join city on (address.city_id = city.city_id) left join country on (city.country_id = country.country_id)
#7h. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
#select category.name as Genre, sum(payment.amount) as Gross_Revenue from payment left join rental on (rental.rental_id = payment.rental_id) left join	inventory on (inventory.inventory_id = rental.inventory_id) left join film on (film.film_id = inventory.film_id) left join film_category on (film_category.film_id = film.film_id) left join category on (category.category_id = film_category.category_id) group by Genre order by Gross_Revenue desc limit 5
#8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.
#CREATE VIEW Top AS (select category.name as Genre, sum(payment.amount) as Gross_Revenue from payment left join rental on (rental.rental_id = payment.rental_id) left join	inventory on (inventory.inventory_id = rental.inventory_id) left join film on (film.film_id = inventory.film_id) left join film_category on (film_category.film_id = film.film_id) left join category on (category.category_id = film_category.category_id) group by Genre order by Gross_Revenue desc limit 5)
#8b. How would you display the view that you created in 8a?
#select * from Top
#8c. You find that you no longer need the view top_five_genres. Write a query to delete it.
#drop view top


