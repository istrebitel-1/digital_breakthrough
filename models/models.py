# pylint: disable=no-name-in-module
# pylint: disable=no-self-argument
import psycopg2
import json
from pydantic import BaseModel, ValidationError


conn = psycopg2.connect(database="digital_breakthrough", user="postgres",
                        password="4432", host="26.173.145.160", port="5434")
cursor = conn.cursor()


class json_serializable(BaseModel):
    data = [{}]

    def add_features(self, name, value, id):
        self.data[id][name] = value

    def add_new_features_item(self):
        self.data.append({})


#
#               Шаблонные функции на получение данных из БД
# ----------------------------------------------------------------------------------
#
def get_data(query):
    cursor.execute(query)
    results = cursor.fetchall()
    return results


def jsonify(some_tuple):
    results = json.dumps(some_tuple, ensure_ascii=False,
                         separators=(',', ': '))
    return results
#
# ----------------------------------------------------------------------------------
#


# Вход работника департамента
def login_emp(login, password):
    logins = get_data("select lower(user_login), user_password from dwh.is_users e")
    check = False

    for item in logins:
        if login == item[0] and password == item[1]:
            check = True

    if check == True:
        return 'success'
    else:
        return 'wrong'


# Выборка СПО
def spo_select():
    return(jsonify(get_data(
        "select "
            "doab.org_id, "
            "doab.org_name "
        "from dwh.dim_organizations_and_branches doab "
    )))


# Выборка направлений подготовки
def prof_select():
    return(jsonify(get_data(
        "select "
            "td.training_direction_id, "
            "td.training_direction_name "
        "from dwh.dim_training_direction td"
    )))


# Подсчёт кол-ва студентов
def student_qnt():
    return(jsonify(get_data(
        "select "
            "count(fe.enrollment_id) "
        "from dwh.fct_enrollment fe "
        "left join dwh.fct_documents_acceptance fda "
            "on fda.document_acceptance_id = fe.document_acceptance_id "
        "left join dwh.fct_enrollee fe2 "
            "on fe2.enrollee_id = fda.enrollee_id "
            "and fe2.student = true"
    )))


# Подсчёт кол-ва учреждений
def orgs_qnt():
    return(jsonify(get_data(
        "select count(*) from dwh.dim_organizations_and_branches"
    )))


# Круговая диаграмма кол-ва абитуриентов по годам
def piechart():
    data = get_data(
        "select "
            "count(fe.enrollment_id) qnt,"
            "extract('year' from fe.enrollment_dttm) acc_year "
        "from dwh.fct_enrollment fe "
        "group by "
            "extract('year' from fe.enrollment_dttm)"
    )
    json_inf = json_serializable()
    object_id = 0

    for i in range(0, len(data)):
        json_inf.add_features("year", str(int(data[i][1])), i)
        json_inf.add_features("students", data[i][0], i)
        json_inf.add_new_features_item()
        object_id += 1

    del json_inf.data[-1]
    return(jsonify(json_inf.dict()))


def checkbox_report():
    return(jsonify(get_data(
        "select "
            "acc_year::varchar(4),"
            "org_name,"
            "training_direction_name,"
            "orphan,"
            "disabled,"
            "sport_ach "
        "from dwh.big_rep "
    )))


# Список лет поступления
def years():
    return(jsonify(get_data(
        "select distinct "
           "extract('year' from fe.enrollment_dttm)::varchar(4) "
        "from dwh.fct_enrollment fe"
    )))
