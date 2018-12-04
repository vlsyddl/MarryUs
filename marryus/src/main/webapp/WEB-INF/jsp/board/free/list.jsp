<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marry Us</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script
	  src="https://code.jquery.com/jquery-3.3.1.js"
	  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	  crossorigin="anonymous"></script>
    <c:import url="/common/importCss.jsp"/>
	<c:import url="/common/importJs.jsp"/>
    
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="community">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>신부 대기실</h2>
                
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="communityTab">
                    <ul>
                        <li ><a href="<c:url value='/board/notice/list.do'/>">공지게시판</a></li>
                        <li ><a href="<c:url value='/board/review/list.do'/>">후기 게시판</a></li>
                        <li class="on"><a href="<c:url value='/board/free/list.do'/>">신부 대기실    </a></li>
                        <li ><a href="<c:url value='/board/mtom/mtomlist.do'/>">1:1 질문</a></li>
                        <li ><a href="javascript:void(0);">FAQ</a></li>
                    </ul>
                    <div class="communityContents">
                        <table id="contentsList" class="table table-hover">
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
							<c:forEach var="b" items="${freeList}">
	                            <tr>
	                                <td>${b.no}</td>
	                                <td><a href="detail.do?boardNo=${b.boardNo}">${b.title}</a></td>
	                                <td>${b.writer}</td>
	                                <td><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd hh:mm"/></td>
	                                <td>${b.viewCnt}</td>
	                            </tr>
							</c:forEach>
                   	 	</table>
			            <div id="writeButton">
			            	<a href="writeForm.do"><button>글쓰기</button></a>
			            </div>
                    </div>
                    <ul class="pagination">
						<li><a
											<c:choose>
					      <c:when test="${beginPage!=1}">href="list.do?pageNo=${beginPage-1}"</c:when>
					      <c:otherwise>href="#"</c:otherwise>
						    </c:choose>
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<c:forEach var="i" begin="${beginPage}" end="${endPage}">
											<li><a
												<c:choose>
												   	<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/search.json"}'>
												    href="<c:url value='/board/free/search.json?pageNo=${i-1}&type=${result.type}&content=${result.content}' />"
												    </c:when>
												
												    <c:otherwise>
												     href="list.do?pageNo=${i}"
												     </c:otherwise>
											     </c:choose>>
												${i}</a>
											</li>
										</c:forEach>
					
										<li><a
											<c:choose>
					      <c:when test="${endPage != lastPage}"> href="list.do?pageNo=${endPage+1}" </c:when>
					    	<c:otherwise>href="#"</c:otherwise>
					    	</c:choose>
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
					</ul>
               		</div>
			            <form id="searchForm" method="post">
			            	<div id="search">
			            		<select name="type">
			            			<option value="1">제목</option>
			            			<option value="2">내용</option>
			            			<option value="3">글쓴이</option>
			            			<option value="4">제목+내용</option>
			            		</select>
			            		<input type="hidden" name="pageNo" value="1" />
			            		<input type="text" id="searchContent" name="content" placeholder="검색어를 입력해주세요." />
			            		<button type="button" id="searchBtn">검색</button>
			            	</div>
			            </form>
			            </div>
        </section>
		<c:import url="/common/importFooter.jsp" />
    </div>
	<c:import url="/common/importSideBar.jsp" />
    <script>
//          var options = {
//                 'speed' : 500,				 		//스피드
//                 'initTop' : 300, 					//기본top위치
//                 'alwaysTop' : false,				// true
//                 'default_x' : false 				//레이어가 붙는 아이디 
//             }
//             $('#sideBar').Floater(options);
         
         $("#searchBtn").click(function () {
        	 if ($("#searchContent").val() == "") {
        		 alert("검색어를 입력해주세요.");
        		 return false;
        	 }
        	 $.ajax({
        		url : "<c:url value='/board/free/search.json' />",
        		method : "POST",
        		data : $("#searchForm").serialize(),
        		cache : false
        	 }).done (function (result) {
         		 var html = "";
         		 html += "<tr>";
         		html  += "<th>번호</th>";
         		html  += "<th>제목</th>";
         		html  += "<th>작성자</th>";
         		html  += "<th>작성일</th>";
         		html  += "<th>조회수</th>";
         		html  += "</tr>";
        		 	  for ( var i = 0; i<result.length; i++) {
	        		 		html += "<tr>"
	        		 		html += "<td>" + result[i].no + "</td>"
	        		 		html += "<td><a href='detail.do?boardNo="+result[i].boardNo+"'>" + result[i].title + "</a></td>"
	        		 		html += "<td>" + result[i].writer + "</td>"
	        		 		html += "<td>"+ result[i].regDate +"</td>"
	        		 		html += "<td>" + result[i].viewCnt + "</td>"
	        		 		html += "</tr>"
        		 	  	 }
        		$("#contentsList").html(html);
        	 });
         });
    </script>
</body>
</html>