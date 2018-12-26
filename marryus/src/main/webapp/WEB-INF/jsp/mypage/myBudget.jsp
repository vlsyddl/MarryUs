<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/printThis/1.14.0/printThis.js"></script>
    <style>
/*            * { margin: 0px; padding: 0px; box-sizing: border-box; }
        body {
            font-size: 17px;
            color: #333;
            line-height: 3;
        }
        
        #outer_box{
        	margin-top: 40px;
        }

        .container-fluid {
            padding-left: 15px;
            padding-right: 15px;
            margin-left: auto;
            margin-right: auto;
        }
        .container {
            width: 1170px;
            padding-left: 15px;
            padding-right: 15px;
            margin-left: auto;
            margin-right: auto;    
        }


        table{
            border-spacing:50px;
            border-collapse: collapse;
            width: 1000px;
            border-radius: 10px;
            border: 0px;
        }
        td, th { padding: 10px;             
        text-align: center; 
        font-family: 맑은 고딕;}
        .table {
            width: 100%; 
            margin-bottom: 20px;
            font-size: 16px;
        }

         .table > tbody > tr {
            border-radius: 10px;
         }
        .table > tbody > tr > td, .table > tbody > tr > th {
            padding: 8px;
            vertical-align: top;
            line-height: 1.5;
        } 

        .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: #f9f9f9; 
        }
        
        .table-bordered > tbody > tr > td {
            border-bottom: 1px solid #ddd;
        }

        .table-bordered > tbody > tr > th{
            background: #ccc9c9;
            color: #5c4c4c;
            font-weight: 900;
        }

        .table-hover > tbody > tr:hover {
            background-color: #d6d6d6;
        }

        input, select{
            border-right:0px; border-top:0px; border-left:0px; border-bottom:1px solid #ccc9c9;
            line-height: 30px;
            font-size:15px;
        }
        
		input::placeholder {
		  color: blue;
		  font-style: italic;
		} */
		

/*//////////////////////////////////////////////////////////////////
[ FONT ]*/




/*//////////////////////////////////////////////////////////////////
[ RESTYLE TAG ]*/
* {
	margin: 0px; 
	padding: 0px; 
	box-sizing: border-box;
}

body, html {
	height: 100%;
	font-family: sans-serif;
}

/* ------------------------------------ */
a {
	margin: 0px;
	transition: all 0.4s;
	-webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
}

a:focus {
	outline: none !important;
}

a:hover {
	text-decoration: none;
}

/* ------------------------------------ */
h1,h2,h3,h4,h5,h6 {margin: 0px;}

p {margin: 0px;}

ul, li {
	margin: 0px;
	list-style-type: none;
}


/* ------------------------------------ */
        input, select{
            border-right:0px; border-top:0px; border-left:0px; border-bottom:1px solid #ccc9c9;
            line-height: 30px;
            font-size:15px;
            background: none;
        }

textarea {
  display: block;
  outline: none;
}

textarea:focus, input:focus {
  border-color: transparent !important;
}

/* ------------------------------------ */
button {
	outline: none !important;
	border: none;
	background: transparent;
}

button:hover {
	cursor: pointer;
}

iframe {
	border: none !important;
}


		input::placeholder {
		  color: #334455;
		} 




/*//////////////////////////////////////////////////////////////////
[ Utiliti ]*/






/*//////////////////////////////////////////////////////////////////
[ Table ]*/

.limiter {
  width: 100%;
  margin: 0 auto;
}

.container-table100 {
  width: 100%;
  min-height: 100vh;


  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  align-items: 60px;
  justify-content: center;
  flex-wrap: wrap;
  padding: 30px 30px;
}

.wrap-table100 {
  width: 1170px;
}

table {
  border-spacing: 1;
  border-collapse: collapse;
  background: white;
  border-radius: 10px;
  overflow: hidden;
  width: 100%;
  margin: 0 auto;
  position: relative;
}
table * {
  position: relative;
}
table td, table th {
  padding-left: 8px;
}
table thead tr {
  height: 60px;
  background:  rgba(255,191,222,1);
}
table tbody tr {
  height: 50px;
}
table tbody tr:last-child {
  border: 0;
}
table td, table th {
  text-align: center;
   line-height: 30px;
   vertical-align: middle;
}
table td.l, table th.l {
  text-align: right;
}
table td.c, table th.c {
  text-align: center;
}
table td.r, table th.r {
  text-align: center;
}


.table100-head th{
  font-size: 18px;
  color: #fff;
  line-height: 1.2;
  font-weight: unset;
}

tbody tr:nth-child(even) {
  background-color: #f5f5f5;
}

tbody tr {
  font-family: OpenSans-Regular;
  font-size: 15px;
  color: #808080;
  line-height: 1.2;
  font-weight: unset;
}

tbody tr:hover {
  color: #555555;
  cursor: pointer;
}



@media screen and (max-width: 992px) {
  table {
    display: block;
  }
  table > *, table tr, table td, table th {
    display: block;
    line-height: 30px;
    vertical-align: middle;
  }
  table thead {
    display: none;
  }
  table tbody tr {
    height: auto;
    padding: 37px 0;
  }
  table tbody tr td {
    padding-left: 40% !important;
    margin-bottom: 24px;

  }
  table tbody tr td:last-child {
    margin-bottom: 0;
  }
  table tbody tr td:before {
    font-family: OpenSans-Regular;
    font-size: 14px;
    color: #999999;
    line-height: 1.2;
    font-weight: unset;
    position: absolute;
    width: 40%;
    left: 30px;
    top: 0;
  }



  tbody tr {
    font-size: 14px;
  }
}

@media (max-width: 576px) {
  .container-table100 {
    padding-left: 15px;
    padding-right: 15px;
  }
}
		

    	a {
		    text-decoration: none;
		    color: #333;
		}
		.mypage .info_left{
		    height: 200px;
		    background: url(../resources/img/mypage_image.png)no-repeat center center/cover;
		}
		
		
		.mypage .info_left .time{
		    text-align: right;
		    position: absolute;
		    bottom: 10px;
		    right: 120px;
		}
		
		.mypage .info_right{
		    padding: 0px 50px;
		    height: 200px;
		}
		.infoBox{
			margin: 30px 0px;
			border: 1px solid #efeeee;
		}
		button{
		 margin : 10px 10px 0px 10px;
		 padding : 10px;
		 text-align: right;
		}
		.progress-bar {
		background-color: #ffbfce;
		}
		
		#outer_budget{
			width: 1170px;
			margin: auto;
		}
		button{
 margin : 10px 10px 0px 10px;
 padding : 10px;
 text-align: right;
}
.progress-bar {
background-color: #ffbfce;
}
#outer_budget .btnBox{
	margin-top: 15px;
}
#outer_budget .btnBox:after{
	display: block;
	clear: both;
	content: '';
}
#outer_budget .btnBox a{
    display: block;
    float: left;
    width: 180px;
    padding: 10px 0;
    background: #ffc7c7;
    text-align: center;
    font-size: 1.2em;
    border: 1px solid #d9d9d9;
    letter-spacing: 5px;
    transition: all 0.5s;
}
#outer_budget .btnBox a:hover{
	background: #fff;
	color: #333;
    text-decoration: none;
}
#outer_budget .btnBox a.downLoadBtn{
	border-radius: 10px 0 0 10px;
}
#outer_budget .btnBox a.printBtn{
	border-radius: 0 10px 10px 0;
}
		
		

    </style>

</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
<nav class="myPageNav">
           <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mypage/mywedding.do'/>">
                                    <img src="<c:url value="/resources/"/>img/hall_ico.png" alt="" class="img-responsive center-block">
                                나의 웨딩
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myTodo.do'/>">
                                    <img src="<c:url value="/resources/"/>img/chk_ico.png" alt="" class="img-responsive center-block">
                                체크리스트
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myBudget.do'/>">
                                <img src="<c:url value="/resources/"/>img/budget_ico.png" alt="" class="img-responsive center-block">
                                예산
                            </a>
                        </li>
                         <li>
                            <a href="<c:url value='/mypage/myAuction.do?choo=tab1&memNo=${user.no}&auctionType=v'/>">
                                <img src="<c:url value="/resources/"/>img/auction_ico.png" alt="" class="img-responsive center-block">
                                역경매 현황
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
                                <img src="<c:url value="/resources/"/>img/bookmark_ico.png" alt="" class="img-responsive center-block">
                                북마크
                            </a>
                        </li>
                    </ul>
            </div>
        </nav>
	 <div id="outer_budget">
	                      <form id="downForm" action="downExcel2.do">
	        				 <input type="hidden" id="memNo" name="memNo" value="${user.no}">
	                        </form>
	                        <div class="btnBox">	                        	
		                        <a href="#" class="downLoadBtn">DownLoad</a>
		                        <a href="#" class="printBtn">Print</a>
	                        </div>
<%-- 	            <form action="downExcel2.do">
	   			<input type="hidden" id="memNo" name="memNo" value="${user.no}">
	            <button class="downLoadBtn" style="float:left;">download</button>
	       </form>
	             <button class="printBtn">Print</button> --%>
	             
	             
	             
	             
                 <div class="infoBox cf">
                    <div class="col-md-6 no-padding info_left">
                        <div class="time cf">
                            <dl class="day">
                                <dt>Days</dt>
                                <dd>0</dd>
                            </dl>
                            <dl class="hours">
                                <dt>Hours</dt>
                                <dd>0</dd>
                            </dl>
                            <dl class="min">
                                <dt>Min</dt>
                                <dd>0</dd>
                            </dl>
                            <dl class="sec">
                                <dt>Sec</dt>
                                <dd>0</dd>
                            </dl>
                        </div>
                    </div>
                    
                    
                    <div class="col-md-6 no-padding info_right">
                    <%--     <div class="progressBar">
                            <p style=" font-size: 23px;  font-family:맑은고딕; font-weight: 700;">예산 진행도</p>
                           		<c:choose>
                           			<c:when test="${spendBudget==0}">
                           				<c:set  var="t" value="0" />
                           			</c:when>
                           			<c:when test="${spendBudget==0 && totalBudget==0}">
                           				<c:set  var="t" value="0" />
                           			</c:when>
                            			<c:when test="${totalBudget==0 && spendBudget!=0}">
                           				<c:set  var="t" value="${totalBudget}" />
                           			</c:when>
                           			<c:when test="${totalBudget!=0 && spendBudget==0}">
                           				<c:set  var="t" value="${totalBudget}" />
                           			</c:when> 
                           			<c:otherwise>
                           				<fmt:parseNumber var="t" value="${3000/spendBudget*100}" integerOnly="true" />
                           			</c:otherwise>
                           		</c:choose>

                            <div class="progress" style="height: 20px;">
  								<div class="progress-bar" role="progressbar" style="width: ${t}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
                            <p style=" font-size: 22px; text-align: right; ">3000 out of </p>
                             <c:choose>
	                            <c:when test="${totalBudget!=0 && spendBudget==0}">  
	                            <p style=" font-size: 17px; font-style: italic; font-family:맑은고딕; text-align: right; font-weight: 900;"><span style=" font-size: 45px;font-weight: 900; ">${totalBudget}</span>만원</p>
 	                            </c:when>
	                            <c:when test="${t<=100}">
	                             <p style=" font-size: 17px; font-style: italic; font-family:맑은고딕; text-align: right; font-weight: 900;"><span style=" font-size: 45px;font-weight: 900; ">${t} </span>%</p>
	                            </c:when>
	                            <c:when test="${t>100}">
	                             <p style=" font-size: 17px; font-style: italic; font-family:맑은고딕; text-align: right; font-weight: 400;"><span style=" font-size: 25px;font-weight: 900; line-height: 2em">예산이 지출을 넘었어요</span>${t}%</p>
	                            </c:when> 
                            </c:choose> 
                        </div>
                    </div> --%>
                        <div class="progressBar">
                            <p style=" font-size: 23px;  font-family:맑은고딕; font-weight: 700;">예산 진행도</p>
                             <c:choose>
	                            <c:when test="${spendBudget==0}">
	                                <c:set  var="t" value="0" />
	                            </c:when>
	                            <c:otherwise>
	                            	<fmt:parseNumber var="t" value="${spendBudget/3000*100}" integerOnly="true" />
	                            </c:otherwise>
	                         </c:choose>
                            <div class="progress" style="height: 20px;">
  								<div class="progress-bar" role="progressbar" style="width: ${t}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
                            <p style=" font-size: 22px; text-align: right; ">${spendBudget} out of 3000</p>
                            <p style=" font-size: 17px; font-style: italic; font-family:맑은고딕; text-align: right; font-weight: 900;"><span style=" font-size: 45px;font-weight: 900; ">${t}</span>%</p>
                        </div>
                    </div> 
                </div>  
        
        
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
            <th>카테고리</th>
            <th>항목</th>
            <th>예산</th>
            <th>지출</th>
            <th></th>
							</tr>
						</thead>
						<tbody>


    <c:forEach var="bList" items="${budgetList}">
        <tr id="${bList.budgNo}">
            <td class="category">${bList.codeValue}</td>
            <td class="content">${bList.budgContent}</td>
            <td class="budget">${bList.budgBudget}만원</td>
            <td class="expenses">${bList.budgExpenses}만원</td>
            <td>
				<a href="#" class="updateIcon" data-budgno="${bList.budgNo}"><i class="fas fa-pen"></i></a>
				<a href="#" onclick="deleteBudget(${bList.budgNo})"><i class="fas fa-trash-alt"></i></a>
			</td>
        </tr>
    </c:forEach>
        
	<form id="writeBudgetForm" method="post">
        <input type="hidden" name="memNo" value="${user.no}">
        <tr>
            <td>
                <select id="budgCategory" name="budgCategory">
                    <option value="">--카테고리--</option>
                    <option value="vn">웨딩홀</option>
                    <option value="sd">스드메</option>
                    <option value="hm">허니문</option>
                    <option value="jh">예물, 혼수</option>
                    <option value="as">추가서비스</option>
                </select>
            </td>
            <td><input type="text" id="budgContent" name="budgContent" placeholder="항목을 입력하세요."></td>
            <td><input type="text" id="budgBudget" name="budgBudget" placeholder="예산을 입력하세요.">만원</td>
            <td>
                <input type="text" id="budgExpenses" name="budgExpenses" placeholder="지출을 입력하세요.">만원
            </td>
            <td>
                <a href="#" id="writeBtn"><i class="fas fa-pen"></i></a>
            </td>
        </tr>
	</form>
   	</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

    
	<script>
	
	   $(function(){
	        $(document).ready(function(){
	          	var memNo  = $("#memNo").val();
	          	  $.ajax({
	                    url:"/marryus/mypage/MyproFileWeddingDate.json",
	                    data:{memNo:memNo },
	                    type:"post"
	                 })
	                 .done(function(result){
	                    var wd = moment(result.wedDate).format('YYYY-MM-DD');
	                    $.fn.CountDownTimer(wd); 
	                 });
	                
	          });
	        });
	
		$("#writeBtn").click(function () {
		    if($("#budgCategory").val() == "") {
		    	alert("카테고리를 선택해주세요.");
		    } else if ($("#budgContent").val() == "") {
		    	alert("항목을 입력해주세요.");
		    } else if ($("#budgBudget").val() == "") {
		    	alert("예산을 입력해주세요.");
		    } else if ($("#budgExpenses").val() == "") {
		    	alert("지출을 입력해주세요.");
		    } else {
			    $.ajax({
			        url : '<c:url value="/mypage/writeMyBudget.do" />',
			        data : $("#writeBudgetForm").serialize(),
			        cache : false
			    }).done(function () {
			    	location.href='/marryus/mypage/myBudget.do?memNo=${user.no}';
			    });
		    }
		});
		
		
		$(".updateIcon").click(function () {
			var budgNo = $(this).data("budgno");
			var parent = document.getElementById(budgNo);
			
			
			
			var category = parent.childNodes[1].textContent;
			var content = parent.childNodes[3].textContent;
			var budget = parent.childNodes[5].textContent.substring(0, parent.childNodes[5].textContent.length-1);
			var expenses = parent.childNodes[7].textContent.substring(0, parent.childNodes[5].textContent.length-1);
			var html = '';
			html += '<input type="hidden" name="budgNo" value="'+budgNo+'"/>';
			html += '<td>'+category+'</td>';
			html += '<td><input type="text" id="content" value="'+content+'"/></td>';
			html += '<td><input type="text" id="budget" value="'+budget+'"/></td>';
			html += '<td><input type="text" id="expenses" value="'+expenses+'"/></td>';
			html += '<td>';
			html += '<a href="#" class="updateAEle"><i class="fas fa-pen"></i></a>';
			html += '</td>';
			
			$("#"+budgNo+"").html(html);
			
			$(".updateAEle").click(function () {
				if ($("#content").val() == "") {
			    	alert("항목을 입력해주세요.");
				} else if ($("#budget").val() == "") {
					alert("예산을 입력해주세요.");
				} else if ($("#expenses").val() == "") {
					alert("지출을 입력해주세요.");
				} else {
					$.ajax({
				        url : '<c:url value="/mypage/updateMyBudget.do" />',
				        data : {
				        	"budgNo" : budgNo,
				        	"budgContent" : $("#content").val(),
				        	"budgBudget" : $("#budget").val(),
				        	"budgExpenses" : $("#expenses").val()
				        },
				        cache : false
					}).done(function () {
				    	location.href='/marryus/mypage/myBudget.do?memNo=${user.no}';
					});
				}
			})	
		});
		
		function deleteBudget(budgNo) {
			$.ajax({
		        url : '<c:url value="/mypage/deleteMyBudget.do" />',
		        data : "budgNo="+budgNo,
		        cache : false
			}).done(function () {
		    	location.href='/marryus/mypage/myBudget.do?memNo=${user.no}';
			});
		};
		
		

				
				$(".printBtn").on("click", function(){
					$('.table100').printThis({
						
					});
				});
				
				
				
				 $(".downLoadBtn").click(function(e){
					 e.preventDefault();
					 $("#downForm").submit();
				 })
				 

		
	</script>
</body>
</html>