INSERT INTO dwh.dep_employees
(dep_employee_id, employee_first_name, employee_second_name, employee_surname, mobile_phone, registration_dttm, is_user_id)
VALUES(1, 'Светлов', 'Игорь', 'Петрович', '89502504050', NULL, 4);
INSERT INTO dwh.dep_employees
(dep_employee_id, employee_first_name, employee_second_name, employee_surname, mobile_phone, registration_dttm, is_user_id)
VALUES(2, 'Темнов', 'Петр', 'Андреевич', '89502504051', NULL, 5);
INSERT INTO dwh.dep_employees
(dep_employee_id, employee_first_name, employee_second_name, employee_surname, mobile_phone, registration_dttm, is_user_id)
VALUES(3, 'Дневнов', 'Николай', 'Игоревич', '89502504052', NULL, 6);

INSERT INTO dwh.dim_acceptance_applications_dt
(acceptance_application_dt_id, start_acceptance_applications_dttm, end_acceptance_applications_dttm, form_of_study_id, eff_dttm, exp_dttm, load_dttm)
VALUES(1, '2021-08-13 00:00:00.000', '2021-09-01 00:00:00.000', 1, '2021-04-17 13:01:07.528', '2999-12-31 00:00:00.000', '2021-04-17 13:01:07.528');
INSERT INTO dwh.dim_acceptance_applications_dt
(acceptance_application_dt_id, start_acceptance_applications_dttm, end_acceptance_applications_dttm, form_of_study_id, eff_dttm, exp_dttm, load_dttm)
VALUES(2, '2021-08-13 00:00:00.000', '2021-09-01 00:00:00.000', 2, '2021-04-17 13:01:07.554', '2999-12-31 00:00:00.000', '2021-04-17 13:01:07.554');

INSERT INTO dwh.dim_citizenship
(citizenship_id, citizenship_name, eff_dttm, exp_dttm, load_dttm)
VALUES(1, 'Русский', '2021-04-17 12:12:28.236', '2999-12-31 00:00:00.000', '2021-04-17 12:12:28.236');
INSERT INTO dwh.dim_citizenship
(citizenship_id, citizenship_name, eff_dttm, exp_dttm, load_dttm)
VALUES(2, 'Украинец', '2021-04-17 12:12:28.245', '2999-12-31 00:00:00.000', '2021-04-17 12:12:28.245');
INSERT INTO dwh.dim_citizenship
(citizenship_id, citizenship_name, eff_dttm, exp_dttm, load_dttm)
VALUES(3, 'Казах', '2021-04-17 12:12:28.247', '2999-12-31 00:00:00.000', '2021-04-17 12:12:28.247');

INSERT INTO dwh.dim_education_level
(education_level_id, education_level_name, eff_dttm, exp_dttm, load_dttm)
VALUES(1, '9 классов', '2021-04-17 12:11:44.593', '2999-12-31 00:00:00.000', '2021-04-17 12:11:44.593');
INSERT INTO dwh.dim_education_level
(education_level_id, education_level_name, eff_dttm, exp_dttm, load_dttm)
VALUES(2, '11 классов', '2021-04-17 12:11:44.597', '2999-12-31 00:00:00.000', '2021-04-17 12:11:44.597');

INSERT INTO dwh.dim_family_cathegory
(family_cathegory_id, family_cathegory_name, eff_dttm, exp_dttm, load_dttm)
VALUES(1, 'Полная семья', '2021-04-17 12:19:41.468', '2999-12-31 00:00:00.000', '2021-04-17 12:19:41.468');
INSERT INTO dwh.dim_family_cathegory
(family_cathegory_id, family_cathegory_name, eff_dttm, exp_dttm, load_dttm)
VALUES(3, 'Дети, оставшиеся без попечения родителей', '2021-04-17 12:19:41.514', '2999-12-31 00:00:00.000', '2021-04-17 12:19:41.514');
INSERT INTO dwh.dim_family_cathegory
(family_cathegory_id, family_cathegory_name, eff_dttm, exp_dttm, load_dttm)
VALUES(2, 'Дети-сироты', '2021-04-17 12:19:41.499', '2999-12-31 00:00:00.000', '2021-04-17 12:19:41.499');

INSERT INTO dwh.dim_forms_of_study
(form_of_study_id, forms_of_study_name, education_system, eff_dttm, exp_dttm, load_dttm, form_of_study_type)
VALUES(1, 'Очная', NULL, '2021-04-17 11:55:17.543', '2999-12-31 00:00:00.000', '2021-04-17 11:55:17.543', 'Бюджет');
INSERT INTO dwh.dim_forms_of_study
(form_of_study_id, forms_of_study_name, education_system, eff_dttm, exp_dttm, load_dttm, form_of_study_type)
VALUES(2, 'Очная', NULL, '2021-04-17 11:55:17.554', '2999-12-31 00:00:00.000', '2021-04-17 11:55:17.554', 'Внебюджет');

INSERT INTO dwh.dim_organizations_and_branches
(org_id, org_name, org_dsc, tomsk_city_id, eff_dttm, exp_dttm, load_dttm)
VALUES(1, 'Профессиональное училище № 25', NULL, 1, '2021-04-17 11:38:49.988', '2999-12-31 00:00:00.000', '2021-04-17 11:38:49.988');
INSERT INTO dwh.dim_organizations_and_branches
(org_id, org_name, org_dsc, tomsk_city_id, eff_dttm, exp_dttm, load_dttm)
VALUES(2, 'Асиновский техникум промышленной индустрии и сервиса', NULL, 2, '2021-04-17 11:38:50.011', '2999-12-31 00:00:00.000', '2021-04-17 11:38:50.011');
INSERT INTO dwh.dim_organizations_and_branches
(org_id, org_name, org_dsc, tomsk_city_id, eff_dttm, exp_dttm, load_dttm)
VALUES(3, 'Бакчарский филиал Кривошеинский агропромышленный техникум', NULL, 3, '2021-04-17 11:38:50.038', '2999-12-31 00:00:00.000', '2021-04-17 11:38:50.038');

INSERT INTO dwh.dim_passport
(passport_id, p_series, p_number, issue_dt, issue_place, enrollee_id)
VALUES(1, '3414', '103051', '2014-05-14', 'УМВД РОССИИ ПО ТВЕРСКОЙ ОБЛАСТИ', 1);
INSERT INTO dwh.dim_passport
(passport_id, p_series, p_number, issue_dt, issue_place, enrollee_id)
VALUES(2, '3414', '103052', '2015-11-15', 'УМВД РОССИИ ПО ТВЕРСКОЙ ОБЛАСТИ', 2);
INSERT INTO dwh.dim_passport
(passport_id, p_series, p_number, issue_dt, issue_place, enrollee_id)
VALUES(3, '3414', '103053', '2015-06-11', 'УМВД РОССИИ ПО ТВЕРСКОЙ ОБЛАСТИ', 3);

INSERT INTO dwh.dim_sports_type
(sport_type_id, sports_type_name, eff_dttm, exp_dttm, load_dttm)
VALUES(1, 'Нормы ГТО', '2021-04-17 12:54:01.861', '2999-12-31 00:00:00.000', '2021-04-17 12:54:01.861');
INSERT INTO dwh.dim_sports_type
(sport_type_id, sports_type_name, eff_dttm, exp_dttm, load_dttm)
VALUES(2, 'Марафон 2021', '2021-04-17 12:54:01.881', '2999-12-31 00:00:00.000', '2021-04-17 12:54:01.881');

INSERT INTO dwh.dim_tomsk_cities
(tomsk_city_id, tomsk_region_id, tomsk_city_name, eff_dttm, exp_dttm, load_dttm)
VALUES(1, 1, 'Александровское', '2021-04-17 11:34:54.832', '2999-12-31 00:00:00.000', '2021-04-17 11:34:54.832');
INSERT INTO dwh.dim_tomsk_cities
(tomsk_city_id, tomsk_region_id, tomsk_city_name, eff_dttm, exp_dttm, load_dttm)
VALUES(2, 2, 'Асино', '2021-04-17 11:34:54.856', '2999-12-31 00:00:00.000', '2021-04-17 11:34:54.856');
INSERT INTO dwh.dim_tomsk_cities
(tomsk_city_id, tomsk_region_id, tomsk_city_name, eff_dttm, exp_dttm, load_dttm)
VALUES(3, 3, 'Бакчар', '2021-04-17 11:34:54.872', '2999-12-31 00:00:00.000', '2021-04-17 11:34:54.872');

INSERT INTO dwh.dim_tomsk_regions
(tomsk_region_id, tomsk_region_name, eff_dttm, exp_dttm, load_dttm)
VALUES(1, 'Александровский район', '2021-04-17 11:26:04.251', '2999-12-31 00:00:00.000', '2021-04-17 11:26:04.251');
INSERT INTO dwh.dim_tomsk_regions
(tomsk_region_id, tomsk_region_name, eff_dttm, exp_dttm, load_dttm)
VALUES(2, 'Асиновский район', '2021-04-17 11:27:52.085', '2999-12-31 00:00:00.000', '2021-04-17 11:27:52.085');
INSERT INTO dwh.dim_tomsk_regions
(tomsk_region_id, tomsk_region_name, eff_dttm, exp_dttm, load_dttm)
VALUES(3, 'Бакчарский район', '2021-04-17 11:28:20.458', '2999-12-31 00:00:00.000', '2021-04-17 11:28:20.458');

INSERT INTO dwh.dim_training_direction
(training_direction_id, training_direction_name, training_direction_month_qnt, profession_name, ok_profession_name, req_education, training_direction_type, eff_dttm, exp_dttm, load_dttm)
VALUES(1, 'Строительство и эксплуатация зданий и сооружений', 46, 'Строительство и эксплуатация зданий и сооружений
Строительство жилых и общественных зданий
Сметное нормирование и ценообразование в строительстве', '01.01.01', '9 классов', 'ППКРС', '2021-04-17 12:30:02.377', '2999-12-31 00:00:00.000', '2021-04-17 12:30:02.377');
INSERT INTO dwh.dim_training_direction
(training_direction_id, training_direction_name, training_direction_month_qnt, profession_name, ok_profession_name, req_education, training_direction_type, eff_dttm, exp_dttm, load_dttm)
VALUES(2, 'Строительство жилых и общественных зданий', 46, 'Строительство и эксплуатация зданий и сооружений
Строительство жилых и общественных зданий
Сметное нормирование и ценообразование в строительстве', '01.01.02', '9 классов', 'ППКРС', '2021-04-17 12:30:02.379', '2999-12-31 00:00:00.000', '2021-04-17 12:30:02.379');
INSERT INTO dwh.dim_training_direction
(training_direction_id, training_direction_name, training_direction_month_qnt, profession_name, ok_profession_name, req_education, training_direction_type, eff_dttm, exp_dttm, load_dttm)
VALUES(3, 'Сметное нормирование и ценообразование в строительстве', 46, 'Строительство и эксплуатация зданий и сооружений
Строительство жилых и общественных зданий
Сметное нормирование и ценообразование в строительстве', '01.01.03', '11 классов', 'ППКРС', '2021-04-17 12:30:02.381', '2999-12-31 00:00:00.000', '2021-04-17 12:30:02.381');

INSERT INTO dwh.fct_address
(address_id, city_name, street_name, house_number, building_name, housing_name, city_region)
VALUES(1, 'Томск', 'Красноармейская', '4', NULL, NULL, NULL);
INSERT INTO dwh.fct_address
(address_id, city_name, street_name, house_number, building_name, housing_name, city_region)
VALUES(2, 'Томск', 'Советская', '24', NULL, NULL, NULL);
INSERT INTO dwh.fct_address
(address_id, city_name, street_name, house_number, building_name, housing_name, city_region)
VALUES(3, 'Томск', 'Ленина', '11', NULL, NULL, NULL);

INSERT INTO dwh.fct_creative_achievements
(creative_achievement_id, enrollee_id, creative_achievements_id, supporting_doc_name)
VALUES(1, 1, 2, NULL);
INSERT INTO dwh.fct_creative_achievements
(creative_achievement_id, enrollee_id, creative_achievements_id, supporting_doc_name)
VALUES(3, 2, 1, NULL);
INSERT INTO dwh.fct_creative_achievements
(creative_achievement_id, enrollee_id, creative_achievements_id, supporting_doc_name)
VALUES(5, 3, 3, NULL);
INSERT INTO dwh.fct_creative_achievements
(creative_achievement_id, enrollee_id, creative_achievements_id, supporting_doc_name)
VALUES(2, 5, 3, NULL);
INSERT INTO dwh.fct_creative_achievements
(creative_achievement_id, enrollee_id, creative_achievements_id, supporting_doc_name)
VALUES(4, 4, 3, NULL);

INSERT INTO dwh.fct_creative_achievements_name
(creative_achievements_id, creative_achievements_name, eff_dttm, exp_dttm, load_dttm)
VALUES(1, 'Спортивная олимпиала', '2021-04-17 12:08:38.837', '2999-12-31 00:00:00.000', '2021-04-17 12:08:38.837');
INSERT INTO dwh.fct_creative_achievements_name
(creative_achievements_id, creative_achievements_name, eff_dttm, exp_dttm, load_dttm)
VALUES(2, 'Русский медвежонок', '2021-04-17 12:08:38.858', '2999-12-31 00:00:00.000', '2021-04-17 12:08:38.858');
INSERT INTO dwh.fct_creative_achievements_name
(creative_achievements_id, creative_achievements_name, eff_dttm, exp_dttm, load_dttm)
VALUES(3, 'Нормы гто', '2021-04-17 12:08:38.874', '2999-12-31 00:00:00.000', '2021-04-17 12:08:38.874');

INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(1, '2021-04-17 12:00:00.000', true, 1, 1, 4.0, 1, 1);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(2, '2021-04-17 12:00:00.000', NULL, 2, 2, 4.2, 1, 1);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(4, '2021-04-17 12:00:00.000', NULL, 2, 3, 4.5, 1, 2);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(5, '2021-04-17 12:00:00.000', true, 2, 4, 5.0, 1, 2);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(6, '2021-04-17 12:00:00.000', NULL, 2, 5, 3.0, 1, 1);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(7, '2021-04-17 12:00:00.000', NULL, 2, 6, 4.2, 1, 1);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(3, '2021-04-17 12:00:00.000', true, 1, 7, 3.8, 2, 1);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(8, '2021-04-17 12:00:00.000', true, 1, 8, 4.0, 2, 1);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(9, '2020-05-14 12:00:00.000', false, 1, 9, 3.5, 3, 2);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(10, '2020-05-14 12:00:00.000', false, 2, 10, 3.75, 2, 2);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(11, '2020-05-14 12:00:00.000', true, 2, 11, 4.3, 2, 2);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(12, '2020-05-14 12:00:00.000', true, 2, 12, 4.6, 2, 3);
INSERT INTO dwh.fct_documents_acceptance
(document_acceptance_id, document_acceptance_dttm, original, form_of_study_id, enrollee_id, certificate_avg_mark, training_direction_id, org_id)
VALUES(13, '2020-05-14 12:00:00.000', false, 1, 13, 3.7, 2, 2);

INSERT INTO dwh.fct_education
(education_id, enrollee_id, education_place, education_level_id, education_document, english_edu, target_direction)
VALUES(1, 1, 'МОУ СОШ № 1 ', 2, 'Аттестат', true, true);
INSERT INTO dwh.fct_education
(education_id, enrollee_id, education_place, education_level_id, education_document, english_edu, target_direction)
VALUES(2, 2, 'МОУ СОШ № 1 ', 2, 'Аттестат', true, NULL);
INSERT INTO dwh.fct_education
(education_id, enrollee_id, education_place, education_level_id, education_document, english_edu, target_direction)
VALUES(3, 3, 'МОУ СОШ № 1 ', 1, 'Аттестат', true, NULL);

INSERT INTO dwh.fct_enr_achievements
(enr_achievement_id, olympiad_name, winner, prize_winner, olympiad_level, enrollee_id)
VALUES(1, 'Русский медвежонок', true, NULL, 'Региональная', 1);
INSERT INTO dwh.fct_enr_achievements
(enr_achievement_id, olympiad_name, winner, prize_winner, olympiad_level, enrollee_id)
VALUES(2, 'Русский медвежонок', false, true, 'Региональная', 2);
INSERT INTO dwh.fct_enr_achievements
(enr_achievement_id, olympiad_name, winner, prize_winner, olympiad_level, enrollee_id)
VALUES(3, 'Русский медвежонок', NULL, true, 'Региональная', 3);

INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(1, 'Иванов', 'Иван', 'Иванович', '2005-02-02', 1, 1, 1, '79998789878', NULL, 'dsada@mail.ru', true, 2, true, true, true, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(4, 'Сидоров', 'Антон', 'Алексеевич', '2004-03-02', 3, 2, 3, '79854524565', NULL, 'fasfa@mail.ru', false, 1, true, false, false, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(5, 'Сидоров', 'Антон', 'Алексеевич', '2004-03-02', 3, 2, 3, '79854524565', NULL, 'fasfa@mail.ru', false, 2, true, true, false, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(6, 'Сидоров', 'Антон', 'Алексеевич', '2004-03-02', 3, 2, 3, '79854524565', NULL, 'fasfa@mail.ru', false, 1, true, false, true, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(7, 'Сидоров', 'Антон', 'Алексеевич', '2004-03-02', 3, 2, 3, '79854524565', NULL, 'fasfa@mail.ru', false, 1, true, false, true, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(2, 'Петров', 'Петр', 'Петрович', '2006-02-02', 2, 1, 2, '79654987456', NULL, 'dassa@mail.ru', false, 1, true, false, false, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(3, 'Сидоров', 'Антон', 'Алексеевич', '2004-03-02', 3, 2, 3, '79854524565', NULL, 'fasfa@mail.ru', false, 1, true, false, false, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(8, 'Соколов', 'Игнат', 'Анатольевич', '2003-05-07', 3, 1, 3, '79654987456', NULL, 'fasfa@mail.ru', true, 1, true, true, false, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(9, 'Домов', 'Игорь', 'Андреевич', '2003-05-07', 3, 1, 3, '79654987456', NULL, 'fasfa@mail.ru', false, 1, true, false, false, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(10, 'Дронов', 'Дмитрий', 'Иванович', '2003-05-07', 3, 1, 3, '79654987456', NULL, 'fasfa@mail.ru', false, 1, true, false, false, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(11, 'Зеленова', 'Татьяна', 'Сергеевна', '2003-05-07', 3, 1, 3, '79654987456', NULL, 'fasfa@mail.ru', false, 1, true, true, false, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(12, 'Иголкина', 'Надежда', 'Дмитриевна', '2003-05-07', 3, 1, 3, '79654987456', NULL, 'fasfa@mail.ru', false, 1, true, false, false, NULL, true);
INSERT INTO dwh.fct_enrollee
(enrollee_id, enrollee_first_name, enrollee_second_name, enrollee_surname, birthday_dt, birth_place, citizenship_id, address_id, mobile_phone_number, home_phone_number, email, dormitory_need, family_cathegory_id, first_enrollee_spo, orphan, disabled, signature_photo_path, student)
VALUES(13, 'Потова', 'Наталья', 'Павловна', '2003-05-07', 3, 1, 3, '79654987456', NULL, 'fasfa@mail.ru', false, 1, true, true, false, NULL, true);

INSERT INTO dwh.fct_enrollee_parents_info
(enrollee_parent_info_id, enrollee_id, parent_first_name, parent_second_name, parent_surname, address_id, work_place_name, work_position, mobile_phone_number, email)
VALUES(1, 1, 'Иванов', 'Игорь', 'Евгеньевич', 1, 'Магнит', 'Менеджер по передвижению грузов', '89990000000', 'test@mail.com');
INSERT INTO dwh.fct_enrollee_parents_info
(enrollee_parent_info_id, enrollee_id, parent_first_name, parent_second_name, parent_surname, address_id, work_place_name, work_position, mobile_phone_number, email)
VALUES(2, 1, 'Иванова', 'Таисия', 'Игоревна', 1, 'Магнит', 'Продавец', '89990000000', 'test@mail.com');
INSERT INTO dwh.fct_enrollee_parents_info
(enrollee_parent_info_id, enrollee_id, parent_first_name, parent_second_name, parent_surname, address_id, work_place_name, work_position, mobile_phone_number, email)
VALUES(3, 2, 'Петров', 'Анатолий', 'Михайлович', 2, 'Пятерочка', 'Менеджер по передвижению грузов', '89990000000', 'test@mail.com');
INSERT INTO dwh.fct_enrollee_parents_info
(enrollee_parent_info_id, enrollee_id, parent_first_name, parent_second_name, parent_surname, address_id, work_place_name, work_position, mobile_phone_number, email)
VALUES(4, 2, 'Петрова', 'Анастасия', 'Александровна', 2, 'Пятерочка', 'Администратор', '89990000000', 'test@mail.com');
INSERT INTO dwh.fct_enrollee_parents_info
(enrollee_parent_info_id, enrollee_id, parent_first_name, parent_second_name, parent_surname, address_id, work_place_name, work_position, mobile_phone_number, email)
VALUES(5, 3, 'Сидорова', 'Елена', 'Анатольевна', 3, 'Завод ', 'Бухгалтер', '89990000000', 'tesе1Ct@mail.com');

INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(1, 1, '2021-04-17 00:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(2, 2, '2021-04-17 00:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(3, 3, '2021-04-17 00:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(4, 4, '2021-04-17 00:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(5, 5, '2021-04-17 00:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(6, 6, '2021-04-17 00:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(7, 7, '2021-04-17 00:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(8, 8, '2021-04-17 00:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(9, 9, '2020-05-14 12:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(10, 10, '2020-05-14 12:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(11, 11, '2020-05-14 12:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(12, 12, '2020-05-14 12:00:00.000');
INSERT INTO dwh.fct_enrollment
(enrollment_id, document_acceptance_id, enrollment_dttm)
VALUES(13, 13, '2020-05-14 12:00:00.000');

INSERT INTO dwh.fct_sports_achievements
(sports_achievements_id, enrollee_id, sport_type_id, supporting_doc_name)
VALUES(1, 1, 1, NULL);
INSERT INTO dwh.fct_sports_achievements
(sports_achievements_id, enrollee_id, sport_type_id, supporting_doc_name)
VALUES(2, 1, 2, NULL);
INSERT INTO dwh.fct_sports_achievements
(sports_achievements_id, enrollee_id, sport_type_id, supporting_doc_name)
VALUES(3, 2, 1, NULL);
INSERT INTO dwh.fct_sports_achievements
(sports_achievements_id, enrollee_id, sport_type_id, supporting_doc_name)
VALUES(4, 3, 2, NULL);

INSERT INTO dwh.is_users
(is_user_id, user_login, user_password)
VALUES(1, '1111', NULL);
INSERT INTO dwh.is_users
(is_user_id, user_login, user_password)
VALUES(2, '1111', NULL);
INSERT INTO dwh.is_users
(is_user_id, user_login, user_password)
VALUES(3, '3333', NULL);
INSERT INTO dwh.is_users
(is_user_id, user_login, user_password)
VALUES(4, '4444', NULL);
INSERT INTO dwh.is_users
(is_user_id, user_login, user_password)
VALUES(5, '5555', NULL);
INSERT INTO dwh.is_users
(is_user_id, user_login, user_password)
VALUES(6, '6666', NULL);
INSERT INTO dwh.is_users
(is_user_id, user_login, user_password)
VALUES(7, 'admin', 'admin');

INSERT INTO dwh.org_employees
(org_employee_id, org_id, employee_first_name, employee_second_name, employee_surname, mobile_phone, is_user_id)
VALUES(1, 1, 'Иванов', 'Иван', 'Иванович', NULL, 1);
INSERT INTO dwh.org_employees
(org_employee_id, org_id, employee_first_name, employee_second_name, employee_surname, mobile_phone, is_user_id)
VALUES(2, 2, 'Петров', 'Петр', 'Петрович', NULL, 2);
INSERT INTO dwh.org_employees
(org_employee_id, org_id, employee_first_name, employee_second_name, employee_surname, mobile_phone, is_user_id)
VALUES(3, 3, 'Александров', 'Александр', 'Александрович', NULL, 3);
