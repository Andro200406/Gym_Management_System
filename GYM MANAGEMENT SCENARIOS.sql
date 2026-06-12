USE Gym_Management_System;

-- Basic (Daily Gym Operations)

-- 1. Active Members
SELECT * FROM Members
WHERE MembershipStatus='Active';

-- 2. Expired Members
SELECT * FROM Members
WHERE MembershipStatus='Expired';

-- 3. Today's Attendance

SELECT * FROM Attendance
WHERE AttendanceDate=CURDATE();

-- 4. New Members This Month

SELECT *
FROM Members
WHERE MONTH(JoinDate)=MONTH(CURDATE());

-- 5. Available Membership Plans

SELECT * FROM MembershipPlans;

-- 6. Female Members

SELECT * FROM Members
WHERE Gender='Female';

-- 7. Trainers List

SELECT * FROM Trainers;

-- 8. Equipment Needing Service

SELECT * FROM Equipment
WHERE ConditionStatus='Needs Service';

-- 9. Recent Payments

SELECT * FROM Payments
ORDER BY PaymentDate DESC;

-- 10. Average Feedback Rating

SELECT AVG(Rating)
FROM Feedback;

-- Intermediate (Manager Dashboard)

-- 11. Total Revenue

SELECT SUM(Amount) AS Revenue
FROM Payments;

-- 12. Revenue by Payment Method

SELECT PaymentMethod,
SUM(Amount)
FROM Payments
GROUP BY PaymentMethod;

-- 13. Most Popular Membership Plan

SELECT mp.PlanName, COUNT(*) TotalMembers
FROM MembershipPlans mp
JOIN Subscriptions s ON mp.PlanID=s.PlanID
GROUP BY mp.PlanName
ORDER BY TotalMembers DESC;

-- 14. Most Popular Workout Plan

SELECT w.WorkoutName, COUNT(*) Assignments
FROM WorkoutPlans w
JOIN MemberWorkout mw ON w.WorkoutID=mw.WorkoutID
GROUP BY w.WorkoutName
ORDER BY Assignments DESC;

-- 15. Most Popular Diet Plan

SELECT d.DietName, COUNT(*) Assignments
FROM DietPlans d
JOIN MemberDiet md ON d.DietID=md.DietID
GROUP BY d.DietName
ORDER BY Assignments DESC;

-- 16. Trainer With Most Members

SELECT t.TrainerName,
COUNT(*) Members
FROM Trainers t
JOIN MemberTrainer mt
ON t.TrainerID=mt.TrainerID
GROUP BY t.TrainerName
ORDER BY Members DESC;

-- 17. Top Paying Members

SELECT m.FullName,
SUM(p.Amount) TotalPaid
FROM Members m
JOIN Payments p
ON m.MemberID=p.MemberID
GROUP BY m.FullName
ORDER BY TotalPaid DESC;

-- 18. Branch-wise Staff Count

SELECT b.BranchName,
COUNT(*) StaffCount
FROM Branches b
JOIN Staff s
ON b.BranchID=s.BranchID
GROUP BY b.BranchName;

-- 19. Daily Attendance Count

SELECT AttendanceDate,
COUNT(*) TotalVisitors
FROM Attendance
GROUP BY AttendanceDate;

-- 20. Members With Trainer Details

SELECT m.FullName,
t.TrainerName
FROM Members m
JOIN MemberTrainer mt
ON m.MemberID=mt.MemberID
JOIN Trainers t
ON mt.TrainerID=t.TrainerID;

-- Advanced (Business Intelligence & Analytics)

-- 21. Members Likely to Leave (Churn)

SELECT m.FullName
FROM Members m
JOIN Subscriptions s
ON m.MemberID=s.MemberID
WHERE s.Status='Expired';

-- 22. Members Without Attendance

SELECT FullName
FROM Members
WHERE MemberID NOT IN
(
SELECT DISTINCT MemberID
FROM Attendance
);

-- 23. Members Without Trainers

SELECT FullName
FROM Members
WHERE MemberID NOT IN
(
SELECT MemberID
FROM MemberTrainer
);

-- 24. Members Without Diet Plans

SELECT FullName
FROM Members
WHERE MemberID NOT IN
(
SELECT MemberID
FROM MemberDiet
);

-- 25. Members Without Workout Plans

SELECT FullName
FROM Members
WHERE MemberID NOT IN
(
SELECT MemberID
FROM MemberWorkout
);

-- 26. Members Paying Above Average

SELECT *
FROM Payments
WHERE Amount >
(
SELECT AVG(Amount)
FROM Payments
);

-- 27. Highest Revenue Membership Plan

SELECT mp.PlanName,
SUM(mp.Amount) Revenue
FROM MembershipPlans mp
JOIN Subscriptions s
ON mp.PlanID=s.PlanID
GROUP BY mp.PlanName
ORDER BY Revenue DESC;

-- 28. Peak Gym Hour

SELECT HOUR(CheckIn) PeakHour,
COUNT(*) Visitors
FROM Attendance
GROUP BY HOUR(CheckIn)
ORDER BY Visitors DESC;

-- 29. Top 5 Most Active Members

SELECT m.FullName,
COUNT(*) Visits
FROM Members m
JOIN Attendance a
ON m.MemberID=a.MemberID
GROUP BY m.FullName
ORDER BY Visits DESC
LIMIT 5;

-- 30. CEO Dashboard Query

SELECT
(SELECT COUNT(*) FROM Members) AS TotalMembers,
(SELECT COUNT(*) FROM Trainers) AS TotalTrainers,
(SELECT COUNT(*) FROM Staff) AS TotalStaff,
(SELECT SUM(Amount) FROM Payments) AS TotalRevenue,
(SELECT AVG(Rating) FROM Feedback) AS AvgRating,
(SELECT COUNT(*) FROM Attendance) AS TotalVisits,
(SELECT COUNT(*) FROM Equipment) AS TotalEquipment;

