CREATE DATABASE IF NOT EXISTS music_store;
USE music_store;

-- ============================================
-- TABLES CREATION
-- ============================================

CREATE TABLE IF NOT EXISTS genre (
  GenreId INT PRIMARY KEY,
  Name VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS media_type (
  MediaTypeId INT PRIMARY KEY,
  Name VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS artist (
  ArtistId INT PRIMARY KEY,
  Name VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS album (
  AlbumId INT PRIMARY KEY,
  Title VARCHAR(160),
  ArtistId INT,
  FOREIGN KEY (ArtistId) REFERENCES artist(ArtistId)
);

CREATE TABLE IF NOT EXISTS track (
  TrackId INT PRIMARY KEY,
  Name VARCHAR(200),
  AlbumId INT,
  MediaTypeId INT,
  GenreId INT,
  Composer VARCHAR(220),
  Milliseconds INT,
  Bytes INT,
  UnitPrice DECIMAL(10,2),
  FOREIGN KEY (AlbumId) REFERENCES album(AlbumId),
  FOREIGN KEY (MediaTypeId) REFERENCES media_type(MediaTypeId),
  FOREIGN KEY (GenreId) REFERENCES genre(GenreId)
);

CREATE TABLE IF NOT EXISTS playlist (
  PlaylistId INT PRIMARY KEY,
  Name VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS playlist_track (
  PlaylistId INT,
  TrackId INT,
  PRIMARY KEY (PlaylistId, TrackId),
  FOREIGN KEY (PlaylistId) REFERENCES playlist(PlaylistId),
  FOREIGN KEY (TrackId) REFERENCES track(TrackId)
);

CREATE TABLE IF NOT EXISTS employee (
  EmployeeId INT PRIMARY KEY,
  LastName VARCHAR(20),
  FirstName VARCHAR(20),
  Title VARCHAR(30),
  ReportsTo INT,
  BirthDate DATETIME,
  HireDate DATETIME,
  Address VARCHAR(70),
  City VARCHAR(40),
  State VARCHAR(40),
  Country VARCHAR(40),
  PostalCode VARCHAR(10),
  Phone VARCHAR(24),
  Fax VARCHAR(24),
  Email VARCHAR(60),
  FOREIGN KEY (ReportsTo) REFERENCES employee(EmployeeId)
);

CREATE TABLE IF NOT EXISTS customer (
  CustomerId INT PRIMARY KEY,
  FirstName VARCHAR(40),
  LastName VARCHAR(20),
  Company VARCHAR(80),
  Address VARCHAR(70),
  City VARCHAR(40),
  State VARCHAR(40),
  Country VARCHAR(40),
  PostalCode VARCHAR(10),
  Phone VARCHAR(24),
  Fax VARCHAR(24),
  Email VARCHAR(60),
  SupportRepId INT,
  FOREIGN KEY (SupportRepId) REFERENCES employee(EmployeeId)
);

CREATE TABLE IF NOT EXISTS invoice (
  InvoiceId INT PRIMARY KEY,
  CustomerId INT,
  InvoiceDate DATETIME,
  BillingAddress VARCHAR(70),
  BillingCity VARCHAR(40),
  BillingState VARCHAR(40),
  BillingCountry VARCHAR(40),
  BillingPostalCode VARCHAR(10),
  Total DECIMAL(10,2),
  FOREIGN KEY (CustomerId) REFERENCES customer(CustomerId)
);

CREATE TABLE IF NOT EXISTS invoice_line (
  InvoiceLineId INT PRIMARY KEY,
  InvoiceId INT,
  TrackId INT,
  UnitPrice DECIMAL(10,2),
  Quantity INT,
  FOREIGN KEY (InvoiceId) REFERENCES invoice(InvoiceId),
  FOREIGN KEY (TrackId) REFERENCES track(TrackId)
);

-- ============================================
-- DATA INSERTION - GENRE
-- ============================================

INSERT INTO genre (GenreId, Name) VALUES
(1, 'Rock'),
(2, 'Jazz'),
(3, 'Metal'),
(4, 'Alternative'),
(5, 'Latin'),
(6, 'Classical'),
(7, 'Drama'),
(8, 'Easy Listening'),
(9, 'Electronica'),
(10, 'Blues'),
(11, 'Latin'),
(12, 'Punk'),
(13, 'Hip Hop'),
(14, 'Pop'),
(15, 'Reggae'),
(16, 'Heavy Metals'),
(17, 'Soundtrack'),
(18, 'TV Shows'),
(19, 'Science Fiction'),
(20, 'TV Shows'),
(21, 'Sci Fi'),
(22, 'Documentary'),
(23, 'Audiobook'),
(24, 'Comedy'),
(25, 'Alternative'),
(26, 'Ambient');

-- ============================================
-- DATA INSERTION - MEDIA_TYPE
-- ============================================

INSERT INTO media_type (MediaTypeId, Name) VALUES
(1, 'MPEG audio file'),
(2, 'Protected AAC audio file'),
(3, 'Protected MPEG-4 video file'),
(4, 'Purchased AAC audio file'),
(5, 'AAC audio file');

-- ============================================
-- DATA INSERTION - ARTIST
-- ============================================

INSERT INTO artist (ArtistId, Name) VALUES
(1, 'AC/DC'),
(2, 'Accept'),
(3, 'Aerosmith'),
(4, 'Alanis Morissette'),
(5, 'Alice In Chains'),
(6, 'Antônio Carlos Jobim'),
(7, 'Apocalyptica'),
(8, 'Audioslave'),
(9, 'BackBeat'),
(10, 'Billy Cobham'),
(11, 'Black Sabbath'),
(12, 'Black Sheep'),
(13, 'Blind Melon'),
(14, 'Blue Öyster Cult'),
(15, 'Blues Traveler'),
(16, 'BossaStella'),
(17, 'Boston'),
(18, 'Britney Spears'),
(19, 'Bronze Band'),
(20, 'Bruce Dickinson'),
(21, 'Buddy Guy'),
(22, 'Burning Spear'),
(23, 'C. W. Stoneking'),
(24, 'Calexico'),
(25, 'Cándida Batista'),
(26, 'Canned Heat'),
(27, 'Carlos Santana'),
(28, 'Carter Burwell'),
(29, 'Cartoon'),
(30, 'Case/Lang/Veirs');

-- ============================================
-- DATA INSERTION - ALBUM
-- ============================================

INSERT INTO album (AlbumId, Title, ArtistId) VALUES
(1, 'For Those About To Rock We Salute You', 1),
(2, 'Balls to the Wall', 2),
(3, 'Restless and Wild', 2),
(4, 'Let There Be Rock', 1),
(5, 'Big Ones', 3),
(6, 'Jagged Little Pill', 4),
(7, 'Facelift', 5),
(8, 'Warner 25, 1994-2019', 6),
(9, 'The Number of the Beast', 1),
(10, 'Greatest Hits', 7),
(11, 'Audioslave', 8),
(12, 'Out of Exile', 8),
(13, 'Super Hits', 9),
(14, 'Back to Black', 10),
(15, 'Paranoid Android', 11),
(16, 'Master of Puppets', 1),
(17, 'Nevermind', 5),
(18, 'Appetite for Destruction', 3),
(19, 'Aladdin Sane', 4),
(20, 'Station to Station', 3);

-- ============================================
-- DATA INSERTION - TRACK
-- ============================================

INSERT INTO track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
(1, 'For Those About To Rock (We Salute You)', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 343719, 11170334, 0.99),
(2, 'Right Through You', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 199836, 6566614, 0.99),
(3, 'Snowballed', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 203102, 6723451, 0.99),
(4, 'Evil Walks', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 263497, 8611245, 0.99),
(5, 'C.O.D.', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 199318, 6556860, 0.99),
(6, 'Breaking The Rules', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 263288, 8596840, 0.99),
(7, 'Night Of The Long Knives', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 205246, 6757821, 0.99),
(8, 'Spellbound', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 210973, 6935989, 0.99),
(9, 'Go Down', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 272855, 8978297, 0.99),
(10, 'Dog Eat Dog', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 215196, 7076250, 0.99),
(11, 'Let Me Put My Love Into You', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 262724, 8611245, 0.99),
(12, 'Back In Black', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 255611, 8417823, 0.99);

-- ============================================
-- DATA INSERTION - EMPLOYEE
-- ============================================

INSERT INTO employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES
(1, 'Adams', 'Andrew', 'General Manager', NULL, '1962-02-18', '2002-08-14', '11120 Jasper Ave NW', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'andrew@chinookmusic.com'),
(2, 'Edwards', 'Nancy', 'Sales Manager', 1, '1958-12-08', '2002-05-01', '825 8 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 2T3', '+1 (403) 262-3361', '+1 (403) 262-3364', 'nancy@chinookmusic.com'),
(3, 'Peacock', 'Jane', 'Sales Support Agent', 2, '1973-08-29', '2002-04-01', '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5M5', '+1 (403) 262-3361', '+1 (403) 262-6712', 'jane@chinookmusic.com'),
(4, 'Park', 'Margaret', 'Sales Support Agent', 2, '1966-01-09', '2003-05-03', '683 10 Street SW', 'Calgary', 'AB', 'Canada', 'T2P 5G7', '+1 (403) 263-4423', '+1 (403) 263-4289', 'margaret@chinookmusic.com'),
(5, 'Johnson', 'Steve', 'Sales Support Agent', 2, '1965-03-03', '2003-10-17', '7031 Bloor Street W', 'Toronto', 'ON', 'Canada', 'M6W 1R9', '+1 (416) 898-9759', '', 'steve@chinookmusic.com'),
(6, 'Mitchell', 'Michael', 'IT Manager', 1, '1973-07-01', '2004-01-09', '5827 Bowness Road NW', 'Calgary', 'AB', 'Canada', 'T3B 0C5', '+1 (403) 246-9887', '+1 (403) 246-9899', 'michael@chinookmusic.com'),
(7, 'King', 'Robert', 'IT Staff', 6, '1970-05-29', '2004-01-02', '590 Columbia Boulevard West', 'Lethbridge', 'AB', 'Canada', 'T1K 5N8', '+1 (403) 456-9986', '+1 (403) 456-8485', 'robert@chinookmusic.com'),
(8, 'Callahan', 'Laura', 'IT Staff', 6, '1968-01-09', '2004-03-04', '923 7 ST NW', 'Lethbridge', 'AB', 'Canada', 'T1H 1Y8', '+1 (403) 467-3351', '+1 (403) 467-8772', 'laura@chinookmusic.com');

-- ============================================
-- DATA INSERTION - CUSTOMER
-- ============================================

INSERT INTO customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES
(1, 'Luís', 'Gonçalves', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. Brasileira, 1', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3),
(2, 'Leonie', 'Köhler', NULL, 'Theodor-Heuss-Straße 34', 'Stuttgart', NULL, 'Germany', '70174', '+49 0711 2842410', NULL, 'leonie.kohler@surfeu.de', 5),
(3, 'François', 'Tremblay', NULL, '1498 rue Bélanger', 'Montréal', 'QC', 'Canada', 'H2G 1A7', '+1 (514) 721-4711', NULL, 'ftremblay@gmail.com', 3),
(4, 'Björn', 'Hansen', NULL, 'Ullevålsveien 14', 'Oslo', NULL, 'Norway', '0171', '+47 22 44 22 22', NULL, 'bjorn.hansen@yahoo.no', 4),
(5, 'František', 'Wichterlová', 'JetBrains s.r.o.', 'Klanova 9/506', 'Prague', NULL, 'Czech Republic', '14700', '+420 2 4172 5555', '+420 2 4172 5555', 'frantisekw@jetbrains.com', 4),
(6, 'Helena', 'Holý', NULL, 'Rilská 3174/6', 'Prague', NULL, 'Czech Republic', '14300', '+420 2 4172 5555', NULL, 'hholy@gmail.com', 5),
(7, 'Astrid', 'Gruber', NULL, 'Rotenturmstraße 4, 1020 Salzburg', 'Salzburg', NULL, 'Austria', '5020', '+43 06212 3010', NULL, 'astrid.gruber@apple.at', 3),
(8, 'Daan', 'Peeters', NULL, 'Grétrystraat 63', 'Brussels', NULL, 'Belgium', '1000', '+32 2 210 39 40', NULL, 'daan_peeters@apple.be', 1),
(9, 'Kara', 'Nielsen', NULL, 'Sørengade 2', 'Copenhagen', NULL, 'Denmark', '2100', '+45 33 11 22 33', NULL, 'kara.nielsen@jubii.dk', 4),
(10, 'Eduardo', 'Martins', 'Woodstock Discos', 'Rua do Outeiro, 67', 'Lisbon', NULL, 'Portugal', NULL, '+351 (213) 622-7555', '+351 (213) 622-4894', 'eduardo@woodstock.pt', 4);

-- ============================================
-- DATA INSERTION - PLAYLIST
-- ============================================

INSERT INTO playlist (PlaylistId, Name) VALUES
(1, 'Music'),
(2, 'Movies'),
(3, 'TV Shows'),
(4, 'Audiobooks'),
(5, 'Music Videos'),
(6, 'All Media'),
(7, 'Brazilian Music'),
(8, 'Classical'),
(9, 'Classical 101 - Deep Cuts'),
(10, 'Classical 101 - Next Steps'),
(11, 'Classical 101 - The Basics'),
(12, 'David Guetta'),
(13, 'Grunge'),
(14, 'Heavy Metal Classic'),
(15, 'Heavy Metal'),
(16, 'Hip Hop/Rap'),
(17, 'Indie'),
(18, 'Indie Rock'),
(19, 'Jazz'),
(20, 'Latin'),
(21, 'Metal'),
(22, 'Movies'),
(23, 'On-The-Go 1'),
(24, 'Podcasts'),
(25, 'Red Hot Chili Peppers'),
(26, 'Rock'),
(27, 'Rock Legends'),
(28, 'TV Shows'),
(29, 'Videos'),
(30, 'Workout Mix');

-- ============================================
-- DATA INSERTION - PLAYLIST_TRACK
-- ============================================

INSERT INTO playlist_track (PlaylistId, TrackId) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12);

-- ============================================
-- DATA INSERTION - INVOICE
-- ============================================

INSERT INTO invoice (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES
(1, 2, '2009-01-06', 'Theodor-Heuss-Straße 34', 'Stuttgart', NULL, 'Germany', '70174', 1.98),
(2, 4, '2009-01-06', 'Ullevålsveien 14', 'Oslo', NULL, 'Norway', '0171', 3.96),
(3, 8, '2009-01-06', 'Grétrystraat 63', 'Brussels', NULL, 'Belgium', '1000', 5.94),
(4, 1, '2009-01-09', 'Av. Brasileira, 1', 'São José dos Campos', 'SP', 'Brazil', '12227-000', 8.91),
(5, 3, '2009-01-14', '1498 rue Bélanger', 'Montréal', 'QC', 'Canada', 'H2G 1A7', 13.86),
(6, 7, '2009-01-16', 'Rotenturmstraße 4, 1020 Salzburg', 'Salzburg', NULL, 'Austria', '5020', 0.99),
(7, 9, '2009-01-17', 'Sørengade 2', 'Copenhagen', NULL, 'Denmark', '2100', 1.98),
(8, 5, '2009-01-19', 'Klanova 9/506', 'Prague', NULL, 'Czech Republic', '14700', 3.96),
(9, 10, '2009-01-21', 'Rua do Outeiro, 67', 'Lisbon', NULL, 'Portugal', NULL, 5.94),
(10, 6, '2009-01-27', 'Rilská 3174/6', 'Prague', NULL, 'Czech Republic', '14300', 13.86);

-- ============================================
-- DATA INSERTION - INVOICE_LINE
-- ============================================

INSERT INTO invoice_line (InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity) VALUES
(1, 1, 2, 0.99, 1),
(2, 1, 4, 0.99, 1),
(3, 2, 6, 0.99, 1),
(4, 2, 8, 0.99, 1),
(5, 2, 10, 0.99, 1),
(6, 2, 12, 0.99, 1),
(7, 3, 1, 0.99, 1),
(8, 3, 3, 0.99, 1),
(9, 3, 5, 0.99, 1),
(10, 3, 7, 0.99, 1),
(11, 3, 9, 0.99, 1),
(12, 3, 11, 0.99, 1),
(13, 4, 2, 0.99, 1),
(14, 4, 4, 0.99, 1),
(15, 4, 6, 0.99, 1),
(16, 4, 8, 0.99, 1),
(17, 4, 10, 0.99, 1),
(18, 4, 12, 0.99, 1),
(19, 4, 1, 0.99, 1),
(20, 4, 3, 0.99, 1),
(21, 4, 5, 0.99, 1),
(22, 5, 7, 0.99, 1),
(23, 5, 9, 0.99, 1),
(24, 5, 11, 0.99, 1),
(25, 5, 2, 0.99, 1),
(26, 5, 4, 0.99, 1),
(27, 5, 6, 0.99, 1),
(28, 5, 8, 0.99, 1),
(29, 5, 10, 0.99, 1),
(30, 5, 12, 0.99, 1),
(31, 5, 1, 0.99, 1),
(32, 5, 3, 0.99, 1),
(33, 5, 5, 0.99, 1),
(34, 5, 7, 0.99, 1),
(35, 6, 1, 0.99, 1),
(36, 7, 2, 0.99, 1),
(37, 7, 4, 0.99, 1),
(38, 8, 6, 0.99, 1),
(39, 8, 8, 0.99, 1),
(40, 8, 10, 0.99, 1),
(41, 8, 12, 0.99, 1),
(42, 9, 1, 0.99, 1),
(43, 9, 3, 0.99, 1),
(44, 9, 5, 0.99, 1),
(45, 9, 7, 0.99, 1),
(46, 9, 9, 0.99, 1),
(47, 9, 11, 0.99, 1),
(48, 10, 2, 0.99, 1),
(49, 10, 4, 0.99, 1),
(50, 10, 6, 0.99, 1),
(51, 10, 8, 0.99, 1),
(52, 10, 10, 0.99, 1),
(53, 10, 12, 0.99, 1),
(54, 10, 1, 0.99, 1),
(55, 10, 3, 0.99, 1),
(56, 10, 5, 0.99, 1),
(57, 10, 7, 0.99, 1);

-- Q1. Find the top 10 customers by total spending.
select c.customerId,concat(c.firstname,'',c.lastname) as full_name,
c.country,round(sum(il.unitprice*il.quantity),2) as total_spending
from customer as c
join invoice as i
on c.customerId=i.customerId
join invoice_line as il
on i.invoiceid=il.invoiceid
group by c.customerId,c.firstname,lastname
order by total_spending desc
limit 10;

-- Q2. Find the total revenue generated from each country.
select c.country,
round(sum(i.total),2) as revenue
from customer as c
join invoice as i
on c.customerid=i.customerid
group by c.country;

-- Q3.Find customers whose total spending is greater than the average customer spending.
select c.customerid,concat(c.firstname,'',c.lastname),
round(sum(i.total),2) as total_spending
from customer as c 
join invoice as i
on c.customerid=i.customerid
group by c.customerid,c.firstname,c.lastname
having sum(i.total)>(select avg(customer_total)
 from (select sum(total)as customer_total
 from invoice 
 group by 	customerid
 ) as customer_spending
 )
 order by total_spending desc;

-- Q4.Find customers who have made more than 5 invoices.
select c.customerid,concat(c.firstname,'',c.lastname) as full_name,
count(i.invoiceid) as invoice_count
from customer as c
join invoice as i
on c.customerid=i.customerid
group by c.customerid,c.firstname,c.lastname;

-- Q5.Find the top 10 tracks by quantity sold.
select t.trackid,t.name,
sum(il.quantity) as quantity_sold 
from track as t
join invoice_line as il
group by t.trackid,t.name
order by quantity_sold desc
limit 10;

-- Q6.Calculate total revenue generated by each music genre.
select g.genreid,g.name,
round(sum(il.unitprice*il.quantity),2) as revenue
from genre as g
left join track as t
on g.genreid=t.genreid
left join invoice_line as il
on il.trackid=t.trackid
group by g.genreid,g.name
order by revenue desc;

-- Q7. Find the top 10 artists based on total track sales.
select a.artistid,a.name,
sum(il.quantity) as track_sales
from artist as a
left join album as al
on a.artistid=al.artistid
left join track as t
on t.albumid=al.albumid
left join invoice_line as il
on il.trackid=t.trackid
group by a.artistid,a.name
order by track_sales desc
limit 10;

-- Q8.Find the top 10 albums based on revenue generated.
select al.albumid,al.title,
round(sum(il.unitprice*il.quantity),2) as revenue
from album as al
left join track as t
on al.albumid=t.albumid
left join invoice_line as il
on il.trackid=t.trackid
group by al.albumid,al.title;

-- Q9.Find countries that have more than 5 customers but generate below-average revenue per customer.
WITH country_data AS (
    SELECT
        c.Country,
        COUNT(DISTINCT c.CustomerId) AS customer_count,
        SUM(il.UnitPrice * il.Quantity) AS total_revenue
    FROM customer AS c
    JOIN invoice AS i
        ON c.CustomerId = i.CustomerId
    JOIN invoice_line AS il
        ON i.InvoiceId = il.InvoiceId
    GROUP BY c.Country )
    
SELECT
    Country,
    customer_count,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(total_revenue / customer_count, 2) AS revenue_per_customer
FROM country_data
WHERE customer_count > 5
  AND total_revenue / customer_count < (
      SELECT AVG(total_revenue / customer_count)
      FROM country_data
  )
ORDER BY revenue_per_customer;

-- Q10.Rank customers from highest to lowest based on their total spending.
select c.customerid,concat(c.firstname,'',c.lastname) as fullname,
sum(il.unitprice*il.quantity) as total_Spending,
rank() over(order by sum(il.unitprice*il.quantity) desc) as spending_rank
FROM customer AS c
JOIN invoice AS i
    ON c.customerId = i.customerId
JOIN invoice_line AS il
    ON i.invoiceId = il.invoiceId
GROUP BY
    c.customerId,
    c.firstName,
    c.lastName
ORDER BY spending_rank;
