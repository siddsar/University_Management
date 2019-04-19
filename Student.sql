-- BEGIN TRANSACTION;

DROP DATABASE IF EXISTS ums_db;

CREATE DATABASE ums_db;
USE ums_db;

CREATE TABLE Ongoing (
	Sem TINYINT NOT NULL,
	Year SMALLINT NOT NULL,
	Today DATETIME NOT NULL,
	PRIMARY KEY(Today)
);

CREATE TABLE Student (
	Roll_no	INTEGER NOT NULL,
	Name	TEXT NOT NULL,
	Email_id	TEXT NOT NULL,
	DOB	DATE NOT NULL,
	DOA	DATE NOT NULL,
	CPI	DECIMAL,
	Contact TEXT,
	PRIMARY KEY(Roll_no)
);

CREATE TABLE Department (
	Dept_code VARCHAR(4) NOT NULL,
	Dept_name TEXT NOT NULL,
	PRIMARY KEY(Dept_code)
);

CREATE TABLE Program (
	Program_id	INTEGER NOT NULL,
	Dept_code VARCHAR(4) NOT NULL,
	Program	TEXT NOT NULL,
	OE_credits	SMALLINT NOT NULL,
	DE_credits	SMALLINT NOT NULL,
	DC_credits	SMALLINT NOT NULL,
	IC_credits	SMALLINT NOT NULL,
	HSS_credits	SMALLINT NOT NULL,
	ESO_credits	SMALLINT NOT NULL,
	THESIS_credits	SMALLINT NOT NULL,
	FOREIGN KEY(Dept_code) REFERENCES Department(Dept_code),
	PRIMARY KEY(Program_id)
	
);
CREATE TABLE Course (
	Course_code	VARCHAR(7) NOT NULL,
	Course_name	TEXT NOT NULL,
	Credits	TINYINT NOT NULL,
	PRIMARY KEY(Course_code)
);
CREATE TABLE Grade (
	Grade VARCHAR(2) NOT NULL,
	Grade_point SMALLINT NOT NULL,
	PRIMARY KEY(Grade)
);
CREATE TABLE Professor(
	Prof_id	INTEGER NOT NULL,
	Name TEXT NOT NULL,
	Email_id TEXT NOT NULL,
	DOB	DATE NOT NULL,
	DOJ	DATE NOT NULL,
	Dept_code VARCHAR(4) NOT NULL,
	Room Text,
	FOREIGN KEY(Dept_code) REFERENCES Department(Dept_code),
	PRIMARY KEY(Prof_id)
);
CREATE TABLE Prof_Designation(
	Prof_id INTEGER NOT NULL,
	Designation TEXT NOT NULL,
	FOREIGN KEY(Prof_id) REFERENCES Professor(Prof_id)
);

CREATE TABLE Student_Program (
	Roll_no	INTEGER NOT NULL,
	Prog_id	INTEGER NOT NULL,
	FOREIGN KEY(Prog_id) REFERENCES Program(Program_id),
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
	PRIMARY KEY(Roll_no,Prog_id)
);
CREATE TABLE Pre_req (
	Course_code	VARCHAR(7) NOT NULL,
	Prereq_course_code	VARCHAR(7) NOT NULL,
	FOREIGN KEY(Course_code) REFERENCES Course(Course_code),
	FOREIGN KEY(Prereq_course_code) REFERENCES Course(Course_code),
	PRIMARY KEY(Course_code,Prereq_course_code)
);

CREATE TABLE Course_offered (
	Course_code	VARCHAR(7) NOT NULL,
	Sem	TINYINT NOT NULL,
	Year	SMALLINT NOT NULL,
	Prof_incharge_id	INTEGER NOT NULL,
	Type_offered	TEXT NOT NULL,
	Time_slot	BIT(50) NOT NULL,
	FOREIGN KEY(Prof_incharge_id) REFERENCES Professor(Prof_id),
	FOREIGN KEY(Course_code) REFERENCES Course(Course_code),
	PRIMARY KEY(Course_code,Sem,Year)
);
CREATE TABLE Course_request (
	Course_code	VARCHAR(7) NOT NULL,
	Sem	TINYINT NOT NULL,
	Year	SMALLINT NOT NULL,
	Prof_id	INTEGER NOT NULL,
	Roll_no	INTEGER NOT NULL,
	Status	TEXT NOT NULL,
	Type_Taken TEXT NOT NULL,
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
	FOREIGN KEY(Prof_id) REFERENCES Professor(Prof_id),
	FOREIGN KEY(Course_code,Sem,Year) REFERENCES Course_offered(Course_code,Sem,Year),
	PRIMARY KEY(Course_code,Sem,Year,Roll_no)
);
CREATE TABLE Course_Profs(
	Course_code VARCHAR(7) NOT NULL,
	Prof_id	INTEGER NOT NULL,
	Prof_Type TEXT NOT NULL,
	PRIMARY KEY(Course_code,Prof_id),
	FOREIGN KEY(Prof_id) REFERENCES Professor(Prof_id),
	FOREIGN KEY(Course_code) REFERENCES Course(Course_code)
);
CREATE TABLE Course_registration (
	Course_code	VARCHAR(7) NOT NULL,
	Roll_no	INTEGER NOT NULL,
	Prof_id	INTEGER NOT NULL,
	Grade	VARCHAR(2) NOT NULL,
	Sem	TINYINT NOT NULL,
	Year	SMALLINT NOT NULL,
	Type_Taken TEXT NOT NULL,
	FOREIGN KEY(Course_code) REFERENCES Course(Course_code),
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
	FOREIGN KEY(Prof_id) REFERENCES Professor(Prof_id),
	FOREIGN KEY(Grade) REFERENCES Grade(Grade),
	FOREIGN KEY(Course_code,Sem,Year) REFERENCES Course_offered(Course_code,Sem,Year),
	PRIMARY KEY(Course_code,Roll_no,Sem,Year)
);
CREATE TABLE TA (
	Course_code	VARCHAR(7) NOT NULL,
	Sem	TINYINT NOT NULL,
	Year	SMALLINT NOT NULL,
	Roll_no	INTEGER NOT NULL,
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
	FOREIGN KEY(Course_code) REFERENCES Course(Course_code),
	PRIMARY KEY(Course_code,Sem,Year,Roll_no)
);
CREATE TABLE Mentoring(
	Prof_id INTEGER NOT NULL,
	Roll_no INTEGER NOT NULL,
	Course_code VARCHAR(7) NOT NULL,
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
	FOREIGN KEY(Course_code) REFERENCES Course(Course_code),
	FOREIGN KEY(Prof_id) REFERENCES Professor(Prof_id),
	PRIMARY KEY(Prof_id,Roll_no,Course_code)
);


CREATE TABLE Doctor (
	D_id	INTEGER NOT NULL,
	Name	TEXT NOT NULL,
	Degree	TEXT NOT NULL,
	Specialisation	TEXT NOT NULL,
	Email	TEXT NOT NULL,
	Contact	BIGINT NOT NULL,
	PRIMARY KEY(D_id)
);

CREATE TABLE Doctor_availability (
	D_id	INTEGER NOT NULL,
	Monday	INTEGER NOT NULL, 
	Tuesday	INTEGER NOT NULL, 
	Wednesday	INTEGER NOT NULL, 
	Thursday	INTEGER NOT NULL, 
	Friday	INTEGER NOT NULL, 
	Saturday	INTEGER NOT NULL, 
	Sunday	INTEGER NOT NULL, 
    FOREIGN KEY(D_id) REFERENCES Doctor(D_id),
    PRIMARY KEY(D_id)
);

CREATE TABLE Bookings (
	Booked_by TEXT NOT NULL,
	Room VARCHAR(5) NOT NULL,
	Area VARCHAR(5) NOT NULL,
	Start_time DATETIME NOT NULL,
	End_time DATETIME NOT NULL,
	PRIMARY KEY(Room,Area,Start_time)
);

CREATE TABLE Treatment (
	Patient_type	TEXT NOT NULL,
	Patient_id	INTEGER NOT NULL,
	Relationship	TEXT,
	D_id	INTEGER NOT NULL,
	FOREIGN KEY(D_id) REFERENCES Doctor(D_id) 
);

CREATE TABLE Patient_appointment (
	Patient_type	TEXT NOT NULL,
	Patient_id	INTEGER NOT NULL, 
	D_id	INTEGER NOT NULL,
	Appointment_no	SMALLINT NOT NULL,
	Appointment_datetime	DATETIME NOT NULL,
    FOREIGN KEY(D_id) REFERENCES Doctor(D_id),
    PRIMARY KEY(Patient_id,Appointment_datetime)
);

CREATE TABLE Library (
	Acc_no	INTEGER NOT NULL,
	Book_no	INTEGER NOT NULL,
	Book_title TEXT NOT NULL,
	Author	TEXT NOT NULL,
	Tot_copies	SMALLINT NOT NULL,
	PRIMARY KEY(Book_no)
);

CREATE TABLE Book_issued (
	Book_no	INTEGER NOT NULL,
	Roll_no	INTEGER NOT NULL, 
	Date_issued	DATE NOT NULL,
	Date_due	DATE NOT NULL,
	Date_return	DATE,
	FOREIGN KEY(Book_no) REFERENCES Library(Book_no),
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
    PRIMARY KEY(Book_no,Roll_no)
);

CREATE TABLE Student_hall (
	Roll_no	INTEGER NOT NULL,
	Hall	TINYINT NOT NULL,
	Room_no	TEXT NOT NULL,
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
    PRIMARY KEY(Roll_no)
);

CREATE TABLE Dues (
	Roll_no	INTEGER NOT NULL,
	Mess_dues	INTEGER NOT NULL,
	Electricity_dues	INTEGER NOT NULL,
	Library_dues	INTEGER NOT NULL,
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
    PRIMARY KEY(Roll_no)
);
CREATE TABLE Work_Locations (
	Location_ID VARCHAR(6) NOT NULL,
	Work_location TEXT NOT NULL,
	PRIMARY KEY(Location_ID)
);
CREATE TABLE Staff (
	Staff_id	INTEGER NOT NULL,
	Location_id VARCHAR(6) NOT NULL,
	Name	TEXT NOT NULL,
	Work_description TEXT NOT NULL,
    FOREIGN KEY(Location_id) REFERENCES Work_Locations(Location_ID),
    PRIMARY KEY(Staff_id)
);
CREATE TABLE Student_governance_body (
	Body_id	INTEGER NOT NULL,
	Body_name	TEXT NOT NULL,
	Funds_allocated	INTEGER NOT NULL,
	PRIMARY KEY(Body_id)
);
CREATE TABLE Body_members (
	Body_id	INTEGER NOT NULL,
	Roll_no	INTEGER NOT NULL,
	Position TEXT NOT NULL,
    FOREIGN KEY(Body_id) REFERENCES Student_governance_body(Body_id),
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
	PRIMARY KEY(Body_id,Roll_no)
);

CREATE TABLE Attendance_salary (
	Emp_type	TEXT NOT NULL,
	Id	INTEGER NOT NULL,
	Month_attendance	INTEGER NOT NULL,
	Salary	BIGINT NOT NULL
);





DELIMITER $$
CREATE TRIGGER course_status_change AFTER UPDATE
ON Course_request
FOR EACH ROW
BEGIN
	IF NEW.Status = 'Accepted' THEN
		INSERT INTO Course_registration
		SET Course_code = NEW.Course_code , Prof_Id = NEW.Prof_Id, Roll_no = NEW.Roll_no, Grade = 'I', Sem = NEW.Sem, Year = NEW.Year, Type_taken = NEW.Type_taken;
	END IF;
END;$$

CREATE TRIGGER CPI AFTER UPDATE
ON Course_registration
FOR EACH ROW
BEGIN
	IF NEW.Grade <> 'On' THEN
		UPDATE Student
		SET Student.CPI = (
			select CAST(sum(Course.Credits*Grade.Grade_point) as DECIMAL)/sum(Course.Credits)
			from Course_registration, Course, Grade
			where Course_registration.Course_code=Course.Course_code and Course_registration.Roll_no = NEW.Roll_no and Grade.Grade = Course_registration.Grade and Course_registration.Grade <> 'I'
		)
		WHERE Student.Roll_no = NEW.Roll_no;
	END IF;
END;$$

CREATE TRIGGER old_bookings AFTER UPDATE
ON Ongoing
FOR EACH ROW
BEGIN
DELETE FROM Bookings
WHERE Bookings.End_time < NEW.Today;
END;$$

CREATE TRIGGER library_dues AFTER UPDATE
ON Book_issued
FOR EACH ROW
BEGIN
	UPDATE Dues
	SET Dues.Library_dues = (
	CASE
		WHEN DATEDIFF(NEW.Date_return, NEW.Date_due) > 0 THEN Dues.Library_dues + DATEDIFF(NEW.Date_return, NEW.Date_due)*5
		WHEN DATEDIFF(NEW.Date_return, NEW.Date_due) <= 0 THEN Dues.Library_dues
	END
	)
	WHERE Dues.Roll_no = NEW.Roll_no;
END;$$

DELIMITER ;

-- SET FOREIGN_KEY_CHECKS=0;

-- COMMIT;
