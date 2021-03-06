
INSERT into Student values(150657,"Uriah Franks","uriahfranks@iitk.ac.in","1996-07-20","2015-07-22",0,"5172799804");
INSERT into Student values(150512,"Wyatt Oneal","wyattoneal@iitk.ac.in","1996-09-23","2015-07-22",0,"2673183230");
INSERT into Student values(150320,"Hammett Gutierrez","hammettgutierrez@iitk.ac.in","1996-05-05","2015-07-21",0,"3194596861");
INSERT into Student values(150665,"Clio Fulton","cliofulton@iitk.ac.in","1996-08-23","2015-07-22",0,"1822015187");
INSERT into Student values(160394,"Ulric Blake","ulricblake@iitk.ac.in","1996-09-29","2016-07-21",0,"2335064115");
INSERT into Student values(160691,"Noel Snider","noelsnider@iitk.ac.in","1996-11-02","2016-07-21",0,"4585500324");
INSERT into Student values(160787,"Dennis Sutton","dennissutton@iitk.ac.in","1996-05-08","2016-07-21",0,"7016064404");
INSERT into Student values(160083,"Ashely Key","ashelykey@iitk.ac.in","1996-09-24","2016-07-21",0,"8157009770");
INSERT into Student values(160379,"Lara Washington","larawashington@iitk.ac.in","1996-03-16","2016-07-22",0,"4367605178");
INSERT into Student values(160717,"Ruby Obrien","rubyobrien@iitk.ac.in","1996-05-17","2016-07-22",0,"8590430734");
INSERT into Student values(160369,"Ethan Hamilton","ethanhamilton@iitk.ac.in","1996-05-18","2016-07-21",0,"8918902483");
INSERT into Student values(160591,"Cain Morris","cainmorris@iitk.ac.in","1996-02-14","2016-07-21",0,"9899690263");
INSERT into Student values(160120,"Noelani Hayes","noelanihayes@iitk.ac.in","1996-08-06","2016-07-22",0,"3392908828");
INSERT into Student values(170128,"Brennan Reilly","brennanreilly@iitk.ac.in","1996-11-18","2017-07-22",0,"4089468469");
INSERT into Student values(170396,"Talon Mcmahon","talonmcmahon@iitk.ac.in","1996-02-17","2017-07-22",0,"4556144286");
INSERT into Student values(180601,"Ira Sharpe","irasharpe@iitk.ac.in","1996-11-02","2018-07-20",0,"8414471408");
INSERT into Student values(180118,"Kyra Frye","kyrafrye@iitk.ac.in","1996-09-17","2018-07-21",0,"2972423672");
INSERT into Student values(180618,"Nomlanga Duran","nomlangaduran@iitk.ac.in","1996-04-24","2018-07-22",0,"2414691333");
INSERT into Student values(180169,"Linus Solis","linussolis@iitk.ac.in","1996-06-08","2018-07-21",0,"8581056360");
INSERT into Student values(180556,"Mason Santiago","masonsantiago@iitk.ac.in","1996-05-04","2018-07-21",0,"6023199815");
INSERT into Student values(180337,"Gabriel Buck","gabrielbuck@iitk.ac.in","1996-08-09","2018-07-22",0,"3070917144");




INSERT into Department values("CSE","Computer Science and Engineering");
INSERT into Department values("EE","Electrical Engineering");
INSERT into Department values("ME","Mechanical Engineering");
INSERT into Department values("MSE","Materical Science Engineering");
INSERT into Department values("MTH","Mathematics");

INSERT into Program values(1,"CSE","BT",54,45,100,100,49,40,0);
INSERT into Program values(2,"CSE","MT",0,55,50,0,0,0,100);
INSERT into Program values(3,"CSE","PhD",0,0,100,0,0,0,200);
INSERT into Program values(4,"EE","BT",54,45,100,100,49,40,0);
INSERT into Program values(5,"EE","MT",0,55,50,0,0,0,100);
INSERT into Program values(6,"EE","PhD",0,0,100,0,0,0,200);
INSERT into Program values(7,"ME","BT",54,45,100,100,49,40,0);
INSERT into Program values(8,"ME","MT",0,55,50,0,0,0,100);
INSERT into Program values(9,"ME","PhD",0,0,100,0,0,0,200);
INSERT into Program values(10,"MSE","BT",54,45,100,100,49,40,0);
INSERT into Program values(11,"MSE","MT",0,55,50,0,0,0,100);
INSERT into Program values(12,"MSE","PhD",0,0,100,0,0,0,200);
INSERT into Program values(13,"MTH","BS",54,45,100,100,49,40,0);
INSERT into Program values(14,"MTH","MS",0,55,50,0,0,0,100);
INSERT into Program values(15,"MTH","PhD",0,0,100,0,0,0,200);

INSERT into Course values("ESC101","Introduction to Programming",14);
INSERT into Course values("ESC201","Introduction to Electronics",14);
INSERT into Course values("CS330","Operating Systems",12);
INSERT into Course values("CS399","UG Thesis",9);
INSERT into Course values("CS699","MT Thesis",18);
INSERT into Course values("CS799","PhD Thesis",18);
INSERT into Course values("EE320","Communication Systems",11);
INSERT into Course values("EE399","UG Thesis",9);
INSERT into Course values("EE699","MT Thesis",18);
INSERT into Course values("EE799","PhD Thesis",18);
INSERT into Course values("MTH101","Calculus",11);
INSERT into Course values("MTH102","Linear Algebra",11);
INSERT into Course values("MTH201","Probability and Statistics",11);
INSERT into Course values("ME320","Energy Systems",11);
INSERT into Course values("MSE220","Properties of Matter",8);
INSERT into Course values("TA201","Manufacturing Processes-1",6);
INSERT into Course values("TA202","Manufacturing Processes-2",6);



INSERT into Grade values("A*",10);
INSERT into Grade values("A",10);
INSERT into Grade values("B",8);
INSERT into Grade values("C",6);
INSERT into Grade values("D",4);
INSERT into Grade values("E",2);
INSERT into Grade values("F",0);
INSERT into Grade values("S",0);
INSERT into Grade values("X",0);
INSERT into Grade values("I",0);



INSERT into Professor values(1001,"Arnab Bhattacharya","arnabb@iitk.ac.in","1970-07-20","2001-07-20","CSE","RM504");
INSERT into Professor values(1002,"Piyush Rai","piyush@iitk.ac.in","1985-07-20","2015-07-20","CSE","RM501");
INSERT into Professor values(2001,"Ketan Rajawat","ketan@iitk.ac.in","1985-07-20","2015-07-20","EE","ACES101");
INSERT into Professor values(2002,"A R Harish","harish@iitk.ac.in","1965-07-20","1995-07-20","EE","ACES102");
INSERT into Professor values(3001,"Ishan Sharma","ishan@iitk.ac.in","1985-07-20","2015-07-20","ME","FB203");
INSERT into Professor values(3002,"Nachiketan","nch@iitk.ac.in","1965-07-20","1995-07-20","ME","FB210");
INSERT into Professor values(4001,"Subhra Dhar","sdhar@iitk.ac.in","1985-07-20","2015-07-20","MTH","FB510");
INSERT into Professor values(4002,"Shunmugraj","shun@iitk.ac.in","1965-07-20","1995-07-20","MTH","FB520");

insert into Prof_Designation values(1001,"Professor");
insert into Prof_Designation values(1002,"Professor");
insert into Prof_Designation values(2001,"Assistant Professor");
insert into Prof_Designation values(1001,"HOD");
insert into Prof_Designation values(4002,"Professor");
insert into Prof_Designation values(4002,"DOSA");
insert into Prof_Designation values(3001,"Assistant Professor");
insert into Prof_Designation values(2002,"Professor");
insert into Prof_Designation values(4001,"Associate Professor");
insert into Prof_Designation values(3002,"Professor");

INSERT into Student_Program values(150657,1);
INSERT into Student_Program values(150512,2);
INSERT into Student_Program values(150320,3);
INSERT into Student_Program values(150665,4);
INSERT into Student_Program values(160394,5);
INSERT into Student_Program values(160691,6);
INSERT into Student_Program values(160787,7);
INSERT into Student_Program values(160083,8);
INSERT into Student_Program values(160379,9);
INSERT into Student_Program values(160717,10);
INSERT into Student_Program values(160369,11);
INSERT into Student_Program values(160591,12);
INSERT into Student_Program values(160120,13);
INSERT into Student_Program values(170128,14);
INSERT into Student_Program values(170396,15);
INSERT into Student_Program values(180601,1);
INSERT into Student_Program values(180118,2);
INSERT into Student_Program values(180169,4);
INSERT into Student_Program values(180556,5);
INSERT into Student_Program values(180337,7);

INSERT into Pre_req values("MTH102","MTH101");
INSERT into Pre_req values("CS330","ESC101");
INSERT into Pre_req values("EE320","ESC201");
INSERT into Pre_req values("MSE220","TA201");

INSERT into Student_hall values(150657,1,"A-101");
INSERT into Student_hall values(150512,2,"A-101");
INSERT into Student_hall values(150320,3,"A-101");
INSERT into Student_hall values(150665,4,"A-101");
INSERT into Student_hall values(160394,5,"A-101");
INSERT into Student_hall values(160691,6,"A-101");
INSERT into Student_hall values(160787,7,"A-101");
INSERT into Student_hall values(160083,8,"A-101");
INSERT into Student_hall values(160379,9,"A-101");
INSERT into Student_hall values(160717,10,"A-101");
INSERT into Student_hall values(160369,11,"A-101");
INSERT into Student_hall values(160591,12,"A-101");
INSERT into Student_hall values(160120,13,"A-101");
INSERT into Student_hall values(170128,14,"A-101");
INSERT into Student_hall values(170396,15,"A-101");
INSERT into Student_hall values(180601,1,"A-102");
INSERT into Student_hall values(180118,2,"A-102");
INSERT into Student_hall values(180169,4,"A-102");
INSERT into Student_hall values(180556,5,"A-102");
INSERT into Student_hall values(180337,7,"A-102");



INSERT into Dues values(150657,0,0,0);
INSERT into Dues values(150512,0,0,0);
INSERT into Dues values(150320,0,0,0);
INSERT into Dues values(150665,0,0,0);
INSERT into Dues values(160394,0,0,0);
INSERT into Dues values(160691,0,0,0);
INSERT into Dues values(160787,0,0,0);
INSERT into Dues values(160083,0,0,0);
INSERT into Dues values(160379,0,0,0);
INSERT into Dues values(160717,0,0,0);
INSERT into Dues values(160369,0,0,0);
INSERT into Dues values(160591,0,0,0);
INSERT into Dues values(160120,0,0,0);
INSERT into Dues values(170128,0,0,0);
INSERT into Dues values(170396,0,0,0);
INSERT into Dues values(180601,0,0,0);
INSERT into Dues values(180118,0,0,0);
INSERT into Dues values(180169,0,0,0);
INSERT into Dues values(180556,0,0,0);
INSERT into Dues values(180337,0,0,0);


INSERT into Work_Locations values("RM601","Centre for Cyber Secuirty");
INSERT into Work_Locations values("NCL101","New Core Chemistry Lab");

INSERT into Staff values(9001,"RM601","Avantas Ghosal","Project Engineer");
INSERT into Staff values(9002,"NCL101","Debasis Sundhararajan","Lab Assistant");


INSERT into Library values(1,1001,"C Programming","James Arthur",10);
INSERT into Library values(1,1002,"Introduction to Algorithms","CLRS",20);

INSERT into Book_issued values(1001,160394,"2019-03-05","2019-03-29","2019-03-20");
INSERT into Book_issued values(1002,160394,"2019-03-05","2019-03-29",NULL);

INSERT into Student_governance_body values(1,"Science and Technology Council",2000000);
INSERT into Student_governance_body values(2,"Cultural Council",1000000);
INSERT into Student_governance_body values(3,"Academic Review",30000);

INSERT into Body_members values(1,150657,"SnT General Secretary");
INSERT into Body_members values(1,160083,"Robotics Coordinator");
INSERT into Body_members values(2,160379,"Dance Coordinator");

INSERT into Attendance_salary values("Professor",1001,25,150000);
INSERT into Attendance_salary values("Project Engineer",9001,22,65000);


INSERT into Doctor values(1001,'Rita Mathur','MS','ENT','rita@gmail.com',9876543210);
INSERT into Doctor values(1002,'Anand dubey','MS','Ortho','dubey@gmail.com',9876543220);
INSERT into Doctor values(1003,'Dinesh Shah','MD','Medicine','shah@gmail.com',9874563210);

INSERT into Doctor_availability values(1001,1100,0011,1010,1010,1010,1100,0001);
INSERT into Doctor_availability values(1002,0001,1100,0111,0110,1011,0110,0011);
INSERT into Doctor_availability values(1003,0011,0111,0110,0001,1110,0011,1100);

INSERT into Treatment values('Professor',2001,'Spouse',1001);
INSERT into Treatment values('Student',160787,'Self',1002);
INSERT into Treatment values('Staff',9001,'Self',1003);

INSERT into Patient_appointment values('Professor',2001,1001,1,'2019-03-12 09:00:00');
INSERT into Patient_appointment values('Student',160787,1002,2,'2019-03-12 12:00:00');
INSERT into Patient_appointment values('Staff',9001,1003,3,'2019-03-12 14:00:00');


INSERT into Course_offered values("ESC101",1,2019,1002,"IC",b'00001011100000001110000010111000000011100000101110');
INSERT into Course_offered values("CS330",1,2019,1001,"ESO",b'00100000000000000000001000000000000000000010000000');
INSERT into Course_offered values("ESC201",1,2019,2001,"IC",b'10000011100000001110100000111000000011101000001110');
INSERT into Course_offered values("EE320",1,2019,2002,"DC",b'10000000000000000000100000000000000000001000000000');
INSERT into Course_offered values("ME320",1,2019,3001,"DE",b'00100000000000000000001000000000000000000010000000');
INSERT into Course_offered values("MSE220",1,2019,3001,"DE",b'00100000000000000000001000000000000000000010000000');
INSERT into Course_offered values("MTH101",1,2019,4001,"IC",b'00100000000000000000001000000000000000000010000000');

INSERT into Course_request values("ESC101",1,2019,1002,180556,"Pending","IC");
INSERT into Course_request values("CS330",1,2019,1001,170128,"Pending","ESO");
INSERT into Course_request values("ESC201",1,2019,2001,170396,"Pending","IC");
INSERT into Course_request values("EE320",1,2019,2002,150665,"Pending","DC");
INSERT into Course_request values("ME320",1,2019,3001,160787,"Pending","DE");
INSERT into Course_request values("MSE220",1,2019,3001,160717,"Pending","DE");
INSERT into Course_request values("MTH101",1,2019,4001,180556,"Pending","IC");



INSERT into Course_Profs values("ESC101",1002,"Instructor in-Charge");
INSERT into Course_Profs values("ESC101",1001,"Tutor");
INSERT into Course_Profs values("CS330",1001,"Instructor in-Charge");
INSERT into Course_Profs values("ESC201",2001,"Instructor in-Charge");
INSERT into Course_Profs values("ESC201",2002,"Tutor");
INSERT into Course_Profs values("EE320",2002,"Instructor in-Charge");
INSERT into Course_Profs values("ME320",3001,"Instructor in-Charge");
INSERT into Course_Profs values("MSE220",3001,"Instructor in-Charge");
INSERT into Course_Profs values("MTH101",4001,"Instructor in-Charge");

INSERT into TA values("ME320",1,2019,160083);
INSERT into TA values("EE320",1,2019,160691);
INSERT into TA values("CS330",1,2019,150320);

INSERT into Mentoring values(1001,150657,'CS399');
INSERT into Mentoring values(1002,150512,'CS699');
INSERT into Mentoring values(1002,150320,'CS799');

INSERT into Ongoing values(1,2019,"2019-04-22");

INSERT into Bookings values("SnT General Secretary","L7","LHC","2019-04-30 19:00:00","2019-04-30 20:00:00");




-- UPDATE Course_request set status="Accepted" where Course_code="ESC101" and Roll_no=180556;
--
-- UPDATE Course_registration set grade="A" where Course_code="ESC101" and Roll_no=180556;
