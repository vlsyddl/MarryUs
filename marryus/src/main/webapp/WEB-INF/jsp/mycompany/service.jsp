<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<c:import url="/common/importCss.jsp" />
<c:import url="/common/importJs.jsp" />
<style>
table {
	width: 800px;
	margin: auto;
}

table tr, table td {
	border-collapse: collapse;
	vertical-align: middle;
}

.table_outer>td {
	border: 1px solid black;
}

.title {
	font-size: 20px;
	font-weight: 800;
}

.subtitle {
	font-size: 15px;
	font-weight: 500;
}

.InsertProfile>td {
	font-size: 50px;
	font-weight: 800;
	border: 3px dashed black;
}

.itemBox {
	padding: 30px 0;
}

.itemBox dl {
	border-bottom: 2px solid #333;
}

.itemBox dl+dl {
	margin-top: 15px;
}

.itemBox dl:after {
	display: block;
	clear: both;
	content: '';
}

.itemBox dl dt {
	width: 30%;
	float: left;
}

.itemBox dl dd {
	width: 70%;
	float: left;
	padding-left: 30px;
}

.itemBox dl dd h2 {
	font-size: 1.5em;
	font-weight: bold;
}

.itemBox dl dd p {
	margin-top: 15px;
	font-size: 1.2em;
}

.itemWrap .btnBox {
	text-align: right;
}

.itemWrap .btnBox a {
	display: inline-block;
	padding: 5px 20px;
	border-radius: 20px;
	background: #ff9292;
	color: #fff;
	font-size: 1.4em;
	border: 1px solid #d9d9d9;
}
</style>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
	<div id="wrap" class="mypage">
		<nav class="myCompanyNav">
		<div class="container">
			<ul>
				<li><a href="<c:url value='/mycompany/myCompany.do'/>"> <img
						src="<c:url value="/resources/"/>img/company_ico.png" alt=""
						class="img-responsive center-block"> 업체 정보
				</a></li>
				<li class="on"><a href="<c:url value='/mycompany/service.do'/>">
						<img src="<c:url value="/resources/"/>img/card_ico.png" alt=""
						class="img-responsive center-block"> 업체 등록
				</a></li>
				<li><a href="<c:url value='/mycompany/auctionList.do'/>"> <img
						src="<c:url value="/resources/"/>img/graph_ico.png" alt=""
						class="img-responsive center-block"> 입찰 현황
				</a></li>
				<li><a href="<c:url value='/mycompany/reservationView.do'/>">
						<img src="<c:url value="/resources/"/>img/reservation_icon2.png"
						alt="" class="img-responsive center-block" style="padding: 5px;">
						예약 현황
				</a></li>
			</ul>
		</div>
		</nav>



		<div class="itemWrap">
			<div class="container">

				<div class="itemBox">
					<c:forEach var="auction" items="${autionList}">
						<dl
							onClick="location.href='<c:url value="/mycompany/myServiceUpdate.do?memNo=${user.no}&comInfoNo=${auction.comInfoNo}"/>'"
							style="cursor: pointer;">
							<dt>
								<img
									src="<c:url value="/${auction.comFilePath}/${auction.comFileName}"/>"
									class="img-responsive center-block">
							</dt>
							<dd>
								<h6 class="comType">
									<c:choose>
										<c:when test="${auction.comInfoType=='v'}">웨딩홀</c:when>
										<c:when test="${auction.comInfoType=='s'}">스튜디오</c:when>
										<c:when test="${auction.comInfoType=='d'}">드레스</c:when>
										<c:when test="${auction.comInfoType=='m'}">메이크업</c:when>
										<c:when test="${auction.comInfoType=='h'}">허니문</c:when>
										<c:when test="${auction.comInfoType=='j'}">예물</c:when>
										<c:when test="${auction.comInfoType=='e'}">기타</c:when>
									</c:choose>
								</h6>
								<h2 class="comType">${auction.comInfoName}</h2>
								<p>${auction.comInfoProfile}</p>
							</dd>
						</dl>
					</c:forEach>
				</div>
				<div class="btnBox">
					<a href="<c:url value="/mycompany/myService.do"/>"
						class="insertBtn"> <i class="fas fa-plus"></i> 서비스 등록하기
					</a>
				</div>
			</div>
		</div>
		<%-- <c:forEach var="auction" items="${autionList}">
	<a >
	<table onClick="location.href='<c:url value="/mycompany/myServiceUpdate.do?memNo=${user.no}&comInfoNo=${auction.comInfoNo}"/>'" style="cursor:pointer;" class="table_outer">
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
	<table onClick="location.href=`<c:url value="/mycompany/myService.do"/>`" style="cursor:pointer;" class="InsertProfile">
		<tr>
			<td style="font-size: 50px; font-weight: 800;">+</td>
			<td style="font-size: 24px; font-weight: 800;">서비스 등록하기</td>
		<tr>
	</table>
	</a> --%>

	</div>
</body>
</html>