CREATE TABLE IF NOT EXISTS Users
	(user_id INTEGER AUTO_INCREMENT, 
	 password VARCHAR(100) NOT NULL,
	 first_name VARCHAR(100) NOT NULL, 
	 last_name VARCHAR(100) NOT NULL,
	 email VARCHAR(100) NOT NULL,
	 phone_number VARCHAR(10) NOT NULL,
	 street_address VARCHAR(100),
	 driver_license VARCHAR(20),
	 UNIQUE (email),
	 PRIMARY KEY (user_id));

CREATE TABLE IF NOT EXISTS Location
	(loc_id INTEGER AUTO_INCREMENT,
	 city VARCHAR(100),
	 state VARCHAR(100), 
	 zip_code CHAR(10),
	 UNIQUE (city, state),
	 PRIMARY KEY (loc_id));

CREATE TABLE IF NOT EXISTS User_loc
	(loc_id INTEGER,
	 user_id INTEGER,
	 UNIQUE (loc_id, user_id),
	 FOREIGN KEY (user_id) REFERENCES Users(user_id)
	 ON DELETE CASCADE,
	 FOREIGN KEY (loc_id) REFERENCES Location(loc_id)
	 ON UPDATE CASCADE);

-- Service Type
CREATE TABLE IF NOT EXISTS Type
	(type_id INTEGER,
	 type VARCHAR(100),
	 PRIMARY KEY (type_id));

CREATE TABLE IF NOT EXISTS Service
	(ser_id INTEGER AUTO_INCREMENT,
     ser_name VARCHAR(100),
     ser_startingdate DATE,
	 ser_endingdate DATE,
	 ser_ava_startingtime TIME,
	 ser_ava_endingtime TIME,
	 hours_min FLOAT(6,1),
	 hours_max FLOAT(6,1),
	 ser_description TEXT,
	 type_id INTEGER,
	 poster_id INTEGER NOT NULL,
	 street_address VARCHAR(100),
	 loc_id INTEGER,
	 PRIMARY KEY (ser_id),
	 FOREIGN KEY (type_id) REFERENCES Type(type_id)
	 ON UPDATE CASCADE,
	 FOREIGN KEY (loc_id) REFERENCES Location(loc_id)
	 ON UPDATE CASCADE,
	 FOREIGN KEY (poster_id) REFERENCES Users(user_id)
	 ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS Signsheet
	(user_id INTEGER,
	 ser_id INTEGER,
	 approved TINYINT(1),
	 UNIQUE (user_id, ser_id),
	 FOREIGN KEY (user_id) REFERENCES Users(user_id)
	 ON DELETE CASCADE,
	 FOREIGN KEY (ser_id) REFERENCES Service(ser_id)
	 ON UPDATE CASCADE);
-- Note: need to use a view or trigger to make sure user_id != poster_id(in Service table) since CHECK constraint is not available in MariaDB

-- not in use temporarily
-- CREATE TABLE IF NOT EXISTS User_User_Ser
-- 	(user1_id INTEGER,
-- 	 user2_id INTEGER,
-- 	 ser_id INTEGER,
-- 	 accepted TINYINT(1),
-- 	 completed TINYINT(1),
-- 	 UNIQUE (user1_id, user2_id, ser_id),
-- 	 FOREIGN KEY (user1_id) REFERENCES Users(user_id)
-- 	 ON DELETE CASCADE,
-- 	 FOREIGN KEY (user2_id) REFERENCES Users(user_id)
-- 	 ON DELETE CASCADE,
-- 	 FOREIGN KEY (ser_id) REFERENCES Service(ser_id)
-- 	 ON DELETE CASCADE);
-- Note: need to use a view or trigger to make sure user1_id != user2_id since CHECK constraint is not available in MariaDB

-- not in use temporarily
-- CREATE TABLE IF NOT EXISTS Rating
-- 	(r_id INTEGER,
-- 	 star INTEGER,
-- 	 comment TEXT, 
-- 	 PRIMARY KEY (r_id));

-- not in use temporarily
-- CREATE TABLE IF NOT EXISTS User_rat
-- 	(r_id INTEGER,
-- 	 user1_id INTEGER,
-- 	 user2_id INTEGER,
-- 	 UNIQUE (user1_id, user2_id, r_id),
-- 	 FOREIGN KEY (user1_id) REFERENCES Users(user_id)
-- 	 ON DELETE CASCADE,
-- 	 FOREIGN KEY (user2_id) REFERENCES Users(user_id)
-- 	 ON DELETE CASCADE,
-- 	 FOREIGN KEY (r_id) REFERENCES Rating(r_id)
-- 	 ON DELETE CASCADE);