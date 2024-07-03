


UPDATE Hobby SET Name = 'Reading Book' WHERE Id = 1;

UPDATE Employee SET Age = 24 WHERE Id = 1;

UPDATE EmployeeSalary SET Salary = 5000 WHERE Id = 4;

UPDATE EmployeeHobby SET HobbyId = 2 WHERE Id = 3;

-----------------------------------------------------------------------------------

select * from Hobby;

select * from Employee;

select * from EmployeeSalary;

select * from EmployeeHobby;

-------------------------------------------------------------------------------------

DELETE FROM Hobby WHERE Id = 3;

DELETE FROM Employee WHERE Id=2;

DELETE FROM EmployeeSalary WHERE Id =2;

DELETE FROM EmployeeHobby WHERE Id = 3;

DELETE FROM Employee WHERE Id IN (SELECT Id FROM Employee);

-------------------------------------------------------------------------------------------

TRUNCATE TABLE EmployeeSalary;

TRUNCATE TABLE EmployeeHobby;

TRUNCATE TABLE Hobby;

TRUNCATE TABLE Employee;

------------------------------------------------------------------------------------------------


ALTER TABLE EmployeeSalary DROP CONSTRAINT FK__EmployeeS__Emplo__5165187F;


ALTER TABLE EmployeeHobby DROP CONSTRAINT [FK__EmployeeH__Emplo__5441852A];



TRUNCATE TABLE Employee;

------------------------------------------------------------------------------------------------

ALTER TABLE EmployeeSalary DROP CONSTRAINT [PK__Employee__3214EC07635C0CB9];


ALTER TABLE EmployeeHobby DROP CONSTRAINT [FK__EmployeeH__Hobby__5535A963];


TRUNCATE TABLE Hobby;

----------------------------------------------------------------------------------------------------

INSERT INTO Hobby ( Name) VALUES
('Reading'),
('Sport'),
('Cooking'),
( 'Playing'),
('Dancing'),
('Acting'),
('Meditation'),
('Writing'),
( 'Traveling'),
('Yoga');

----------------------------------------------------------------------------------

INSERT INTO Employee (FirstName, LastName, Age, MobileNumber, Address) VALUES
('Vrushali', 'More', 23, '1234567890', 'Dhule-Maharashtra'),
('Mayuri', 'Sonawane', 22, '9876543210', 'Kalmadu-Maharashtra'),
('Vaishu','Patil',23,'0987654321','Saundane-Maharashtra'),
('Roshan','Patil',24,'09321097665','Mukati-Maharashtra'),
('Ganesh','Patil',23,'76543216587','Dhule-Maharashtra');


-----------------------------------------------------------------------------------

INSERT INTO EmployeeSalary ( EmployeeId, Salary, Date) VALUES
( 1, 5000.00, '2024-01-07'),
(2, 6000.00, '2024-02-10'),
(3 , 8000.00, '2024-03-19'),
(4, 9000.00, '2024-05-20'),
(5, 4000.00, '2024-05-25');

------------------------------------------------------------------------------------------



INSERT INTO EmployeeHobby ( EmployeeId, HobbyId) VALUES
( 1, 1,2,3),
(2, 4,5,2),
(3, 4,6,7),
(4, 8,9,5),
(5, 3,2,10);


------------------***********************************************---------------------------

SELECT *
FROM Employee
LEFT JOIN Hobby ON Employee.Id =Hobby. Id;

------------------*********************************************----------------------------------------

SELECT CONCAT(Employee.FirstName, ' ', Employee.LastName) AS EmployeeName,
       Hobby.Name AS HobbyName
FROM Employee AS ej
INNER JOIN Employee ON ej.Id = Employee.Id
INNER JOIN Hobby ON ej.Id = Hobby.Id;


*********************************************************************************************************


SELECT CONCAT(Employee.FirstName, ' ', Employee.LastName) AS EmployeeName,
       Employeesalary.Salary AS Salary
FROM Employee AS ej
INNER JOIN Employee ON ej.Id = Employee.Id
INNER JOIN Employeesalary ON ej.Id = EmployeeSalary.Id;


------------------***********************************************-----------------------------------------


SELECT 
    e.FirstName,
    SUM(s.Salary) AS total_salary,
    h.name
FROM 
    Employee e
JOIN 
    Employeesalary s ON e.id = s.id
JOIN 
    Hobby h ON e.id = h.id
GROUP BY 
    e.FirstName, h.name;

--------------------*********************************************----------------------------------------
 //Using SubQuery


	SELECT 
    e.Id AS Employee,
    (
        SELECT STRING_AGG(h.name, ', ')
        FROM Hobby h
        WHERE h.id = e.id
    ) AS Hobby,
    SUM(e.Salary) AS EmployeeSalary
FROM 
    EmployeeSalary e
GROUP BY 
    e.Id, e.id;


	--------------------------*************************************----------------------------------------------



