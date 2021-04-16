create database digital_breakthrough;

create schema dwh;

create table dwh.dim_citizenship(
	citizenship_id serial primary key,
	citizenship_name varchar(200),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table fct_address(
	address_id serial primary key,
	city_name varchar(300),
	street_name varchar(400),
	house_number varchar(20),
	building_name varchar(20),
	housing_name varchar(20)
);

create table dwh.dim_calendar(
	date_id serial primary key,
	date_value date,
	day_num int,
	month_num int,
	year_num int,
	month_name varchar(20),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.dim_family_cathegory(
	family_cathegory_id serial primary key,
	family_cathegory_name varchar(300),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.dim_training_direction(
	training_direction_id serial primary key,
	training_direction_name varchar(300),
	training_direction_month_qnt int,
	profession_name varchar(300),
	ok_profession_name varchar(300),
	req_education varchar(100),
	training_direction_type varchar(50),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.fct_creative_achievements_name(
	creative_achievements_id serial primary key,
	creative_achievements_name varchar(300),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.fct_enrollee(
	enrollee_id serial primary key,
	enrollee_first_name varchar(200),
	enrollee_second_name varchar(200),
	enrollee_surname varchar(200),
	birthday_dt date,
	birth_place int references dwh.fct_address(address_id),
	citizenship_id int references dwh.dim_citizenship(citizenship_id),
	address_id int references dwh.fct_address(address_id),
	mobile_phone_number varchar(30),
	home_phone_number varchar(30),
	email varchar(100),
	dormitory_need bool,
	family_cathegory_id int references dwh.dim_family_cathegory(family_cathegory_id),
	first_enrollee_spo bool,
	orphan bool,
	disabled bool,
	signature_photo_path varchar(200)
);

create table dwh.dim_passport(
	passport_id serial primary key,
	p_series varchar(4),
	p_number varchar(6),
	issue_dt date,
	issue_place varchar(150),
	enrollee_id int references dwh.fct_enrollee(enrollee_id)
);

create table dwh.dim_education_level(
	education_level_id serial primary key,
	education_level_name varchar(200),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
)

create table dwh.fct_education(
	education_id serial primary key,
	enrollee_id int references dwh.fct_enrollee(enrollee_id),
	education_place varchar(300),
	education_level_id int references dwh.dim_education_level(education_level_id),
	education_document varchar(300),
	english_edu bool,
	target_direction bool
);

create table dwh.fct_enr_achievements(
	enr_achievement_id serial primary key,
	olympiad_name varchar(300),
	winner bool,
	prize_winner bool,
	olympiad_level varchar(100),
	enrollee_id int references dwh.fct_enrollee(enrollee_id)
);

create table dwh.fct_creative_achievements(
	creative_achievement_id serial primary key,
	enrollee_id int references dwh.fct_enrollee(enrollee_id),
	creative_achievements_id int references dwh.fct_creative_achievements_name(creative_achievements_id),
	supporting_doc_name varchar(400)
);

create table dwh.dim_sports_type(
	sport_type_id serial primary key,
	sports_type_name varchar(100),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.fct_sports_achievements(
	sports_achievements_id serial primary key,
	enrollee_id int references dwh.fct_enrollee(enrollee_id),
	sport_type_id int references dwh.dim_sports_type(sport_type_id),
	supporting_doc_name varchar(400)
);

create table dwh.fct_enrollee_parents_info(
	enrollee_parent_info_id serial primary key,
	enrollee_id int references dwh.fct_enrollee(enrollee_id),
	parent_first_name varchar(200),
	parent_second_name varchar(200),
	parent_surname varchar(200),
	address_id int references dwh.fct_address(address_id),
	work_place_name varchar(300),
	work_position varchar(300),
	mobile_phone_number varchar(30),
	email varchar(100)
);

create table dwh.dim_forms_of_study(
	form_of_study_id serial primary key,
	forms_of_study_name varchar(100),
	education_system varchar(100),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.dim_acceptance_applications_dt(
	acceptance_application_dt_id serial primary key,
	start_acceptance_applications_dttm timestamp,
	end_acceptance_applications_dttm timestamp,
	form_of_study_id int references dwh.dim_forms_of_study(form_of_study_id),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.fct_documents_acceptance(
	document_acceptance_id serial primary key,
	document_acceptance_dttm timestamptz,
	original bool,
	form_of_study_id int references dwh.dim_forms_of_study(form_of_study_id),
	enrollee_id int references dwh.fct_enrollee(enrollee_id),
	certificate_avg_mark numeric(1,1)
	--Приём выпускников со свидетельством об обучении
);

create table dwh.fct_enrollment(
	enrollment_id serial primary key,
	document_acceptance_id int references dwh.fct_documents_acceptance(document_acceptance_id),
	enrollment_dttm timestamptz
);

create table dwh.dim_region(
	region_id serial primary key,
	region_name varchar(100),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.dim_tomsk_regions(
	tomsk_region_id serial primary key,
	tomsk_region_name varchar(100),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.dim_tomsk_cities(
	tomsk_city_id serial primary key,
	tomsk_region_id int references dwh.dim_tomsk_regions(tomsk_region_id),
	tomsk_city_name varchar(100),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.dim_organizations_and_branches(
	org_id serial primary key,
	org_name varchar(300),
	org_dsc varchar(500),
	tomsk_city_id int references dwh.dim_tomsk_cities(tomsk_city_id),
	eff_dttm timestamptz default now(),
	exp_dttm timestamptz default '2999-12-31',
	load_dttm timestamptz default now()
);

create table dwh.org_employees(
	org_employee_id serial primary key,
	org_id int references dwh.dim_organizations_and_branches(org_id),
	employee_first_name varchar(200),
	employee_second_name varchar(200),
	employee_surname varchar(200),
	mobile_phone varchar(30),
	is_user_id int references dwh.is_users(is_user_id)
	--мб ещё что-то надо будет
);

create table dwh.dep_employees(
	dep_employee_id serial primary key,
	employee_first_name varchar(200),
	employee_second_name varchar(200),
	employee_surname varchar(200),
	mobile_phone varchar(30),
	registration_dttm timestamptz,
	is_user_id int references dwh.is_users(is_user_id)
	--мб ещё что-то надо будет
);

create table dwh.is_users(
	is_user_id serial primary key,
	user_login varchar(100),
	user_password uuid
)
