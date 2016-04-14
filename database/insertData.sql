-- users
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln1","testfn1","testpw1","test1@test.com","1123","530 S State St","123test1");
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln2","testfn2","testpw2","test2@test.com","2123","825 N University Ave","123test2");
INSERT INTO users (last_name,first_name,password,email,phone_number,street_address,driver_license)
VALUES ("testln3","testfn3","testpw3","test3@test.com","3123","105 S State St","123test3");

-- location
INSERT INTO location (city,state,zip_code)
VALUES ("Ann Arbor","MI","48109");

-- user_loc
INSERT INTO user_loc VALUES (1, 1);
INSERT INTO user_loc VALUES (1, 2);
INSERT INTO user_loc VALUES (1, 3);


-- draft
