create database dbms_company;
use dbms_company;

create table University(
Uid varchar(10),
Name varchar(30),
No_of_Students integer(10),
NAAC_Credits varchar(5),
Affiliation varchar(20),
TPO varchar(20),
TPO_Phone varchar(10),
constraint pku primary key (Uid));

create table Placement_Record(
MOU_Signed integer,
Package_gt_15 integer,
Package_bw_5_15 integer,
Package_lt_5 integer,
Uid varchar(10),
constraint pkpr primary key (Uid),
constraint fkpr foreign key (Uid) references University(Uid));

create table Domain(
Name varchar(10),
No_Of_Students integer(10),
Uid varchar(10),
constraint fkd foreign key (Uid) references University(Uid));

create table Teams(
Team_name varchar(20),
Student_USN varchar(10),
Role varchar(20),
Uid varchar(10),
constraint pkt primary key (Team_name,Student_USN,Uid),
constraint fkt foreign key (Uid) references University(Uid));

create table Projects(
Name varchar(20),
Team_name varchar(20),
Uid varchar(10),
constraint fkpu foreign key (Uid) references University (Uid),
constraint fkpt foreign key (Team_name) references Teams (Team_name));

create table Achievements(
Event_name varchar(20),
Year integer,
Status varchar(10),
Team_Name varchar(20),
Uid varchar(10),
constraint pka primary key (Event_name,Team_Name,Uid),
constraint fkat foreign key (Team_name) references Teams (Team_name),
constraint fkau foreign key (Uid) references University (Uid));

create table Companies(
Name varchar(20),
Year integer,
No_of_recruit integer,
Uid varchar(10),
constraint pkc primary key (Name,Year,Uid),
constraint fkcu foreign key (Uid) references University (Uid));

create table Points(
Uid varchar(10),
Score integer,
constraint pkp primary key (Uid),
constraint fkp foreign key (Uid) references University (Uid));

insert into University values("1BI","BIT",7500,"A++","VTU","Girish","6362347005");

insert into Placement_Record values(50, 1370,14829,9856,"1BI");

insert into Domain values("CSE",764,"1BI");
insert into Domain values("AI",712,"1BI");
insert into Domain values("ECE",688,"1BI");
insert into Domain values("CIV",512,"1BI");
insert into Domain values("ME",498,"1BI");

insert into Teams values("Debuggers","1BI21CS062","Machine Learning","1BI");
insert into Teams values("Debuggers","1BI21CS011","Machine Learning","1BI");
insert into Teams values("Debuggers","1BI21CS015","App Developerr","1BI");

insert into Projects values("SpotECare","Debuggers","1BI");

insert into Achievements values("Women's Hackathon",2023,"8th","Debuggers","1BI");

insert into Companies values("Boeing",2023,12,"1BI");

select Name,No_of_Students,NAAC_Credits from University where Uid="1BI";
select Package_gt_15,Package_bw_5_15,Package_lt_5 from Placement_Record where Uid="1BI";
select Event_name,Year,Status,Team_Name from Achievements where Uid="1BI";
select Name,No_of_Students from Domain where Uid="1BI";
select TPO,TPO_Phone from University where Uid="1BI";

#3 credits for naac,3 credits for package >15, 2 credits for package bw 15 and 5, 1 credit for 
#package lt 5, 2 credits for projects, 3 credits for achievements, 2 credits for no of companies

-- select (3*(select case
-- when NAAC_Credits='A++' then 7
-- when NAAC_Credits='A+' then 6
-- when NAAC_Credits='A' then 5
-- when NAAC_Credits='B++' then 4
-- when NAAC_Credits='B+' then 3
-- when NAAC_Credits='B' then 2
-- when NAAC_Credits='C' then 1
-- when NAAC_Credits='D' then 0
-- end
-- from University where Uid="1BI")
-- +3*(select Package_gt_15 from Placement_Record where Uid="1BI")
-- +2*(select Package_bw_5_15 from Placement_Record where Uid="1BI")
-- +1*(select Package_lt_5 from Placement_Record where Uid="1BI")
-- +2*(select count(*) from Projects where Uid="1BI")
-- +3*(select count(*) from Achievements where Uid="1BI")
-- +2*(select count(*) from Companies where Uid="1BI"))/(3+3+2+1+2+3+2) as rsult;

delimiter //
create trigger T1 after insert on university for each row
begin
insert into Placement_Record values(0,0,0,0,new.Uid);
insert into Points values(new.Uid,0);
update Points set Score=(select (3*(select case
when NAAC_Credits='A++' then 7
when NAAC_Credits='A+' then 6
when NAAC_Credits='A' then 5
when NAAC_Credits='B++' then 4
when NAAC_Credits='B+' then 3
when NAAC_Credits='B' then 2
when NAAC_Credits='C' then 1
when NAAC_Credits='D' then 0
end
from University where Uid=new.Uid)
+3*(select Package_gt_15 from Placement_Record where Uid=new.Uid)
+2*(select Package_bw_5_15 from Placement_Record where Uid=new.Uid)
+1*(select Package_lt_5 from Placement_Record where Uid=new.Uid)
+2*(select count(*) from Projects where Uid=new.Uid)
+3*(select count(*) from Achievements where Uid=new.Uid)
+2*(select count(*) from Companies where Uid=new.Uid))/(3+3+2+1+2+3+2) as rsult) where Uid=new.Uid;
end; //

delimiter //
create trigger T2 after update on university for each row
begin
update Points set Score=(select (3*(select case
when NAAC_Credits='A++' then 7
when NAAC_Credits='A+' then 6
when NAAC_Credits='A' then 5
when NAAC_Credits='B++' then 4
when NAAC_Credits='B+' then 3
when NAAC_Credits='B' then 2
when NAAC_Credits='C' then 1
when NAAC_Credits='D' then 0
end
from University where Uid=new.Uid)
+3*(select Package_gt_15 from Placement_Record where Uid=new.Uid)
+2*(select Package_bw_5_15 from Placement_Record where Uid=new.Uid)
+1*(select Package_lt_5 from Placement_Record where Uid=new.Uid)
+2*(select count(*) from Projects where Uid=new.Uid)
+3*(select count(*) from Achievements where Uid=new.Uid)
+2*(select count(*) from Companies where Uid=new.Uid))/(3+3+2+1+2+3+2) as rsult) where Uid=new.Uid;
end; //

delimiter //
create trigger T3 after update on Placement_record for each row
begin
update Points set Score=(select (3*(select case
when NAAC_Credits='A++' then 7
when NAAC_Credits='A+' then 6
when NAAC_Credits='A' then 5
when NAAC_Credits='B++' then 4
when NAAC_Credits='B+' then 3
when NAAC_Credits='B' then 2
when NAAC_Credits='C' then 1
when NAAC_Credits='D' then 0
end
from University where Uid=new.Uid)
+3*(select Package_gt_15 from Placement_Record where Uid=new.Uid)
+2*(select Package_bw_5_15 from Placement_Record where Uid=new.Uid)
+1*(select Package_lt_5 from Placement_Record where Uid=new.Uid)
+2*(select count(*) from Projects where Uid=new.Uid)
+3*(select count(*) from Achievements where Uid=new.Uid)
+2*(select count(*) from Companies where Uid=new.Uid))/(3+3+2+1+2+3+2) as rsult) where Uid=new.Uid;
end; //

delimiter //
create trigger T4 after insert on Projects for each row
begin
update Points set Score=(select (3*(select case
when NAAC_Credits='A++' then 7
when NAAC_Credits='A+' then 6
when NAAC_Credits='A' then 5
when NAAC_Credits='B++' then 4
when NAAC_Credits='B+' then 3
when NAAC_Credits='B' then 2
when NAAC_Credits='C' then 1
when NAAC_Credits='D' then 0
end
from University where Uid=new.Uid)
+3*(select Package_gt_15 from Placement_Record where Uid=new.Uid)
+2*(select Package_bw_5_15 from Placement_Record where Uid=new.Uid)
+1*(select Package_lt_5 from Placement_Record where Uid=new.Uid)
+2*(select count(*) from Projects where Uid=new.Uid)
+3*(select count(*) from Achievements where Uid=new.Uid)
+2*(select count(*) from Companies where Uid=new.Uid))/(3+3+2+1+2+3+2) as rsult) where Uid=new.Uid;
end; //

delimiter //
create trigger T5 after insert on Achievements for each row
begin
update Points set Score=(select (3*(select case
when NAAC_Credits='A++' then 7
when NAAC_Credits='A+' then 6
when NAAC_Credits='A' then 5
when NAAC_Credits='B++' then 4
when NAAC_Credits='B+' then 3
when NAAC_Credits='B' then 2
when NAAC_Credits='C' then 1
when NAAC_Credits='D' then 0
end
from University where Uid=new.Uid)
+3*(select Package_gt_15 from Placement_Record where Uid=new.Uid)
+2*(select Package_bw_5_15 from Placement_Record where Uid=new.Uid)
+1*(select Package_lt_5 from Placement_Record where Uid=new.Uid)
+2*(select count(*) from Projects where Uid=new.Uid)
+3*(select count(*) from Achievements where Uid=new.Uid)
+2*(select count(*) from Companies where Uid=new.Uid))/(3+3+2+1+2+3+2) as rsult) where Uid=new.Uid;
end; //

delimiter //
create trigger T6 after insert on Companies for each row
begin
update Points set Score=(select (3*(select case
when NAAC_Credits='A++' then 7
when NAAC_Credits='A+' then 6
when NAAC_Credits='A' then 5
when NAAC_Credits='B++' then 4
when NAAC_Credits='B+' then 3
when NAAC_Credits='B' then 2
when NAAC_Credits='C' then 1
when NAAC_Credits='D' then 0
end
from University where Uid=new.Uid)
+3*(select Package_gt_15 from Placement_Record where Uid=new.Uid)
+2*(select Package_bw_5_15 from Placement_Record where Uid=new.Uid)
+1*(select Package_lt_5 from Placement_Record where Uid=new.Uid)
+2*(select count(*) from Projects where Uid=new.Uid)
+3*(select count(*) from Achievements where Uid=new.Uid)
+2*(select count(*) from Companies where Uid=new.Uid))/(3+3+2+1+2+3+2) as rsult) where Uid=new.Uid;
end; //
delimiter ;

create table Acc_Details(
Username varchar(30),
Password varchar(20),
Acc_Type varchar(10),
constraint pkad primary key (username));

insert into Acc_Details values("bit-bangalore@edu.in","bit@vvpura","College");