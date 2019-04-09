-- BEGIN TRANSACTION;

DROP DATABASE IF EXISTS ums_db;

CREATE DATABASE ums_db;
USE ums_db;

CREATE TABLE Ongoing (
	Sem TINYINT NOT NULL,
	Year SMALLINT NOT NULL,
	PRIMARY KEY(Sem,Year)
);
CREATE TABLE Student (
	Roll_no	INTEGER NOT NULL,
	Name	TEXT NOT NULL,
	Email_id	TEXT NOT NULL,
	DOB	DATE NOT NULL,
	DOA	DATE NOT NULL,
	CPI	NUMERIC,
	PRIMARY KEY(Roll_no)
);
CREATE TABLE Program (
	Program_id	INTEGER NOT NULL,
	Dept_code VARCHAR(4) NOT NULL,
	Dept_name TEXT NOT NULL,
	Program	TEXT NOT NULL,
	OE_credits	SMALLINT NOT NULL,
	DE_credits	SMALLINT NOT NULL,
	DC_credits	SMALLINT NOT NULL,
	IC_credits	SMALLINT NOT NULL,
	SO_credits	SMALLINT NOT NULL,
	ESO_credits	SMALLINT NOT NULL,
	PRIMARY KEY(Program_id)
);
CREATE TABLE Course (
	Course_code	VARCHAR(7) NOT NULL,
	Course_name	TEXT NOT NULL,
	Credits	TINYINT NOT NULL,
	PRIMARY KEY(Course_code)
);
CREATE TABLE Professor(
	Prof_id	INTEGER NOT NULL,
	Name	TEXT NOT NULL,
	Email_id	TEXT NOT NULL,
	DOB	DATE NOT NULL,
	DOJ	DATE NOT NULL,
	Dept_code	VARCHAR(4) NOT NULL,
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
	PRIMARY KEY(Course_code,Sem,Year,Roll_no)
);
CREATE TABLE Course_offered (
	Course_code	VARCHAR(7) NOT NULL,
	Sem	TINYINT NOT NULL,
	Year	SMALLINT NOT NULL,
	Prof_incharge_id	INTEGER NOT NULL,
	Type_offered	TEXT NOT NULL,
	Time_slot	INTEGER NOT NULL,
	FOREIGN KEY(Prof_incharge_id) REFERENCES Professor(Prof_id),
	FOREIGN KEY(Course_code) REFERENCES Course(Course_code),
	PRIMARY KEY(Course_code,Sem,Year)
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
	Grade	VARCHAR(1) NOT NULL,
	Sem	TINYINT NOT NULL,
	Year	SMALLINT NOT NULL,
	FOREIGN KEY(Course_code) REFERENCES Course(Course_code),
	FOREIGN KEY(Roll_no) REFERENCES Student(Roll_no),
	FOREIGN KEY(Prof_id) REFERENCES Professor(Prof_id),
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
)

-- SET FOREIGN_KEY_CHECKS=0;

-- COMMIT;
