import psycopg2
import json


conn = psycopg2.connect(database="digital_breakthrough", user="postgres",
                        password="4432", host="26.173.145.160", port="5434")
cursor = conn.cursor()


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
