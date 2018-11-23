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
    <style>
       * { margin: 0px; padding: 0px; box-sizing: border-box; }
        body {
            font-size: 17px;
            color: #333;
            line-height: 3;
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
            text-align: center;
        }
        td, th { padding: 0px; }
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
            line-height: 1.42;
        } 

        .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: #f9f9f9; 
        }
        
        .table-bordered > tbody > tr > td {
            border-bottom: 1px solid #ddd;
        }

        .table-bordered > tbody > tr > th{
            background: #e9d5d5;
            color: #5c4c4c;
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

    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
</head>
<body>
    <table class="table-bordered container-fluid">
        <tr>
            <th>입찰 신청일</th>
            <th>경매 신청인</th>
            <th>경매 결과</th>
            <th>낙찰액</th>
        </tr>
        <c:forEach items="${autionList}" var="aution">
        <c:forEach items="${aution.tenderList}" var="tender">
        
        <tr>
            <td><fmt:formatDate value='${tender.tenderRegdate}' pattern='yyyy-MM-dd' /></td>
            <td>${aution.genName}</td>
            <td>
            	<c:choose>
            		<c:when test="${tender.tenderStatus=='done'}"> <span class="redBack textstyle">유찰</span> </c:when>
            		<c:when test="${tender.tenderStatus=='choo'}"> <span class="blueBack textstyle">낙찰</span> </c:when>
            		<c:when test="${tender.tenderStatus=='ing'}"> <span class="grayBack textstyle">미정</span> </c:when>
            	</c:choose>
            </td>
            <td><fmt:formatNumber type='currency' value='${tender.tenderBudget}' pattern='###,###'/>원</td>
        </tr>
        </c:forEach>
        </c:forEach>
        
        
        
    </table>
    
    
  
		<c:if test="${pageResult.count != 0}">
			<nav>
			  <ul class="pagination">
			    <li <c:if test="${pageResult.prev eq false}">class="disabled"</c:if> >
			      <a href="${pageResult.beginPage - 1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
				<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
					<li <c:if test="${i eq pageResult.pageNo}">class="active"</c:if> >
						<c:choose>
							<c:when test="${i ne pageResult.pageNo}" >
								<a href="${i}">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="#">${i}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
			    <li <c:if test="${pageResult.next eq false}">class="disabled"</c:if> >
			      <a href="${pageResult.endPage + 1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</c:if>
		
    
    
    
    <script>
    
    </script>
</body>
</html>