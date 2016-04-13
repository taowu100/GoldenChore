CREATE TABLE IF NOT EXISTS Users
	(user_id VARCHAR(100), 
	 password VARCHAR(100) NOT NULL,
	 first_name VARCHAR(100) NOT NULL, 
	 last_name VARCHAR(100) NOT NULL,
	 email VARCHAR(100) NOT NULL,
	 phone_number VARCHAR(10) NOT NULL,
	 street_address VARCHAR(100),
	 driver_license VARCHAR(20),
	 PRIMARY KEY (user_id));

CREATE TABLE IF NOT EXISTS Location
	(loc_id INTEGER,
	 city VARCHAR(100),
	 state VARCHAR(100), 
	 country VARCHAR(100),
	 zip_code CHAR(10),
	 UNIQUE (city, state, country),
	 PRIMARY KEY (loc_id));

CREATE TABLE IF NOT EXISTS User_loc
	(loc_id INTEGER,
	 user_id VARCHAR(100),
	 UNIQUE (loc_id, user_id),
	 FOREIGN KEY (user_id) REFERENCES Users(user_id)
	 ON DELETE CASCADE,
	 FOREIGN KEY (loc_id) REFERENCES Location(loc_id)
	 ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS Type
	(type_id INTEGER,
	 type VARCHAR(100),
	 PRIMARY KEY (type_id));

CREATE TABLE IF NOT EXISTS Service
	(ser_id INTEGER,
	 ser_date DATE,
	 ser_time TIME,
	 hours FLOAT(6,1),
	 ser_description TEXT,
	 type_id INTEGER,
	 PRIMARY KEY (ser_id),
	 FOREIGN KEY (type_id) REFERENCES Type(type_id)
	 ON UPDATE CASCADE);

-- CREATE TABLE IF NOT EXISTS Ser_type
-- 	(ser_id INTEGER,
-- 	 type_id INTEGER,
-- 	 UNIQUE (ser_id, type_id),
-- 	 FOREIGN KEY (ser_id) REFERENCES Service
-- 	 ON DELETE CASCADE,
-- 	 FOREIGN KEY (type_id) REFERENCES Type
-- 	 ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS User_ser
	(user_id VARCHAR(100),
	 ser_id INTEGER,
	 UNIQUE (user_id, ser_id),
	 FOREIGN KEY (user_id) REFERENCES Users(user_id)
	 ON DELETE CASCADE,
	 FOREIGN KEY (ser_id) REFERENCES Service(ser_id)
	 ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS User_User_Ser
	(user1_id VARCHAR(100),
	 user2_id VARCHAR(100),
	 ser_id INTEGER,
	 accepted TINYINT(1),
	 completed TINYINT(1),
	 UNIQUE (user1_id, user2_id, ser_id),
	 FOREIGN KEY (user1_id) REFERENCES Users(user_id)
	 ON DELETE CASCADE,
	 FOREIGN KEY (user2_id) REFERENCES Users(user_id)
	 ON DELETE CASCADE,
	 FOREIGN KEY (ser_id) REFERENCES Service(ser_id)
	 ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS Rating
	(r_id INTEGER,
	 star INTEGER,
	 comment TEXT, 
	 PRIMARY KEY (r_id));

CREATE TABLE IF NOT EXISTS User_rat
	(r_id INTEGER,
	 user1_id VARCHAR(100),
	 user2_id VARCHAR(100),
	 UNIQUE (user1_id, user2_id, r_id),
	 FOREIGN KEY (user1_id) REFERENCES Users(user_id)
	 ON DELETE CASCADE,
	 FOREIGN KEY (user2_id) REFERENCES Users(user_id)
	 ON DELETE CASCADE,
	 FOREIGN KEY (r_id) REFERENCES Rating(r_id)
	 ON DELETE CASCADE);