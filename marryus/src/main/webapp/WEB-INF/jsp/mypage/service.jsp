<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
<style>
	table{
		width: 600px;
	}
	table tr, table td{
		border-collapse: collapse;
		vertical-align: middle;
	}
	
	.table_outer>td{
		border: 1px solid black;
	}
	.title{
		font-size: 20px;
		font-weight: 800;
	}
	.subtitle{
		font-size: 15px;
		font-weight: 500;
	}
	.InsertProfile>td{
		font-size: 50px;
		font-weight: 800;
		border: 3px dashed black;
	}
	


</style>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
        <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li>
                            <a href="<c:url value='/mypage/myweddingService.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                my service 
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/service.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                service add
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/auctionList.do'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                my tender
                            </a>
                        </li>
                    </ul>
            </div>
        </nav>
        
        
        
        
        
        
	<c:forEach var="auction" items="${autionList}">
	<a >
	<table onClick="location.href=`http://localhost:8000/marryus/mypage/myServiceUpdate.do?memNo=10&comInfoNo=${auction.comInfoNo}`" style="cursor:pointer;" calss="table_outer">
		<tr>
			<td><img src="<c:url value="/${auction.comFilePath}/${auction.comFileName}"/>" width="150px" height="100px"/></td>
			<td><table><tr><td class="title">${auction.comInfoName}</td></tr>
			<tr><td class="subtitle">
			<c:choose>
				<c:when test="${auction.comInfoType=='v'}">웨딩홀</c:when>
				<c:when test="${auction.comInfoType=='s'}">스튜디오</c:when>
				<c:when test="${auction.comInfoType=='d'}">드레스</c:when>
				<c:when test="${auction.comInfoType=='m'}">메이크업</c:when>
				<c:when test="${auction.comInfoType=='h'}">허니문</c:when>
				<c:when test="${auction.comInfoType=='j'}">예물</c:when>
				<c:when test="${auction.comInfoType=='e'}">기타</c:when>
			</c:choose>
			</td></tr>
			</table>
			</td>
		</tr>
	</table>
	</a>
	</c:forEach>
	<a>
	<table onClick="location.href=`http://localhost:8000/marryus/mypage/myService.do`" style="cursor:pointer;" class="InsertProfile">
		<tr>
			<td style="font-size: 50px; font-weight: 800;">+</td>
		<tr>
	</table>
	</a>
	
	</div>
</body>
</html>