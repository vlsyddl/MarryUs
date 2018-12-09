<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Marry us</title>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	 <link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
</head>
<body>
<c:import url="/common/importHeader.jsp"/>
	<div id="wrap" class="community">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>공지사항</h2>
                
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="communityTab">
                    <ul>
                        <li  class="on"><a href="<c:url value='/board/list.do?category=nt'/>">공지게시판</a></li>
                        <li ><a href="<c:url value='/board/review.do'/>">후기 게시판</a></li>
                        <li ><a href="<c:url value='/board/list.do?category=fr'/>">신부 대기실    </a></li>
                        <li ><a href="<c:url value='/board/list.do?category=mm'/>">1:1 질문</a></li>
                        <li ><a href="<c:url value='/board/list.do?category=fq'/>">FAQ</a></li>
                    </ul>
                    <div class="communityContents">
                        <div class="contentsHead">
                            <h2 class="title">${board.title }</h2>
                            <div class="infoBox">
                                <ul>
                                    <li>작성자 <span>${board.writer}</span></li>
                                    <li>작성일 <span><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></span></li>
                                    <li>조회수 <span>${board.viewCnt }</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="contentsBody">
							${board.content}
                        </div>
                        <div class="btnBox">
                            <a href="#" class="listBtn" onclick="location.href='<%= request.getHeader("REFERER") %>'; return false;">목록</a>
                        </div>
                    </div>
				 </div>
                </div>
            </section>
            <c:import url="/common/importFooter.jsp"/>
        </div>
        <c:import url="/common/importSideBar.jsp"/>
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