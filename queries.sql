--1.List the ticket_id,ticket_type,Transaction_type and price for all tickets with a price less than or equal to the average ticket price.


SELECT t.ticket_id, t.ticket_type_id AS ticket_type,t.ticket_seat , t.ticket_price
FROM Ticket t
JOIN (
    SELECT AVG(ticket_price::numeric) AS avg_price
    FROM Ticket
) avg_t
ON t.ticket_price::numeric <= avg_t.avg_price
JOIN transaction_table tr
ON t.ticket_id = tr.ticket_id;

--2.select content_id,movie_name,rating with highest rating
(select m.content_id, m.movie_name, cr.overall_rating
from movie m
join content c on m.content_id = c.content_id 
join content_rating cr on c.rating_id = cr.rating_id 
order by cr.overall_rating desc
limit 1)
union
(select tv.content_id, tv.show_name, cr.overall_rating
from tv_show tv
join content c on tv.content_id = c.content_id 
join content_rating cr on c.rating_id = cr.rating_id 
order by cr.overall_rating desc
limit 1)
union 
(select a.content_id, a.event_name, cr.overall_rating
from awards a 
join content c on a.content_id = c.content_id 
join content_rating cr on c.rating_id = cr.rating_id 
order by cr.overall_rating desc
limit 1);



--3.Which Celebrity is having better ranking in IMDB when compared with others so that focussing on that celebrity updates can increase the company's revenue

select celebrity_name, celebrity_ranking 
from celebrity_info ci 
order by celebrity_ranking asc 
;

--4. Which type of membership is being used most by the customers 

select mp.membership_plan_id,mp.plan_description, count(c.customer_id) as cust_count
from customer c 
join membership_plan mp 
on c.membership_plan_id = mp.membership_plan_id 
join membership_plan_type mpt 
on mp.plan_type_id  = mpt.plan_type_id 
group by mp.membership_plan_id 
order by cust_count desc
limit 2
;



