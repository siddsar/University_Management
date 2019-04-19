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


