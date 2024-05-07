DROP TABLE IF EXISTS Customer ;
create table Customer (
	customer_id INT not null,
	membership_plan_id VARCHAR(50),
	imdb_pro_id VARCHAR(50),
	customer_first_name VARCHAR(50),
	customer_last_name VARCHAR(50),
	customer_email VARCHAR(50),
	customer_contact_number VARCHAR(50),
	customer_password VARCHAR(50),
	primary KEY(customer_id)
);

select * from Customer;

ALTER TABLE Customer
ADD CONSTRAINT fk_memb_plan
FOREIGN KEY (membership_plan_id)
REFERENCES Membership_Plan (membership_plan_id),
ADD CONSTRAINT fk_imdb
FOREIGN KEY (imdb_pro_id)
REFERENCES IMDB_Pro (imdb_pro_id);





DROP TABLE IF EXISTS Membership_plan;
create table Membership_plan (
	membership_plan_id VARCHAR(50),
	transaction_id VARCHAR(50),
	plan_type_id INT,
	plan_description VARCHAR(50),
	plan_duration VARCHAR(50),
	plan_price VARCHAR(50),
	content_id VARCHAR(50),
	primary KEY(membership_plan_id)
);

ALTER TABLE Membership_plan
ADD CONSTRAINT fk_memb_transc
FOREIGN KEY (transaction_id)
REFERENCES Transaction_table (transaction_id),
ADD CONSTRAINT fk_mem_plan
FOREIGN KEY (plan_type_id)
REFERENCES Membership_Plan_Type (plan_type_id),
ADD CONSTRAINT fk_cont_id
FOREIGN KEY (content_id)
REFERENCES Content (content_id);

select * from Membership_plan;


DROP TABLE IF EXISTS Membership_Plan_Type;
create table Membership_plan_Type(
plan_type_id INT,
plan_type VARCHAR(50),
primary key(plan_type_id));

select * from Membership_plan_Type;

DROP TABLE IF EXISTS Transaction_table;
create table transaction_table (
	transaction_id VARCHAR(50),
	ticket_id INT,
	transaction_date DATE ,
	transaction_amount VARCHAR(50),
	transaction_type VARCHAR(50),
	transaction_status VARCHAR(50),
	primary key (transaction_id)
);

select * from Transaction_table;

ALTER TABLE Transaction_table
ADD CONSTRAINT fk_ticket_id
FOREIGN KEY (ticket_id)
REFERENCES Ticket(ticket_id);

DROP TABLE IF EXISTS Ticket;
create table Ticket (
	ticket_type_id VARCHAR(50),
	ticket_id INT,
	show_time_id INT ,
	ticket_price VARCHAR(50),
	ticket_date DATE,
	ticket_seat VARCHAR(50),
	primary key (ticket_id)
);

select * from Ticket;

ALTER TABLE Ticket
ADD CONSTRAINT fk_ticket_type_id
FOREIGN KEY (ticket_type_id)
REFERENCES Ticket_Type(ticket_Type_id),
ADD CONSTRAINT fk_showtime_id
FOREIGN KEY (show_time_id)
REFERENCES Show_time(show_time_id);



DROP TABLE IF EXISTS Ticket_Type;
create table Ticket_Type (
	ticket_type_id VARCHAR(50),
	ticket_type VARCHAR(50),
	primary key (ticket_type_id)
);

select * from Ticket_type;

DROP TABLE IF EXISTS Show_time;
create table Show_time (
	show_time_id INT,
	review_id INT,
	showtime_date DATE ,
	Showtime_time TIME,
	Showtime_duration VARCHAR(50),
	showtime_venue VARCHAR(50),
	primary key (Show_time_id)
);

select * from Show_time;
ALTER TABLE Show_time
ADD CONSTRAINT fk_show_time
FOREIGN KEY (review_id)
REFERENCES Show_review(review_id);



DROP TABLE IF EXISTS Show_review;
create table Show_review (
	review_id INT,
	review_rating INT,
	review_date DATE ,
	cast_review INT,
	director_review INT,
	primary key (review_id)
);

select * from Show_review;

DROP TABLE IF EXISTS IMDB_Pro;
create table IMDB_Pro (
	imdb_pro_id VARCHAR(50),
	Celebrity_content_id INT,
	content_genre VARCHAR(50) ,
	content_description VARCHAR(50),
	content_views VARCHAR(50),
	content_likes VARCHAR(50),
	primary key (imdb_pro_id)
);

select * from IMDB_Pro;
ALTER TABLE IMDB_Pro
ADD CONSTRAINT fk_celeb_content_id
FOREIGN KEY (Celebrity_content_id)
REFERENCES Celebrity_Content(Celebrity_content_id);


DROP TABLE IF EXISTS Celebrity_Content;
create table Celebrity_Content (
	celebrity_id INT,
	Celebrity_content_id INT ,
	celebrity_movies VARCHAR(50),
	celebrity_tv_shows VARCHAR(50),
	primary key(celebrity_content_id)
);

select * from Celebrity_Content;

ALTER TABLE Celebrity_Content
ADD CONSTRAINT fk_celeb_id
FOREIGN KEY (celebrity_id)
REFERENCES Celebrity_info(celebrity_id);


DROP TABLE IF EXISTS Celebrity_info;
create table Celebrity_info (
	celebrity_id INT,
	celebrity_name VARCHAR(50) ,
	celebrity_birthdate DATE,
	celebrity_updates VARCHAR(50),
	celebrity_ranking INT,
	celebrity_awards VARCHAR(50),
	primary KEY(celebrity_id)
);

select * from Celebrity_info;

DROP TABLE IF EXISTS Talent_hire;
create table Talent_hire (
	director_id INT,
	imdb_pro_id VARCHAR(50) ,
	rating VARCHAR(50),
	review_comments VARCHAR
	);

select * from Talent_hire;

ALTER TABLE Talent_hire
ADD CONSTRAINT fk_director_id
FOREIGN KEY (director_id)
REFERENCES Casting_director(director_id),
ADD CONSTRAINT fk_imdb_id
FOREIGN KEY (imdb_pro_id)
REFERENCES IMDB_Pro(imdb_pro_id)

DROP TABLE IF EXISTS Casting_director;
create table Casting_director (
	director_id INT,
	director_first_name VARCHAR(50) ,
	director_last_name VARCHAR(50),
	director_age INT,
	director_gender CHAR,
	director_background VARCHAR(50),
	primary key(director_id)
	);


select * from Casting_director;

DROP TABLE IF EXISTS Talent_Casting;
create table Talent_Casting (
	director_id INT,
	project_id VARCHAR(50) ,
	talent_name VARCHAR(50),
	talent_role VARCHAR(50)
	);

select * from Talent_Casting;

ALTER TABLE Talent_Casting
ADD CONSTRAINT fk_director2_id
FOREIGN KEY (director_id)
REFERENCES Casting_director(director_id),
ADD CONSTRAINT fk_project_id
FOREIGN KEY (project_id)
REFERENCES Project(project_id)


DROP TABLE IF EXISTS Project;
create table Project (
	project_id VARCHAR(50) ,
	project_name VARCHAR(50),
	project_type VARCHAR(50),
	project_description VARCHAR,
	project_director VARCHAR,
	primary key(project_id)
	);

select * from Project;

DROP TABLE IF EXISTS Content_rating;
create table Content_rating (
	rating_id VARCHAR(50) ,
	overall_rating INT,
	rating_by_genre INT,
	rating_by_certificates INT,
	rating_by_cast_and_crew INT,
	primary key(rating_id)
	);

select * from Content_rating;

DROP TABLE IF EXISTS Content;
create table Content (
	content_id VARCHAR(50) ,
	rating_id varchar(50),
	content_type VARCHAR(50),
	primary key(content_id)
	);

select * from Content;

ALTER TABLE Content
ADD CONSTRAINT fk_rating_id
FOREIGN KEY (rating_id)
REFERENCES Content_rating(rating_id);

DROP TABLE IF EXISTS Movie;
create table Movie (
	content_id VARCHAR(50) ,
	movie_name VARCHAR,
	duration VARCHAR,
	description VARCHAR,
	rating int,
	primary key(movie_name)
	);

select * from Movie;
ALTER TABLE Movie
ADD CONSTRAINT fk_contentmve_id
FOREIGN KEY (content_id)
REFERENCES Content(content_id);


DROP TABLE IF EXISTS TV_Show;
create table TV_Show (
	content_id VARCHAR(50) ,
	show_name VARCHAR,
	duration VARCHAR,
	description VARCHAR,
	rating int,
	primary key(show_name)
	);

select * from TV_Show;

ALTER TABLE TV_Show
ADD CONSTRAINT fk_contentshow_id
FOREIGN KEY (content_id)
REFERENCES Content(content_id);

DROP TABLE IF EXISTS Awards;
create table Awards (
	content_id VARCHAR(50) ,
	event_name VARCHAR,
	duration VARCHAR,
	description VARCHAR,
	rating int,
	primary key(event_name)
	);

select * from Awards;

ALTER TABLE Awards
ADD CONSTRAINT fk_contentawards_id
FOREIGN KEY (content_id)
REFERENCES Content(content_id);

INSERT INTO Customer (customer_id, membership_plan_id, imdb_pro_id, customer_first_name, customer_last_name, customer_email, customer_contact_number, customer_password) 
VALUES
(1, 'B10', '123456', 'John', 'Doe', 'john.doe@email.com', '+1-555-1234', 'password123'),
(2, 'P60', '789012', 'Jane', 'Smith', 'jane.smith@email.com', '+1-555-5678', 'password456'),
(3, 'B10', '345678', 'Bob', 'Johnson', 'bob.johnson@email.com', '+1-555-9012', 'password789'),
(4, 'B10', '901234', 'Sarah', 'Lee', 'sarah.lee@email.com', '+1-555-3456', 'passwordabc'),
(5, 'P60', '567890', 'Mike', 'Chen', 'mike.chen@email.com', '+1-555-7890', 'passworddef'),
(6, 'B10', '789012', 'Alice', 'Smith', 'alice.smith@email.com', '+1-555-1234', 'password123'),
(7, 'P60', '345678', 'Bob', 'Johnson', 'bob.johnson@email.com', '+1-555-5678', 'password456'),
(8, 'B10', '123456', 'Charlie', 'Brown', 'charlie.brown@email.com', '+1-555-9012', 'password789'),
(9, 'B10', '901234', 'David', 'Lee', 'david.lee@email.com', '+1-555-2345', 'password234'),
(10, 'P60', '567890', 'Emily', 'Nguyen', 'emily.nguyen@email.com', '+1-555-6789', 'password567'),
(11, 'B10', '234567', 'Frank', 'Garcia', 'frank.garcia@email.com', '+1-555-1234', 'password890'),
(12, 'P60', '890123', 'Grace', 'Davis', 'grace.davis@email.com', '+1-555-5678', 'password123'),
(13, 'B10', '456789', 'Henry', 'Smith', 'henry.smith@email.com', '+1-555-9012', 'password456'),
(14, 'B10', '901234', 'Isabella', 'Jones', 'isabella.jones@email.com', '+1-555-2345', 'password234'),
(15, 'P60', '567890', 'Jacob', 'Wilson', 'jacob.wilson@email.com', '+1-555-6789', 'password567'),
(16, 'B10', '234567', 'Kayla', 'Gonzalez', 'kayla.gonzalez@email.com', '+1-555-1234', 'password890'),
(17, 'P60', '890123', 'Liam', 'Davis', 'liam.davis@email.com', '+1-555-5678', 'password123'),
(18, 'B10', '456789', 'Mia', 'Johnson', 'mia.johnson@email.com', '+1-555-9012', 'password456'),
(19, 'P60', '123456', 'Oliver', 'Martinez', 'oliver.martinez@email.com', '+1-555-7890', 'password789'),
(20, 'G100', '789012', 'Sophiab', 'Brown', 'sophia.brown7@email.com', '+1-555-3457', 'password01290'),
(21, 'P20', '789012', 'Sophia', 'Brownie', 'sophia.brown8@email.com', '+1-555-3458', 'password01KP'),
(22, 'G100', '789012', 'Sophiabc', 'Browncloud', 'sophia.brown9@email.com', '+1-555-3459', 'password01876');
select * from Customer;

INSERT INTO Membership_plan (membership_plan_id, transaction_id, plan_type_id, plan_description, plan_duration, plan_price,content_id)
VALUES 
    ('B10', 'TXN001', 1, 'Basic Plan', '1 month', '$9.99','M4590'),
    ('P60', 'TXN002', 2, 'Premium Plan', '6 months', '$59.99','TV394'),
    ('G100', 'TXN003', 3, 'Gold Plan', '12 months', '$99.99','EVENTS67'),
    ('P20', 'TXN004', 4, 'Platinum Plan', '1 month', '$19.99','TV394'),
    ('S30', 'TXN005', 5, 'Silver Plan', '3 months', '$29.99','EVENTS67');

   
   INSERT INTO IMDB_Pro (imdb_pro_id, Celebrity_content_id, content_genre, content_description, content_views, content_likes)
VALUES 
    ('123456', 1, 'Comedy', 'A hilarious comedy', '100000', '50000'),
    ('234567', 2, 'Drama', 'An intense drama', '50000', '25000'),
    ('345678', 3, 'Action', 'An explosive action movie', '75000', '35000'),
    ('456789', 4, 'Romance', 'A heartwarming romance', '90000', '45000'),
    ('567890', 5, 'Horror', 'A spine-chilling horror', '60000', '30000'),
    ('678901', 6, 'Sci-Fi', 'An epic science fiction adventure', '80000', '40000'),
    ('789012', 7, 'Thriller', 'A nail-biting thriller', '70000', '35000'),
    ('890123', 8, 'Mystery', 'A gripping mystery', '65000', '32500'),
    ('901234', 9, 'Documentary', 'A fascinating documentary', '55000', '27500'),
    ('012345', 10, 'Animation', 'A charming animated film', '85000', '42500');
   
   INSERT INTO Celebrity_info (celebrity_id, celebrity_name, celebrity_birthdate, celebrity_updates, celebrity_ranking, celebrity_awards) 
   VALUES 
(1, 'Tom Hanks', '1956-07-09', 'Wins Golden Globe for Best Actor', 10, 'Academy Award for Best Actor'),
(2, 'Beyonce', '1981-09-04', 'Announces new album release', 8, 'Grammy Award for Album of the Year'),
(3, 'Leonardo DiCaprio', '1974-11-11', 'Begins filming new Martin Scorsese movie', 9, 'Academy Award for Best Actor'),
(4, 'Angelina Jolie', '1975-06-04', 'Directs new movie for Netflix', 7, 'Academy Award'),
(5, 'Dwayne Johnson', '1972-05-02', 'Becomes highest-paid actor in Hollywood', 6, 'NAACP Image Award'),
(6, 'Emma Watson', '1990-04-15', 'Named UN Women Goodwill Ambassador', 2, 'British Academy Film Award'),
(7, 'Chris Hemsworth', '1983-08-11', 'Starts filming new Thor movie', 3, 'Teen Choice Award'),
(8, 'Jennifer Lawrence', '1990-08-15', 'Wins Golden Globe for Best Supporting Actress', 11, 'Academy Award for Best Actress'),
(9, 'Robert Downey Jr.', '1965-04-04', 'retired from the Marvel Cinematic Universe', 12, 'Golden Globe Award'),
(10, 'Scarlett Johansson', '1984-11-22', 'Set to star in upcoming Disney+ series', 13, 'BAFTA Award'),
(11, 'Tom Cruise', '1962-07-03', 'Completes filming for Mission: Impossible 7', 1, 'Golden Globe Award'),
(12, 'Margot Robbie', '1990-07-02', 'To star in pirates of carrebian', 4, 'Critics Choice Movie Award'),
(13, 'Ryan Reynolds', '1976-10-23', 'Signs deal with Netflix to produce new movie', 5, 'Peoples Choice Award');

INSERT INTO Celebrity_Content (celebrity_id, Celebrity_content_id, celebrity_movies, celebrity_tv_shows) 
VALUES 
(1, 1, 'Forrest Gump', 'Band of Brothers'),
(2, 2, 'Dreamgirls', 'Black Is King'),
(3, 3, 'The Wolf of Wall Street', 'Growing Pains'),
(4, 4, 'Maleficent', 'Mr. & Mrs. Smith'),
(5, 5, 'Jumanji: Welcome to the Jungle', 'Ballers'), 
(6, 6, 'Harry Potter and the Sorcerers Stone', 'The Circle'),
(7, 7, 'Thor:Ragnarok', 'Home and Away'),
(8, 8, 'Silver Linings Playbook', 'The Bill Engvall Show'),
(9, 9, 'Iron Man', 'Ally McBeal'),
(10,10, 'Marriage Story', 'Euphoria'),
(11,11, 'Top Gun', 'Mission: Impossible - The Series'),
(12,12, 'The Wolf of Wall Street', 'Pan Am'),
(13,13, 'Deadpool', 'Two Guys and a Girl');

INSERT INTO Membership_plan_Type (plan_type_id, plan_type)
VALUES 
    (1, 'Basic plan with limitations'),
    (2, 'Customized plan 6 months with benefits'),
    (3, 'Customized plan 12 months with benefits'),
    (4, 'Basic plan with no limitations'),
    (5, '3 months basic plan');
   
   INSERT INTO transaction_table (transaction_id, ticket_id, transaction_date, transaction_amount, transaction_type, transaction_status)
VALUES 
    ('TXN001', 101, '2022-01-01', '100.00', 'Credit', 'Completed'),
    ('TXN002', 102, '2022-01-02', '200.00', 'Debit', 'Completed'),
    ('TXN003', 103, '2022-01-03', '50.00', 'Credit', 'Pending'),
    ('TXN004', 104, '2022-01-04', '300.00', 'Debit', 'Completed'),
    ('TXN005', 105, '2022-01-05', '150.00', 'Credit', 'Completed'),
    ('TXN006', 106, '2022-01-06', '75.00', 'Credit', 'Pending'),
    ('TXN007', 107, '2022-01-07', '250.00', 'Debit', 'Completed'),
    ('TXN008', 108, '2022-01-08', '125.00', 'Credit', 'Completed'),
    ('TXN009', 109, '2022-01-09', '400.00', 'Debit', 'Pending'),
    ('TXN010', 110, '2022-01-10', '50.00', 'Credit', 'Completed'),
    ('TXN011', 111, '2022-01-11', '100.00', 'Credit', 'Completed'),
    ('TXN012', 112, '2022-01-12', '150.00', 'Debit', 'Pending'),
    ('TXN013', 113, '2022-01-13', '75.00', 'Credit', 'Completed'),
    ('TXN014', 114, '2022-01-14', '200.00', 'Debit', 'Completed'),
    ('TXN015', 115, '2022-01-15', '50.00', 'Credit', 'Pending');
   
   INSERT INTO Casting_director (director_id, director_first_name, director_last_name, director_age, director_gender, director_background)
VALUES
    (1, 'John', 'Doe', 40, 'M', 'Film'),
    (2, 'Jane', 'Smith', 35, 'F', 'Theatre'),
    (3, 'Robert', 'Johnson', 45, 'M', 'Television'),
    (4, 'Sarah', 'Garcia', 32, 'F', 'Film'),
    (5, 'David', 'Lee', 50, 'M', 'Theatre'),
    (6, 'Emily', 'Nguyen', 28, 'F', 'Television'),
    (7, 'Michael', 'Brown', 55, 'M', 'Film'),
    (8, 'Alexandra', 'Kim', 42, 'F', 'Theatre'),
    (9, 'Thomas', 'Wong', 47, 'M', 'Film'),
    (10, 'Jessica', 'Liu', 31, 'F', 'Television'),
    (11, 'William', 'Chen', 36, 'M', 'Film'),
    (12, 'Maria', 'Gonzalez', 53, 'F', 'Theatre'),
    (13, 'Christopher', 'Park', 29, 'M', 'Television'),
    (14, 'Melissa', 'Ng', 39, 'F', 'Film'),
    (15, 'William', 'Johnson', 50, 'M', 'Film'),
    (16, 'Sophie', 'Martin', 37, 'F', 'Theatre'),
    (17, 'Daniel', 'Nguyen', 43, 'M', 'Television'),
    (18, 'Olivia', 'Chen', 29, 'F', 'Film'),
    (19, 'Jonathan', 'Garcia', 55, 'M', 'Theatre'),
    (20, 'Lena', 'Wang', 34, 'F', 'Television');
   
   INSERT INTO Project (project_id, project_name, project_type, project_description, project_director)
VALUES
    ('P001', 'The Great Gatsby', 'Film', 'A romantic drama set in the roaring 20s', 'John Doe'),
    ('P002', 'Hamlet', 'Theatre', 'A tragic play about a prince seeking revenge', 'Jane Smith'),
    ('P003', 'Breaking Bad', 'Television', 'A crime drama about a high school chemistry teacher turned drug lord', 'Robert Johnson'),
    ('P004', 'La La Land', 'Film', 'A romantic musical set in modern-day Los Angeles', 'Sarah Garcia'),
    ('P005', 'Les Miserables', 'Theatre', 'A musical about love, redemption, and revolution in 19th century France', 'David Lee'),
    ('P006', 'Stranger Things', 'Television', 'A sci-fi horror series set in the 1980s', 'Emily Nguyen'),
    ('P007', 'The Irishman', 'Film', 'A crime epic spanning several decades', 'Michael Brown'),
    ('P008', 'The Lion King', 'Theatre', 'A musical based on the Disney animated film', 'Alexandra Kim'),
    ('P009', 'The Crown', 'Television', 'A historical drama about the reign of Queen Elizabeth II', 'Thomas Wong'),
    ('P010', 'The Phantom of the Opera', 'Theatre', 'A musical about a mysterious figure haunting the Paris Opera House', 'Jessica Liu'),
    ('P011', 'Inception', 'Film', 'A sci-fi action film about a thief who enters people’s dreams', 'William Chen'),
    ('P012', 'Wicked', 'Theatre', 'A musical based on the novel Wicked: The Life and Times of the Wicked Witch of the West', 'Maria Gonzalez'),
    ('P013', 'Breaking Bad: El Camino', 'Film', 'A continuation of the Breaking Bad story following the events of the series finale', 'Christopher Park'),
    ('P014', 'The Sopranos', 'Television', 'A crime drama about a New Jersey mobster and his family', 'Melissa Ng'),
    ('P015', 'The Social Network', 'Film', 'A biographical drama about the founding of Facebook', 'William Johnson'),
    ('P016', 'A Streetcar Named Desire', 'Theatre', 'A play about a fading Southern belle and her brutish brother-in-law', 'Sophie Martin'),
    ('P017', 'The Queen\s Gambit', 'Television', 'A period drama about a young female chess prodigy in the 1950s', 'Daniel Nguyen'),
    ('P018', 'The Sound of Music', 'Theatre', 'A musical based on the true story of the Von Trapp family during World War II', 'Olivia Chen'),
    ('P019', 'The Godfather', 'Film', 'A crime drama about the Corleone family and their mafia empire', 'Jonathan Garcia'),
    ('P020', 'The Importance of Being Earnest', 'Theatre', 'A play about mistaken identities and romance in Victorian England', 'Lena Wang');


INSERT INTO Show_review (review_id, review_rating, review_date, cast_review, director_review)
VALUES
    (1, 8, '2022-01-05', 7, 9),
    (2, 6, '2022-02-12', 5, 7),
    (3, 9, '2022-03-20', 8, 9),
    (4, 7, '2022-04-02', 6, 8),
    (5, 10, '2022-05-18', 9, 10),
    (6, 5, '2022-06-25', 4, 6),
    (7, 8, '2022-07-09', 8, 7),
    (8, 7, '2022-08-14', 7, 8),
    (9, 9, '2022-09-22', 9, 9),
    (10, 6, '2022-10-30', 6, 7),
    (11, 8, '2022-11-15', 7, 9),
    (12, 5, '2022-12-22', 4, 7),
    (13, 9, '2023-01-30', 8, 9),
    (14, 7, '2023-02-13', 6, 8),
    (15, 10, '2023-03-24', 9, 10),
    (16, 5, '2023-04-30', 4, 6),
    (17, 8, '2023-05-15', 8, 7),
    (18, 7, '2023-06-20', 7, 8),
    (19, 9, '2023-07-28', 9, 9),
    (20, 6, '2023-08-30', 6, 7);

INSERT INTO Show_time (show_time_id, review_id, showtime_date, showtime_time, showtime_duration, showtime_venue)
VALUES
    (1, 1, '2022-01-10', '19:00', '2 hours', 'Theater A'),
    (2, 2, '2022-02-18', '20:30', '1.5 hours', 'Theater B'),
    (3, 3, '2022-03-25', '18:00', '2.5 hours', 'Theater C'),
    (4, 4, '2022-04-08', '21:00', '2 hours', 'Theater A'),
    (5, 5, '2022-05-20', '19:30', '3 hours', 'Theater B'),
    (6, 6, '2022-06-27', '18:30', '1.5 hours', 'Theater C'),
    (7, 7, '2022-07-11', '20:00', '2 hours', 'Theater A'),
    (8, 8, '2022-08-16', '19:30', '2.5 hours', 'Theater B'),
    (9, 9, '2022-09-24', '18:00', '2 hours', 'Theater C'),
    (10, 10, '2022-10-31', '21:00', '1.5 hours', 'Theater A'),
    (11, 11, '2023-01-15', '19:30', '2 hours', 'Theater B'),
    (12, 12, '2023-02-22', '20:00', '1.5 hours', 'Theater C'),
    (13, 13, '2023-03-29', '18:30', '2.5 hours', 'Theater A'),
    (14, 14, '2023-04-12', '21:00', '2 hours', 'Theater B'),
    (15, 15, '2023-05-24', '19:00', '3 hours', 'Theater C'),
    (16, 16, '2023-06-30', '20:00', '1.5 hours', 'Theater A'),
    (17, 17, '2023-07-14', '18:30', '2 hours', 'Theater B'),
    (18, 18, '2023-08-19', '20:30', '2.5 hours', 'Theater C'),
    (19, 19, '2023-09-27', '19:00', '2 hours', 'Theater A'),
    (20, 20, '2023-11-01', '21:30', '1.5 hours', 'Theater B');

   INSERT INTO Ticket_Type (ticket_type_id, ticket_type)
VALUES
    ('TT001', 'General Admission'),
    ('TT002', 'VIP'),
    ('TT003', 'Student'),
    ('TT004', 'Senior'),
    ('TT005', 'Group');
   
INSERT INTO Ticket (ticket_type_id, ticket_id, show_time_id, ticket_price, ticket_date, ticket_seat)
VALUES
    ('TT001', 101, 1, '30.00', '2023-01-01', 'A1'),
    ('TT002', 102, 1, '75.00', '2023-01-01', 'VIP1'),
    ('TT001', 103, 2, '25.00', '2023-02-01', 'B3'),
    ('TT003', 104, 2, '20.00', '2023-02-01', 'S2'),
    ('TT001', 105, 3, '35.00', '2023-03-01', 'C7'),
    ('TT004', 106, 3, '15.00', '2023-03-01', 'R4'),
    ('TT001', 107, 4, '40.00', '2023-04-01', 'D5'),
    ('TT005', 108, 4, '20.00', '2023-04-01', 'G2'),
    ('TT001', 109, 5, '45.00', '2023-05-01', 'E8'),
    ('TT002', 110, 5, '80.00', '2023-05-01', 'VIP2'),
    ('TT002', 111, 6, '70.00', '2023-06-01', 'VIP3'),
    ('TT001', 112, 6, '30.00', '2023-06-01', 'F6'),
    ('TT004', 113, 7, '18.00', '2023-07-01', 'T8'),
    ('TT003', 114, 7, '22.00', '2023-07-01', 'S6'),
    ('TT001', 115, 8, '40.00', '2023-08-01', 'A3'),
    ('TT005', 116, 8, '16.00', '2023-08-01', 'G4'),
    ('TT001', 117, 9, '35.00', '2023-09-01', 'B8'),
    ('TT002', 118, 9, '80.00', '2023-09-01', 'VIP4'),
    ('TT001', 119, 10, '30.00', '2023-10-01', 'C5'),
    ('TT004', 120, 10, '14.00', '2023-10-01', 'R6');
   
   INSERT INTO Talent_Casting (director_id, project_id, talent_name, talent_role)
VALUES
    (1, 'P001', 'Emma Stone', 'Lead Actress'),
    (1, 'P001', 'Ryan Gosling', 'Lead Actor'),
    (2, 'P002', 'Tom Hardy', 'Villain'),
    (2, 'P002', 'Margot Robbie', 'Supporting Actress'),
    (3, 'P003', 'Chris Evans', 'Superhero'),
    (4, 'P004', 'Scarlett Johansson', 'Lead Actress'),
    (4, 'P004', 'Chris Hemsworth', 'Lead Actor'),
    (5, 'P005', 'Angelina Jolie', 'Villain'),
    (5, 'P005', 'Brad Pitt', 'Supporting Actor'),
    (6, 'P006', 'Tom Hanks', 'Protagonist'),
    (7, 'P007', 'Tom Cruise', 'Lead Actor'),
    (7, 'P007', 'Margot Robbie', 'Lead Actress'),
    (8, 'P008', 'Meryl Streep', 'Protagonist'),
    (8, 'P009', 'Robert De Niro', 'Antagonist'),
    (9, 'P010', 'Daniel Craig', 'Spy');
   
   INSERT INTO Talent_hire (director_id, imdb_pro_id, rating, review_comments)
VALUES
    (1, '123456', '8.5', 'Great acting skills'),
    (1, '123456', '9.0', 'A true professional'),
    (2, '234567', '7.5', 'Did a good job'),
    (2, '234567', '8.0', 'Talented and dedicated to their craft'),
    (3, '345678', '9.5', 'An absolute pleasure to work with you'),
    (4, '456789', '8.0', 'Solid performance, brought a lot to the role'),
    (4, '456789', '9.5', 'Amazing talent, added depth and complexity'),
    (5, '567890', '7.0', 'Good performance, but lacked chemistry with co-stars'),
    (5, '567890', '8.5', 'Very talented'),
    (6, '678901', '8.0', 'Professional and dedicated'),
    (7, '789012', '9.0', 'Extremely talented, delivered a standout performance'),
    (7, '789012', '7.5', 'Good performance, but could have been more polished'),
    (8, '890123', '8.5', 'Very professional'),
    (8, '890123', '9.5', 'One of the best actors I have worked with'),
    (9, '901234', '7.0', 'Did a decent job');
   
   INSERT INTO Content_rating (rating_id, overall_rating, rating_by_genre, rating_by_certificates, rating_by_cast_and_crew) 
   VALUES
('tt0012345', 8, 7, 9, 8),
('tt0054321', 9, 9, 8, 8),
('tt0098765', 7, 6, 8, 7),
('tt0123456', 10, 10, 10, 9),
('tt0212345', 6, 6, 7, 7),
('tt0312345', 8, 8, 8, 7),
('tt0412345', 7, 6, 7, 8),
('tt0512345', 9, 9, 9, 10),
('tt0612345', 8, 7, 9, 8),
('tt0712345', 7, 6, 8, 7),
('CR11', 9, 8, 7, 6),
('CR12', 6, 7, 8, 9),
('CR13', 5, 6, 7, 8),
('CR14', 8, 7, 6, 5),
('CR15', 6, 5, 4, 3);

INSERT INTO Content (content_id, rating_id, content_type) 
VALUES
('M4590','tt0012345','Movie'),
('TV394','tt0054321','Tv'),
('EVENTS67','tt0098765','Awards');

INSERT INTO Movie (content_id, movie_name, duration, description, rating)
VALUES ('M4590', 'The Shawshank Redemption', '2h 22min', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 9),
('M4590', 'The Godfather', '2h 55min', 'An organized crime dynastys aging patriarch transfers control of his clandestine empire to his reluctant son.', 9),
('M4590', 'The Dark Knight', '2h 32min', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 8),
('M4590', 'The Godfather: Part II', '3h 22min', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 9),
('M4590', '12 Angry Men', '1h 36min', 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.', 8),
('M4590', 'The Dark Knight-2', '2h 32min', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 9),
('M4590', 'The Godfather-3', '2h 55min', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 9),
('M4590', 'The Lord of the Rings: The Fellowship of the Ring', '2h 58min', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 8),
('M4590', 'Forrest Gump', '2h 22min', 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 8),
('M4590', 'Inception', '2h 28min', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 8);


INSERT INTO TV_Show (content_id, show_name, duration, description, rating)
VALUES
('TV394', 'Stranger Things', '60 min', 'When a young boy disappears, his mother, a police chief, and his friends must confront terrifying supernatural forces in order to get him back.', 8),
('TV394', 'Game of Thrones', '60 min', 'Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.', 9),
('TV394', 'Breaking Bad', '49 min', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family future.', 9),
('TV394', 'The Crown', '58 min', 'Follows the political rivalries and romance of Queen Elizabeth IIs reign and the events that shaped the second half of the twentieth century.', 8),
('TV394', 'The Witcher', '60 min', 'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts.', 8),
('TV394', 'Friends', '30 min', 'A sitcom about a group of friends living in New York City', 8),
('TV394', 'The Office', '30 min', 'A mockumentary-style sitcom about office life', 8),
('TV394', 'The Family Man', '30 min', 'A fascinating thriller with patriotism', 9),
('TV394', 'mirzapur', '94 min', 'A drama filmed in the north part of india', 8),
('TV394', 'The Test', '51 min', 'A documentary on border-gavaskar trophy', 9);


INSERT INTO Awards (content_id, event_name, duration, description, rating) 
VALUES 
('EVENTS67', 'Academy Awards', '3 hours', 'Annual awards ceremony recognizing excellence in cinematic achievements', 4),
('EVENTS67', 'Emmy Awards', '4 hours', 'Annual awards ceremony recognizing excellence in television programming', 5),
('EVENTS67', 'Grammy Awards', '3.5 hours', 'Annual awards ceremony recognizing excellence in the music industry', 4),
('EVENTS67', 'Tony Awards', '3 hours', 'Annual awards ceremony recognizing excellence in live Broadway theater', 3),
('EVENTS67', 'Golden Globe Awards', '3 hours', 'Annual awards ceremony recognizing excellence in film and television', 4),
('EVENTS67', 'Screen Actors Guild Awards', '2 hours', 'Annual awards ceremony recognizing outstanding performances in film and television', 4),
('EVENTS67', 'MTV Video Music Awards', '3 hours', 'Annual awards ceremony recognizing achievements in the music video industry', 3),
('EVENTS67', 'People\s Choice Awards', '2 hours', 'Annual awards ceremony where winners are determined by public vote', 3),
('EVENTS67', 'Cannes Film Festival', '10 days', 'Annual film festival featuring screenings and competition of international films', 5),
('EVENTS67', 'Oscars', '3.5 hours', 'Annual awards ceremony recognizing excellence in the film industry', 5);




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










   








