<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
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


@font-face {
  font-family: OpenSans-Regular;
  src: url('../fonts/OpenSans/OpenSans-Regular.ttf'); 
}



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
		  font-style: italic;
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
  background: #36304a;
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
  font-family: OpenSans-Regular;
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
		
		
    </style>

</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
       <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mypage/mywedding.do'/>">
                                    <img src="img/hall_ico.png" alt="" class="img-responsive center-block">
                                My Wedding
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myTodo.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                Check List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myAuction.do?choo=tab1&memNo=${user.no}&auctionType=v'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myBudget.do'/>">
                                <img src="img/budget_ico.png" alt="" class="img-responsive center-block">
                                Budget Spent
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
                                <img src="img/bookmark_ico.png" alt="" class="img-responsive center-block">
                                Bookmark
                            </a>
                        </li>
                    </ul>
            </div>
        </nav>
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
            <td class="budget">${bList.budgBudget}원</td>
            <td class="expenses">${bList.budgExpenses}원</td>
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
            <td><input type="text" id="budgBudget" name="budgBudget" placeholder="예산을 입력하세요.">원</td>
            <td>
                <input type="text" id="budgExpenses" name="budgExpenses" placeholder="지출을 입력하세요.">원
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

    
	<script>
	
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
		    	console.log($("#writeBudgetForm").serialize());
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
			console.log($(this).data("budgno"));
			var budgNo = $(this).data("budgno");
			var parent = document.getElementById(budgNo);
			console.log(parent);
			var category = parent.childNodes[1].textContent;
			var content = parent.childNodes[3].textContent;
			var budget = parent.childNodes[5].textContent;
			var expenses = parent.childNodes[7].textContent;
			var html = '';
			html += '<input type="hidden" name="budgNo" value="'+budgNo+'"/>';
			html += '<td>'+category+'</td>';
			html += '<td><input type="text" id="content" value="'+content+'"/></td>';
			html += '<td><input type="text" id="budget" value="'+budget+'원"/></td>';
			html += '<td><input type="text" id="expenses" value="'+expenses+'원"/></td>';
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
			console.log(budgNo);
			$.ajax({
		        url : '<c:url value="/mypage/deleteMyBudget.do" />',
		        data : "budgNo="+budgNo,
		        cache : false
			}).done(function () {
		    	location.href='/marryus/mypage/myBudget.do?memNo=${user.no}';
			});
		};
		
	</script>
</body>
</html>