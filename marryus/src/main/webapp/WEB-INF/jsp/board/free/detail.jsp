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
                        <div class="commentBox">
			       		<c:if test="${user != null }">	       			
				       		<div class="inputBox">
				       			<div class="row">	       				
					       			<form id="insertComment" class="col-md-10">
					       				<input type="hidden" name="boardNo" id="commentBoardNo" value="${board.boardNo }"/>
					       				<input type="hidden" name="commWriter" value="${user.email}"/>
					       				<textarea rows="3" cols="100" class="form-control" name="commContent" id="commentContent"></textarea>
					       			</form>
					       			<div class="col-md-2">
					       				<a class="commentInputBtn" href="javascript:void(0)" onclick="insertComment()">댓글 남기기</a>
					       			</div>
				       			</div>
				       		</div>
			       		</c:if>
			       		<ul class="commentList">
			       				<li>
				       				<div class="commentInfo">
				       					<span class="commentName"></span>
				       					<span class="commentDate"></span>
				       					<a class="deleteComment" href="javascript:void(0)" onclick=""><i class="fas fa-trash-alt"></i> 삭제</a>
			       					</div>
				       				<div class="commentContents">
				       					
				       				</div>
				       			</li>
			       		</ul>
			       </div>
                        <div class="btnBox">
                        	<c:if test="${board.writer eq user.email }">
                        		<a class="modifyBtn" href="<c:url value="/board/updateForm.do?category=${board.category}&boardNo=${board.boardNo }"/>">수정</a>
                        		<a class="deleteBtn" href="<c:url value="/board/delete.do?category=${board.category}&boardNo=${board.boardNo }"/>"/>삭제</a>
                        	</c:if>
                        	<%
                        		String befeorePage = request.getHeader("REFERER");
                        		
                        	%>
                            <a href="#" class="listBtn" onclick="location.href='<%= request.getHeader("REFERER") %>'; return false;">목록</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
		<c:import url="/common/importFooter.jsp" />
    </div>
	<c:import url="/common/importSideBar.jsp" />
    <script>
        $(function(){
        	commentList(${board.boardNo})
        })
    		var options = {
                 'speed' : 500,				 		//스피드
                 'initTop' : 300, 					//기본top위치
                 'alwaysTop' : false,				// true
                'default_x' : false 				//레이어가 붙는 아이디 
             }
             $('#sideBar').Floater(options);
        
	          //댓글
	          function commentList(boardNo){
	          	$(".commentList").html("")
	          	$.ajax({
	          		url : "<c:url value="/board/commentList.json"/>",
	          		data : "boardNo="+boardNo
	          	}).done(function(data){
	          		var html ='';
	          		for(var c of data){
	          			html+='<li>'
			       			html+='<div class="commentInfo">'
			       			html+='<span class="commentName">'+c.commWriter+'</span>'
			       			html+='<span class="commentDate">'+new Date(c.commDate).format("yyyy-MM-dd")+'</span>'
			       			if(c.commWriter=="${user.email}"){		       				
				       			html+='<a class="deleteComment" href="#" onclick="deleteComment('+c.commNo+','+boardNo+')"><i class="fas fa-trash-alt"></i> 삭제</a>'		
			       			}
			       			html+='</div>'		
		       				html+='<div class="commentContents">'+c.commContent+'</div>'	
			       			html+='</li>'		       			
	          		}
	          		$(".commentList").html(html)
	          	})
	          } 
			//댓글 입력
			function insertComment(){
				if($("#commentContent").val()==""){
					alert("댓글 내용을 입력해주세요")
					return;
				}
				var formData = new FormData($("#insertComment")[0])
				$.ajax({
					url : "<c:url value="/board/insertComment.json"/>",
					data : formData,
					type : "POST",
					processData : false,
					contentType : false
				}).done(function(data){
					$("#commentContent").val("")
					commentList(formData.get("boardNo"))
				});
			};
			
			//댓글 삭제
			function deleteComment(commNo,boardNo){
				$.ajax({
					url : "<c:url value="/board/deleteComment.json"/>",
					data : "commNo="+commNo
				}).done(function(data){
					commentList(boardNo)
				})			
			}
	
			//날짜 정리
            Date.prototype.format = function(f) {
                if (!this.valueOf()) return " ";
             
                var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
                var d = this;
                 
                return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
                    switch ($1) {
                        case "yyyy": return d.getFullYear();
                        case "yy": return (d.getFullYear() % 1000).zf(2);
                        case "MM": return (d.getMonth() + 1).zf(2);
                        case "dd": return d.getDate().zf(2);
                        case "E": return weekName[d.getDay()];
                        case "HH": return d.getHours().zf(2);
                        case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
                        case "mm": return d.getMinutes().zf(2);
                        case "ss": return d.getSeconds().zf(2);
                        case "a/p": return d.getHours() < 12 ? "오전" : "오후";
                        default: return $1;
                    }
                });
            };
             
            String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
            String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
            Number.prototype.zf = function(len){return this.toString().zf(len);};
    </script>
</body>
</html>