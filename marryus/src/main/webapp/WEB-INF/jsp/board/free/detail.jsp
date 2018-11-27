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
<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	 <script
	  src="https://code.jquery.com/jquery-3.3.1.js"
	  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	  crossorigin="anonymous"></script>
	  <Style>
	  	#commentSide > tbody > tr > th {
	  		width: 150px;
	  		padding-right: 10px;
	  	}
	  	#commentSide > tbody > tr > td {
	  		width: 150px;
	  	}
	  </Style>
	    
</head>
<body>
    <header>
        <div class="container">
            <div class="row">
                <div class="logo col-md-3">
                    <a href="<c:url value="/main/main.do"/>"><img src="<c:url value="/resources/img/logo.png"/>" alt="" class="img-responsive center-block"></a>
                </div>
                <nav class="gnb col-md-9">
                    <div class="gnb_top cf">
                        <ul class="cf">
							<!-- 로그인, 로그아웃 -->
							<c:if test="${user.email eq null}">
								<li><a href="<c:url value='/signup/signupPro.do' />">회원가입</a></li>
								<li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
							</c:if>
							<c:if test="${user.email ne null}">
								<li>${user.name}님이로그인 하셨습니다.</li>
								<li><a href="<c:url value='/main/logout.do' />"> 로그아웃</a></li>
								<li><a href="<c:url value="/mypage/mywedding.do"/>">마이페이지</a></li>
							</c:if>
							<li><a href="#"><i class="far fa-bell"></i></a></li>
                        </ul>
                    </div>
                    <div class="gnb_bot cf">
                        <ul class="cf">
                            <li class="on"><a href="<c:url value="/service/weddingHall.do"/>">웨딩홀</a></li>
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
                        <li ><a href="review.html">후기 게시판</a></li>
                        <li class="on"><a href="<c:url value='/board/free/list.do'/>">신부 대기실    </a></li>
                        <li ><a href="<c:url value='/board/mtom/mtomlist.do'/>">1:1 질문</a></li>
                        <li ><a href="javascript:void(0);">FAQ</a></li>
                    </ul>
                    <div class="communityContents">
                        <table class="table table-hover">
                            <tr>
                                <th>제목</th>
                                <td>${freeDetail.title}</td>
                            </tr>
                            <tr>
                            	<th>작성자</th>
                            	<td>${freeDetail.writer}</td>
                            </tr>
                            <tr>
                            	<th>작성일</th>
                            	<td><fmt:formatDate value="${freeDetail.regDate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                            <tr>
                            	<th>조회수</th>
                            	<td>${freeDetail.viewCnt}</td>
                            </tr>
                            <tr>
                            	<th>내용</th>
                            	<td>${freeDetail.content}</td>
                            </tr>
                    </table>
                    <a href="list.do"><button>목록</button></a>
                    <c:if test="${user.email==freeDetail.writer}">
                    <a href="updateForm.do?boardNo=${freeDetail.boardNo}"><button>수정</button></a>
                    <a href="delete.do?boardNo=${freeDetail.boardNo}"><button>삭제</button></a>
                    </c:if>
                    <div id="writeComment">
                    	<form id="writeCommentForm" method="post">
                    		<input type="hidden" name="boardNo" value="${freeDetail.boardNo}" />
                    		<input type="hidden" name="commWriter" value="${user.email}" />
	                    	<textarea name='commContent' id='commentWrite' cols='30' rows='7' class='form-control'></textarea>
	            			<button id="commentFormBtn" type="button">댓글 작성</button>
                    	</form>
                    </div>
                    <div id="communityComments">
	                   	<table id="commentSide" class="table table-hover">
	                   	</table>
                    </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <aside id="sideBar">
        <ul>
            <li><a href="#"><i class="fas fa-user-edit"></i>마이페이지</a></li>
            <li><a href="<c:url value='/board/notice/list.do'/>"><i class="fas fa-headset"></i></i>공지 게시판</a></li>
            <li><a href="#"><i class="fas fa-chalkboard-teacher"></i>후기 게시판</a></li>
            <li><a href="<c:url value='/board/free/list.do'/>"><i class="far fa-kiss-wink-heart"></i>신부대기실</a></li>
            <li><a href="<c:url value='/board/mtom/mtomlist.do'/>"><i class="far fa-comments"></i>1 : 1 질문</a></li>
            <li><a href="#"><i class="far fa-question-circle"></i>FAQ</a></li>
        </ul>
    </aside>
    <script>
//          var options = {
//                 'speed' : 500,				 		//스피드
//                 'initTop' : 300, 					//기본top위치
//                 'alwaysTop' : false,				// true
//                 'default_x' : false 				//레이어가 붙는 아이디 
//             }
//             $('#sideBar').Floater(options);
	list();
	
	function list() {
			$.ajax({
				url : "<c:url value='/board/free/commentList.json'/>",
				data : {"boardNo" : "${freeDetail.boardNo}"},
				cache : false
			})
			.done( function(result) {
					console.log(result);
					var html = "";
					for(var i = 0; i < result.length; i++) {
						html += "<tr>"
						html += "<input type='hidden' name='commNo' value='"+result[i].commNo+"'  />"
						html += "<td>"+result[i].commWriter+"</td>"
						html += "<td>"+result[i].commContent+"</td>"
						
						if ( result[i].commWriter == "${user.email}" ) {
							html += "<td><button onclick='commentUpdate()'>수정</button></td>"
							html += "<td><button onclick='commentDelete("+result[i].commNo+")'>삭제</button></td>"
						}
						
						html += "</tr>"
					}
					$('#commentSide').html(html);
			})
			.fail(function(){ console.log("요청 실패시 호출"); });
		};
		
		$("#commentFormBtn").click( function(e) {
			if ($("#commentWrite").val() == "") {
				alert("댓글을 입력해주세요.");
				return false;
			}
			
			e.preventDefault();
			var str = $("#commentWrite").val();
			str = str.replace(/(?:\r\n|\r|\n)/g, "<br>");
			$("#commentWrite").val(str);
			$.ajax({
				url : "<c:url value='/board/free/commentWrite.json'/>",
				data : $("#writeCommentForm").serialize(),
				method : "POST",
				cache : false
			}).done( function(result) {
					$("#commentWrite").val("");
					list();
			});

		});
		
		function commentDelete(commNo) {
			$.ajax({
				url : "<c:url value='/board/free/commentDelete.json'/>",
				data : { "commNo" : commNo },
				cache : false
			}).done( function(result) {
				list();
			});
		};
		
		function commentUpdate() {
			$.ajax({
				
			});
		};
	
    </script>
</body>
</html>