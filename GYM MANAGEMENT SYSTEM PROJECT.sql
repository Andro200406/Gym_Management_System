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

-- 2. MembershipPlans

CREATE TABLE MembershipPlans (
    PlanID INT PRIMARY KEY,
    PlanName VARCHAR(50),
    DurationMonths INT,
    Amount DECIMAL(10,2),
    Benefits VARCHAR(200)
);

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

-- 4. Trainers

CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY,
    TrainerName VARCHAR(100),
    Specialization VARCHAR(100),
    ExperienceYears INT,
    Phone VARCHAR(15),
    Salary DECIMAL(10,2)
);

-- 5. MemberTrainer

CREATE TABLE MemberTrainer (
    AssignmentID INT PRIMARY KEY,
    MemberID INT,
    TrainerID INT,
    AssignedDate DATE,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY(TrainerID) REFERENCES Trainers(TrainerID)
);

-- 6. Attendance

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    MemberID INT,
    AttendanceDate DATE,
    CheckIn TIME,
    CheckOut TIME,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);

-- 7. Payments

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);

-- 8. Equipment

CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(100),
    Quantity INT,
    PurchaseDate DATE,
    ConditionStatus VARCHAR(20)
);

-- 9. WorkoutPlans

CREATE TABLE WorkoutPlans (
    WorkoutID INT PRIMARY KEY,
    WorkoutName VARCHAR(100),
    Goal VARCHAR(100),
    DurationWeeks INT
);

-- 10. MemberWorkout

CREATE TABLE MemberWorkout (
    MemberWorkoutID INT PRIMARY KEY,
    MemberID INT,
    WorkoutID INT,
    AssignedDate DATE,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY(WorkoutID) REFERENCES WorkoutPlans(WorkoutID)
);

-- 11. DietPlans

CREATE TABLE DietPlans (
    DietID INT PRIMARY KEY,
    DietName VARCHAR(100),
    Goal VARCHAR(100),
    Calories INT
);

-- 12. MemberDiet

CREATE TABLE MemberDiet (
    MemberDietID INT PRIMARY KEY,
    MemberID INT,
    DietID INT,
    AssignedDate DATE,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY(DietID) REFERENCES DietPlans(DietID)
);

-- 13. Branches

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    City VARCHAR(100),
    ManagerName VARCHAR(100)
);

-- 14. Staff

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100),
    Role VARCHAR(50),
    Salary DECIMAL(10,2),
    BranchID INT,
    FOREIGN KEY(BranchID) REFERENCES Branches(BranchID)
);

-- 15. Feedback

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    MemberID INT,
    Rating INT,
    Comments VARCHAR(300),
    FeedbackDate DATE,
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);