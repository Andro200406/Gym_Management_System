CREATE DATABASE Gym_Management_System;
USE Gym_Management_System;

-- 1.Members

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(200),
    JoinDate DATE,
    MembershipStatus VARCHAR(20)
);

INSERT INTO Members VALUES
(1,'Andro','Male',25,'9876500001','andro1@gmail.com','Nagercoil','2025-01-10','Active'),
(2,'Ashik','Male',25,'9876500002','ashik@gmail.com','Nagercoil','2025-01-12','Active'),
(3,'Christa','Female',25,'9876500003','chrizz3@gmail.com','Nagercoil','2025-01-15','Active'),
(4,'Rohini','Female',25,'9876500004','rohini@gmail.com','Nagercoil','2025-01-18','Expired'),
(5,'Roshik','Male',30,'9876500005','roshik5@gmail.com','Nagercoil','2025-01-20','Active'),
(6,'Vikash','Male',27,'9876500006','okkali6@gmail.com','Theni','2025-01-22','Active'),
(7,'Dinesh','Male',29,'9876500007','dinesh7@gmail.com','Tirunelveli','2025-01-25','Active'),
(8,'Kamlesh','Male',31,'9876500008','varsha8@gmail.com','Tirunelveli','2025-01-28','Inactive'),
(9,'Felix','Male',33,'9876500009','mama9@gmail.com','Tirunelveli','2025-02-01','Active'),
(10,'Hari','Male',24,'9876500010','hari9@gmail.com','Tirunelveli','2025-02-03','Active'),
(11,'Anic Durai','Male',26,'9876500011','anic11@gmail.com','Tenkasi Gramam','2025-02-05','Active'),
(12,'Bharath Kumar','Male',29,'9876500012','kumar12@gmail.com','Thoothukudi','2025-02-08','Expired'),
(13,'Blesson','Male',27,'9876500013','bellboy13@gmail.com','Tirunelveli','2025-02-10','Active'),
(14,'Mydeen','Male',30,'9876500014','issuku14@gmail.com','Tirunelveli','2025-02-12','Active'),
(15,'Davood','Male',23,'9876500015','ollukhan5@gmail.com','Tirunelveli','2025-02-15','Active'),
(16,'Samrat','Male',25,'9876500016','saipallavi6@gmail.com','Tirunelveli','2025-02-18','Inactive'),
(17,'Kittu','Male',28,'9876500017','2yrponnu@gmail.com','Tirunelveli','2025-02-20','Active'),
(18,'Rashid','Male',32,'9876500018','sudalaithambi8@gmail.com','Tirunelveli','2025-02-22','Active'),
(19,'Beer','Male',27,'9876500019','baasimani19@gmail.com','Tirunelveli','2025-02-25','Expired'),
(20,'Sudalai','Male',24,'9876500020','wedssam@gmail.com','Tirunelveli','2025-02-28','Active');

select * from Members;

-- 2. MembershipPlans

CREATE TABLE MembershipPlans (
    PlanID INT PRIMARY KEY,
    PlanName VARCHAR(50),
    DurationMonths INT,
    Amount DECIMAL(10,2),
    Benefits VARCHAR(200)
);
INSERT INTO MembershipPlans VALUES
(1,'Basic Monthly',1,1000.00,'Gym Access'),
(2,'Standard Monthly',1,1500.00,'Gym Access, Cardio Area'),
(3,'Premium Monthly',1,2500.00,'Gym Access, Cardio, Personal Trainer'),
(4,'Student Monthly',1,800.00,'Gym Access for Students'),
(5,'Women Fitness Monthly',1,1200.00,'Gym Access, Women Fitness Classes'),
(6,'Basic Quarterly',3,2700.00,'Gym Access'),
(7,'Standard Quarterly',3,4000.00,'Gym Access, Cardio Area'),
(8,'Premium Quarterly',3,7000.00,'Gym Access, Personal Trainer, Diet Plan'),
(9,'Student Quarterly',3,2200.00,'Gym Access for Students'),
(10,'Women Quarterly',3,3500.00,'Gym Access, Zumba, Yoga'),
(11,'Basic Half-Yearly',6,5000.00,'Gym Access'),
(12,'Standard Half-Yearly',6,7500.00,'Gym Access, Cardio Area'),
(13,'Premium Half-Yearly',6,13000.00,'Gym Access, Personal Trainer, Diet Plan'),
(14,'Weight Loss Program',6,15000.00,'Diet Plan, Cardio, Trainer Support'),
(15,'Muscle Gain Program',6,16000.00,'Strength Training, Diet Plan'),
(16,'Basic Annual',12,9000.00,'Unlimited Gym Access'),
(17,'Standard Annual',12,13000.00,'Gym Access, Cardio, Locker'),
(18,'Premium Annual',12,22000.00,'Gym Access, Trainer, Diet Plan'),
(19,'Couple Annual',12,18000.00,'Access for Two Members'),
(20,'Family Annual',12,30000.00,'Access for Four Family Members'),
(21,'Senior Citizen Plan',12,7000.00,'Light Fitness Programs'),
(22,'Corporate Plan',12,25000.00,'Corporate Employee Membership'),
(23,'Athlete Performance Plan',12,35000.00,'Advanced Strength & Conditioning'),
(24,'Yoga & Wellness Plan',12,10000.00,'Yoga Classes, Meditation Sessions'),
(25,'VIP Elite Membership',12,50000.00,'All Facilities, Personal Trainer, Nutritionist, Steam Bath');

select * from MembershipPlans;

-- 3. Subscriptions

CREATE TABLE Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    MemberID INT,
    PlanID INT,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY(PlanID) REFERENCES MembershipPlans(PlanID)
);

INSERT INTO Subscriptions VALUES
(1,1,16,'2025-01-10','2026-01-09','Active'),
(2,2,17,'2025-01-12','2026-01-11','Active'),
(3,3,18,'2025-01-15','2026-01-14','Active'),
(4,4,1,'2025-01-18','2025-02-17','Expired'),
(5,5,6,'2025-01-20','2025-04-19','Expired'),
(6,6,11,'2025-01-22','2025-07-21','Expired'),
(7,7,16,'2025-01-25','2026-01-24','Active'),
(8,8,2,'2025-01-28','2025-02-27','Inactive'),
(9,9,17,'2025-02-01','2026-01-31','Active'),
(10,10,18,'2025-02-03','2026-02-02','Active'),
(11,11,3,'2025-02-05','2025-03-04','Expired'),
(12,12,7,'2025-02-08','2025-05-07','Expired'),
(13,13,12,'2025-02-10','2025-08-09','Active'),
(14,14,16,'2025-02-12','2026-02-11','Active'),
(15,15,21,'2025-02-15','2026-02-14','Active'),
(16,16,4,'2025-02-18','2025-03-17','Inactive'),
(17,17,8,'2025-02-20','2025-05-19','Active'),
(18,18,13,'2025-02-22','2025-08-21','Active'),
(19,19,1,'2025-02-25','2025-03-24','Expired'),
(20,20,22,'2025-02-28','2026-02-27','Active'),

select * from Subscriptions;

-- 4. Trainers

CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY,
    TrainerName VARCHAR(100),
    Specialization VARCHAR(100),
    ExperienceYears INT,
    Phone VARCHAR(15),
    Salary DECIMAL(10,2)
);

INSERT INTO Trainers VALUES
(1,'Vishal','Weight Training',5,'9877100001',35000.00),
(2,'Pandi Shakthi','Bodybuilding',7,'9877100002',42000.00),
(3,'sivaguru','CrossFit',4,'9877100003',32000.00),
(4,'Raja Baron','Weight Loss',6,'9877100004',38000.00),
(5,'Kavinath','Strength & Conditioning',8,'9877100005',50000.00),
(6,'Dinesh Kumar','Personal Training',5,'9877100006',36000.00),
(7,'Mohan Raj','Cardio Fitness',3,'9877100007',28000.00),
(8,'Dominic','Functional Training',6,'9877100008',39000.00),
(9,'Hari','Athletic Performance',7,'9877100009',45000.00),
(10,'Ajith Kumar','Powerlifting',9,'9877100010',55000.00),
(11,'Bharath Kumar','Yoga',4,'9877100011',30000.00),
(12,'Ganesh Keshavan','Zumba',3,'9877100012',27000.00),
(13,'Manikandan','HIIT',5,'9877100013',34000.00),
(14,'Naveen Kumar','Weight Loss',6,'9877100014',37000.00),
(15,'Asveth','Muscle Gain',8,'9877100015',48000.00),
(16,'Ashwin','Sports Fitness',5,'9877100016',35000.00),
(17,'Ram Dharshan','CrossFit',7,'9877100017',43000.00),
(18,'Nickson','Bodybuilding',10,'9877100018',60000.00),
(19,'Santhosh Prem','Functional Training',4,'9877100019',31000.00),
(20,'Praveen','Strength Training',6,'9877100020',40000.00),
(21,'Gomathi','Women Fitness',5,'9877100021',36000.00),
(22,'Divya Bharathi','Yoga & Meditation',4,'9877100022',32000.00),
(23,'Keerthana','Zumba',3,'9877100023',28000.00),
(24,'Harini','Aerobics',5,'9877100024',34000.00),
(25,'Kavyasuha','Women Weight Loss',6,'9877100025',39000.00);

select * from Trainers;

-- 5. MemberTrainer

CREATE TABLE MemberTrainer (
    AssignmentID INT PRIMARY KEY,
    MemberID INT,
    TrainerID INT,
    AssignedDate DATE,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY(TrainerID) REFERENCES Trainers(TrainerID)
);

INSERT INTO MemberTrainer VALUES
(1,1,1,'2025-01-10'),
(2,2,2,'2025-01-12'),
(3,3,21,'2025-01-15'),
(4,4,22,'2025-01-18'),
(5,5,5,'2025-01-20'),
(6,6,6,'2025-01-22'),
(7,7,7,'2025-01-25'),
(8,8,8,'2025-01-28'),
(9,9,9,'2025-02-01'),
(10,10,10,'2025-02-03'),
(11,11,11,'2025-02-05'),
(12,12,12,'2025-02-08'),
(13,13,13,'2025-02-10'),
(14,14,14,'2025-02-12'),
(15,15,15,'2025-02-15'),
(16,16,16,'2025-02-18'),
(17,17,17,'2025-02-20'),
(18,18,18,'2025-02-22'),
(19,19,19,'2025-02-25'),
(20,20,20,'2025-02-28'),

select * from MemberTrainer;

-- 6. Attendance

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    MemberID INT,
    AttendanceDate DATE,
    CheckIn TIME,
    CheckOut TIME,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Attendance VALUES
(1,1,'2025-06-01','06:00:00','07:30:00'),
(2,2,'2025-06-01','06:15:00','07:45:00'),
(3,3,'2025-06-01','07:00:00','08:15:00'),
(4,4,'2025-06-01','17:00:00','18:30:00'),
(5,5,'2025-06-01','18:00:00','19:30:00'),
(6,6,'2025-06-02','06:00:00','07:20:00'),
(7,7,'2025-06-02','06:30:00','08:00:00'),
(8,8,'2025-06-02','17:15:00','18:45:00'),
(9,9,'2025-06-02','18:00:00','19:15:00'),
(10,10,'2025-06-02','05:45:00','07:00:00'),
(11,11,'2025-06-03','06:10:00','07:40:00'),
(12,12,'2025-06-03','07:00:00','08:20:00'),
(13,13,'2025-06-03','17:30:00','18:50:00'),
(14,14,'2025-06-03','18:10:00','19:40:00'),
(15,15,'2025-06-03','06:20:00','07:50:00'),
(16,16,'2025-06-04','06:00:00','07:10:00'),
(17,17,'2025-06-04','07:15:00','08:30:00'),
(18,18,'2025-06-04','17:00:00','18:20:00'),
(19,19,'2025-06-04','18:00:00','19:25:00'),
(20,20,'2025-06-04','06:40:00','08:00:00'),

select * from Attendance;

-- 7. Payments

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Payments VALUES
(1,1,9000.00,'2025-01-10','UPI'),
(2,2,13000.00,'2025-01-12','Credit Card'),
(3,3,22000.00,'2025-01-15','Net Banking'),
(4,4,1000.00,'2025-01-18','Cash'),
(5,5,2700.00,'2025-01-20','UPI'),
(6,6,5000.00,'2025-01-22','Debit Card'),
(7,7,9000.00,'2025-01-25','UPI'),
(8,8,1500.00,'2025-01-28','Cash'),
(9,9,13000.00,'2025-02-01','Credit Card'),
(10,10,22000.00,'2025-02-03','Net Banking'),
(11,11,2500.00,'2025-02-05','UPI'),
(12,12,4000.00,'2025-02-08','Debit Card'),
(13,13,7500.00,'2025-02-10','UPI'),
(14,14,9000.00,'2025-02-12','Credit Card'),
(15,15,7000.00,'2025-02-15','Net Banking'),
(16,16,800.00,'2025-02-18','Cash'),
(17,17,7000.00,'2025-02-20','UPI'),
(18,18,13000.00,'2025-02-22','Debit Card'),
(19,19,1000.00,'2025-02-25','Cash'),
(20,20,25000.00,'2025-02-28','Net Banking'),

select * from Payments;

-- 8. Equipment

CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(100),
    Quantity INT,
    PurchaseDate DATE,
    ConditionStatus VARCHAR(20)
);

INSERT INTO Equipment VALUES
(1,'Treadmill',10,'2024-01-15','Good'),
(2,'Exercise Bike',8,'2024-01-15','Good'),
(3,'Elliptical Trainer',6,'2024-02-10','Good'),
(4,'Rowing Machine',4,'2024-02-10','Good'),
(5,'Stair Climber',3,'2024-03-05','Excellent'),
(6,'Smith Machine',2,'2024-03-20','Excellent'),
(7,'Leg Press Machine',3,'2024-03-20','Good'),
(8,'Chest Press Machine',4,'2024-04-12','Good'),
(9,'Lat Pulldown Machine',3,'2024-04-12','Good'),
(10,'Cable Crossover Machine',2,'2024-04-12','Excellent'),
(11,'Bench Press Station',5,'2024-05-01','Good'),
(12,'Incline Bench',5,'2024-05-01','Good'),
(13,'Decline Bench',3,'2024-05-01','Good'),
(14,'Squat Rack',4,'2024-05-15','Excellent'),
(15,'Power Rack',2,'2024-05-15','Excellent'),
(16,'Olympic Barbell',20,'2024-06-01','Good'),
(17,'EZ Curl Bar',10,'2024-06-01','Good'),
(18,'Dumbbell Set 1-10kg',20,'2024-06-01','Good'),
(19,'Dumbbell Set 12-30kg',15,'2024-06-01','Good'),
(20,'Weight Plates Set',50,'2024-06-01','Good'),
(21,'Kettlebell Set',25,'2024-06-20','Good'),
(22,'Medicine Ball',15,'2024-06-20','Good'),
(23,'Battle Rope',5,'2024-06-20','Good'),
(24,'Resistance Bands',30,'2024-06-20','Excellent'),
(25,'Jump Rope',40,'2024-06-20','Good'),
(26,'Yoga Mat',60,'2024-07-10','Excellent'),
(27,'Foam Roller',20,'2024-07-10','Good'),
(28,'Punching Bag',6,'2024-07-10','Good'),
(29,'Pull-Up Station',4,'2024-08-05','Excellent'),
(30,'Ab Crunch Machine',4,'2024-08-05','Needs Service');

select * from Equipment;

-- 9. WorkoutPlans

CREATE TABLE WorkoutPlans (
    WorkoutID INT PRIMARY KEY,
    WorkoutName VARCHAR(100),
    Goal VARCHAR(100),
    DurationWeeks INT
);

INSERT INTO WorkoutPlans VALUES
(1,'Beginner Full Body','General Fitness',4),
(2,'Weight Loss Starter','Weight Loss',6),
(3,'Muscle Gain Beginner','Muscle Gain',8),
(4,'Strength Builder','Strength Training',10),
(5,'Cardio Blast','Cardio Fitness',4),
(6,'Advanced Weight Loss','Weight Loss',12),
(7,'Lean Muscle Program','Muscle Gain',12),
(8,'Powerlifting Program','Strength Training',16),
(9,'CrossFit Beginner','CrossFit',6),
(10,'CrossFit Advanced','CrossFit',12),
(11,'Bodybuilding Phase 1','Bodybuilding',8),
(12,'Bodybuilding Phase 2','Bodybuilding',12),
(13,'HIIT Fat Burn','Fat Loss',6),
(14,'Athletic Conditioning','Sports Fitness',10),
(15,'Functional Fitness','Functional Training',8),
(16,'Senior Fitness Program','Senior Health',8),
(17,'Women Fat Loss Plan','Women Fitness',8),
(18,'Women Strength Program','Women Fitness',10),
(19,'Yoga Wellness Plan','Flexibility',12),
(20,'Core Strength Program','Core Strength',6),
(21,'Abs Transformation','Six Pack Abs',8),
(22,'Summer Shred Challenge','Fat Loss',12),
(23,'Mass Gainer Program','Muscle Gain',16),
(24,'Marathon Preparation','Endurance',12),
(25,'Cycling Fitness Program','Cardio Fitness',8),
(26,'Beginner Home Workout','General Fitness',4),
(27,'Advanced Home Workout','General Fitness',8),
(28,'Competition Preparation','Bodybuilding',16),
(29,'Sports Performance Elite','Athletic Performance',14),
(30,'Transformation Challenge','Weight Loss & Muscle Gain',12);

select * from WorkoutPlans;

-- 10. MemberWorkout

CREATE TABLE MemberWorkout (
    MemberWorkoutID INT PRIMARY KEY,
    MemberID INT,
    WorkoutID INT,
    AssignedDate DATE,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY(WorkoutID) REFERENCES WorkoutPlans(WorkoutID)
);

INSERT INTO MemberWorkout VALUES
(1,1,3,'2025-01-10'),
(2,2,4,'2025-01-12'),
(3,3,17,'2025-01-15'),
(4,4,19,'2025-01-18'),
(5,5,7,'2025-01-20'),
(6,6,2,'2025-01-22'),
(7,7,8,'2025-01-25'),
(8,8,5,'2025-01-28'),
(9,9,14,'2025-02-01'),
(10,10,1,'2025-02-03'),
(11,11,6,'2025-02-05'),
(12,12,13,'2025-02-08'),
(13,13,23,'2025-02-10'),
(14,14,15,'2025-02-12'),
(15,15,4,'2025-02-15'),
(16,16,9,'2025-02-18'),
(17,17,10,'2025-02-20'),
(18,18,11,'2025-02-22'),
(19,19,12,'2025-02-25'),
(20,20,21,'2025-02-28'),

select * from MemberWorkout;

-- 11. DietPlans

CREATE TABLE DietPlans (
    DietID INT PRIMARY KEY,
    DietName VARCHAR(100),
    Goal VARCHAR(100),
    Calories INT
);

INSERT INTO DietPlans VALUES
(1,'Weight Loss Basic Diet','Weight Loss',1500),
(2,'Weight Loss Advanced Diet','Weight Loss',1800),
(3,'Muscle Gain Beginner Diet','Muscle Gain',2500),
(4,'Muscle Gain Advanced Diet','Muscle Gain',3200),
(5,'Fat Burn Diet','Fat Loss',1600),
(6,'Lean Muscle Diet','Muscle Gain',2800),
(7,'Bodybuilding Diet','Bodybuilding',3500),
(8,'Athlete Performance Diet','Sports Performance',3000),
(9,'CrossFit Nutrition Plan','CrossFit',2700),
(10,'Strength Builder Diet','Strength Training',2900),
(11,'Vegetarian Weight Loss Diet','Weight Loss',1400),
(12,'Vegetarian Muscle Gain Diet','Muscle Gain',2600),
(13,'Vegan Fitness Diet','General Fitness',2200),
(14,'Keto Fat Loss Diet','Fat Loss',1800),
(15,'Low Carb Diet','Weight Loss',1700),
(16,'High Protein Diet','Muscle Gain',3100),
(17,'Women Fitness Diet','Women Fitness',1900),
(18,'Women Weight Loss Diet','Women Fitness',1600),
(19,'Senior Citizen Healthy Diet','Senior Health',1800),
(20,'Yoga Wellness Diet','Flexibility & Wellness',2000),
(21,'Diabetic Friendly Diet','Health Management',1700),
(22,'Heart Healthy Diet','Heart Health',1900),
(23,'Six Pack Abs Diet','Core Strength',2100),
(24,'Transformation Diet Plan','Weight Loss & Muscle Gain',2400),
(25,'Marathon Runner Diet','Endurance',3200),
(26,'Tamil Nadu Traditional Healthy Diet','General Fitness',2200),
(27,'South Indian Protein Diet','Muscle Gain',2800),
(28,'Competition Prep Diet','Bodybuilding',3400),
(29,'Summer Shred Diet','Fat Loss',1700),
(30,'Elite Athlete Nutrition Plan','Athletic Performance',3600);

select * from DietPlans;

-- 12. MemberDiet

CREATE TABLE MemberDiet (
    MemberDietID INT PRIMARY KEY,
    MemberID INT,
    DietID INT,
    AssignedDate DATE,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY(DietID) REFERENCES DietPlans(DietID)
);

INSERT INTO MemberDiet VALUES
(1,1,3,'2025-01-10'),
(2,2,4,'2025-01-12'),
(3,3,17,'2025-01-15'),
(4,4,20,'2025-01-18'),
(5,5,6,'2025-01-20'),
(6,6,1,'2025-01-22'),
(7,7,7,'2025-01-25'),
(8,8,5,'2025-01-28'),
(9,9,8,'2025-02-01'),
(10,10,13,'2025-02-03'),
(11,11,2,'2025-02-05'),
(12,12,14,'2025-02-08'),
(13,13,16,'2025-02-10'),
(14,14,10,'2025-02-12'),
(15,15,27,'2025-02-15'),
(16,16,11,'2025-02-18'),
(17,17,12,'2025-02-20'),
(18,18,28,'2025-02-22'),
(19,19,15,'2025-02-25'),
(20,20,30,'2025-02-28'),


select * from MemberDiet;

-- 13. Branches

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    City VARCHAR(100),
    ManagerName VARCHAR(100)
);

INSERT INTO Branches VALUES
(1,'Titan Fitness Nagercoil','Nagercoil','Raja Baron'),
(2,'Titan Fitness Tirunelveli','Tirunelveli','Pandi Shakthi'),
(3,'Titan Fitness Chennai Anna Nagar','Chennai','Sivaguru'),
(4,'Titan Fitness Chennai Velachery','Chennai','Vishal'),
(5,'Titan Fitness Coimbatore','Coimbatore','Kavinath'),
(6,'Titan Fitness Madurai','Madurai','Hari'),
(7,'Titan Fitness Salem','Salem','Dominic'),
(8,'Titan Fitness Trichy','Trichy','Ajith Kumar'),
(9,'Titan Fitness Erode','Erode','Ganesh Keshavan'),
(10,'Titan Fitness Thoothukudi','Thoothukudi','Ashwin'),
(11,'Titan Fitness Vellore','Vellore','Nickson'),
(12,'Titan Fitness Tenkasi','Tenkasi','Ram Dharshan'),
(13,'Titan Fitness Theni','Theni','Santhosh Prem'),
(14,'Titan Fitness Karur','Karur','Gomathi'),
(15,'Titan Fitness Kanyakumari','Kanyakumari','Divya Bharathi');

select * from Branches;

-- 14. Staff

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100),
    Role VARCHAR(50),
    Salary DECIMAL(10,2),
    BranchID INT,
    FOREIGN KEY(BranchID) REFERENCES Branches(BranchID)
);

INSERT INTO Staff VALUES
(1,'Arun Kumar','Receptionist',22000.00,1),
(2,'Vignesh Kumar','Cleaner',18000.00,1),
(3,'Priya Shankar','Nutritionist',35000.00,1),
(4,'Karthik Raj','Receptionist',22000.00,2),
(5,'Divya Bharathi','Accountant',32000.00,2),
(6,'Hari Prasad','Cleaner',18000.00,2),
(7,'Ganesh Kumar','Receptionist',22000.00,3),
(8,'Ramesh Kumar','Maintenance Technician',28000.00,3),
(9,'Janani','Nutritionist',35000.00,3),
(10,'Suresh Babu','Receptionist',22000.00,4),
(11,'Keerthana','Accountant',32000.00,4),
(12,'Dinesh Kumar','Cleaner',18000.00,4),
(13,'Ashwin Kumar','Receptionist',22000.00,5),
(14,'Monisha','Nutritionist',35000.00,5),
(15,'Rajesh Kumar','Maintenance Technician',28000.00,5),
(16,'Pavithra','Receptionist',22000.00,6),
(17,'Prakash','Cleaner',18000.00,6),
(18,'Swetha','Accountant',32000.00,6),
(19,'Murugan','Receptionist',22000.00,7),
(20,'Lavanya','Nutritionist',35000.00,7),
(21,'Senthil Kumar','Cleaner',18000.00,7),
(22,'Harini','Receptionist',22000.00,8),
(23,'Balaji','Maintenance Technician',28000.00,8),
(24,'Anitha','Accountant',32000.00,8),
(25,'Nandhini','Receptionist',22000.00,9),
(26,'Farook','Cleaner',18000.00,9),
(27,'Gayathri','Nutritionist',35000.00,9),
(28,'Hemant','Receptionist',22000.00,10),
(29,'Sanjana','Accountant',32000.00,10),
(30,'Varsha','Cleaner',18000.00,10),
(31,'Yuvaraj','Receptionist',22000.00,11),
(32,'Akshaya','Nutritionist',35000.00,11),
(33,'Kannan','Maintenance Technician',28000.00,11),
(34,'Yazhini','Receptionist',22000.00,12),
(35,'Bhuvanesh','Cleaner',18000.00,12),
(36,'Ritika','Accountant',32000.00,12),
(37,'Geetha','Receptionist',22000.00,13),
(38,'Chandru','Maintenance Technician',28000.00,13),
(39,'Uma','Nutritionist',35000.00,13),
(40,'Jothika','Receptionist',22000.00,14),
(41,'Eswar','Cleaner',18000.00,14),
(42,'Kalpana','Accountant',32000.00,14),
(43,'Leela','Receptionist',22000.00,15),
(44,'Franklin','Maintenance Technician',28000.00,15),
(45,'Ranjani','Nutritionist',35000.00,15);

select * from Staff;

-- 15. Feedback

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    MemberID INT,
    Rating INT,
    Comments VARCHAR(300),
    FeedbackDate DATE,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Feedback VALUES
(1,1,5,'Excellent trainers and clean environment','2025-06-01'),
(2,2,4,'Good equipment and friendly staff','2025-06-01'),
(3,3,5,'Loved the women fitness program','2025-06-02'),
(4,4,3,'Need more workout machines','2025-06-02'),
(5,5,5,'Very effective muscle gain program','2025-06-03'),
(6,6,4,'Good atmosphere for workouts','2025-06-03'),
(7,7,5,'Personal trainer was very helpful','2025-06-04'),
(8,8,3,'Gym gets crowded in evenings','2025-06-04'),
(9,9,4,'Nice cardio section','2025-06-05'),
(10,10,5,'Best gym in the area','2025-06-05'),
(11,11,4,'Staff are supportive and polite','2025-06-06'),
(12,12,5,'Excellent weight loss results','2025-06-06'),
(13,13,4,'Good training plans','2025-06-07'),
(14,14,5,'Very professional trainers','2025-06-07'),
(15,15,4,'Diet plan helped a lot','2025-06-08'),
(16,16,3,'Locker room needs improvement','2025-06-08'),
(17,17,5,'CrossFit sessions are amazing','2025-06-09'),
(18,18,4,'Equipment is well maintained','2025-06-09'),
(19,19,4,'Affordable membership plans','2025-06-10'),
(20,20,5,'Great transformation support','2025-06-10'),
(21,21,5,'Yoga classes are excellent','2025-06-11'),
(22,22,4,'Good facilities overall','2025-06-11'),
(23,23,5,'Friendly trainers and staff','2025-06-12'),
(24,24,3,'Need more parking space','2025-06-12'),
(25,25,4,'Workout plans are effective','2025-06-13'),
(26,26,5,'Very motivating environment','2025-06-13'),
(27,27,4,'Clean and hygienic gym','2025-06-14'),
(28,28,5,'Achieved my fitness goals','2025-06-14'),
(29,29,4,'Good customer service','2025-06-15'),
(30,30,5,'Excellent nutrition guidance','2025-06-15'),
(31,31,4,'Trainers are knowledgeable','2025-06-16'),
(32,32,3,'Music volume is too high','2025-06-16'),
(33,33,5,'Best fitness center experience','2025-06-17'),
(34,34,4,'Good value for money','2025-06-17'),
(35,35,5,'Bodybuilding program is excellent','2025-06-18'),
(36,36,4,'Modern equipment available','2025-06-18'),
(37,37,5,'Very satisfied with services','2025-06-19'),
(38,38,4,'Helpful reception staff','2025-06-19'),
(39,39,3,'Need additional treadmills','2025-06-20'),
(40,40,5,'Premium membership is worth it','2025-06-20'),
(41,41,4,'Good maintenance of machines','2025-06-21'),
(42,42,5,'Excellent workout guidance','2025-06-21'),
(43,43,4,'Flexible workout timings','2025-06-22'),
(44,44,5,'Very clean gym environment','2025-06-22'),
(45,45,4,'Friendly gym community','2025-06-23'),
(46,46,3,'Waiting time for equipment is high','2025-06-23'),
(47,47,5,'Professional training sessions','2025-06-24'),
(48,48,4,'Good branch facilities','2025-06-24'),
(49,49,5,'Highly recommend this gym','2025-06-25'),
(50,50,5,'Outstanding fitness experience','2025-06-25');

select * from Feedback;

-- These 20 scenarios will help you understand the complete Gym Management System database using Joins, Aggregate Functions, 
-- GROUP BY, HAVING, Subqueries, CASE, Date Functions, Ranking, and Business Insights. 
-- Your schema contains Members, Plans, Subscriptions, Trainers, Attendance, Payments, 
-- Workouts, Diets, Branches, Staff, Equipment, and Feedback.

-- 1. Complete Member Profile

SELECT m.MemberID,m.FullName, s.Status, mp.PlanName, t.TrainerName, w.WorkoutName, d.DietName
FROM Members m
LEFT JOIN Subscriptions s ON m.MemberID=s.MemberID
LEFT JOIN MembershipPlans mp ON s.PlanID=mp.PlanID
LEFT JOIN MemberTrainer mt ON m.MemberID=mt.MemberID
LEFT JOIN Trainers t ON mt.TrainerID=t.TrainerID
LEFT JOIN MemberWorkout mw ON m.MemberID=mw.MemberID
LEFT JOIN WorkoutPlans w ON mw.WorkoutID=w.WorkoutID
LEFT JOIN MemberDiet md ON m.MemberID=md.MemberID
LEFT JOIN DietPlans d ON md.DietID=d.DietID;

-- 2. Total Gym Revenue

SELECT SUM(Amount) AS TotalRevenue FROM Payments;

-- 3. Revenue by Payment Method

SELECT PaymentMethod, SUM(Amount) Revenue
FROM Payments
GROUP BY PaymentMethod;

-- 4. Membership Plan Popularity

SELECT mp.PlanName, COUNT(*) Members
FROM MembershipPlans mp
JOIN Subscriptions s ON mp.PlanID=s.PlanID
GROUP BY mp.PlanName 
ORDER BY Members DESC;

-- 5. Trainer Performance

SELECT t.TrainerName, COUNT(*) TotalMembers
FROM Trainers t
JOIN MemberTrainer mt ON t.TrainerID=mt.TrainerID
GROUP BY t.TrainerName
ORDER BY TotalMembers DESC;

-- 6. Attendance Hours

SELECT MemberID, 
TIMESTAMPDIFF(MINUTE,CheckIn,CheckOut) AS MinutesSpent
FROM Attendance;

-- 7. Members With Highest Attendance

SELECT MemberID, COUNT(*) Visits
FROM Attendance
GROUP BY MemberID
ORDER BY Visits DESC;

-- 8. Average Feedback Rating

SELECT ROUND(AVG(Rating),2) AvgRating
FROM Feedback;

-- 9. Best Feedback Members

SELECT m.FullName,f.Rating
FROM Feedback f
JOIN Members m ON f.MemberID=m.MemberID
WHERE Rating=5;

-- 10. Workout Plan Popularity

SELECT w.WorkoutName, COUNT(*) Assigned
FROM WorkoutPlans w
JOIN MemberWorkout mw ON w.WorkoutID=mw.WorkoutID
GROUP BY w.WorkoutName
ORDER BY Assigned DESC;

-- 11. Diet Plan Popularity

SELECT d.DietName, COUNT(*) Assigned
FROM DietPlans d
JOIN MemberDiet md ON d.DietID=md.DietID
GROUP BY d.DietName
ORDER BY Assigned DESC;

-- 12. Expired Members

SELECT m.FullName,s.EndDate
FROM Members m
JOIN Subscriptions s
ON m.MemberID=s.MemberID
WHERE s.Status='Expired';

-- 13. Premium Customers

SELECT m.FullName, mp.PlanName, mp.Amount
FROM Members m
JOIN Subscriptions s ON m.MemberID=s.MemberID
JOIN MembershipPlans mp ON s.PlanID=mp.PlanID
WHERE mp.Amount>20000;

-- 14. Highest Paying Members

SELECT m.FullName, SUM(p.Amount) TotalPaid
FROM Members m
JOIN Payments p ON m.MemberID=p.MemberID
GROUP BY m.FullName
ORDER BY TotalPaid DESC;

-- 15. Branch-wise Staff Count

SELECT b.BranchName, COUNT(*) StaffCount
FROM Branches b
JOIN Staff s ON b.BranchID=s.BranchID
GROUP BY b.BranchName;

-- 16. Highest Paid Trainer

SELECT *
FROM Trainers
WHERE Salary=
(
SELECT MAX(Salary)
FROM Trainers
);

-- 17. Equipment Maintenance Report

SELECT * FROM Equipment
WHERE ConditionStatus='Needs Service';

-- 18. Members Above Average Payment

SELECT *
FROM Payments
WHERE Amount >
(
SELECT AVG(Amount)
FROM Payments
);

-- 19. Feedback Analysis

SELECT Rating, COUNT(*) Reviews
FROM Feedback
GROUP BY Rating;

-- 20. Ultimate Gym Dashboard Query

SELECT
(SELECT COUNT(*) FROM Members) TotalMembers,
(SELECT COUNT(*) FROM Trainers) TotalTrainers,
(SELECT COUNT(*) FROM Attendance) TotalVisits,
(SELECT SUM(Amount) FROM Payments) TotalRevenue,
(SELECT AVG(Rating) FROM Feedback) AvgRating,
(SELECT COUNT(*) FROM Equipment) TotalEquipment;