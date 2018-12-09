<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marry Us</title>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	 <link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
    
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="community">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>1:1 질문</h2>
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="communityTab">
                    <ul>
                        <li ><a href="<c:url value='/board/list.do?category=nt'/>">공지게시판</a></li>
                        <li ><a href="<c:url value='/board/review.do'/>">후기 게시판</a></li>
                        <li ><a href="<c:url value='/board/list.do?category=fr'/>">신부 대기실    </a></li>
                        <li class="on"><a href="<c:url value='/board/list.do?category=mm'/>">1:1 질문</a></li>
                        <li ><a href="<c:url value='/board/list.do?category=fq'/>">FAQ</a></li>
                    </ul>
                    <div class="communityContents">
                        <table class="table table-hover">
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                                <th>답변여부</th>
                            </tr>
						<c:choose>
                            	<c:when test="${fn:length(list) eq 0}">
                            		<tr>
                            			<td colspan="5" style="text-align: center;">게시물이 존재하지 않습니다.</td>
                            		</tr>
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach var="b" items="${list}">
			                            <tr>
			                                <td>${b.boardNo}</td>
			                                <c:choose>
			                                	<c:when test='${b.secret=="y"}'>
		                                			<td><a href='detail.do?boardNo=${b.boardNo}' <c:if test='${user.email != b.writer }'>onclick='alert("비밀글 입니다."); return false;'</c:if>>${b.title}<i class="fas fa-lock"></i></a></td>
			                                	</c:when>
			                                	<c:otherwise>		                                		
					                                <td><a href='detail.do?boardNo=${b.boardNo}'>${b.title}</a></td>
			                                	</c:otherwise>
			                                </c:choose>
			                                <td>${b.writer}</td>
			                                <td><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd" /></td>
			                                <td>${b.viewCnt}</td>
			                                <td style="text-transform: uppercase;">${b.answer}</td>
			                            </tr>
									</c:forEach>
                            	</c:otherwise>
                            </c:choose>
                    </table>
                    <c:if test="${user !=null }">                    	
	                    <div class="btnBox">
	                    	<a class="wirteBtn" href="<c:url value="/board/writeForm.do?category=${param.category }"/>">글작성</a>
	                    </div>
                    </c:if>
                    </div>
                    <c:import url="/common/importPageSearch.jsp"/>
		            </div>
	            </div>
        </section>
		<c:import url="/common/importFooter.jsp" />
    </div>
	<c:import url="/common/importSideBar.jsp" />
    <script>
          var options = {
                'speed' : 500,				 		//스피드
                'initTop' : 300, 					//기본top위치
                 'alwaysTop' : false,				// true
                 'default_x' : false 				//레이어가 붙는 아이디 
             }
          $('#sideBar').Floater(options);
         
         
    </script>
</body>
</html>