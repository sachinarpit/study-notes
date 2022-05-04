DVD rental Database - https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip

	select customer_id, sum(amount) as "total order amount" from payment pmt group by pmt.customer_id order by sum(amount) desc

	select customer_id, count(payment_id) from payment group by customer_id order by count(payment_id) desc

	select customer_id, staff_id, count(*) from payment group by customer_id, staff_id 

	select staff_id, count(staff_id) from payment group by staff_id order by count(staff_id) desc 

	select rating, round(avg(replacement_cost),5) from film group by rating

	select customer_id, sum(pmt.amount) from payment pmt group by customer_id order by sum(pmt.amount) desc limit 5

	-- List customers having 40 or more payments
	select customer_id, count(*) from payment group by customer_id having count(*) >= 40

	-- List customers, who spent more than $100 in payments with staff# 2
	select customer_id, sum(amount) from payment where staff_id = 2 group by customer_id having sum(amount) > 100

	--Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2. The answer should be customers 187 and 148.
	select customer_id, sum(amount) from payment where staff_id = 2 group by customer_id having sum(amount) > 110

	--How many films begin with the letter J?. The answer should be 20.
	select count(*) from film where title like 'J%';

	--What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?. The answer is Eddie Tomlin
	select first_name,last_name from customer where address_id < 500 and first_name like 'E%' order by customer_id desc limit 1;

	--List customers, who has made at least one payment
	select customer.customer_id, first_name, payment_id, amount from payment inner join customer on payment.customer_id = customer.customer_id

	--List the films, which are not available in inventory (dvd rental database) -> use left outer join with null where condn for right table
	select film.film_id, title, store_id from film left outer join inventory on film.film_id = inventory.film_id where inventory.film_id is null

	--List the customers, who never took any movies on rent (dvd rental database) -> use left outer join with null where condn for right table
	select customer.first_name, customer.store_id from customer left join store on customer.store_id = store.store_id where store.store_id is null

	--List the email of the customers, who live in california
	select customer_id, email from customer inner join address on customer.address_id = address.address_id 
	where address.district = 'California'

	-- List all the movies of Actor "Nick Wahlberg"
	select film.title from film_actor
	inner join actor on film_actor.actor_id = actor.actor_id
	inner join film on film.film_id = film_actor.film_id
	where actor.first_name = 'Nick' and actor.last_name = 'Wahlberg'

	--List the movies of which rental rate is higher than avg.
	select title, rental_rate from film where rental_rate > (select avg(rental_rate) from film)

	--Why cant alias be used in this query???
	select title, rental_rate, avg_rental_rate from film where rental_rate > (select avg(rental_rate) as avg_rental_rate from film)
	-- ERROR:  column "avg_rental_rate" does not exist

	--List movie titles, which are returned between a certain set of dates 

	--using joins
	select film.title from inventory
	inner join film on film.film_id = inventory.film_id
	inner join rental on rental.inventory_id = inventory.inventory_id
	where rental.rental_date between '2005-05-29' and '2005-05-30'

	--using subquery
	select distinct title from film where film_id IN
	(select inventory.film_id from inventory
	inner join rental on rental.inventory_id = inventory.inventory_id
	where rental.rental_date between '2005-05-29' and '2005-05-30')

	--Find customers, who have at least one payment with amount > 11
	select customer_id, first_name from customer where customer_id IN 
	(select distinct customer_id from payment where amount > 11)

	--Find pairs of films, which has same length
	select film1.title, film2.title from film as film1
	inner join film as film2
	on film1.length = film2.length
	where film1.film_id != film2.film_id

	--used here not equal to condition to ignore the same record matching with same record	
Northwind Database - https://raw.githubusercontent.com/pthom/northwind_psql/master/northwind.sql
	
	--List the number of customers in each country, sorted high to low
	select country, count(customer_id) from customers group by country order by COUNT(customer_id) desc;


Booking/Facilities/Members Databases - SQL Udemy course "The Complete SQL Bootcamp 2022: Go from Zero to Hero"
	-- Database excercises.tar - https://drive.google.com/file/d/1wDqIK6zt5twWnCOx97ywipaiWR2d0OfT/view
	-- Link to Google Doc with Questions and Expected Results: - https://docs.google.com/document/d/1wiuYbTQslmfolQWgeVPB356csjK6yqOUBhgC7fM44o8/edit?usp=sharing
	-- Link to Google Doc with Solutions - https://docs.google.com/document/d/1swGZ0RG3KKqWqzmsI_qrMgjJ3lt39mtAJqRSMZy6Z-8/edit?usp=sharing
	
	--Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
	select facid, count(*) from cd.bookings where starttime between '2012-09-01' and '2012-09-30' group by facid

	--Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
	select facilities.facid, sum(slots) from cd.facilities as facilities  inner join cd.bookings as bookings 
	on facilities.facid = bookings.facid
	group by facilities.facid
	having sum(slots) > 1000

	--Produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
	select starttime, name  from cd.bookings as bookings inner join cd.facilities as facilities 
	on bookings.facid = facilities.facid
	where date(starttime) = '2012-09-21' and name like 'Tennis Court%'
	order by starttime

	--Produce a list of the start times for bookings by members named 'David Farrell'?
	select starttime from cd.bookings as bookins inner join cd.members as members 
	on bookins.memid = members.memid
	where firstname = 'David' and surname = 'Farrell'

	--Find out the length of an ID field (int as datatype)
	select char_length(CAST(inventory_id as varchar)) from rental

Database and other resources from the course - https://starttechacademy.com/resources-data-analytics-with-sql/
	--Data Files - https://drive.google.com/uc?export=download&id=128E4sRuESTFUsn4VCKNQkjyJrXNrpcwM
	Data -> All files for Restoring Database -> Supermart_DB_tar_v12.tar

	--Retrieve all orders where ‘discount’ value is greater than zero ordered in descending order basis ‘discount’ value
	select ORDER_ID, DISCOUNT from sales where discount > 0 order by discount desc

	--How many orders given and how many products ordered by a customer with id 'CG-12520'
	select count(distinct(order_id)) as "total_orders", count(distinct(product_id)) as "total_products_ordered" 
	from sales where customer_id = 'CG-12520'

	--Find out total profit for all the sales
	select sum(profit) from sales

	--Find out total qty of a product sold
	select sum(quantity) from sales where product_id = 'FUR-TA-10000577'

	--Find out min and max sales in June 2015
	select min(sales) as "min sales", max(sales) "max sales" from sales where order_date between '2015-06-01' and '2015-06-30'

	--Find the min, avg and max age of East region customers
	select min(age) as "min", avg(age) as "avg", max(age) as "max" from customer where region = 'East';

	--Find out, how many customers livein which region
	select region, count(*) from customer group by region

	--Find out of each product qty sold
	select product_id, count(*) from sales group by product_id

	--Find out top 5 customers, who have spent at our store, min, avg,max and total spent
	select customer_id, min(sales), avg(sales),  max(sales), sum(sales) from sales 
	group by customer_id order by sum(sales) desc limit 5

	--Find # of customers in each region and display only regions, which has more than 200 customers
	select region, count(*) from customer group by region having count(*) > 200

	--Get the list of product ID’s where the quantity of product sold is greater than 10
	select product_id, sum(quantity) from sales group by product_id having sum(quantity) > 10

	--Get the category and sales of the products of that category
	select category, sum(sales) from sales inner join product
	on sales.product_id = product.product_id
	group by category

	--Get data containing Product_id, product name, category, total sales value of that product, and total quantity sold. 
	select product.product_id, product_name, category, sum(sales), sum(quantity) 
	from product inner join sales
	on product.product_id = sales.product_id
	group by product.product_id, product_name, category

	--Find out the sales items, where the customers who bought those orders is aged more than 60
	--using joins
	select sales from sales inner join customer 
	on sales.customer_id = customer.customer_id
	where age > 60

	--using subquery
	select  sales from sales where customer_id in 
	(select customer_id from customer where age > 60)

	--Find out the quantity of each product sold
	select product.product_id, product_name, category, sum(quantity) from sales inner join product
	on sales.product_id = product.product_id
	group by product.product_id, product_name, category

	--scripts for sales_2015 and customer_20_60 tables
	create table sales_2015 as select * from sales where ship_date between '2015-01-01' and '2015-12-31';
	create table customer_20_60 as select * from customer where age between 20 and 60;

	--Find the total sales done in every state for customer_20_60 and sales_2015 table
	select customer_20_60.state, sum(sales) from sales_2015  left join customer_20_60
	on customer_20_60.customer_id = sales_2015.customer_id
	group by state

Employee Database from Udemy course "SQL - MySQL for Data Analytics and Business Intelligence" - https://www.dropbox.com/s/znmjrtlae6vt4zi/employees.sql?dl=0
	
	--Select all employees whose average salary is higher than $120,000 per annum.
	select employees.emp_no, avg(salary) from employees inner join salaries
	on employees.emp_no = salaries.emp_no
	group by employees.emp_no
	having avg(salary) > 120000

	--Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
	select emp_no, count(*) from dept_emp
	where from_date > '2000-01-01'
	group by emp_no
	having count(*) > 1

	--How many departments are there in the “employees” database?
	select count(distinct dept_no) from dept_emp

	select count(*) from departments

	--What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
	select sum(salary) from salaries where to_date > '1997-01-01'

	--What is the average annual salary paid to employees who started after the 1st of January 1997?
	select avg(salary) from salaries where from_date > '1997-01-01'

	--Extract a list containing information about all managers’ employee number, 
	--first and last name, department number, and hire date. 
	select employees.emp_no, first_name, last_name, dept_no, from_date
	from dept_manager inner join employees
	on dept_manager.emp_no = employees.emp_no

	--Join the 'employees' and the 'dept_manager' tables to 
	--return a subset of all the employees whose last name is Markovitch. 
	--See if the output contains a manager with that name.  


	--Find list of employees, who are not managers => 300000
	select employees.emp_no, first_name, last_name, dept_manager.emp_no, dept_manager.dept_no 
	from employees left join dept_manager
	on dept_manager.emp_no = employees.emp_no
	where dept_manager.emp_no is null

	--Find list of managers, who do not have any employees => 0
	select employees.emp_no, first_name, last_name, dept_manager.emp_no, dept_manager.dept_no 
	from dept_manager left join employees
	on dept_manager.emp_no = employees.emp_no
	where employees.emp_no is null

	--Select the first and last name, the hire date, 
	--and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.
	select first_name, last_name, hire_date, title 
	from employees inner join titles
	on employees.emp_no = titles.emp_no
	where first_name = 'Margareta' and last_name = 'Markovitch'

	--Extract the information about all department managers 
	--who were hired between the 1st of January 1990 and the 1st of January 1995.
	select * from dept_manager inner join employees
	on dept_manager.emp_no = employees.emp_no
	where hire_date between '1990-01-01' and '1995-01-01'

	SELECT * FROM dept_manager WHERE emp_no IN 
	(SELECT emp_no FROM employees 
	 WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');

	--Select the entire information for all employees whose job title is “Assistant Engineer” => 15128
	select * from employees inner join titles
	on employees.emp_no = titles.emp_no
	where title = 'Assistant Engineer'

	select * from employees where emp_no in
	(select emp_no from titles where title = 'Assistant Engineer')

	--Find the average salary of the male and female employees in each department.

	--Find the lowest department number encountered in the 'dept_emp' table. Then, find the highest department number.

	--Retrieve a list of all employees that have been hired in 2000.

	--How many contracts have been registered in the ‘salaries’ table 
	--with duration of more than one year and of value higher than or equal to $100,000?

	Leetcode problems - https://leetcode.com/problemset/database/?difficulty=EASY&page=1
	
		175. Combine Two Tables
		------------------------
			 Table: Person

			+-------------+---------+
			| Column Name | Type    |
			+-------------+---------+
			| personId    | int     |
			| lastName    | varchar |
			| firstName   | varchar |
			+-------------+---------+
			personId is the primary key column for this table.
			This table contains information about the ID of some persons and their first and last names.

			Table: Address

			+-------------+---------+
			| Column Name | Type    |
			+-------------+---------+
			| addressId   | int     |
			| personId    | int     |
			| city        | varchar |
			| state       | varchar |
			+-------------+---------+
			addressId is the primary key column for this table.
			Each row of this table contains information about the city and state of one person with ID = PersonId.

			Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

			Return the result table in any order.

			Input: 
			Person table:
			+----------+----------+-----------+
			| personId | lastName | firstName |
			+----------+----------+-----------+
			| 1        | Wang     | Allen     |
			| 2        | Alice    | Bob       |
			+----------+----------+-----------+
			Address table:
			+-----------+----------+---------------+------------+
			| addressId | personId | city          | state      |
			+-----------+----------+---------------+------------+
			| 1         | 2        | New York City | New York   |
			| 2         | 3        | Leetcode      | California |
			+-----------+----------+---------------+------------+
			Output: 
			+-----------+----------+---------------+----------+
			| firstName | lastName | city          | state    |
			+-----------+----------+---------------+----------+
			| Allen     | Wang     | Null          | Null     |
			| Bob       | Alice    | New York City | New York |
			+-----------+----------+---------------+----------+
			Explanation: 
			There is no address in the address table for the personId = 1 so we return null in their city and state.
			addressId = 1 contains information about the address of personId = 2.

			Answer
			select FirstName, LastName, City, State
			from Person left join Address
			on Person.PersonId = Address.PersonId