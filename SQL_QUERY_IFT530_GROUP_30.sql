/*
** Author: Sumasree Battula
** ASU ID: 1231053267
** Course: IFT-530
** Group Number : 30
** Team members:Mohan Karthik VijayaKumar(ASU ID: 1231053267),Sumasree Battula.
** SQL Server Version: Microsoft SQL Server 2012 (SP1)
** History: Assignment on Security
** Date created: 04/23/2024
*/

create database Grp30_DB
go
use Grp30_DB
go
CREATE SCHEMA Blood_bank

CREATE TABLE Blood_bank.donor(
    donor_id INT NOT NULL,
    donor_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(1) NOT NULL,
    cityName VARCHAR(50) NOT NULL,
    bloodTypeCode VARCHAR(3) NOT NULL,
    last_Donated VARCHAR(10) NOT NULL,
	CONSTRAINT donor_PK PRIMARY KEY(donor_id),
);

CREATE TABLE Blood_bank.donation(
    donation_id INT NOT NULL,
    donor_id INT NOT NULL,
	donation_date VARCHAR(8) NOT NULL,
	donation_amount INT NOT NULL,
	CONSTRAINT donation_PK PRIMARY KEY(donation_id),
);

CREATE TABLE Blood_bank.inventory(
	bloodTypeCode VARCHAR(3) NOT NULL,
	expiration_date VARCHAR(8)NOT NULL,
	quantity_available INT NOT NULL,
	CONSTRAINT inventory_PK PRIMARY KEY(bloodTypeCode),
);


CREATE TABLE Blood_bank.Patient(
	patient_id INT NOT NULL,
    patient_name VARCHAR(50)NOT NULL,
    patient_age INT NOT NULL,
    patient_gender VARCHAR(1)NOT NULL,
    hospital_id INT NOT NULL,
	phone_num VARCHAR(10) NOT NULL,
	email_id VARCHAR(50) NOT NULL,
    bloodTypeCode VARCHAR(3) NOT NULL,
	CONSTRAINT patient_PK PRIMARY KEY(patient_id),
	CONSTRAINT patient_UC1 UNIQUE(phone_num),
	CONSTRAINT patient_UC2 UNIQUE(email_id),
);

CREATE TABLE Blood_bank.Hospital(
	hospital_id INT NOT NULL,
    hospital_name VARCHAR(60) NOT NULL,
    city VARCHAR(40) NOT NULL,
	CONSTRAINT hospital_PK PRIMARY KEY(hospital_id),
);



CREATE TABLE Blood_bank.Request(
	req_id INT NOT NULL,
    req_date VARCHAR(8)NOT NULL,
    patient_id INT NOT NULL,
    donor_id INT NOT NULL,
	CONSTRAINT req_PK PRIMARY KEY(req_id),
);


ALTER TABLE Blood_bank.donor ADD CONSTRAINT donation_FK FOREIGN KEY (bloodTypeCode)
REFERENCES Blood_bank.inventory(bloodTypeCode)

ALTER TABLE Blood_bank.donation ADD CONSTRAINT donation_FK1 FOREIGN KEY (donor_id)
REFERENCES Blood_bank.donor(donor_id)

ALTER TABLE Blood_bank.Patient ADD CONSTRAINT patient_FK1 FOREIGN KEY (hospital_id)
REFERENCES Blood_bank.Hospital(hospital_id)


ALTER TABLE Blood_bank.Request ADD CONSTRAINT req_FK1 FOREIGN KEY (patient_id)
REFERENCES Blood_bank.Patient(patient_id)

ALTER TABLE Blood_bank.Request ADD CONSTRAINT req_FK2 FOREIGN KEY (donor_id)
REFERENCES Blood_bank.donor(donor_id)



INSERT INTO Blood_bank.inventory(bloodTypeCode, expiration_date, quantity_available)
VALUES
('A+','20240801', 45),
('B+','20240412', 66),
('O-','20240506', 35),
('AB+','20241228', 75),
('B-','20241104', 100),
('A-','20240301', 40),
('O+','20240707', 85),
('AB-','20240909', 25);

select * from Blood_bank.inventory;


INSERT INTO Blood_bank.donor(donor_id, donor_name, age, gender, cityName, bloodTypeCode, last_Donated)
VALUES
(101,'Suma', 25,'F','Tempe','A+','20230402'),
(102,'Mohan', 27,'M','Los Angeles','B-','20230724'),
(103,'Sanjana S', 22,'F','Mesa','O-','20230802'),
(104,'Jananiya', 32,'F','New York','A+','20231104'),
(105,'Karthik', 21,'M','Sandiego','B+','20230101'),
(106,'Aravind', 35,'M','Chicago','A+','20230608'),
(107,'Aradya', 38,'M','Portland','O+','20230808'),
(108,'Koushal', 29,'M','Denver','AB-','20230211'),
(109,'Virat', 23,'M','Michigan','B-','20230703'),
(110,'Rachana', 28,'F','Boston','AB+','20231111');

select * from Blood_bank.donor;


INSERT INTO Blood_bank.donation(donation_id, donor_id, donation_date, donation_amount)
VALUES
(1001, 101,'20230402', 750),
(1002, 102,'20230724', 250),
(1003, 103,'20230802', 550),
(1004, 104,'20231104', 650),
(1005, 105,'20230101', 150),
(1006, 106,'20230608', 350),
(1007, 107,'20230808', 650),
(1008, 108,'20230211', 850),
(1009, 109,'20230703', 950),
(1010, 110,'20231111', 250),
(1011, 101,'20220101', 550),
(1012, 102,'20220308', 750),
(1013, 103,'20220510', 150),
(1014, 104,'20220922', 650),
(1015, 105,'20220607', 250),
(1016, 106,'20220218', 150),
(1017, 107,'20221113', 450),
(1018, 108,'20220427', 750),
(1019, 109,'20220623', 850),
(1020, 110,'20221010', 950);

select * from Blood_bank.donation;



INSERT INTO Blood_bank.Hospital(hospital_id, hospital_name, city)
VALUES
(11,'Tempe General Medical Hospital','Tempe'),
(21,'Phoenix Medical Hospital','Phoenix'),
(31,'Mesa Central Hospital','Mesa'),
(41,'Ohio State Hospital','Ohio'),
(51,'Texas Elementary Hospital','Texas'),
(61,'Portland Emergency Services Hospital','Oregon'),
(71,'Boston State Medical Hospital','Boston'),
(81,'Michigan Health Center','Michigan'),
(91,'Oregon State Medical Center','Oregon'),
(101,'Pittsburgh State Hospital','Pitssburgh');

select * from Blood_bank.Hospital;

INSERT INTO Blood_bank.Patient(patient_id, patient_name, patient_age, patient_gender, hospital_id, phone_num, email_id, bloodTypeCode)
VALUES
(1,'Vrinda A', 22,'F', 11,'9666677775','Vrinda@gmail.com','B+'),
(2,'Rishith S', 45,'M', 21,'9845672323','Rishith@gmail.com','B-'),
(3,'Priyanka L', 66,'F', 31,'9876767633','Priyanka@gmail.com','A+'),
(4,'Sriraj M', 51,'M', 41,'7778883425','Sriraj@gmail.com','AB+'),
(5,'Lohitha', 25,'F', 51,'6308976213','Lohitha@gmail.com','O-'),
(6,'Vasanth A', 35,'F', 61,'8745672333','Vasanth@gmail.com','A+'),
(7,'Laxmi S', 45,'F', 71,'7893421156','Laxmi@gmail.com','O+'),
(8,'Akash L', 25,'M', 81,'9845672345','Akasha@gmail.com','AB-'),
(9,'Yudisha M', 23,'F', 91,'7856342222','Yudisha@gmail.com','B+'),
(10,'Rohith', 29,'M', 101,'6739056434','Rohith@gmail.com','B-');

select * from Blood_bank.Patient;


INSERT INTO Blood_bank.Request(req_id, req_date, patient_id, donor_id)
VALUES
(111,'20240202', 1, 101),
(222,'20240305', 2, 102),
(333,'20240228', 3, 103),
(444,'20240101', 4, 104),
(555,'20240501', 5, 105),
(666,'20240202', 6, 106),
(777,'20240305', 7, 107),
(888,'20240228', 8, 108),
(999,'20240412', 9, 109),
(1099,'20241012', 10, 110),
(1199,'20241123', 1, 101),
(1299,'20240424', 2, 102),
(1399,'20240126', 3, 103),
(1499,'20240207', 4, 104),
(1599,'20240202', 5, 105),
(1699,'20240809', 6, 106),
(1799,'20240707', 7, 107),
(1899,'20240907', 8, 108),
(1999,'20240606', 9, 109),
(2099,'20240819', 10, 110);

select * from Blood_bank.Request;

-----------------------------------------------------------------------------------------------------------------------

-- VIEW 1: Active Blood Requests (active_blood_requests)

CREATE VIEW active_blood_requests 
AS
SELECT 
  r.req_id,
  r.req_date,
  p.patient_name,
  p.bloodTypeCode,
  h.hospital_name,
  h.city
FROM Blood_bank.Request r
INNER JOIN Blood_bank.Patient p ON r.patient_id = p.patient_id
INNER JOIN Blood_bank.Hospital h ON p.hospital_id = h.hospital_id
WHERE r.req_date >= '20240228';  

Select * from  active_blood_requests;
------------------------------------------------------------------------------------------------------------------------
/*
** Author: Sumasree Battula
** ASU ID: 1231053267
** Course: IFT-530
** Group Number : 30
** Team members:Mohan Karthik VijayaKumar(ASU ID: 1231053267),Sumasree Battula.
** SQL Server Version: Microsoft SQL Server 2012 (SP1)
** History: Assignment on Security
** Date created: 04/23/2024
*/

-- VIEW 2 : Active Blood Donations from Specific Blood Types (active_donations_by_type)

CREATE VIEW active_donations_by_type 
AS
SELECT 
  d.donor_name,
  d.cityName,
  do.donation_date,
  do.donation_amount,
  d.bloodTypeCode
FROM Blood_bank.donation do
INNER JOIN Blood_bank.donor d ON do.donor_id = d.donor_id
WHERE do.donation_date >= '20230501'  
  AND (d.bloodTypeCode = 'A+' OR d.bloodTypeCode = 'O+');

Select * from  active_donations_by_type;

------------------------------------------------------------------------------------------------------------------------------

--VIEW 3: Low Inventory Blood Types (low_inventory)

CREATE VIEW low_inventory 
AS
SELECT 
  bloodTypeCode,
  expiration_date,
  quantity_available
FROM Blood_bank.inventory
WHERE quantity_available <= 40; 

 -- Filter for quantities below 40 units

Select * from  low_inventory;


------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Blood_bank.donor_audit (
  audit_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,  -- Use IDENTITY for auto-increment
  donor_id INT NOT NULL,
  donor_name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  gender VARCHAR(1) NOT NULL,
  cityName VARCHAR(50) NOT NULL,
  bloodTypeCode VARCHAR(3) NOT NULL,
  last_Donated VARCHAR(10) NOT NULL,
  operation VARCHAR(10) NOT NULL,  -- Insert, Update, Delete
  modified_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (donor_id) REFERENCES Blood_bank.donor(donor_id)
);

select * from Blood_bank.donor_audit;


---------------Insert Trigger

CREATE TRIGGER donor_insert_trigger
ON Blood_bank.donor
AFTER INSERT
AS
BEGIN
    INSERT INTO Blood_bank.donor_audit (donor_id, donor_name, age, gender, cityName, bloodTypeCode, last_Donated, operation)
    SELECT 
        inserted.donor_id, 
        inserted.donor_name, 
        inserted.age, 
        inserted.gender, 
        inserted.cityName, 
        inserted.bloodTypeCode, 
        inserted.last_Donated, 
        'Insert'
    FROM inserted;
END;


--------------------Update Trigger

CREATE TRIGGER trg_donor_update
ON Blood_bank.donor
AFTER UPDATE
AS
BEGIN
    INSERT INTO Blood_bank.donor_audit
        (donor_id, donor_name, age, gender, cityName, bloodTypeCode, last_Donated, operation, modified_at)
    SELECT
        donor_id, donor_name, age, gender, cityName, bloodTypeCode, last_Donated, 'Update', GETDATE()
    FROM inserted;
END;



--------------------Delete Trigger

CREATE TRIGGER donor_delete_trigger
ON Blood_bank.donor
AFTER DELETE
AS
BEGIN
    -- Insert the deleted record into the donor_audit table
    INSERT INTO Blood_bank.donor_audit (donor_id, donor_name, age, gender, cityName, bloodTypeCode, last_Donated, operation)
    SELECT 
        d.donor_id, 
        d.donor_name, 
        d.age, 
        d.gender, 
        d.cityName, 
        d.bloodTypeCode, 
        d.last_Donated, 
        'Delete'
    FROM deleted d;
END;


---Testcases

INSERT INTO Blood_bank.donor values(130, 'Pallavi', 21, 'F', 'New York', 'A+', '20230611');
select * from Blood_bank.donor;
select * from Blood_bank.donor_audit;


Update Blood_bank.donor
Set donor_name = 'Jhansi'
where donor_id = 130;

Update Blood_bank.donor
Set last_donated = '20230612'
where donor_id = 130;


select * from Blood_bank.donor;
select * from Blood_bank.donor_audit;

DELETE FROM Blood_bank.donor_audit
WHERE donor_id = 130;

select * from Blood_bank.donor_audit;

select * from Blood_bank.donor;

select * from Blood_bank.donation;
-------------------------------------------------------------------------------------------------

---------Stored Procedure: CalculateBloodRequirement

CREATE PROCEDURE spAddDonation
    @donation_id INT,
    @donor_id INT,
    @donation_date VARCHAR(8),
    @donation_amount INT
AS
BEGIN
    -- Insert a new record into the donations table
    INSERT INTO Blood_bank.donation (donation_id, donor_id, donation_date, donation_amount)
    VALUES (@donation_id, @donor_id, @donation_date, @donation_amount);

    -- Update last donated date in the donor table
    UPDATE Blood_bank.donor
    SET last_Donated = @donation_date
    WHERE donor_id = @donor_id;
END;
GO
-----DROP stored procedure 
DROP PROCEDURE spAddDonation;
GO


---------EXEC spAddDonation;


---------User defined function 

IF OBJECT_ID('dbo.fnTotalDonations', 'FN') IS NOT NULL
  DROP FUNCTION dbo.fnTotalDonations;
GO

CREATE FUNCTION dbo.fnTotalDonations (@donor_id INT)
RETURNS INT
AS
BEGIN
  DECLARE @totalAmount INT;
  SELECT @totalAmount = ISNULL(SUM(donation_amount), 0)
  FROM Blood_bank.donation  -- Assuming Blood_bank is your schema
  WHERE donor_id = @donor_id;

  RETURN @totalAmount;
END;
GO

-----Drop user stored procedure
DROP FUNCTION fnTotalDonations;
GO


----Execution for showing drop of user defined function dropped.


BEGIN TRY
    EXECUTE('SELECT [dbo].[fnTotalDonations]()');
END TRY
BEGIN CATCH
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH




------ Testcases statements using select statements

---- Testcase for Stored procedure
EXEC spAddDonation 1021, 111, '20240423', 100;



---- Testcase for User Defined procedure
SELECT dbo.fnTotalDonations(101) AS TotalDonations;



-----------------------------------------------------------------------------------------------------------------

---------Cursor creation 
--creating cursor:
DECLARE blood_cursor CURSOR FOR
  SELECT donor_id, donor_name, bloodTypeCode
  FROM Blood_bank.donor
  WHERE bloodTypeCode = 'B+';

OPEN blood_cursor;


---Processing loop:

DECLARE @donor_id INT;
DECLARE @donor_name VARCHAR(50);
DECLARE @blood_type VARCHAR(3);

FETCH NEXT FROM blood_cursor INTO @donor_id, @donor_name, @blood_type;

WHILE @@FETCH_STATUS = 0
BEGIN
  -- Process each donor record here (e.g., print details)
  PRINT 'Donor ID: ' + CAST(@donor_id AS VARCHAR(10)) + ', Name: ' + @donor_name + ', Blood Type: ' + @blood_type;

  FETCH NEXT FROM blood_cursor INTO @donor_id, @donor_name, @blood_type;
END;

CLOSE blood_cursor;
DEALLOCATE blood_cursor;






