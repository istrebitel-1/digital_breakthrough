function SPO_select(){
    $.ajax({
        url: "/SPO_select",
    }).done(function (data) {
        data=JSON.parse(data);
        for (let i=0; i<data.length; i++){
            $('#zavedenie_input').append("<option value="+data[i][0]+">"+data[i][1]+"</option>");
        }
    });
}

function Zayavlenie(){
    SPO_select();
    html_obj=`
    <div class='col-12 text-right'>
        <div class='row'>
            <div class='col-md-8 col-2'></div>
            <div class='col-md-4 col-10'>
                <span class='InputHead mb-2'>Учебное заведение</span>
                <select class='form-control mt-2' id='zavedenie_input' onchange='SPO()'>
                </select>
            </div>
        </div>
    </div>
    <div class="col-12 text-center mt-3">
        <span><h4>ЗАЯВЛЕНИЕ О ПРИЕМЕ</h4></span>
    </div>
    <div class='col-12'>
        <div class="table-responsive-sm">
            <table class="table table-bordered">
                <tbody>
                    <tr>
                    <td>
                        <div class='row'>
                                <div class='col-12'>от:</div>
                                <div class='col-12 mt-3'>                                            
                                        <span class='mr-2'>Фамилия:</span>
                                        <input class='form-control' type='text' placeholder='Фамилия' id='family_input'>                               
                                </div>
                                <div class='col-12 mt-3'>                                 
                                    <span class='mr-2'>Имя:</span>
                                    <input class='form-control' type='text' placeholder='Имя' id='name_input'>                                           
                                </div>
                                <div class='col-12 mt-3'>                                           
                                    <span class='mr-2'>Отчество:</span>
                                    <input class='form-control' type='text' placeholder='Отчество' id='otchestvo_input'>                                            
                                </div>
                                <div class='col-12 mt-3'>                                         
                                    <span class='mr-2'>Дата рождения:</span>
                                    <input class='form-control' type='date'  id='birthday_date_input'>                                      
                                </div>
                                <div class='col-12 mt-3'>          
                                    <span class='mr-2'>Место рождения:</span>
                                    <input class='form-control' type='text' placeholder='Место рождения' id='birthday_place_input'>
                                </div>
                        </div>
                    </td>
                    <td>
                        <div class='row'>
                            <div class='col-12'>
                                    <span class='mr-2'>Гражданство:</span>
                                    <input class='form-control' type='text' placeholder='Гражданство' id='nationality_input'>                                       
                            </div>
                            <div class='col-12 mt-3'>
                                <span class='mr-2'>Документ, удостоверяющий личность: паспорт</span>
                            </div>
                            <div class='col-12 mt-3'>  
                                    <span class='mr-1'>Серия:</span>
                                    <input class='form-control' type='nubmer' placeholder='0000' id='seria_input'>       
                            </div>
                            <div class='col-12 mt-3'>            
                                    <span class='mr-1'>№</span>
                                    <input class='form-control' type='nubmer' placeholder='000001' id='passport_number_input'>                     
                            </div>
                            <div class='col-12 mt-3'>                      
                                <span class='mr-2'>Дата выдачи:</span>
                                <input class='form-control' type='date'  id='passport_date_input'>                       
                            </div>
                            <div class='col-12 mt-3'>                    
                                <span class='mr-2'>Кем выдан:</span>
                                <input class='form-control' type='text'  placeholder='Кем выдан' id='passport_place_input'>                     
                            </div>
                        </div>
                    </td>
                    </tr>
            </table>
        </div>
    </div>`;
    html_obj+=`<div class='col-12 mt-2'>                
            <span class='mr-2'>проживающий(ей) по адресу:</span>
            <textarea class='form-control' aria-label="With textarea"  placeholder='полный адрес + индекс' id='adress_input'></textarea>
    </div>
    <div class='col-12 col-lg-6 mt-2'>                
        <span class='mr-2'>личный телефон</span>
        <input class='form-control' type='nubmer' id='telephone_input'>
    </div>
    <div class='col-12 col-lg-6 mt-2'>                
        <span class='mr-2'>домашний (при наличии)</span>
        <input class='form-control' type='nubmer' id='dom_telephone_input'>
    </div>
    <div class='col-12 mt-2'>                
        <span class='mr-2'>Личный адрес электронной почты</span>
        <input class='form-control' type='email' id='email_input'>
    </div>
    <div class='col-12 mt-2'>                
        <p>Прошу принять меня в <span id='spo_insert'></span> на обучение по направлению подготовки (профессия / специальность)</p>
        <span class='InputHead mb-2'>1.(приоритетная профессия / специальность):</span>
        <select class='form-control mt-2' id='specialnost1_input'>
        </select>
        <span class='InputHead mb-2'>2.(дополнительная профессия / специальность) :</span>
        <select class='form-control mt-2' id='specialnost2_input'>
        </select>
        <span class='InputHead mb-2'>3.(дополнительная профессия / специальность) :</span>
        <select class='form-control mt-2' id='specialnost3_input'>
        </select>
        <span class='InputHead mb-2'>4.(дополнительная профессия / специальность) :</span>
        <select class='form-control mt-2' id='specialnost4_input'>
        </select>
    </div>
    <div class='col-6 mt-2 text-center'>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="oplata1" value="бюджетной">
            <label class="form-check-label" for="oplata1">бюджетной</label>
        </div>
    </div>
    <div class='col-6 mt-2 text-center'>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="oplata2" value="платной">
            <label class="form-check-label" for="oplata2">платной основе</label>
        </div>
    </div>
    <div class='col-12 mt-2 text-left'>
        <form class='form-inline'>
            <span class='mr-2'>по</span>
            <select class='form-control mr-2' id='forma_obuchenia_input'>
                <option value="очная">очной</option>
                <option value="заочная">заочной</option>
                <option value="очно-заочная">очно-заочной</option>
            </select>
            <span>форме обучения</span>
        </form>
    </div>
    <div class='col-12 mt-2 text-left'>
        <span><b>О себе сообщаю следующее:</b></span>
        <form class='form-inline'>
            <span class='mr-2'>Окончил (а) в</span><input class='form-control mr-2' type='nubmer' placeholder='год' id='year_okonchaniya_input'>
            <span class='mr-2'>году:</span><input class='form-control' type='text' placeholder='Тип Учебного завеления' id='uchebnoe_type_input'>
            <span class='mr-2'>,</span>
        </form>
        <textarea class='form-control mt-2' aria-label="With textarea"  placeholder='Полное название учебного заведения' id='uchebnoe_zavedenie_input'></textarea> 
    </div>
    <div class='col-12 mt-2 text-left'>
        <form class='form-inline'>
            <span class='mr-2'>Уровень образования:</span>
            <select class='form-control' id='uroven_obrazovania_input'>
            </select>
        </form>
    </div>
    <div class='col-12 mt-2 text-left'>
        <span class='mr-2'>Документ об образовании:  Аттестат, Номер</span>
        <input class='form-control' type='text' id='atestat_number_input'>
    </div>
    <div class='col-12 mt-2 text-left'>
        <form class='form-inline'>
            <span class='mr-2'>Английский язык</span>
            <select class='form-control' id='english_input'>
                <option>да</option>
                <option>нет</option>
            </select>
        </form>
    </div>
    <div class='col-12 mt-2 text-left'>
        <form class='form-inline'>
            <span class='mr-2'>Наличие договора о целевом обучении:</span>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="dogovor1" value="имеется">
                <label class="form-check-label" for="dogovor1">имеется</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="dogovor2" value="не имеется">
                <label class="form-check-label" for="dogovor2">не имеется</label>
            </div>
        </form>
    </div>
    <div class='col-12 col-lg-4 mt-2 text-left'>
        <form class='form-inline mt-2'>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="olimp_place1" value="Победитель">
                <label class="form-check-label" for="olimp_place1">Победитель</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="olimp_place2" value="Призер">
                <label class="form-check-label" for="olimp_place2">Призер</label>
            </div>
            <span class='ml-2'>олимпиад</span>
        </form>
    </div>
    <div class='col-12 col-lg-8 mt-2 text-left'>
        <form class='form-inline'>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="olimp_value1" value="всероссийского">
                <label class="form-check-label" for="olimp_value1">всероссийского</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="olimp_value2" value="областного">
                <label class="form-check-label" for="olimp_value2">областного</label>
            </div>
            <span class='ml-2 mr-2'>уровня</span>
            <input class='form-control' type='text' placeholder="наименование предмета" id='olimp_predmet_input'>
        </form>
    </div>
    <div class='col-12 mt-2 text-left'>
        <form class='form-inline'>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="WSR_place1" value="Победитель">
                <label class="form-check-label" for="WSR_place1">Победитель</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="WSR_place2" value="Призер">
                <label class="form-check-label" for="WSR_place2">призер</label>
            </div>
            <span class='ml-2 mr-2'>чемпионата «Молодые профессионалы (WSR)» в компетенции</span>
            <input class='form-control' type='text' id='WSR_predmet_input'>
        </form>
    </div>
    <div class='col-12 mt-2 text-left'>
        <form class='form-inline'>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="Abilimpics_place1" value="Победитель">
                <label class="form-check-label" for="Abilimpics_place1">Победитель</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="Abilimpics_place2" value="Призер">
                <label class="form-check-label" for="Abilimpics_place2">призер</label>
            </div>
            <span class='ml-2 mr-2'>чемпионата «Абилимпикс»  в компетенции</span>
            <input class='form-control' type='text' id='Abilimpics_predmet_input'>
        </form>
    </div>
    <div class='col-12 mt-2 text-left'>
        <form class='form-inline'>
            <span>Общежитие:</span>
            <select class='form-control' id='obshezitie_input'>
                <option>нет</option>
                <option>да</option>
            </select>
        </form>
        <span class='mt-2'><b>Отношусь к категории:</b></span><br>
        <form class='form-inline'>
            <span class='mt-1 mr-2'>дети-сироты, дети, оставшиеся без попечения родителей, лица из их числа: </span>
            <select class='form-control' id='sitoti_input'>
                <option>нет</option>
                <option>да</option>
            </select>
        </form>    
    </div>
    <div class='col-12 col-lg-6'>
        <form class='form-inline'>
            <span class='mr-2'>инвалиды: </span>
            <select class='form-control' id='invalidi_input'>
                <option>нет</option>
                <option>да</option>
            </select>
        </form>
    </div>
    <div class='col-12 col-lg-6 mt-2'>
        <form class='form-inline'>
            <span class='mr-2'>лица  с ОВЗ (имеется ПМПК) </span>
            <input type="checkbox" class="form-check-input" id="OVZ_check">
        </form>
    </div>
    <div class='col-12 mt-2 text-left'>
        <span><b>Дополнительно о себе сообщаю:</b></span>
        <div class='row'>
            <div class='col-12 col-lg-3'>
                <span>Творческие достижения:</span>
            </div>
            <div class='col-12 col-lg-9'>
                <form class='form-inline'>
                    <input type="checkbox" class="form-check-input" id="horeofraphia">
                    <span class='mr-2'>хореография</span>
                </form>
                <input type="file" name="horeo_file" id='horeo_file' class="form-control-file"/>
            </div>
        </div>
    </div>
    <div class='col-12 mt-2 text-center'>
        <button class='btn mb-2' onclick="AbToServer()">Подать</button>
    </div>`;
    var div = document.createElement("div");
        div.setAttribute("class", "row mt-5");
        div.setAttribute('id', 'Zayavlenie');
    div.innerHTML=html_obj;
    document.getElementById('vstavka').appendChild(div);
}

function SPO(){
    n=document.getElementById('zavedenie_input').options.selectedIndex;
    temp=document.getElementById('zavedenie_input').options[n].text;
    document.getElementById('spo_insert').innerHTML=temp;
}

function AbToServer() {

    var n = document.getElementById('zavedenie_input').options.selectedIndex;
    let org_name = document.getElementById('zavedenie_input').options[n].value;

    let enrollee_second_name = document.getElementById('family_input').value;

    let enrollee_first_name = document.getElementById('name_input').value;

    let enrollee_surname = document.getElementById('otchestvo_input').value;

    let birthday_dt = document.getElementById('birthday_date_input').value;

    let brith_place = document.getElementById('birthday_place_input').value;

    let citezenship_name = document.getElementById('nationality_input').value;

    let p_series = document.getElementById('seria_input').value;

    let p_number = document.getElementById('passport_number_input').value;

    let issue_dt = document.getElementById('passport_date_input').value;

    let issue_place = document.getElementById('passport_place_input').value;

    let full_address = document.getElementById('adress_input').value;

    let mobile_phone_number = document.getElementById('telephone_input').value;

    let home_phone_number = document.getElementById('dom_telephone_input').value;

    let email = document.getElementById('email_input').value;

    n = document.getElementById('specialnost1_input').options.selectedIndex;
    let prior1  = document.getElementById('specialnost1_input').options[n].value;

    n = document.getElementById('specialnost2_input').options.selectedIndex;
    let prior2 = document.getElementById('specialnost2_input').options[n].value;

    n = document.getElementById('specialnost3_input').options.selectedIndex;
    let prior3 = document.getElementById('specialnost3_input').options[n].value;

    n = document.getElementById('specialnost4_input').options.selectedIndex;
    let prior4 = document.getElementById('specialnost4_input').options[n].value;

    if (document.getElementById('oplata1').checked && document.getElementById('forma_obuchenia_input').value == 'очной')
    {
        var form_of_study = 1;
    };

    if (document.getElementById('oplata2').checked && document.getElementById('forma_obuchenia_input').value == 'очной')
    {
        var form_of_study = 2;
    };

    if (document.getElementById('oplata1').checked == false && document.getElementById('oplata2').checked == false)
    {
        console.log('Заполните пажожда на бюджете вы или нет');
    };

    let end_year = document.getElementById('year_okonchania_input').value;

    let education_place_type = document.getElementById('uchebnoe_type_input').value;

    let education_place = document.getElementById('uchebnoe_zavedenie_input').value;

    n = document.getElementById('uroven_obrazovania_input').options.selectedIndex;
    let education_level_id = document.getElementById('uroven_obrazovania_input').options[n].value;

    let education_document = document.getElementById('atestat_number_input').value;

    n = document.getElementById('english_input').options.selectedIndex;
    let english_edu = document.getElementById('english_input').options[n].value;

    if (document.getElementById('dogovor1').checked)
    {
        var target_direction = true;
    }
    else
    {
        target_direction = false;
    };

    let dormitory_need = document.getElementById('obshezitie_input').value;

    let orphan = document.getElementById('siroti_input').value;

    let disabled = document.getElementById('invalidi_input').value;

    disabled = document.getElementById('OVZ_check').value;

    let horeofraphia = document.getElementById('horeofraphia').value;
}