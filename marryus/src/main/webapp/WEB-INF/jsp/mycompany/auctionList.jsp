

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
       * { margin: 0px; padding: 0px; box-sizing: border-box; }
        body {
            color: #333;
            line-height: 3;
        }

        .c-fluid {
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
            width: 800px;
            margin: 50px 0px;
            text-align: center;
        }
        td, th { padding: 0px; text-align: center;}

        .table {
            width: 100%; 
            margin-bottom: 20px;
        }

         .table > tbody > tr {
            border-radius: 10px;
         }
        .table > tbody > tr > td, .table > tbody > tr > th {
            padding: 8px;
            vertical-align: top;
            border-top: 1px solid #ddd;
        } 

        .tb-striped > tbody > tr:nth-of-type(odd) {
            background-color: #f9f9f9; 
        }
        
        .tb-bordered > tbody > tr > td {
            border-bottom: 1px solid #ddd;
            font-size: 18px;
            line-height: 2.3;
        }

        .tb-bordered > tbody > tr > th{
            background: #e9d5d5;
            color: #5c4c4c;
            font-size: 20px;
            line-height: 2.5;
        }

        .table-hover > tbody > tr:hover {
            background-color: #d6d6d6;
        }

        tr:hover{
            background: #fbf8f8;
            color: #5c4c4c;
        }

        .btn {
            padding: 6px 12px;
            border: 1px solid transparent;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:active {
            box-shadow: 0 3px 5px rgba(0, 0, 0, .125) inset;
        }
        .btn:focus, .btn:hover {
            color: #333;
        }
        /** https://xetown.com/questions/570699 값에 따라  색상 바꾸는 법*/
        .redBack{
            background: rgb(168, 37, 37);
        }
        .blueBack{
            background: rgb(29, 29, 173)
        }
        .grayBack{
            background: rgb(188, 188, 190)
        }
        .textstyle{
            color: #f9f9f9;
            font-weight: 700;
            border-radius: 3px;
            padding: 3px;
        }
        
        
        nav{
           text-align: center;   
        }
        
        
        


    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
</head>
<body>
<header>
	<div class="container">
		<div class="row">
			<div class="logo col-md-3">
				<a href="<c:url value="/main/main.do"/>"><img
					src="<c:url value="/resources/img/logo.png"/>" alt=""
					class="img-responsive center-block"></a>
			</div>
			<nav class="gnb col-md-9">
			<div class="gnb_top cf">
				<ul class="cf">
					<li><a href="<c:url value='/signup/signupPro.do' />">회원가입</a></li>
					<!-- 로그인, 로그아웃 -->
					<c:if test="${user.email eq null}">
						<li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
					</c:if>
					<c:if test="${user.email ne null}">
					
							<li>${user.name}님이로그인 하셨습니다.</li>
					
						<li><a href="<c:url value='/main/logout.do' />"> 로그아웃</a></li>
					</c:if>
					<li><a href="<c:url value="/mypage/mywedding.do"/>">마이페이지</a></li>
					<li><a href="#"><i class="far fa-bell"></i></a></li>
				</ul>
			</div>
			<div class="gnb_bot cf">
				<ul class="cf">
					<li><a href="<c:url value="/service/weddingHall.do"/>">웨딩홀</a></li>
					<li><a href="#">스&middot;드&middot;메</a></li>
					<li><a href="#">허니문</a></li>
					<li><a href="#">예물</a></li>
					<li><a href="#">추가서비스</a></li>
				</ul>
			</div>
			</nav>
		</div>
	</div>
	<span class="gnbBar"></span> 
</header>
    <div id="wrap" class="mypage">
        <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
                                    <img src="img/hall_ico.png" alt="" class="img-responsive center-block">
                                My Wedding
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/auctionList.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                Check List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/todoExample.do'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/generalUpdate.do'/>">
                                <img src="img/budget_ico.png" alt="" class="img-responsive center-block">
                                Budget Spent
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/companyUpdate.do'/>">
                                <img src="img/bookmark_ico.png" alt="" class="img-responsive center-block">
                                Bookmark
                            </a>
                        </li>
                    </ul>
            </div>
        </nav>
        
        
        
        
        

    
        <table class="tb-bordered c-fluid">
        <tr>
            <th>입찰 신청일</th>
            <th>경매 신청인</th>
            <th>경매 결과</th>
            <th>낙찰액</th>
        </tr>
        <c:forEach items="${autionList}" var="auction">
        
        <tr>
            <td><fmt:formatDate value='${auction.tenderRegdate}' pattern='yyyy-MM-dd' /></td>
            <td>${auction.memName}</td>
            <td>
            	<c:choose>
            		<c:when test="${auction.tenderStatus=='done'}"> <span class="redBack textstyle">유찰</span> </c:when>
            		<c:when test="${auction.tenderStatus=='choo'}"> <span class="blueBack textstyle">낙찰</span> </c:when>
            		<c:when test="${auction.tenderStatus=='ing'}"> <span class="grayBack textstyle">미정</span> </c:when>
            	</c:choose>
            </td>
            <td><fmt:formatNumber type='currency' value='${auction.tenderBudget}' pattern='###,###'/>원</td>
        </tr>
        </c:forEach>
    </table>
    
    
    
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
    
    
    <script>
    
    </script>
</body>
</html>