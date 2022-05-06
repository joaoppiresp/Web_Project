--enumerations
CREATE TABLE roles(
                    role_type TEXT NOT NULL,
                    role_id INTEGER NOT NULL,
                    PRIMARY KEY (role_id)
);

CREATE TABLE transpType(
                    transp_type TEXT NOT NULL,
                    transp_id INTEGER NOT NULL,
                    PRIMARY KEY (transp_id)
);
--end of enumerations
CREATE TABLE users(
                    user_id SERIAL UNIQUE NOT NULL,
                    username VARCHAR(40) NOT NULL,
                    email VARCHAR(60) NOT NULL,
                    passwrd VARCHAR(16) NOT NULL,
                    role_fk INTEGER NOT NULL,                                 --integer to identify type of user (FK)
                    profile_pic VARCHAR(150),
                    PRIMARY KEY (user_id)
);

CREATE TABLE friends(
                    friendship BOOLEAN,
                    sender_id INTEGER,
                    receiver_id INTEGER
);

CREATE TABLE destinations(
                    destination_id SERIAL UNIQUE NOT NULL,
                    destination_name TEXT NOT NULL,
                    descript VARCHAR(400) NOT NULL,
                    PRIMARY KEY (destination_id)

);

CREATE TABLE trip(
                    trip_id SERIAL UNIQUE NOT NULL,
                    transp_fk INTEGER,
                    destin_fk INTEGER,
                    PRIMARY KEY (trip_id)
);

CREATE TABLE travelPlans(
                    travelPlan_id SERIAL UNIQUE NOT NULL,
                    user_fk INTEGER NOT NULL,                                 --integer to identify user (FK)
                    plan_name VARCHAR(40) NOT NULL,
                    trip_fk INTEGER,                                   --integer to identify the destination (FK)
                    return_date FLOAT,
                    place_fk INTEGER,
                    friend_fk INTEGER,
                    visit_fk INTEGER,
                    PRIMARY KEY (travelPlan_id)
);

CREATE TABLE transportations(
                    transportation_id SERIAL UNIQUE NOT NULL,
                    transptype_fk INTEGER NOT NULL,                           --integer to type of transportation (FK)
                    origin GEOMETRY,
                    destination GEOMETRY,
                    distance GEOMETRY,                                          --distance between the two points
                    PRIMARY KEY (transportation_id)
);

CREATE TABLE places(
                    place_id SERIAL UNIQUE NOT NULL,
                    place_name TEXT NOT NULL,
                    place_geo GEOMETRY,
                    schedual VARCHAR(400),
                    payment BOOLEAN,
                    oficial_page_url VARCHAR(200),
                    PRIMARY KEY (place_id)
);

CREATE TABLE visit(
                    visit_id INTEGER,
                    place_fk INTEGER,
                    visit_date FLOAT,
                    PRIMARY KEY (visit_id)
);


CREATE TABLE budgets(
                    travelPlan_fk INTEGER,
                    descript VARCHAR(50),
                    payment_fk BOOLEAN,
                    xpns_date FLOAT,
                    xpns_value VARCHAR(7),
                    method CHAR,
                    total_fk INTEGER
);

CREATE TABLE budgetTotal(
                    total_id SERIAL UNIQUE NOT NULL,
                    total_value VARCHAR(10),
                    PRIMARY KEY (total_id)
);

--users constraints
ALTER TABLE users
add CONSTRAINT users_fk_roles
FOREIGN KEY (role_fk) REFERENCES roles(role_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

--travelPlans contraints
ALTER TABLE TravelPlans
add CONSTRAINT travelPlans_fk_user
FOREIGN KEY (user_fk) REFERENCES users(user_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE TravelPlans
add CONSTRAINT travelPlans_fk_trip
FOREIGN KEY (trip_fk) REFERENCES trip(trip_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE TravelPlans
add CONSTRAINT travelPlans_fk_places
FOREIGN KEY (place_fk) REFERENCES places(place_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE TravelPlans
add CONSTRAINT travelPlans_fk_visit
FOREIGN KEY (visit_fk) REFERENCES visit(visit_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

--transportaions contraints
ALTER TABLE transportations
add CONSTRAINT transportation_fk_transpType
FOREIGN KEY (transptype_fk) REFERENCES transpType(transp_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

--budget constraints
ALTER TABLE budgets
add CONSTRAINT budgets_fk_travelPlans
FOREIGN KEY (travelPlan_fk) REFERENCES travelPlans(travelPlan_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE budgets
add CONSTRAINT budgets_fk_budgetTotal
FOREIGN KEY (total_fk) REFERENCES budgetTotal(total_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

--visit constraints
ALTER TABLE visit
add CONSTRAINT visit_fk_places
FOREIGN KEY (place_fk) REFERENCES places(place_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

--trip constraints
ALTER TABLE trip
add CONSTRAINT trip_fk_transportations
FOREIGN KEY (transp_fk) REFERENCES transportations(transportation_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE trip
add CONSTRAINT trip_fk_destinations
FOREIGN KEY (destin_fk) REFERENCES destinations(destination_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;
