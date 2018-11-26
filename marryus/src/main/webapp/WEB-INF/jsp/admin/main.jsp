<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marry Us</title>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/admin.css"/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>

</head>
<body>
    <aside id="gnb">
        <div class="profile">
            <span class="name"><c:out value="${admin.admName}"/></span>
            <script>
            	$(document).ready(function(){
            		var type = "${admin.admType}";
                	
                	var grant;
                	if(type=='sadm'){
    					grant = "최고관리자";      		
                	}else{
                		grant = "일반관리자";
                	}
                	$(".grant").html(grant);
            	})
            	
            </script>
            <span class="grant"></span>
            <div class="btnBox">
                <a href="#" class="modify">Modify</a>
                <a href="<c:url value="/admin/logout.do"/>" class="logout">Log Out</a>
            </div>
        </div>
        <nav>
            <ul>
                <li class="active"><a href="#"><i class="fas fa-th-large"></i> Main</a></li>
                <li><a href="#"><i class="fas fa-list"></i> Boarad</a></li>
                <c:if test="${admin.admType eq 'sadm'}">
                	<li><a href="#"><i class="fas fa-user-cog"></i> User</a></li>
                </c:if>
                <li><a href="#"><i class="fas fa-gift"></i> Event</a></li>
            </ul>
        </nav>
    </aside>
    <div id="wrap" class="main cf">
        <h2 class="title">
            Admin Main
        </h2>
        <section class="itemWrap">
            <div class="item item01">
                <h3 class="item_title">
                    접속 통계                    
                </h3>
                <canvas id="connectionStatistics"></canvas>
            </div>
            <div class="item item02">
                <h3 class="item_title">
                    경매 통계                    
                </h3>
                <canvas id="auctionStatistics"></canvas>
            </div>
            <div class="item item03">
                <h3 class="item_title">
                    회원 통계                    
                </h3>
                <canvas id="userStatistics"></canvas>
            </div>
            <div class="item item04">
                <h3 class="item_title">
                    승인이 필요한 회원                    
                </h3>
                <div class="tableWrap">
                    <table class="table">
                        <colgroup>
                            <col width="30%">
                            <col width="*">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>아이디</th>
                                <th>회원 타입</th>
                                <th>가입일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>aaa</td>
                                <td>일반회원</td>
                                <td>2018.11.22</td>
                            </tr>
                            <tr>
                                <td>aaa</td>
                                <td>일반회원</td>
                                <td>2018.11.22</td>
                            </tr>
                            <tr>
                                <td>aaa</td>
                                <td>일반회원</td>
                                <td>2018.11.22</td>
                            </tr>
                            <tr>
                                <td>aaa</td>
                                <td>일반회원</td>
                                <td>2018.11.22</td>
                            </tr>
                            <tr>
                                <td>aaa</td>
                                <td>일반회원</td>
                                <td>2018.11.22</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
            <div class="item item05">
                <h3 class="item_title">
                    답변 안된 질문                    
                </h3>
                <div class="tableWrap">
                    <table class="table">
                            <colgroup>
                                <col width="10%">
                                <col width="*">
                                <col width="10%">
                            </colgroup>
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10</td>
                                <td>글제목</td>
                                <td>2018.11.22</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>글제목</td>
                                <td>2018.11.22</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>글제목</td>
                                <td>2018.11.22</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>글제목</td>
                                <td>2018.11.22</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>글제목</td>
                                <td>2018.11.22</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </section>
    </div>
    <script>
    	$(function(){
    		countConnection();
    	})
    	var ccCount = new Array();
    	var ccDate = new Array();
		function countConnection(){
			$.ajax({
				url : "<c:url value="/admin/countConnection.do"/>"
			}).done(function(data){
				console.log(data)
				for(var i = data.length-1;i>=0;i--){
					ccCount.push(data[i].count)
					ccDate.push(data[i].date)
				}
/* 				for (var b of data){
					ccCount.push(b.count)
					ccDate.push(b.date)
				} */
				connectionChart(ccDate,ccCount);
			})
		}	
        //접속 통계
        function connectionChart(date,count){
	        var chart1 = document.getElementById("connectionStatistics");
	        var options ={
	            scales: {
	                yAxes: [{
	                    ticks: {
	                     beginAtZero:true
	                    }
	                }]
	                    },
	                    legend: {
	                display: false
	            },
	        };
	        var dataHospital = {
	            labels: date,
	            datasets: [
	                {
	                    fill: false,
	                    lineTension: 0,
	                    backgroundColor : ["red","orange","yellow","green","blue","indigo","purple"],
	                    borderColor: "rgba(255, 19, 56, 0.65)",
	                    data: count,
	                }
	            ],
	        };
	
	        var hospitalChar = new Chart(chart1, {
	        type: 'bar',
	        data: dataHospital,
	        options: options
	        
	        });
        }
        // 경매 통계
        var chart2 = document.getElementById("auctionStatistics");
        var options2 ={
           
            legend:{
              position:'bottom'
            }
        };
        var dataAuction = {
            labels: ["웨딩홀","스드메","허니문","예물","추가서비스"],
            datasets: [
                {
                    fill: false,
                    lineTension: 0,
                    backgroundColor : ["red","orange","yellow","green","blue"],
                    borderWidth:0,
                    data: [100,80,92,57,61],
                }
            ],
            options: {
                scales: {
                    yAxes: [{
                      stacked: true
                    }]
                }
            }
        };

        var auctionChar = new Chart(chart2, {
        type: 'pie',
        data: dataAuction,
        options: options2
        
        });
        // 유저 통계
        Chart.defaults.global.barPercentage = 0.1
        var chart3 = document.getElementById("userStatistics");
        var options3 ={
            scales: {
                yAxes: [{
                    ticks: {
                     beginAtZero:true
                    }
                }]
                    },
                    legend: {
                display: false
            },
        };
        var dataUser = {
            labels: ["총 회원수","일반회원","기업회원"],
            datasets: [
                {
                    fill: false,
                    lineTension: 0,
                    backgroundColor : ["red","orange","yellow"],
                    borderWidth:0,
                    data: [100,80,92,1]
                },
            ],
            options3: {
                scales: {
                    yAxes: [{
                      stacked: true
                    }]
                }
            }
        };

        var usetChar = new Chart(chart3, {
        type: 'horizontalBar',
        data: dataUser,
        options: options3
        
        });
    </script>
</body>
</html>