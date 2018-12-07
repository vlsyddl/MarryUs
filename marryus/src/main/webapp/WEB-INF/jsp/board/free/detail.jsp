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
     <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	 <link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">	    
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
                        <li ><a href="<c:url value='/board/list.do?category=nt'/>">공지게시판</a></li>
                        <li ><a href="<c:url value='/board/review.do'/>">후기 게시판</a></li>
                        <li  class="on"><a href="<c:url value='/board/list.do?category=fr'/>">신부 대기실    </a></li>
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
                            <a href="#" class="listBtn" onclick="window.history.go(-1); return false;">목록</a>
                        </div>
                    </div>
                </div>
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
	var recommCheckCnt;
	var userNo = "${user.no}";
	
	list();
	
	function list() {
			$.ajax({
				url : "<c:url value='/board/free/commentList.json'/>",
				data : {"boardNo" : "${freeDetail.boardNo}"},
				cache : false
			})
			.done( function(result) {
					var html = "";
					for(var i = 0; i < result.length; i++) {
						html += "<tr id='comm"+result[i].commNo+"'>"
						html += "<input type='hidden' name='commNo' value='"+result[i].commNo+"'  />"
						html += "<td>"+result[i].commWriter+"</td>"
// 						html += "<td id='"+result[i].commNo+"'>"+result[i].commContent+"<td>"
						html += "<td>"+result[i].commContent+"</td>"
						
						if ( result[i].commWriter == "${user.email}" ) {
							html += "<td><button onclick='commentUpdate("+JSON.stringify(result[i])+")'>수정</button></td>"
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
		
		function commentUpdate(comm) {
			var content = "";
			var html = "";
				html += "<input type='hidden' name='commNo' value='"+comm.commNo+"'/>"
				html += "<td>"+comm.commWriter+"</td>"
				html += "<td id='commContent"+comm.commNo+"'>"+
						"<textarea id='commContent' name='commContent' cols='30' rows='10'>"+comm.commContent+"</textarea></td>"
				html += "<td><button id='thisUpdate'>수정</button></td>"
					
			$("#comm"+comm.commNo+"").html(html);
			
			$("#thisUpdate").click(function () {
				
				$.ajax({
					url : "<c:url value='/board/free/commentUpdate.json' />",
					data : {
						"commContent" : $("#commContent").val(),
						"commNo" : comm.commNo
					},
					cache : false
				}).done(function () {
					list();
				});
			});
			
		};
		
		function recommCheck() {
			$.ajax({
				url : "<c:url value='/board/free/recommCheck.json' />",
				data : {
					"boardNo" : "${freeDetail.boardNo}",
					"memNo" : userNo
				},
				cache : false
			}).done(function (result) {
				if (result == 0) {
					$('#recommBtn').text("추천할거면 눌러봐 ^^");
				} else {
					$('#recommBtn').text("이미 추천했어. 취소할거면 눌러 ^^");
				}
				recommCheckCnt = result;
			});
		};
		
		recommCheck();
		
		function recommCnt() {
			$.ajax({
				url : "<c:url value='/board/free/recommCount.json' />",
				data : "boardNo=${freeDetail.boardNo}",
				cache : false
			}).done(function (result) {
				$('#recommCnt').html(result);
			});
		};
		recommCnt();

		$("#recomm").click(function () {
				var recommUrl = "recomm";
				
				if (recommCheckCnt == 1) {
					recommUrl = "recommCancle";
				}
			$.ajax({
				url : "/marryus/board/free/"+ recommUrl + ".json",
				data : {
					"boardNo" : "${freeDetail.boardNo}",
					"memNo" : userNo
				},
				cache : false
			}).done(function (result) {
				if (recommCheckCnt == 0) {
					alert("추천되었습니다.");
					recommCheckCnt = 1;
					$('#recommBtn').text("이미 추천했어. 취소할거면 눌러 ^^");
				} else {
					alert("추천이 취소되었습니다.");
					recommCheckCnt = 0;
					$('#recommBtn').text("추천할거면 눌러봐 ^^");
				}
				recommCnt();
			});
		});
		
    </script>
</body>
</html>