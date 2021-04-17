function cl_date_docx(){
    let src=document.getElementById('rep').src;
    src=src.replace('html','docx');
    src=src.replace('pdf','docx');
    src=src.replace('xlsx','docx');
    document.getElementById('rep').src=src;
}
function cl_date_XLSx(){
    let src=document.getElementById('rep').src;
    src=src.replace('html','xlsx');
    src=src.replace('docx','xlsx');
    src=src.replace('pdf','xlsx');
    document.getElementById('rep').src=src;
}
function cl_date_PDF(){
    let src=document.getElementById('rep').src;
    src=src.replace('html','pdf');
    src=src.replace('docx','pdf');
    src=src.replace('xlsx','pdf');
    document.getElementById('rep').src=src;
}  

function login_check(){
    /*let login=document.getElementById('InputLogin').value;
    let password=document.getElementById('InputPassword').value;
    function ajaxRequest(){
    return $.ajax({
        type:"GET",
        url:"/admin/login/check",
        data:{login, password}
        });
    };
    $admin=ajaxRequest();
    $admin
    .done(function(data){
        if(data=='wrong'){
            alert('проверьте правильность логина и пароля');
        }else{*/
            document.getElementById('admin_login_check').style.display='none';
            document.getElementById('admin_login_site').style.display='block';
            let elem=document.getElementById('admin_act');
            html_obj= `
                        <div class='col-12 text-center mt-5 mb-5'> 
                            <select class="form-control selects" onchange="MenuSwitch(this)">
                                <option value="defaultfunction()">Выберите тип запроса</option>
                                <option value="student_count()">Количество обучающихся по определенной профессии</option>
                                <option value="priziv_count()">Количество обучающихся мужского пола допризывного
                                возраста, которые в рамках осваиваемой профессии получают
                                водительское удостоверение категории «В».</option>
                                <option value="lgota_count()">Количество детей-сирот и студентов с инвалидностью</option>
                                <option value="kommision_report()">Отчет о приемной комиссии</option>
                            </select>
                        </div>`;
            elem.innerHTML=html_obj;
       /* }
    });*/
}
function MenuSwitch(elem){
    let SW=elem.options[elem.selectedIndex].value;
    switch (SW){
        case "student_count()": student_count(); break;
        case "priziv_count()": priziv_count(); break;
        case "lgota_count()": lgota_count(); break;
        case "kommision_report()": kommision_report(); break;
        case "defaultfunction()": break;
    }
}

function student_count(){
    document.getElementById("reports").innerHTML='';
    html_obj=`  <div class='row'>
                    <div class='col-12 col-lg-4'>
                        <span>Учебное заведение</span>
                        <select class="form-control selects" id='SPO_select'>
                            <option value="all">все</option>
                        </select>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <span>Направление подготовки</span>
                        <select class="form-control selects" id='Proffesion_select'>
                            <option value="all">все</option>
                        </select>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn-funct btn mt-4' onclick='Switch_student_count()'>Применить фильтры</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-docx' type='button' onclick='cl_date_docx()'>DOCX</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-xls' type='button' onclick='cl_date_XLSx()'>XLSx</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-pdf' type='button' onclick='cl_date_PDF()'>PDF</button>
                    </div>
                </div>`;
    document.getElementById("reports").innerHTML=html_obj;
    var link = ""; 
    var iframe = document.createElement('iframe');
    frameborder=0;
    iframe.width="100%";
    iframe.height=window.innerHeight*0.6;
    iframe.id="rep";
    iframe.setAttribute("src", link);
    document.getElementById("reports").appendChild(iframe);
    SPO_select();
    Proffesion_select();
}

function SPO_select(){
    $.ajax({
        url: "/SPO_select",
    }).done(function (data) {
        data=JSON.parse(data);
        for (let i=0; i<data.length; i++){
            $('#SPO_select').append("<option value="+data[i][0]+">"+data[i][1]+"</option>");
        }
    });
}

function Proffesion_select(){
    $.ajax({
        url: "/Proffesion_select",
    }).done(function (data) {
        data=JSON.parse(data);
        for (let i=0; i<data.length; i++){
            $('#Proffesion_select').append("<option value="+data[i][0]+">"+data[i][1]+"</option>");
        }
    });
}
    function Switch_student_count(){
        let SPO, Profession, n;
        n=document.getElementById('SPO_select').options.selectedIndex;
        SPO=document.getElementById('SPO_select').options[n].value;
        n=document.getElementById('Proffesion_select').options.selectedIndex;
        Profession=document.getElementById('Proffesion_select').options[n].value;
        if (SPO=='all'&&Profession=='all'){
            document.getElementById('rep').src="";
            }else if(SPO!='all'&&Profession=='all'){
                document.getElementById('rep').src="";
                }else if (SPO!='all'&&Profession!='all'){
                    document.getElementById('rep').src="";
                }else {
                    document.getElementById('rep').src="";
                }

    }

function priziv_count(){
    document.getElementById("reports").innerHTML='';
    html_obj=`  <div class='row'>
                    <div class='col-12 col-lg-4'>
                        <span>Учебное заведение</span>
                        <select class="form-control selects" id='SPO_select'>
                            <option value="all">все</option>
                        </select>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <span>Направление подготовки</span>
                        <select class="form-control selects" id='Proffesion_select'>
                            <option value="all">все</option>
                        </select>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn-funct btn mt-4' onclick='Switch_priziv_count()'>Применить фильтры</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-docx' type='button' onclick='cl_date_docx()'>DOCX</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-xls' type='button' onclick='cl_date_XLSx()'>XLSx</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-pdf' type='button' onclick='cl_date_PDF()'>PDF</button>
                    </div>
                </div>`;
    document.getElementById("reports").innerHTML=html_obj;
    var link = ""; 
    var iframe = document.createElement('iframe');
    frameborder=0;
    iframe.width="100%";
    iframe.height=window.innerHeight*0.6;
    iframe.id="rep";
    iframe.setAttribute("src", link);
    document.getElementById("reports").appendChild(iframe);
    SPO_select();
    Proffesion_select();
}

    function Switch_priziv_count(){
        let SPO, Profession, n;
            n=document.getElementById('SPO_select').options.selectedIndex;
            SPO=document.getElementById('SPO_select').options[n].value;
            n=document.getElementById('Proffesion_select').options.selectedIndex;
            Profession=document.getElementById('Proffesion_select').options[n].value;
            if (SPO=='all'&&Profession=='all'){
                document.getElementById('rep').src="";
                }else if(SPO!='all'&&Profession=='all'){
                    document.getElementById('rep').src="";
                    }else if (SPO!='all'&&Profession!='all'){
                        document.getElementById('rep').src="";
                    }else {
                        document.getElementById('rep').src="";
                    }
    }

function lgota_count(){
    document.getElementById("reports").innerHTML='';
    html_obj=`  <div class='row'>
                    <div class='col-12 col-lg-4'>
                        <span>Учебное заведение</span>
                        <select class="form-control selects" id='SPO_select'>
                            <option value="all">все</option>
                        </select>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <span>Направление подготовки</span>
                        <select class="form-control selects" id='Proffesion_select'>
                            <option value="all">все</option>
                        </select>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn-funct btn mt-4' onclick='Switch_lgota_count()'>Применить фильтры</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-docx' type='button' onclick='cl_date_docx()'>DOCX</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-xls' type='button' onclick='cl_date_XLSx()'>XLSx</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-pdf' type='button' onclick='cl_date_PDF()'>PDF</button>
                    </div>
                </div>`;
    document.getElementById("reports").innerHTML=html_obj;
    var link = ""; 
    var iframe = document.createElement('iframe');
    frameborder=0;
    iframe.width="100%";
    iframe.height=window.innerHeight*0.6;
    iframe.id="rep";
    iframe.setAttribute("src", link);
    document.getElementById("reports").appendChild(iframe);
    SPO_select();
    Proffesion_select();
}
    function Switch_lgota_count(){
        let SPO, Profession, n;
            n=document.getElementById('SPO_select').options.selectedIndex;
            SPO=document.getElementById('SPO_select').options[n].value;
            n=document.getElementById('Proffesion_select').options.selectedIndex;
            Profession=document.getElementById('Proffesion_select').options[n].value;
            if (SPO=='all'&&Profession=='all'){
                document.getElementById('rep').src="";
                }else if(SPO!='all'&&Profession=='all'){
                    document.getElementById('rep').src="";
                    }else if (SPO!='all'&&Profession!='all'){
                        document.getElementById('rep').src="";
                    }else {
                        document.getElementById('rep').src="";
                    }
    }

function kommision_report(){
    document.getElementById("reports").innerHTML='';
    html_obj=`  <div class='row'>
                    <div class='col-12 col-lg-8'>
                        <span>Учебное заведение</span>
                        <select class="form-control selects" id='SPO_select'>
                            <option value="all">все</option>
                        </select>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn-funct btn mt-4' onclick='Switch_kommision_report()'>Применить фильтры</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-docx' type='button' onclick='cl_date_docx()'>DOCX</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-xls' type='button' onclick='cl_date_XLSx()'>XLSx</button>
                    </div>
                    <div class='col-12 col-lg-4'>
                        <button class='btn btn-funct mt-4 btn-pdf' type='button' onclick='cl_date_PDF()'>PDF</button>
                    </div>
                </div>`;
    document.getElementById("reports").innerHTML=html_obj;
    var link = ""; 
    var iframe = document.createElement('iframe');
    frameborder=0;
    iframe.width="100%";
    iframe.height=window.innerHeight*0.6;
    iframe.id="rep";
    iframe.setAttribute("src", link);
    document.getElementById("reports").appendChild(iframe);
    SPO_select();
}
    function Switch_kommision_report(){
        let SPO, n;
            n=document.getElementById('SPO_select').options.selectedIndex;
            SPO=document.getElementById('SPO_select').options[n].value;
            if (SPO=='all'){
                document.getElementById('rep').src="";
            }else{
                document.getElementById('rep').src="";
            }
    }