

--Table Creation

CREATE TABLE Membership(
membershipid CHAR(5) PRIMARY KEY,
membershiptype VARCHAR(10),
startdate DATE,
enddate DATE);


CREATE TABLE CarOwner(
ownerid CHAR(4) PRIMARY KEY,
ownername VARCHAR(20),
contactno VARCHAR(20),
address VARCHAR(30),
membershipid CHAR(5),
FOREIGN KEY (membershipid) REFERENCES Membership(membershipid));


CREATE TABLE CAR(
regno VARCHAR(10) PRIMARY KEY,
cartype VARCHAR(10),
color VARCHAR(10),
contactno VARCHAR(20),
ownerid CHAR(4),
FOREIGN KEY (ownerid) REFERENCES CarOwner(ownerid));

CREATE TABLE ParkingLot(
lotid VARCHAR(10) PRIMARY KEY,
address VARCHAR(30),
capacity INT,
operationalhours INT);


CREATE TABLE Staff(
staffno CHAR(4) PRIMARY KEY,
staffname VARCHAR(25),
telno VARCHAR(25),
position VARCHAR(25),
shift VARCHAR(15),
salary INT
lotid VARCHAR(10),
FOREIGN KEY (lotid) REFERENCES ParkingLot(lotid));


CREATE TABLE ParkSpace(
spaceid VARCHAR(10) PRIMARY KEY,
baserate INT,
lotid VARCHAR(10),
FOREIGN KEY (lotid) REFERENCES ParkingLot(lotid));


CREATE TABLE Invoice(
invoiceno CHAR(4) PRIMARY KEY,
cartype VARCHAR(10),
ownername VARCHAR(20),
staffname VARCHAR(25),
hours INT,
spaceid VARCHAR(10),
ownerid CHAR(4),
staffno CHAR(4),
FOREIGN KEY(spaceid) REFERENCES ParkSpace(spaceid),
FOREIGN KEY(ownerid) REFERENCES CarOwner(ownerid),
FOREIGN KEY (staffno) REFERENCES Staff(staffno));


--DataInsertion
INSERT INTO Membership(membershipid,startdate,enddate,membershiptype)
VALUES
('SL10','2024-02-02','2029-02-02','Silver'),
('SL11', '2024-03-01', '2029-03-01', 'Silver'),
('SL12', '2024-04-01', '2029-04-01', 'Silver'),
('GL10', '2024-05-01', '2029-05-01', 'Gold'),
('GL11', '2024-06-01', '2029-06-01', 'Gold'),
('GL12', '2024-07-01', '2029-07-01', 'Gold'),
('PL10', '2024-08-01', '2029-08-01', 'Platinum'),
('PL11', '2024-09-01', '2029-09-01', 'Platinum');

INSERT INTO CarOwner(ownerid,ownername,contactno,address,membershipid)
VALUES
('COO1','Ahmad Hassan','03268520903','715-A Nishtar Colony Lahore','SL10'),
('COO2','Abdullah Rasheed','03099538923','9-D Architect Society Lahore','SL11'),
('COO3','Muaz Jamil','03289381233','100-A Bahria Town Lahore','SL12'),
('COO4', 'Sana Khan', '03124567890', '56-B Model Town Lahore', 'GL10'),
('COO5', 'Ali Raza', '03001234567', '34-C Johar Town Lahore', 'GL11'),
('COO6', 'Zainab Ahmed', '03214567890', '78-D Garden Town Lahore', 'GL12'),
('COO7', 'Usman Tariq', '03331234567', '23-E Wapda Town Lahore', 'PL10'),
('COO8', 'Fatima Noor', '03451234567', '12-F DHA Phase 5 Lahore', 'PL11'),
('CO10','Muaz Jamil','03022345789','100-A Bahria Town','SL12')
('COO9','Abdullah Rasheed','03184126631','9-D Architect Society Lahore','SL11');

INSERT INTO CAR(regno,cartype,ownerid,color,contactno)
VALUES
('ACK-183','Sedan','COO2','Silver','03099538923'),
('LEC-119', 'SUV', 'COO1', 'Black', '03268520903'),
('LED-123', 'Hatchback', 'COO3', 'White', '03289381233'),
('AZH-101', 'Coupe', 'COO4', 'Red', '03124567890'),
('LEA-23', 'Jeep', 'COO5', 'Blue', '03001234567'),
('LEB-131', 'Minivan', 'COO6', 'Green', '03214567890'),
('LEE-145', 'Pickup', 'COO7', 'Yellow', '03331234567'),
('SIN-167', 'Sedan', 'COO8', 'Gray', '03451234567'),
('LEC-189', 'SUV', 'COO9', 'Brown', '03184126631'),
('LEZ-202', 'Hatchback', 'CO10', 'Purple', '03022345789');

INSERT INTO ParkingLot(lotid,address,capacity,operationalhours)
VALUES
('I001','17 Main GT Road',1000,24),
('I002', 'Packages Mall, Lahore', 800, 12),
('I003', 'Emporium Mall, Lahore', 900, 24),
('I004', 'Centaurus Mall, Islamabad', 850, 12),
('I005', 'Lucky One Mall, Karachi', 950, 12),
('I006', 'Dolmen Mall, Clifton, Karachi', 700, 24),
('I007', 'Fortress Square Mall, Lahore', 600, 24),
('I008', 'Giga Mall, Islamabad', 750, 24),
('I009', 'Atrium Mall, Karachi', 500, 12),
('I010', 'Mall of Lahore, Lahore', 650, 12);

INSERT INTO Staff(staffno, staffname, telno, position, shift, salary, lotid)
VALUES
('SL01', 'Aslam', '03111212456', 'Supervisor', 'Morning', 25000, 'I001'),
('SL02', 'Bilal', '03224567890', 'Manager', 'Evening', 35000, 'I001'),
('SL03', 'Kamran', '03331234567', 'Supervisor', 'Morning', 25000, 'I002'),
('SL04', 'Saad', '03451234567', 'Manager', 'Evening', 35000, 'I002'),
('SL05', 'Hassan', '03561234567', 'Supervisor', 'Morning', 25000, 'I003'),
('SL06', 'Nabeel', '03671234567', 'Manager', 'Evening', 35000, 'I003'),
('SL07', 'Zahid', '03781234567', 'Supervisor', 'Morning', 25000, 'I004'),
('SL08', 'Usman', '03891234567', 'Manager', 'Evening', 35000, 'I004'),
('SL09', 'Rashid', '03901234567', 'Supervisor', 'Morning', 25000, 'I005'),
('SL10', 'Adil', '03101234567', 'Manager', 'Evening', 35000, 'I005'),
('SL11', 'Faisal', '03211234567', 'Supervisor', 'Morning', 25000, 'I006'),
('SL12', 'Noman', '03321234567', 'Manager', 'Evening', 35000, 'I006'),
('SL13', 'Waqar', '03431234567', 'Supervisor', 'Morning', 25000, 'I007'),
('SL14', 'Shahid', '03541234567', 'Manager', 'Evening', 35000, 'I007'),
('SL15', 'Javed', '03651234567', 'Supervisor', 'Morning', 25000, 'I008'),
('SL16', 'Irfan', '03761234567', 'Manager', 'Evening', 35000, 'I008'),
('SL17', 'Tariq', '03871234567', 'Supervisor', 'Morning', 25000, 'I009'),
('SL18', 'Salman', '03981234567', 'Manager', 'Evening', 35000, 'I009'),
('SL19', 'Nadeem', '03191234567', 'Supervisor', 'Morning', 25000, 'I010'),
('SL20', 'Muneeb', '03291234567', 'Manager', 'Evening', 35000, 'I010');

INSERT INTO ParkSpace(spaceid, baserate,lotid)
VALUES
('A001',50,'I001'),
('A002',50,'I001'),
('B001',50,'I002'),
('B002',50,'I002'),
('C001',50,'I003'),
('C002',50,'I003'),
('D001',50,'I004'),
('D002',50,'I004'),
('E001',50,'I005'),
('E002',50,'I005');


INSERT INTO Invoice(invoiceno, cartype, ownerid, ownername, staffno, staffname, spaceid, hours)
VALUES
('0001', 'SUV', 'COO2', 'Abdullah Rasheed', 'SL01', 'Aslam', 'A001', 4),
('0002', 'Sedan', 'COO1', 'Ahmad Hassan', 'SL02', 'Bilal', 'A002', 3),
('0003', 'Hatchback', 'COO3', 'Muaz Jamil', 'SL03', 'Kamran', 'B001',2),
('0004', 'Coupe', 'COO4', 'Sana Khan', 'SL04', 'Saad', 'B002',5),
('0005', 'Jeep', 'COO5', 'Ali Raza', 'SL05', 'Hassan', 'C001', 6),
('0006', 'Minivan', 'COO6', 'Zainab Ahmed', 'SL06', 'Nabeel', 'C002',4),
('0007', 'Pickup', 'COO7', 'Usman Tariq', 'SL07', 'Zahid', 'D001',3),
('0008', 'SUV', 'COO8', 'Fatima Noor', 'SL08', 'Usman', 'D002', 2),
('0009', 'Sedan', 'COO2', 'Abdullah Rasheed', 'SL09', 'Rashid', 'E001',5),
('0010', 'Hatchback', 'COO3', 'Muaz Jamil', 'SL10', 'Adil', 'E002',6);



--Trigger

CREATE OR REPLACE FUNCTION check_positive_values() 
RETURNS TRIGGER AS $$
BEGIN
    
    IF TG_TABLE_NAME = 'invoice' THEN
        IF NEW.hours <= 0 THEN
            RAISE EXCEPTION 'Hours must be positive';
        END IF;
    
    ELSIF TG_TABLE_NAME = 'parkspace' THEN
        IF NEW.baserate <= 1 THEN
            RAISE EXCEPTION 'Base rate must be greater than 1';
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER check_hours_positive
BEFORE INSERT OR UPDATE ON invoice
FOR EACH ROW
EXECUTE FUNCTION check_positive_values();


CREATE TRIGGER check_base_rate_positive
BEFORE INSERT OR UPDATE ON parkspace
FOR EACH ROW
EXECUTE FUNCTION check_positive_values();


