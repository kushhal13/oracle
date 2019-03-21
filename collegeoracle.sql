create table District_Master(
  District_Code number(20) NOT NULL,
  District_Name varchar2(40) NOT NULL,
  Constraint PK_District_Master Primary Key(District_Code)
);

create table Religion_Master(
  Religion_Code number(20) NOT NULL,
  Religion_Name varchar2(40) NOT NULL,
  Constraint PK_Religion_Master Primary Key(Religion_Code)
);

create table Relation_Master(
  Relation_Code number(20) NOT NULL,
  Relation_Name varchar2(40) NOT NULL,
  Constraint PK_Relation_Master Primary Key(Relation_Code)
);

create table Blood_Group(
  Group_Code number(20) NOT NULL,
  Group_Name varchar2(40) NOT NULL,
  Constraint PK_Blood_Group Primary Key(Group_Code)
);

create table Post_Master(
  Post_Code number(20) NOT NULL,
  Post_Name varchar2(40) NOT NULL,
  Constraint PK_Post_Master Primary Key(Post_Code)
);

create table Unit_Master(
  Unit_Code number(20) NOT NULL,
  Unit_Name varchar2(40) NOT NULL,
  Constraint PK_Unit_Master Primary Key(Unit_Code)
);

create table Award_Master(
  Award_Code number(20) NOT NULL,
  Award_Name varchar2(40) NOT NULL,
  Constraint PK_Award_Master Primary Key(Award_Code)
);

create table Training_Master(
  Training_Code number(20) NOT NULL,
  Training_Name varchar2(40) NOT NULL,
  Constraint PK_Training_Master Primary Key(Training_Code)
);

create table Institute_Master(
  Institute_Code number(20) NOT NULL,
  Institute_Name varchar2(40) NOT NULL,
  Constraint PK_Institute_Master Primary Key(Institute_Code)
);

create table Punishment_Master(
  Punishment_Code number(20) NOT NULL,
  Punishment_Name varchar2(40) NOT NULL,
  Constraint PK_Punishment_Master Primary Key(Punishment_Code)
);

create table Education_Master(
  Education_Code number(20) NOT NULL,
  Education_Name varchar2(40) NOT NULL,
  Constraint PK_Education_Master Primary Key(Education_Code)
);

create table University_Master(
  University_Code number(20) NOT NULL,
  University_Name varchar2(40) NOT NULL,
  Constraint PK_University_Master Primary Key(University_Code)
);

create table Country_Master(
  Country_Code number(20) NOT NULL,
  Country_Name varchar2(40) NOT NULL,
  Constraint PK_Country_Master Primary Key(Country_Code)
);

create table Personnel_Detail(
  Emp_Number number(20) not null,
  First_Name varchar2(40),
  Mid_Name varchar2(40),
  Last_Name varchar2(40),
  Perma_District_Code number(20) not null,
  Perma_VDC_NP varchar2(40),
  Perma_Ward_No number(20),
  Perma_Tole varchar2(40),
  Temp_District_Code number(20) not null,
  Temp_VDC_NP varchar2(40),
  Temp_Ward_No number(20),
  Temp_Tole varchar2(40),
  Gender varchar2(20),
  Religion_Code number(20) not null,
  Father_Name varchar2(40),
  Grand_Father_Name varchar2(40),
  Date_Birth_AD date,
  Date_Birth_BS date,
  Nom_Name varchar2(40),
  Nom_Relation number(20) not null,
  Nom_Address varchar2(40),
  Height number(20),
  Blood_Group number(10) not null,
  Appoint_Date_AD date,
  Appoint_Date_BS date,
  Appoint_Age number(20),
  Appoint_Post number(20) not null,
  Appoint_Unit number(20) not null,
  Enter_By varchar2(40) not null,
  Enter_Date_AD date not null,
  constraint PK_Personnel_Detail primary key(Emp_Number),
  constraint fk_PD_Code foreign key(Perma_District_Code) references District_Master(District_Code),
  constraint fk_TD_Code foreign key(Temp_District_Code) references District_Master(District_Code),
  constraint fk_Religionpd_Code foreign key(Religion_Code) references Religion_Master(Religion_Code),
  constraint fk_Relationpd_Code foreign key(Nom_Relation) references Relation_Master(Relation_Code),
  constraint fk_Bloodpd_Group foreign key(Blood_Group) references Blood_Group(Group_Code),
  constraint fk_Appointpd_Post foreign key(Appoint_Post) references Post_Master(Post_Code),
  constraint fk_Appointpd_Unit foreign key(Appoint_Unit) references Unit_Master(Unit_Code)
);

create table Training_Detail(
  Emp_Number number(20) not null,
  SN number(10) not null,
  Training_Code number(20) not null,
  From_Date_BS date not null,
  From_Date_AD date not null,
  To_Date_BS date not null,
  To_Date_AD date not null,
  Country_Code number(20) not null,
  Institute_Code number(20) not null,
  Enter_By varchar2(40) not null,
  Enter_Date_AD date not null,
  constraint fk_Emptr_Number foreign key(Emp_Number) references Personnel_Detail(Emp_Number),
  constraint fk_Trainingd_Code foreign key(Training_Code) references Training_Master(Training_Code),
  constraint fk_Countryd_Code foreign key(Country_Code) references Country_Master(Country_Code),
  constraint fk_Instituted_Code foreign key(Institute_Code) references Institute_Master(Institute_Code)
);

create table Promotion_Detail(
  Emp_Number number(20) not null,
  Promo_Date_AD date,
  Promo_Date_BS date,
  Position_Code number(20) not null,
  Promotion_Type varchar2(40),
  Order_Date_AD date not null,
  Order_Date_BS date not null,
  Authorised_By number(20) not null,
  Authorised_By_Unit number(20) not null,
  Enter_By varchar2(40) not null,
  Enter_Date_AD date not null,
  constraint fk_Emppd_Number foreign key(Emp_Number) references Personnel_Detail(Emp_Number),
  constraint fk_Authorisedp_By foreign key(Authorised_By) references Post_Master(Post_Code),
  constraint fk_Authorisedp_By_Unit foreign key(Authorised_By_Unit) references Unit_Master(Unit_Code)
);

create table Award_Detail(
  Emp_Number number(20) not null,
  SN number(20) not null,
  Award_Code number(20) not null,
  Date_BS date not null,
  Date_AD date not null,
  By_Unit_Code number(20) not null,
  Remarks varchar2(80) not null,
  Enter_By varchar2(40) not null,
  Enter_Date_AD date not null,
  constraint fk_Empad_Number foreign key(Emp_Number) references Personnel_Detail(Emp_Number),
  constraint fk_Awardd_Code foreign key(Award_Code) references Award_Master(Award_Code),
  constraint fk_By_Unitad_Code foreign key(By_Unit_Code) references Unit_Master(Unit_Code)
);

create table Punishment_Detail(
  Emp_Number number(20) not null,
  SN number(20) not null,
  Punishment_Code number(20) not null,
  Date_BS date not null,
  Date_AD date not null,
  By_Unit_Code number(20) not null,
  Remarks varchar2(80) not null,
  Enter_By varchar2(40) not null,
  Enter_Date_AD date not null,
  constraint fk_Emppud_Number foreign key(Emp_Number) references Personnel_Detail(Emp_Number),
  constraint fk_Punishmentd_Code foreign key(Punishment_Code) references Punishment_Master(Punishment_Code),
  constraint fk_By_Unitpd_Code foreign key(By_Unit_Code) references Unit_Master(Unit_Code)
);

create table Education_Detail(
  Emp_Number number(20) not null,
  SN number(20) not null,
  Education_Code number(20) not null,
  Comp_Date_AD date not null,
  Comp_Date_BS date not null,
  Country_Code number(20) not null,
  University_Code number(20) not null,
  Remarks varchar2(80) not null,
  Enter_By varchar2(40) not null,
  Enter_Date_AD date not null,
  constraint fk_Emped_Number foreign key(Emp_Number) references Personnel_Detail(Emp_Number),
  constraint fk_Educationed_Code foreign key(Education_Code) references Education_Master(Education_Code),
  constraint fk_Countryed_Code foreign key(Country_Code) references Country_Master(Country_Code),
  constraint fk_Universityed_Code foreign key(University_Code) references University_Master(University_Code)
);

create table Job_Termination_Detail(
  Emp_Number number(20) not null,
  Termination_Date_AD date,
  Termination_Date_BS date,
  Termination_Type varchar2(40) not null,
  Authorised_By_Code number(20) not null,
  Authorised_By_Unit number(20) not null,
  Enter_Date_AD date not null,
  constraint fk_Empjtd_Number foreign key(Emp_Number) references Personnel_Detail(Emp_Number),
  constraint fk_Authorisedjtd_By_Code foreign key(Authorised_By_Code) references Post_Master(Post_Code),
  constraint fk_Authorisedjtd_By_Unit foreign key(Authorised_By_Unit) references Unit_Master(Unit_Code)
);

create table Transfer_Detail(
  Emp_Number number(20) not null,
  Transfer_Date_AD date not null,
  Transfer_Date_BS date not null,
  Transfer_Type varchar2(40),
  Service_Type_Code number(20),
  Transfer_Unit number(20),
  Authorised_By number(20) not null,
  Authorised_By_Unit number(20) not null,
  Enter_By varchar2(40) not null,
  Enter_Date_AD date not null,
  constraint fk_Empted_Number foreign key(Emp_Number) references Personnel_Detail(Emp_Number),
  constraint fk_Transferd_Unit foreign key(Transfer_Unit) references Unit_Master(Unit_Code),
  constraint fk_Authorisedtd_By_Unit foreign key(Authorised_By_Unit) references Unit_Master(Unit_Code)
);

