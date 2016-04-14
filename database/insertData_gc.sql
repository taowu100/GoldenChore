-- users
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln1","testfn1","testpw1","test1@test.com","1123","530 S State St","123test1");
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln2","testfn2","testpw2","test2@test.com","2123","825 N University Ave","123test2");
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln3","testfn3","testpw3","test3@test.com","3123","105 S State St","123test3");

INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln4","testfn4","testpw4","test4@test.com","4123","105 S State St","123test4");
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln5","testfn5","testpw5","test5@test.com","5123","105 S State St","123test5");
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln6","testfn6","testpw6","test6@test.com","6123","105 S State St","123test6");
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln7","testfn7","testpw7","test7@test.com","7123","105 S State St","123test7");
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln8","testfn8","testpw8","test8@test.com","8123","105 S State St","123test8");

-- location
INSERT INTO location (city,state,zip_code)
VALUES ("Ann Arbor","MI","48109");

-- user_loc
INSERT INTO user_loc VALUES (1, 1);
INSERT INTO user_loc VALUES (1, 2);
INSERT INTO user_loc VALUES (1, 3);

-- type
INSERT INTO type VALUES (1, "Handyman");
INSERT INTO type VALUES (2, "IT Problem");
INSERT INTO type VALUES (3, "Grocery & Delivery");
INSERT INTO type VALUES (4, "Riding");
INSERT INTO type VALUES (5, "Pet Caring");
INSERT INTO type VALUES (6, "General Chore");

-- service
INSERT INTO service (ser_name,ser_startingdate,ser_endingdate,ser_ava_startingtime,ser_ava_endingtime,hours_min,hours_max,ser_description,type_id,poster_id,street_address,loc_id)
VALUES ("Whole Foods Grocery Shopping","2016-04-14","2016-04-14","15:00:00","21:00:00",1,2,"take me to Whole Foods(user1)",4,1,"105 S State St",1);
INSERT INTO service (ser_name,ser_startingdate,ser_endingdate,ser_ava_startingtime,ser_ava_endingtime,hours_min,hours_max,ser_description,type_id,poster_id,street_address,loc_id)
VALUES ("Walk Poodle for 1 hr","2016-04-14","2016-04-15","09:00:00","17:00:00",1,1,"pet pet pet",5,1,"105 S State St",1);
INSERT INTO service (ser_name,ser_startingdate,ser_endingdate,ser_ava_startingtime,ser_ava_endingtime,hours_min,hours_max,ser_description,type_id,poster_id,street_address,loc_id)
VALUES ("Water Garden","2016-04-14","2016-04-14","09:00:00","16:00:00",1,2,"water",6,1,"105 S State St",1);

-- signsheet
INSERT INTO signsheet VALUES (4, 1, 0);
INSERT INTO signsheet VALUES (5, 1, 0);
INSERT INTO signsheet VALUES (6, 1, 0);
INSERT INTO signsheet VALUES (7, 2, 0);
INSERT INTO signsheet VALUES (8, 2, 0);
INSERT INTO signsheet VALUES (6, 3, 1);
INSERT INTO signsheet VALUES (8, 3, 0);