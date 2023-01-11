CREATE TABLE restaurant (
    id INTEGER PRIMARY KEY,
    name varchar(20),
    description varchar(100),
    rating decimal,
    telephone char(10),
    hours varchar(100)
);


CREATE TABLE address (
    id INTEGER PRIMARY KEY,
    street_number varchar(10),
    street_name varchar(20),
    city varchar(20),
    state varchar(15),
    google_map_link varchar(50),
    restaurant_id INTEGER REFERENCES restaurant(id)
);

CREATE TABLE review (
    id INTEGER PRIMARY KEY,
    rating DECIMAL,
    description varchar(100),
    date date,
    restaurant_id INTEGER REFERENCES restaurant(id)
);


CREATE TABLE category (
    id char(2) PRIMARY KEY,
    name varchar(20),
    description varchar(200)
);

CREATE TABLE dish (
    id INTEGER PRIMARY KEY,
    name varchar(50),
    description varchar(200),
    hot_and_spicy BOOLEAN
);

CREATE TABLE categories_dishes (
    category_id char(2) REFERENCES category(id),
    dish_id INTEGER REFERENCES dish(id),
    price money,
    PRIMARY KEY (category_id, dish_id)
);






