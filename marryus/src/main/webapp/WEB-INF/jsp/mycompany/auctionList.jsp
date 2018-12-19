

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
    
    <style>
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
  min-height: 60vh;


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

        .redBack{
            background: #b91e1e
        }
        .blueBack{
            background: #1a5591
        }
        .grayBack{
            background: #b6b6b6
        }
        .pinkBack{
            background:#9fb0d6
        }
        
                .textstyle{
            color: #f9f9f9;
            font-weight: 700;
            border-radius: 3px;
            padding: 6px;
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
   background-color: #f9f9f9;
}

tbody tr {
  font-family: OpenSans-Regular;
  font-size: 15px;
  color: #808080;
  line-height: 1.2;
  font-weight: unset;
  border-bottom: 1px solid #eeeeee;
    font-weight: 700;
}

tbody tr:hover {
  color: #555555;
   background-color: #f2f2f2
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

nav{ text-align: center;}
        
        
        


    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
        <nav class="myCompanyNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mycompany/myCompany.do'/>">
                                <img src="<c:url value="/resources/"/>img/company_ico.png" alt="" class="img-responsive center-block">
                                My Company
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/service.do'/>">
                                    <img src="<c:url value="/resources/"/>img/card_ico.png" alt="" class="img-responsive center-block">
                                My Service
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/auctionList.do'/>">
                                <img src="<c:url value="/resources/"/>img/graph_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/reservationView.do'/>">
                                <img src="<c:url value="/resources/"/>img/reservation_icon2.png" alt="" class="img-responsive center-block" style="padding: 5px;">
                                My Reservation
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
            <th>입찰 신청일</th>
            <th>경매 신청인</th>
            <th>경매 결과</th>
            <th>낙찰액</th>
							</tr>
						</thead>
						<tbody>
        <c:forEach items="${autionList}" var="auction">
        
        <tr>
            <td><fmt:formatDate value='${auction.tenderRegdate}' pattern='yyyy-MM-dd' /></td>
            <td>${auction.memName}</td>
            <td>
            	<c:choose>
            		<c:when test="${auction.tenderStatus=='ing' && auction.dday<0}"> <span class="redBack textstyle">유찰</span> </c:when>
            		<c:when test="${auction.tenderStatus=='done'}"> <span class="blueBack textstyle">낙찰</span> </c:when>
            		<c:when test="${auction.tenderStatus=='ing' && auction.dday>=0}"> <span class="grayBack textstyle">미정</span> </c:when>
            		<c:when test="${auction.tenderStatus=='choo'}"> <span class="pinkBack textstyle">예약</span> </c:when>
            	</c:choose>
            </td>
            <td><fmt:formatNumber type='currency' value='${auction.tenderBudget}' pattern='###,###'/>원</td>
        </tr>
        </c:forEach>
   	</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

    
    
    
    <c:if test="${count != 0}">
			<nav>
			  <ul class="pagination">
			    <li <c:if test="${beginPage==1}">class="disabled"</c:if> >
			    <c:choose>
			    	<c:when test="${beginPage!=1}">
			    		<a href="${pageResult.beginPage - 1}" aria-label="Previous">
			    	</c:when>
			    	<c:otherwise><a href="#" aria-label="Previous"></c:otherwise>
			    </c:choose>
			      
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
				<c:forEach var="i" begin="${beginPage}" end="${endPage}">
					<li <c:if test="${i eq pageNo}">class="active"</c:if> >
						<c:choose>
							<c:when test="${i ne pageNo}" >
								<a href="auctionList.do?pageNo=${i}">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="#">${i}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
			    <li <c:if test="${lastPage==endPage}">class="disabled"</c:if> >
			        <c:choose>
				    	<c:when test="${lastPage!=endPage}">
				    		<a href="auctionList.do?pageNo=${pageResult.beginPage + 1}" aria-label="Next">
				    	</c:when>
				    	<c:otherwise><a href="#" aria-label="Next"></c:otherwise>
			    	</c:choose>
			    	<span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</c:if>
    
  </div>

        
        
        

    
    
 
		
    </div>
    
    

</body>
</html>