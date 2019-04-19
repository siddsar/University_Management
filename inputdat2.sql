INSERT into Course_offered values("ESC101",1,2019,1002,"IC",b'00001011100000001110000010111000000011100000101110');
INSERT into Course_offered values("CS330",1,2019,1001,"ESO",b'00100000000000000000001000000000000000000010000000');
INSERT into Course_offered values("ESC201",1,2019,2001,"IC",b'10000011100000001110100000111000000011101000001110');
INSERT into Course_offered values("EE320",1,2019,2002,"DC",b'10000000000000000000100000000000000000001000000000');
INSERT into Course_offered values("ME320",1,2019,3001,"DE",b'00100000000000000000001000000000000000000010000000');
INSERT into Course_offered values("MSE220",1,2019,3001,"DE",b'00100000000000000000001000000000000000000010000000');
INSERT into Course_offered values("MTH101",1,2019,4001,"IC",b'00100000000000000000001000000000000000000010000000');

INSERT into Course_request values("ESC101",1,2019,1002,180556,"Accepted","IC");
INSERT into Course_request values("CS330",1,2019,1001,170128,"Pending","ESO");
INSERT into Course_request values("ESC201",1,2019,2001,170396,"Accepted","IC");
INSERT into Course_request values("EE320",1,2019,2002,150665,"Pending","DC");
INSERT into Course_request values("ME320",1,2019,3001,160787,"Rejected","DE");
INSERT into Course_request values("MSE220",1,2019,3001,160717,"Pending","DE");
INSERT into Course_request values("MTH101",1,2019,4001,180556,"Pending","IC");

insert into TA values("ME320",1,2019,160083);
insert into TA values("EE320",1,2019,160691);
insert into TA values("CS330",1,2019,150320);

insert into Mentoring values(1001,150657,'CS399');
insert into Mentoring values(1002,150512,'CS699');
insert into Mentoring values(1002,150320,'CS799');

insert into Doctor values(1001,'Rita Mathur','MS','ENT','rita@gmail.com',9876543210);
insert into Doctor values(1002,'Anand dubey','MS','Ortho','dubey@gmail.com',9876543220);
insert into Doctor values(1003,'Dinesh Shah','MD','Medicine','shah@gmail.com',9874563210);

insert into Doctor_availability values(1001,1100,0011,1010,1010,1010,1100,0001);
insert into Doctor_availability values(1002,0001,1100,0111,0110,1011,0110,0011);
insert into Doctor_availability values(1003,0011,0111,0110,0001,1110,0011,1100);

insert into Treatment values('Professor',2001,'Spouse',1001);
insert into Treatment values('Student',160787,'Self',1002);
insert into Treatment values('Staff',9001,'Self',1003);

insert into Patient_appointment values('Professor',2001,1001,1,'2019-03-12 09:00:00');
insert into Patient_appointment values('Student',160787,1002,2,'2019-03-12 12:00:00');
insert into Patient_appointment values('Staff',9001,1003,3,'2019-03-12 14:00:00');


