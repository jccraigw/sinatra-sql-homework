CREATE DATABASE cars2;

\c cars2;

CREATE TABLE models (id SERIAL PRIMARY KEY, make VARCHAR(225), model VARCHAR(225), image_url VARCHAR(225), year INTEGER, price DECIMAL, dealer_id INT references dealers(id));
CREATE TABLE dealers (id SERIAL PRIMARY KEY, name VARCHAR(225));

INSERT INTO dealers(name) VALUES ('Leith Volkswagon');
INSERT INTO dealers(name) VALUES ('Leith BMW');

INSERT INTO models (make, model, image_url, year, price, dealer_id) VALUES ('Volkswagon', 'CC', 'http://www.vwimg.com/iris/iris?vehicle=2017_3584L6_WT9_2016_05_29&paint=2T2T&fabric=LH&pov=E13%2CCGD&quality=100&bkgnd=transparent&RESP=PNG&width=600&w=7500&x=1000&h=5000&y=2000', 2011, 2100.00, 1);
INSERT INTO models (make, model, image_url, year, price, dealer_id) VALUES ('BMW', 'i*', 'http://blog.caranddriver.com/wp-content/uploads/2016/01/BMW-i8-Mirrorless-cameras-PLACEMENT.jpg', 2017, 140400.00, 2);

