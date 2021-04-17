create database digital_breakthrough;

create schema dwh;

create table dwh.dim_calendar (
	date_id serial not null,
	date_value date null,
	day_num int4 null,
	month_num int4 null,
	year_num int4 null,
	month_name varchar(20) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_calendar_pkey primary key (date_id)
);

create table dwh.dim_citizenship (
	citizenship_id serial not null,
	citizenship_name varchar(200) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_citizenship_pkey primary key (citizenship_id)
);

create table dwh.dim_education_level (
	education_level_id serial not null,
	education_level_name varchar(200) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_education_level_pkey primary key (education_level_id)
);

create table dwh.dim_family_cathegory (
	family_cathegory_id serial not null,
	family_cathegory_name varchar(300) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_family_cathegory_pkey primary key (family_cathegory_id)
);

create table dwh.dim_forms_of_study (
	form_of_study_id serial not null,
	forms_of_study_name varchar(100) null,
	education_system varchar(100) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	form_of_study_type varchar(50) null,
	constraint dim_forms_of_study_pkey primary key (form_of_study_id)
);

create table dwh.dim_region (
	region_id serial not null,
	region_name varchar(100) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_region_pkey primary key (region_id)
);

create table dwh.dim_sports_type (
	sport_type_id serial not null,
	sports_type_name varchar(100) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_sports_type_pkey primary key (sport_type_id)
);

create table dwh.dim_tomsk_regions (
	tomsk_region_id serial not null,
	tomsk_region_name varchar(100) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_tomsk_regions_pkey primary key (tomsk_region_id)
);

create table dwh.dim_training_direction (
	training_direction_id serial not null,
	training_direction_name varchar(300) null,
	training_direction_month_qnt int4 null,
	profession_name varchar(300) null,
	ok_profession_name varchar(300) null,
	req_education varchar(100) null,
	training_direction_type varchar(50) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_training_direction_pkey primary key (training_direction_id)
);

create table dwh.fct_address (
	address_id serial not null,
	city_name varchar(300) null,
	street_name varchar(400) null,
	house_number varchar(20) null,
	building_name varchar(20) null,
	housing_name varchar(20) null,
	city_region varchar(200) null,
	constraint fct_address_pkey primary key (address_id)
);

create table dwh.fct_creative_achievements_name (
	creative_achievements_id serial not null,
	creative_achievements_name varchar(300) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint fct_creative_achievements_name_pkey primary key (creative_achievements_id)
);

create table dwh.is_users (
	is_user_id serial not null,
	user_login varchar(100) null,
	user_password varchar(100) null,
	constraint is_users_pkey primary key (is_user_id)
);

create table dwh.dep_employees (
	dep_employee_id serial not null,
	employee_first_name varchar(200) null,
	employee_second_name varchar(200) null,
	employee_surname varchar(200) null,
	mobile_phone varchar(30) null,
	registration_dttm timestamptz null,
	is_user_id int4 null,
	constraint dep_employees_pkey primary key (dep_employee_id),
	constraint dep_employees_is_user_id_fkey foreign key (is_user_id) references dwh.is_users(is_user_id)
);

create table dwh.dim_acceptance_applications_dt (
	acceptance_application_dt_id serial not null,
	start_acceptance_applications_dttm timestamp null,
	end_acceptance_applications_dttm timestamp null,
	form_of_study_id int4 null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_acceptance_applications_dt_pkey primary key (acceptance_application_dt_id),
	constraint dim_acceptance_applications_dt_form_of_study_id_fkey foreign key (form_of_study_id) references dwh.dim_forms_of_study(form_of_study_id)
);

create table dwh.dim_tomsk_cities (
	tomsk_city_id serial not null,
	tomsk_region_id int4 null,
	tomsk_city_name varchar(100) null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_tomsk_cities_pkey primary key (tomsk_city_id),
	constraint dim_tomsk_cities_tomsk_region_id_fkey foreign key (tomsk_region_id) references dwh.dim_tomsk_regions(tomsk_region_id)
);

create table dwh.fct_enrollee (
	enrollee_id serial not null,
	enrollee_first_name varchar(200) null,
	enrollee_second_name varchar(200) null,
	enrollee_surname varchar(200) null,
	birthday_dt date null,
	birth_place int4 null,
	citizenship_id int4 null,
	address_id int4 null,
	mobile_phone_number varchar(30) null,
	home_phone_number varchar(30) null,
	email varchar(100) null,
	dormitory_need bool null,
	family_cathegory_id int4 null,
	first_enrollee_spo bool null,
	orphan bool null,
	disabled bool null,
	signature_photo_path varchar(200) null,
	student bool null,
	constraint fct_enrollee_pkey primary key (enrollee_id),
	constraint fct_enrollee_address_id_fkey foreign key (address_id) references dwh.fct_address(address_id),
	constraint fct_enrollee_birth_place_fkey foreign key (birth_place) references dwh.fct_address(address_id),
	constraint fct_enrollee_citizenship_id_fkey foreign key (citizenship_id) references dwh.dim_citizenship(citizenship_id),
	constraint fct_enrollee_family_cathegory_id_fkey foreign key (family_cathegory_id) references dwh.dim_family_cathegory(family_cathegory_id)
);

create table dwh.fct_enrollee_parents_info (
	enrollee_parent_info_id serial not null,
	enrollee_id int4 null,
	parent_first_name varchar(200) null,
	parent_second_name varchar(200) null,
	parent_surname varchar(200) null,
	address_id int4 null,
	work_place_name varchar(300) null,
	work_position varchar(300) null,
	mobile_phone_number varchar(30) null,
	email varchar(100) null,
	constraint fct_enrollee_parents_info_pkey primary key (enrollee_parent_info_id),
	constraint fct_enrollee_parents_info_address_id_fkey foreign key (address_id) references dwh.fct_address(address_id),
	constraint fct_enrollee_parents_info_enrollee_id_fkey foreign key (enrollee_id) references dwh.fct_enrollee(enrollee_id)
);

create table dwh.fct_sports_achievements (
	sports_achievements_id serial not null,
	enrollee_id int4 null,
	sport_type_id int4 null,
	supporting_doc_name varchar(400) null,
	constraint fct_sports_achievements_pkey primary key (sports_achievements_id),
	constraint fct_sports_achievements_enrollee_id_fkey foreign key (enrollee_id) references dwh.fct_enrollee(enrollee_id),
	constraint fct_sports_achievements_sport_type_id_fkey foreign key (sport_type_id) references dwh.dim_sports_type(sport_type_id)
);

create table dwh.dim_organizations_and_branches (
	org_id serial not null,
	org_name varchar(300) null,
	org_dsc varchar(500) null,
	tomsk_city_id int4 null,
	eff_dttm timestamptz null DEFAULT now(),
	exp_dttm timestamptz null DEFAULT '2999-12-31 00:00:00+03'::timestamp with time zone,
	load_dttm timestamptz null DEFAULT now(),
	constraint dim_organizations_and_branches_pkey primary key (org_id),
	constraint dim_organizations_and_branches_tomsk_city_id_fkey foreign key (tomsk_city_id) references dwh.dim_tomsk_cities(tomsk_city_id)
);

create table dwh.dim_passport (
	passport_id serial not null,
	p_series varchar(4) null,
	p_number varchar(6) null,
	issue_dt date null,
	issue_place varchar(150) null,
	enrollee_id int4 null,
	constraint dim_passport_pkey primary key (passport_id),
	constraint dim_passport_enrollee_id_fkey foreign key (enrollee_id) references dwh.fct_enrollee(enrollee_id)
);

create table dwh.fct_creative_achievements (
	creative_achievement_id serial not null,
	enrollee_id int4 null,
	creative_achievements_id int4 null,
	supporting_doc_name varchar(400) null,
	constraint fct_creative_achievements_pkey primary key (creative_achievement_id),
	constraint fct_creative_achievements_creative_achievements_id_fkey foreign key (creative_achievements_id) references dwh.fct_creative_achievements_name(creative_achievements_id),
	constraint fct_creative_achievements_enrollee_id_fkey foreign key (enrollee_id) references dwh.fct_enrollee(enrollee_id)
);

create table dwh.fct_documents_acceptance (
	document_acceptance_id serial not null,
	document_acceptance_dttm timestamptz null,
	original bool null,
	form_of_study_id int4 null,
	enrollee_id int4 null,
	certificate_avg_mark float4 null,
	training_direction_id int4 null,
	org_id int4 null,
	constraint fct_documents_acceptance_pkey primary key (document_acceptance_id),
	constraint fct_documents_acceptance_enrollee_id_fkey foreign key (enrollee_id) references dwh.fct_enrollee(enrollee_id),
	constraint fct_documents_acceptance_fk foreign key (training_direction_id) references dwh.dim_training_direction(training_direction_id),
	constraint fct_documents_acceptance_fk2 foreign key (org_id) references dwh.dim_organizations_and_branches(org_id),
	constraint fct_documents_acceptance_form_of_study_id_fkey foreign key (form_of_study_id) references dwh.dim_forms_of_study(form_of_study_id)
);

create table dwh.fct_education (
	education_id serial not null,
	enrollee_id int4 null,
	education_place varchar(300) null,
	education_level_id int4 null,
	education_document varchar(300) null,
	english_edu bool null,
	target_direction bool null,
	constraint fct_education_pkey primary key (education_id),
	constraint fct_education_education_level_id_fkey foreign key (education_level_id) references dwh.dim_education_level(education_level_id),
	constraint fct_education_enrollee_id_fkey foreign key (enrollee_id) references dwh.fct_enrollee(enrollee_id)
);

create table dwh.fct_enr_achievements (
	enr_achievement_id serial not null,
	olympiad_name varchar(300) null,
	winner bool null,
	prize_winner bool null,
	olympiad_level varchar(100) null,
	enrollee_id int4 null,
	constraint fct_enr_achievements_pkey primary key (enr_achievement_id),
	constraint fct_enr_achievements_enrollee_id_fkey foreign key (enrollee_id) references dwh.fct_enrollee(enrollee_id)
);

create table dwh.fct_enrollment (
	enrollment_id serial not null,
	document_acceptance_id int4 null,
	enrollment_dttm timestamptz null,
	constraint fct_enrollment_pkey primary key (enrollment_id),
	constraint fct_enrollment_document_acceptance_id_fkey foreign key (document_acceptance_id) references dwh.fct_documents_acceptance(document_acceptance_id)
);

create table dwh.org_employees (
	org_employee_id serial not null,
	org_id int4 null,
	employee_first_name varchar(200) null,
	employee_second_name varchar(200) null,
	employee_surname varchar(200) null,
	mobile_phone varchar(30) null,
	is_user_id int4 null,
	constraint org_employees_pkey primary key (org_employee_id),
	constraint org_employees_is_user_id_fkey foreign key (is_user_id) references dwh.is_users(is_user_id),
	constraint org_employees_org_id_fkey foreign key (org_id) references dwh.dim_organizations_and_branches(org_id)
);

create or replace view dwh.big_rep as 
select 
	extract('year' from fe.enrollment_dttm)::varchar(4) acc_year,
	doab.org_name,
	dtd.training_direction_name,
	count(case when fe2.orphan = true then fe2.orphan end) orphan,
	count(case when fe2.disabled = true then fe2.disabled end) disabled,
	count(case when fsa.enrollee_id is not null then fe.enrollment_id end) sport_ach
from 
	dwh.fct_enrollment fe 
left join dwh.fct_documents_acceptance fda 
	on fda.document_acceptance_id = fe.document_acceptance_id 
left join dwh.fct_enrollee fe2 
	on fe2.enrollee_id = fda.enrollee_id 
left join dwh.dim_training_direction dtd 
	on dtd.training_direction_id = fda.training_direction_id 
left join dwh.dim_organizations_and_branches doab 
	on doab.org_id = fda.org_id 
left join dwh.fct_creative_achievements fca 
	on fca.enrollee_id = fe2.enrollee_id 
left join dwh.fct_sports_achievements fsa 
	on fsa.enrollee_id = fe2.enrollee_id 
group by 
	extract('year' from fe.enrollment_dttm),
	doab.org_name,
	dtd.training_direction_name
order by
	extract('year' from fe.enrollment_dttm),
	doab.org_name,
	dtd.training_direction_name;