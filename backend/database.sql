CREATE TABLE category (
	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN,
	CONSTRAINT pk_category_id PRIMARY KEY (id) 
);

CREATE TABLE user_detail (
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),	
	CONSTRAINT pk_user_id PRIMARY KEY(id)
);

CREATE TABLE product (
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id),	
);

-- the address table to store the user billing and shipping addresses
CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);
-- the cart line table to store the cart details

CREATE TABLE cart_line (
	id IDENTITY,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT fk_cartline_cart_id FOREIGN KEY (cart_id ) REFERENCES cart (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);


-- the order detail table to store the order

CREATE TABLE order_detail (
	id IDENTITY,
	user_id int,
	order_total DECIMAL(10,2),
	order_count int,
	shipping_id int,
	billing_id int,
	order_date date,
	CONSTRAINT fk_order_detail_user_id FOREIGN KEY (user_id) REFERENCES user_detail (id),
	CONSTRAINT fk_order_detail_shipping_id FOREIGN KEY (shipping_id) REFERENCES address (id),
	CONSTRAINT fk_order_detail_billing_id FOREIGN KEY (billing_id) REFERENCES address (id),
	CONSTRAINT pk_order_detail_id PRIMARY KEY (id)
);

-- the order item table to store order items

CREATE TABLE order_item (
	id IDENTITY,
	order_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	CONSTRAINT fk_order_item_product_id FOREIGN KEY (product_id) REFERENCES product (id),
	CONSTRAINT fk_order_item_order_id FOREIGN KEY (order_id) REFERENCES order_detail (id),
	CONSTRAINT pk_order_item_id PRIMARY KEY (id)
);

-- adding four categories
INSERT INTO category (name, description,image_url,is_active) VALUES ('Window', 'This is description for Window category!', 'CAT_1.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Central', 'This is description for Central category!', 'CAT_2.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Portable', 'This is description for Portable category!', 'CAT_3.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Split Ductless', 'This is description for Split Ductless category!', 'CAT_4.png', true);

-- adding four users 
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Isidore', 'Rusumba', 'ADMIN', true, '$2a$10$1cdDsTwbmPP5u83nZBxFkeXdk.3JmptKnSuOj82hT79JPnLycrfFO', 'ir@gmail.com', '9999999999');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Joshua', 'Dickson', 'SUPPLIER', true, '$2a$10$3If3tUWB.zoHVHBfeXwpSuh/eFS6NMC6nQ5QgyiQCzc9oUSsLsI1q', 'jd@gmail.com', '8888888888');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Nandini', 'Dua', 'SUPPLIER', true, '$2a$10$3If3tUWB.zoHVHBfeXwpSuh/eFS6NMC6nQ5QgyiQCzc9oUSsLsI1q', 'nd@gmail.com', '7777777777');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Dennis', 'Mangeni', 'USER', true, '$2a$10$3If3tUWB.zoHVHBfeXwpSuh/eFS6NMC6nQ5QgyiQCzc9oUSsLsI1q', 'dm@gmail.com', '6666666666');

-- adding five products
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDEC23248E64', 'LW1816ER', 'LG', 'lg air conditionner!', 529, 5, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDC45317523A', 'WHAW182BW', 'Whirlpool', 'Whirlpool A/C', 800, 2, true, 1, 1, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRD6BDDBB5B15', 'AMAP121AD', 'Amana', 'Amana A/C', 850, 5, true, 3, 1, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRD792A64DFEF', 'LP1417SHR', 'LG', 'LG A/C', 599, 3, true, 2, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRD43238BB7A3', '15RLS2-ASU15RLS2-AOU15RLS2', 'Fujitsu', 'Fujitsu A/C', 1621, 5, true, 4, 1, 0, 0 );