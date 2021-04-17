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

function Dashboard(){
    let student, spo;
    
    html_obj=`
            <div class='row' id='dashboard'>
                    <div class='col-12 mt-3 ml-5 text-left'>
                        <span class='oglavlenie'>Главная</span>
                    </div>
                    <div class='col-12 mt-3 ml-5'>
                        <div class='row'>
                            <div class='col-12 col-lg-6 text-center'>
                                <div class='card'>
                                    <div class='row'>
                                        <div class='col-6 text-left'>
                                            <div class='dashboardIcon ml-5 mt-4 mb-4 text-center'>
                                                <i class="fa fa-graduation-cap icon" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                        <div class='col-6 text-right'>
                                            <div class='dashboardText mr-5 mt-3 mb-4'>
                                                <span class='dashboardText__head'>Cтуденты</span><br>
                                                <span class='dashboardText__item' id='student_insert'></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class='col-12 col-lg-6 text-center'>
                                <div class='card'>
                                    <div class='row'>
                                        <div class='col-6 text-left'>
                                            <div class='dashboardIcon ml-5 mt-4 mb-4 text-center'>
                                                <i class="fa fa-university icon" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                        <div class='col-6 text-right'>
                                            <div class='dashboardText mr-5 mt-3 mb-4'>
                                                <span class='dashboardText__head'>Учебные заведения</span><br>
                                                <span class='dashboardText__item' id='spo_insert'></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class='col-12 text-center mt-5'>
                                <div class='card full'>
                                    <div class='row'>
                                        <div class='col-12 text-left'>
                                            <div class='dashboardText ml-5 mt-3 mb-4'>
                                                <span class='dashboardText__head'>Приемная комиссия<i class="fa fa-pie-chart ml-2" aria-hidden="true"></i></span>
                                            </div>
                                        </div>
                                        <div class='col-12 text-center diadiv'>
                                            <div id="chartdiv"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>`;
    document.getElementById('admin_act').innerHTML=html_obj;
    $.ajax({
        url: "/count_students",
    }).done(function (data) {
        data=JSON.parse(data);
        student = data[0][0];
        document.getElementById('student_insert').innerHTML=student;
    });
    $.ajax({
        url: "/count_spo",
    }).done(function (data) {
        data=JSON.parse(data);
        spo = data[0][0];
        document.getElementById('spo_insert').innerHTML=spo;
    });

    $.ajax({
        url: "/piechart",
    }).done(function (data) {
        data=JSON.parse(data);
        Dashboard_diagrams(data);
    });
    let buttons=document.getElementsByClassName('menu_btn');
    for (let i=0; i<buttons.length; i++){
        buttons[i].style.color='#000814';
    }
    document.getElementById('Dashboard_button').style.color='#FFC300';
}
    function Dashboard_diagrams(data){
        am4core.useTheme(am4themes_kelly);
        am4core.useTheme(am4themes_animated);
        // Themes end
        // Create chart instance
        var chart = am4core.create("chartdiv", am4charts.PieChart);
        // Add data
        chart.data = data;
        // Add and configure Series
        var pieSeries = chart.series.push(new am4charts.PieSeries());
        pieSeries.dataFields.value = "students";
        pieSeries.dataFields.category = "year";
        pieSeries.slices.template.stroke = am4core.color("#fff");
        pieSeries.slices.template.strokeOpacity = 1;
        // This creates initial animation
        pieSeries.hiddenState.properties.opacity = 1;
        pieSeries.hiddenState.properties.endAngle = -90;
        pieSeries.hiddenState.properties.startAngle = -90;
        chart.hiddenState.properties.radius = am4core.percent(0);
    }

function Reports(){
    let elem=document.getElementById('admin_act');
    html_obj= `<div class='row' id='reports_page'>
                    <div class='col-12 mt-3 ml-5 text-left'>
                        <span class='oglavlenie'>Готовые отчеты</span>
                    </div>
                    <div class='col-12 text-center mt-5 mb-5 ml-5'>
                        <div class='card full'> 
                            <div class='row m-4'>
                                <div class='col-6 text-left'>
                                    <span class='dashboardText__head size'>Выберите нужный документ</span>
                                </div>
                                <div class='col-6'>
                                    <select class="form-control" onchange="MenuSwitch(this)">
                                        <option value="defaultfunction()">Выберите тип запроса</option>
                                        <option value="student_count()">Количество обучающихся по определенной профессии</option>
                                        <option value="lgota_count()">Количество детей-сирот и студентов с инвалидностью</option>
                                        <option value="kommision_report()">Отчет о приемной комиссии</option>
                                    </select>
                                </div>
                                <div class='col-12 mt-5 mb-2 text-center' id='reports'></div>
                            </div>
                        </div>
                    </div>
                </div>`;
    elem.innerHTML=html_obj;
    let buttons=document.getElementsByClassName('menu_btn');
    for (let i=0; i<buttons.length; i++){
        buttons[i].style.color='#000814';
    }
    document.getElementById('Reports_button').style.color='#FFC300';
    console.log(document.getElementById('Reports_button'));
}
window.onload= function(){
    document.getElementById('admin_login_check').style.display='block';
    document.getElementById('admin_login_site').style.display='none';
}
function login_check(){
    let login=document.getElementById('InputLogin').value;
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
        }else{
            document.getElementById('admin_login_check').style.display='none';
            document.getElementById('admin_login_site').style.display='block';
            Dashboard();
        }
    });
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
                </div>`;
    document.getElementById("reports").innerHTML=html_obj;
    var link = "http://26.173.145.160:8080/jasperserver/rest_v2/reports/reports/Digital_breakthrough/forma2.html"; 
    var iframe = document.createElement('iframe');
    frameborder=0;
    iframe.width="100%";
    iframe.height=window.innerHeight*0.6;
    iframe.id="rep";
    iframe.setAttribute("src", link);
    document.getElementById("reports").appendChild(iframe);
    var div = document.createElement("div");
    div.setAttribute("class", "row mt-4");
    html_obj=`  
                <div class='col-12 text-left'>
                <span class='dashboardText__head size'><i class="fa fa-download" aria-hidden="true" class='icon'></i>&nbsp;Для сохранения отчета выберите формат:</span>
                </div>
                <div class='col-12 col-lg-4'>
                    <button class='btn btn-funct mt-4 btn-docx' type='button' onclick='cl_date_docx()'>DOCX&nbsp;<i class="fa fa-file-word-o" aria-hidden="true"></i></button>
                </div>
                <div class='col-12 col-lg-4'>
                    <button class='btn btn-funct mt-4 btn-xls' type='button' onclick='cl_date_XLSx()'>XLSx&nbsp;<i class="fa fa-file-excel-o" aria-hidden="true"></i></button>
                </div>
                <div class='col-12 col-lg-4'>
                    <button class='btn btn-funct mt-4 btn-pdf' type='button' onclick='cl_date_PDF()'>PDF&nbsp;<i class="fa fa-file-pdf-o" aria-hidden="true"></i></button>
                </div>`;
    div.innerHTML=html_obj;
    document.getElementById("reports").appendChild(div);   
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
                </div>`;
    document.getElementById("reports").innerHTML=html_obj;
    var link = "http://26.173.145.160:8080/jasperserver/rest_v2/reports/reports/Digital_breakthrough/forma4.html"; 
    var iframe = document.createElement('iframe');
    frameborder=0;
    iframe.width="100%";
    iframe.height=window.innerHeight*0.6;
    iframe.id="rep";
    iframe.setAttribute("src", link);
    document.getElementById("reports").appendChild(iframe);
    var div = document.createElement("div");
    div.setAttribute("class", "row mt-4");
    html_obj=`  
    <div class='col-12 text-left'>
    <span class='dashboardText__head size'><i class="fa fa-download" aria-hidden="true" class='icon'></i>&nbsp;Для сохранения отчета выберите формат:</span>
    </div>
    <div class='col-12 col-lg-4'>
        <button class='btn btn-funct mt-4 btn-docx' type='button' onclick='cl_date_docx()'>DOCX&nbsp;<i class="fa fa-file-word-o" aria-hidden="true"></i></button>
    </div>
    <div class='col-12 col-lg-4'>
        <button class='btn btn-funct mt-4 btn-xls' type='button' onclick='cl_date_XLSx()'>XLSx&nbsp;<i class="fa fa-file-excel-o" aria-hidden="true"></i></button>
    </div>
    <div class='col-12 col-lg-4'>
        <button class='btn btn-funct mt-4 btn-pdf' type='button' onclick='cl_date_PDF()'>PDF&nbsp;<i class="fa fa-file-pdf-o" aria-hidden="true"></i></button>
    </div>`;
    div.innerHTML=html_obj;
    document.getElementById("reports").appendChild(div);   
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
                        <button class='btn btn-funct mt-4' onclick='Switch_kommision_report()'>Применить фильтры</button>
                    </div>
                </div>`;
    document.getElementById("reports").innerHTML=html_obj;
    var link = "http://26.173.145.160:8080/jasperserver/rest_v2/reports/reports/Digital_breakthrough/forma1.html"; 
    var iframe = document.createElement('iframe');
    frameborder=0;
    iframe.width="100%";
    iframe.height=window.innerHeight*0.6;
    iframe.id="rep";
    iframe.setAttribute("src", link);
    document.getElementById("reports").appendChild(iframe);
    var div = document.createElement("div");
        div.setAttribute("class", "row mt-4");
    html_obj=`  
                <div class='col-12 text-left'>
                <span class='dashboardText__head size'><i class="fa fa-download" aria-hidden="true" class='icon'></i>&nbsp;Для сохранения отчета выберите формат:</span>
                </div>
                <div class='col-12 col-lg-4'>
                    <button class='btn btn-funct mt-4 btn-docx' type='button' onclick='cl_date_docx()'>DOCX&nbsp;<i class="fa fa-file-word-o" aria-hidden="true"></i></button>
                </div>
                <div class='col-12 col-lg-4'>
                    <button class='btn btn-funct mt-4 btn-xls' type='button' onclick='cl_date_XLSx()'>XLSx&nbsp;<i class="fa fa-file-excel-o" aria-hidden="true"></i></button>
                </div>
                <div class='col-12 col-lg-4'>
                    <button class='btn btn-funct mt-4 btn-pdf' type='button' onclick='cl_date_PDF()'>PDF&nbsp;<i class="fa fa-file-pdf-o" aria-hidden="true"></i></button>
                </div>`;
    div.innerHTML=html_obj;
    document.getElementById("reports").appendChild(div);            
    SPO_select();
}
    function Switch_kommision_report(){
        let SPO, n;
            n=document.getElementById('SPO_select').options.selectedIndex;
            SPO=document.getElementById('SPO_select').options[n].value;
            if (SPO=='all'){
                document.getElementById('rep').src="http://26.173.145.160:8080/jasperserver/rest_v2/reports/reports/Digital_breakthrough/forma1.html";
            }else{
                document.getElementById('rep').src="http://26.173.145.160:8080/jasperserver/rest_v2/reports/reports/Digital_breakthrough/forma1.html?org_name="+SPO+"";
            }
    }