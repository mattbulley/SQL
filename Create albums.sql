create table IF NOT EXISTS albums(albumID int not null,
					FirstName varchar(255),
                    UNIQUE(albumID));
                    
create table IF NOT EXISTS people(My_ID int not null auto_increment,
									F_Name varchar(255),
                                    L_Name varchar(255),
                                    Age int,
                                    Country varchar(255),
                                    primary key(My_ID)
                                    );
                                    
insert into people(F_Name, L_Name, Age, Country) values ('Alice','Beacher',26,'America');
insert into people(F_Name, L_Name, Age, Country) values ('John','Smith',32,'Finland');
insert into people(F_Name, L_Name, Age, Country) values ('Alex','Knowles',18,'UK');


select F_Name from people;

create database if not exists mydatabase;

drop schema if exists mydatabase;

drop table if exists people;

select * from people;

alter table people add Status int;
alter table people modify Status varchar(255);

alter table people drop column Status;

update people set L_Name='Day', Age = 25 where My_ID = 2;

select distinct age from people;

select F_Name from people where age between 18 and 25;

