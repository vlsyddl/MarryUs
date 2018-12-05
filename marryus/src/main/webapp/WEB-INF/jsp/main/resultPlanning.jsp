<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="https://fonts.googleapis.com/css?family=Crete+Round:400i|Lato:400,900s" />
<c:import url="/common/importCss.jsp"/>
<c:import url="/common/importJs.jsp"/>
<c:import url="/common/webSocket.jsp"/>
<style>
html {
  box-sizing: border-box;
  font-size: 10px;
  line-height: 1.42857143;
}
*,
*:before,
*:after {
  box-sizing: inherit;
}
body {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100vh;
  position: relative;
  background: #ebebeb;
  font-family: 'Lato', sans-serif;
  font-weight: 700;
  color: #333333;
  padding: 2rem;
}
h1 {
  font-family: 'Crete Round', serif;
  margin: 0;
  font-size: 4rem;
  line-height: 1;
  font-weight: 200;
}
h1 img {
  float: right;
  vertical-align: top;
}
@media (max-width: 630px) {
  h1 img {
    width: 40px;
  }
}
p {
  font-size: 1.4rem;
  font-weight: 400;
}
.sub-head {
  margin: 0.6rem 0;
  color: #999999;
}
main {
  margin: auto;
}
.description {
  width: 74%;
}
@media (max-width: 485px) {
  .description {
    width: 100%;
  }
}
.receipt {
  width: 100%;
  padding: 4rem;
  min-height: 200px;
  background: #FFF;
  border-top: 5px solid #006341;
  position: relative;
}
.receipt:after {
  background: linear-gradient(-45deg, transparent 8px, #FFF 0), linear-gradient(45deg, transparent 8px, #FFF 0);
  background-position: left bottom;
  background-size: 8px 32px;
  content: "";
  width: 100%;
  height: 8px;
  position: absolute;
  bottom: -8px;
  left: 0px;
}
@media (min-width: 630px) {
  .receipt {
    margin: auto;
    top:100px;
    width: 600px;
    padding: 5rem;
  }
}
header {
  margin-bottom: 5rem;
}
footer {
  margin: 4rem 0;
  text-align: center;
  color: #aaaaaa;
}
footer p {
  font-size: 1.2rem;
}
address {
  font-weight: 400;
  font-style: normal;
}
table {
  border-spacing: 0;
  border-collapse: collapse;
  width: 100%;
  margin-top: 3rem;
}

table td {
  font-size: 1.4rem;
  font-weight: 400;
  vertical-align: top;
  border-top: 1px solid #dddddd;
  padding: 2rem 0;
}
.table__img {
  width: 20%;
}
.table__desc {
  width: 65%;
  padding: 2rem 2rem;
}
.table__price {
  width: 15%;
  text-align: right;
}
.table__total {
  text-align: right;
  border-width: 3px;
  border-color: #444;
}
.u-shadow {
  box-shadow: 1px 1px 2px #DDD;
}
.dDay{
 font-size:16px	; font-weight: bolder;
}

.lists{
	display: none;
}
#CheckBtn{
display: block;
}
</style>
</head>
<body>
<c:import url="/common/importHeader.jsp" />
        <main class="container-main">
        
        <input type="hidden" id="memNo" name="memNo" value="${user.no }">
                <div class="receipt">
                      <div class="header"></div>
                        <h1>
                          Your To do List
                        </h1>
                        <input id="CheckBtn" onclick="openList()" type="button" value="todoList 확인하기" >
                    <div class="lists" >
                    <hr>
                    <p class="dDay">상세 내역보기</p>
                      <hr>
                      <div class='detail'>
                        <p>결혼 날짜 : </p>
                        <p>결혼 예정일 : </p>
                        <p>결혼 예정 장소 : </p>
                      </div>
                    <hr>
                    <div class="description">
                        <p class="dDay">D-100</p>
                    </div>
                    <table id="todoListTable">
                        <tbody>
                    
                            
                        </tbody>
                    </table>
                    <hr>
                    <div class="description">
                            <p class="dDay">D-80</p>
                    </div>
                    <table id="todoListTable2">
                            <tbody>
                          
                                </tr>
                                
                            </tbody>
                        </table>
                        <hr>
                        <div class="description">
                                <p class="dDay">D-60</p>
                            </div>
                            <table id="todoListTable3">
                                <tbody>
                                 

                                </tbody>
                            </table>
                            <div class="description">
                                <p class="dDay">D-40</p>
                            </div>
                            <table id="todoListTable4">
                                <tbody>
                               
                                    
                                </tbody>
                            </table>
                            <div class="description">
                                <p class="dDay">D-20</p>
                            </div>
                             <table id="todoListTable5">
                                <tbody>
                                
                                    
                                </tbody>
                            </table>
                             <div class="description">
                                <p class="dDay">D-일주일전</p>
                            </div>
                             <table id="todoListTable6">
                                <tbody>
                                   
                                    
                                </tbody>
                            </table>
                    </div>
                </div>
                
               
            </main>
<script>

$(document).ready(function(){
		var no = $("#memNo").val()
	$.ajax({
		url:"/resultPlanning.json",
		data:"memNo="+no
	})
	.done(function(reuslt){
		alert(reuslt);
		
	});
		
});

function openList(){
	$(".lists").css("display", "block");
	$("#CheckBtn").css("display", "none");
	
	var no = $("#memNo").val()
	$.ajax({
		url:"/marryus/main/resultPlanning.json",
		data:"memNo="+no
	})
	.done(function(result){
		console.log(result);

		/*
			상세내역 뽑기 
		*/
		var detail = '';
		for(i=0; i<1 ; i++){
		detail += ' <p>결혼 장소 : '+result[i].weddingPlan.planPlace+'</p>'
		detail += ' <p>결혼 예정일 : '+result[i].weddingPlan.planWedDate+'</p>'
		detail += ' <p>결혼 예산 : '+result[i].weddingPlan.planBudget+'</p>'
		}
		
		$(".detail").html(detail);
		
		/*
		상세내역 뽑기 
		*/
		var html = '';
		for(i=0; i<result.length ; i++){
			if(result[i].todoDday == '120'){
			html += '<tr>'
			html += '<td class="table__img">'+result[i].todoCategory+'</td>'
			html += '<td class="table__desc">'+result[i].todoContent+'</td>'
			html += '<tr>'
			}
		}
		
		$("#todoListTable").html(html)
		
		var html2='';
		for(i=0; i<result.length ; i++){
			if(result[i].todoDday == '110'){
			html2 += '<tr>'
			html2 += '<td class="table__img">'+result[i].todoCategory+'</td>'
			html2 += '<td class="table__desc">'+result[i].todoContent+'</td>'
			html2 += '<tr>'
			}
		}
		$("#todoListTable2").html(html2);
		
		
		var html3='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday <= '90'  && result[i].todoDday >= '70'){
				html3 += '<tr>'
				html3 += '<td class="table__img">'+result[i].todoCategory+'</td>'
				html3 += '<td class="table__desc">'+result[i].todoContent+'</td>'
				html3 += '<tr>'
			}
		}
		$("#todoListTable3").html(html3);
		
		var html4='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday <= '60'&& result[i].todoDday >= '40'){
				html4 += '<tr>'
				html4 += '<td class="table__img">'+result[i].todoCategory+'</td>'
				html4 += '<td class="table__desc">'+result[i].todoContent+'</td>'
				html4 += '<tr>'
			}
		}
		$("#todoListTable4").html(html4);
		
		var html5='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday <= '30'  && result[i].todoDday >= '10'){
				html5 += '<tr>'
				html5 += '<td class="table__img">'+result[i].todoCategory+'</td>'
				html5 += '<td class="table__desc">'+result[i].todoContent+'</td>'
				html5 += '<tr>'
			}
		}
		$("#todoListTable5").html(html5);
		
		var html6='';
		for(i=0; i<result.length ; i++){
			if( result[i].todoDday =='7'){
				html6 += '<tr>'
				html6 += '<td class="table__img">'+result[i].todoCategory+'</td>'
				html6 += '<td class="table__desc">'+result[i].todoContent+'</td>'
				html6 += '<tr>'
			}
		}
		$("#todoListTable6").html(html6);
	});
}


</script>            
            
</body>
</html>