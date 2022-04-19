--enumerations
CREATE TABLE roles{
                    role_type TEXT NOT NULL,
                    role_id INTEGER NOT NULL,
                    PRIMARY KEY (role_id)
};

CREATE TABLE paymentMethods{
                    method_type TEXT NOT NULL,
                    method_id INTEGER NOT NULL,
                    PRIMARY KEY (method_id)
};

CREATE TABLE transpType{
                    transp_type TEXT NOT NULL,
                    transp_id INTEGER NOT NULL,
                    PRIMARY KEY (transp_id)
};
--end of enumerations
CREATE TABLE users{
                    user_id SERIAL UNIQUE NOT NULL,
                    username VARCHAR(40) NOT NULL,
                    email VARCHAR(60) NOT NULL,
                    passwrd VARCHAR(16) NOT NULL,
                    role_fk INTEGER NOT NULL,                                 --integer to identify type of user (FK)
                    profile_pic VARCHAR(150),
                    PRIMARY KEY (user_id)
};

CREATE TABLE destinations{
                    destination_id SERIAL UNIQUE NOT NULL,
                    destination_name TEXT NOT NULL,
                    descript VARCHAR(400) NOT NULL,
                    PRIMARY KEY (destination_id)

};

CREATE TABLE travelPlans{
                    travelPlan_id SERIAL UNIQUE NOT NULL,
                    user_fk INTEGER NOT NULL,                                 --integer to identify user (FK)
                    plan_name VARCHAR(40) NOT NULL,
                    destination_fk INTEGER,                                   --integer to identify the destination (FK)
                    return_date FLOAT,
                    flight_number_fk VARCHAR(7),
                    transportation_fk INTEGER,
                    place_fk INTEGER,
                    PRIMARY KEY (travelPlan_id)
};

CREATE TABLE flights{
                    flight_number VARCHAR(7) NOT NULL,
                    origin TEXT NOT NULL,
                    destination TEXT NOT NULL,
                    departure_date FLOAT NOT NULL,
                    flight_duration FLOAT NOT NULL,
                    PRIMARY KEY (flight_number)
};

CREATE TABLE transportations{
                    transportation_id SERIAL UNIQUE NOT NULL,
                    transptype_fk INTEGER NOT NULL,                           --integer to type of transportation (FK)
                    origin GEOGRAPHY,
                    destination GEOGRAPHY,
                    distance GEOGRAPHY,                                          --distance between the two points
                    PRIMARY KEY (transportation_id)
};

CREATE TABLE places{
                    place_id SERIAL UNIQUE NOT NULL,
                    place_name TEXT NOT NULL,
                    place_address GEOGRAPHY,
                    arriving_date FLOAT,
                    schedual VARCHAR(400),
                    payment BOOLEAN,
                    oficial_page_url VARCHAR(200),
                    PRIMARY KEY (place_id)
};

CREATE TABLE budgets{
                    travelPlan_fk INTEGER,
                    descript VARCHAR(50),
                    payment_fk BOOLEAN,
                    xpns_date FLOAT,
                    xpns_value VARCHAR(7),
                    method_fk INTEGER,
                    total_fk INTEGER,
};

CREATE TABLE budgetTotal{
                    total_id SERIAL UNIQUE NOT NULL,
                    total_value VARCHAR(10),
                    PRIMARY KEY (total_id)
};

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
add CONSTRAINT travelPlans_fk_destinations
FOREIGN KEY (destination_fk) REFERENCES destinations(destination_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE TravelPlans
add CONSTRAINT travelPlans_fk_flights
FOREIGN KEY (flight_number_fk) REFERENCES flights(flight_number)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE TravelPlans
add CONSTRAINT travelPlans_fk_transportations
FOREIGN KEY (transportation_fk) REFERENCES transportations(transportation_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE TravelPlans
add CONSTRAINT travelPlans_fk_places
FOREIGN KEY (place_fk) REFERENCES places(place_id)
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
add CONSTRAINT budgets_fk_places
FOREIGN KEY (payment_fk) REFERENCES places(payment)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE budgets
add CONSTRAINT budgets_fk_paymentMethods
FOREIGN KEY (method_fk) REFERENCES paymentMethods(method_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE budgets
add CONSTRAINT budgets_fk_budgetTotal
FOREIGN KEY (total_fk) REFERENCES budgetTotal(total_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;