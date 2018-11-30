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
                <li class="active"><a href="<c:url value="/admin//main.do" />"><i class="fas fa-th-large"></i> Main</a></li>
                <li><a href="<c:url value="/admin/board.do" />"><i class="fas fa-list"></i> Boarad</a></li>
                <c:if test="${admin.admType eq 'sadm'}">
                	<li><a href="<c:url value="/admin/user.do"/>"><i class="fas fa-user-cog"></i> User</a></li>
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
                    <table class="table noAgreeMember">
                        <colgroup>
                            <col width="10%">
                            <col width="*">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>회원번호</th>
                                <th>아이디</th>
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
                    <table class="table noAnswerBoard">
                            <colgroup>
                                <col width="10%">
                                <col width="*">
                                <col width="10%">
                            </colgroup>
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                           
                        </tbody>
                    </table>

                </div>
            </div>
        </section>
    </div>
    <script>
    	$(function(){
    		countConnection();
    		noAnswerBoard();
    		countMember();
    		countAuction();
    		noAgreeMember();
    	})
    	
    	var ccCount = new Array(); //일자별 접속자 수
    	var ccDate = new Array(); // 일주일
    	
    	var mgCount; //일반회원 수
    	var mcCount; //기업회원 수
		var memberArray ; //토탈 회원수 
    	//접속자 체크
		function countConnection(){
			$.ajax({
				url : "<c:url value="/admin/countConnection.do"/>"
			}).done(function(data){
				console.log(data)
				for(var i = data.length-1;i>=0;i--){
					ccCount.push(data[i].count)
					ccDate.push(data[i].date)
				}
				connectionChart(ccDate,ccCount);
			})
		}	
		//회원수 체크
		function countMember(){
			$.ajax({
				url : "<c:url value="/admin/countMember.do"/>"
			}).done(function(data){
				console.log(data)
				memberChart(data.total,data.general,data.company)
			})
		}
		//분야별 경매 체크
		function countAuction(){
			$.ajax({
				url : "<c:url value="/admin/countAuction.do"/>"
			}).done(function(data){
				console.log(data)
				auctionChart(data);
			})
		}
		//회원 체크
		function noAgreeMember(){
			$.ajax({
				url : "<c:url value="/admin/noAgreeMember.do"/>"
			}).done(function(data){
				var html;
				for( b of data){
					html+="<tr>"
					html+="<td>"+b.no+"</td>"
					html+="<td>"+b.email+"</td>"
					html+="</tr>"
				}
				$(".noAgreeMember > tbody").html(html)
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
        function auctionChart(data){        	
	        var chart2 = document.getElementById("auctionStatistics");
	        var options2 ={
	           
	            legend:{
	              position:'bottom'
	            }
	        };
	        var dataAuction = {
	            labels: ["웨딩홀","스튜디오","드레스","메이크업","허니문","예물","추가서비스"],
	            datasets: [
	                {
	                    fill: false,
	                    lineTension: 0,
	                    backgroundColor : ["red","orange","yellow","green","blue","indigo","purple"],
	                    borderWidth:0,
	                    data: [data.weddingHall,data.studio,data.dress,data.makeUp,data.honeyMoon,data.jewelry,data.etc],
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
        }
        // 유저 통계
        function memberChart(total,general,company){
	        	
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
	                    data: [total,general,company,1]
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
        }
        
        Date.prototype.format = function(f) {
            if (!this.valueOf()) return " ";
         
            var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
            var d = this;
             
            return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
                switch ($1) {
                    case "yyyy": return d.getFullYear();
                    case "yy": return (d.getFullYear() % 1000).zf(2);
                    case "MM": return (d.getMonth() + 1).zf(2);
                    case "dd": return d.getDate().zf(2);
                    case "E": return weekName[d.getDay()];
                    case "HH": return d.getHours().zf(2);
                    case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
                    case "mm": return d.getMinutes().zf(2);
                    case "ss": return d.getSeconds().zf(2);
                    case "a/p": return d.getHours() < 12 ? "오전" : "오후";
                    default: return $1;
                }
            });
        };
         
        String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
        String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
        Number.prototype.zf = function(len){return this.toString().zf(len);};

        function noAnswerBoard(){
        	$.ajax({
        		url : "<c:url value="/admin/noAnswerBoard.do"/>"
        	}).done(function(data){
        		var html;
        		
        		console.log(data)
        		for(b of data){
					html +="<tr>"
					html +="<td>"+b.boardNo+"</td>"
                    html +="<td>"+b.title+"</td>"    
                    html +="<td>"+b.writer+"</td>"    
                    html +="<td>"+new Date(b.regDate).format("yyyy-MM-dd")+"</td>"
					html +="</tr>"        			
        		}
        		$(".noAnswerBoard > tbody").html(html)
        	})
        }
    </script>
</body>
</html>