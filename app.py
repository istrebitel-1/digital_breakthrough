from flask import Flask, render_template, request, send_from_directory
import os
from models.models import (login_emp, spo_select, prof_select, student_qnt, 
    orgs_qnt, piechart, checkbox_report, years)


app = Flask(__name__)


# Панель абитуриента
@app.route('/user')
def index():
    return render_template("index.html")


# Панель для работников департамента
@app.route('/')
def admin_panel():
    return render_template('depadmin.html')


@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'), 'favicon.ico', mimetype='image/vnd.microsoft.icon')


# Обработка 404 ошибки
@app.errorhandler(404)
def page_not_found(e):
    return render_template('error404.html'), 404


# Проверка входа
@app.route('/admin/login/check', methods=['GET'])
def check_login_admin():
    try:
        login = request.args['login']
        password = request.args['password']
        return login_emp(login, password)
    except Exception as e:
        print(e)
        return 'internal server error, please contact system administrator'


# Выбор СПО
@app.route('/SPO_select', methods=['GET'])
def spo_sel():
    try:
        return spo_select()
    except Exception as e:
        print(e)
        return 'internal server error, please contact system administrator'


# Выборка специальностей
@app.route('/Proffesion_select', methods=['GET'])
def prof_sel():
    try:
        return prof_select()
    except Exception as e:
        print(e)
        return 'internal server error, please contact system administrator'


# Подсчёт кол-ва студентов
@app.route('/count_students', methods=['GET'])
def st_qnt():
    try:
        return student_qnt()
    except Exception as e:
        print(e)
        return 'internal server error, please contact system administrator'


# Подсчёт кол-ва учреждений
@app.route('/count_spo', methods=['GET'])
def spo_qnt():
    try:
        return orgs_qnt()
    except Exception as e:
        print(e)
        return 'internal server error, please contact system administrator'


# Даиграмма
@app.route('/piechart', methods=['GET'])
def piechart_get():
    try:
        return piechart()
    except Exception as e:
        print(e)
        return 'internal server error, please contact system administrator'


# Отчёт с выборкой
@app.route('/big_rep', methods=['GET'])
def big_rep():
    try:
        return checkbox_report()
    except Exception as e:
        print(e)
        return 'internal server error, please contact system administrator'


# Получение списка лет поступления
@app.route('/year_select', methods=['GET'])
def year_select():
    try:
        return years()
    except Exception as e:
        print(e)
        return 'internal server error, please contact system administrator'

if __name__ == "__main__":
    app.run(debug=True, host='26.173.145.160', port='5000')
