<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
<style>
	.title{
		font-size: 50px;
	}
	.content{
		border: 1px solid black;
		width: 1140px;
		font-size: 30px;
	.detailFooter{
	    padding: 10px 0;
	}
	.commentForm{
		border-bottom: 1px solid #d9d9d9;
		padding: 10px 0;
	}
	.commentForm:after{
		display: block;
		content:'';
		clear: both;
	}
	#commentFormBtn{
		display: block;
		float: right;
		width: 100px;
		padding: 10px;
		text-align: center;
		border: 1px solid #333;
		border-radius: 4px;	
		margin-top: 10px;
		transition: all 0.5s;
	}
	#commentFormBtn:hover{
		background: #acd2dd;
		color: #fff;
	}
	.commentBox .commentHead:after{
	    display: block;
	    clear: both;
	    content: "";
	}
	.commentBox .commentHead .infoBox{
	    float: left;
	}
	.commentBox .commentHead .infoBox dl >*{
	    display: inline-block;
	}
	
	.commentBox .commentHead .btnBox{
	    float: right;
	}
	
	.commentList li{
	    border-bottom: 1px solid #d9d9d9;
	    padding: 10px 0;
	}
	.detailBtnBox:after{
	    display: block;
	    clear: both;
	    content: "";
	}
	.detailBtnBox .btnLeft{
	    float: left;
	}
	.detailBtnBox .btnRight{
	    float: right;
	}
	.detailBtnBox a{
	    display: inline-block;
	    border: 1px solid #333;
	    width: 80px;
	    border-radius: 4px;
	    text-align: center;
	    padding: 5px 0;
	    transition: all 0.5s;
	}
	.detailBtnBox a:hover{
		background: #acd2dd;
		color: #fff;
	}

</style>

</head>
<body>
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
	<div id="wrap" class="community">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>1대1 질문</h2>
                
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="communityTab">
                    <ul>
                        <li ><a href="<c:url value='/board/notice/list.do'/>">공지게시판</a></li>
                        <li ><a href="review.html">후기 게시판</a></li>
                        <li ><a href="javascript:void(0);">신부 대기실    </a></li>
                        <li class="on"><a href="<c:url value='/board/mtom/mtomlist.do'/>">1:1 질문</a></li>
                        <li ><a href="javascript:void(0);">FAQ</a></li>
                    </ul>
                    <div class="communityContents">
                    <hr>
                        <p>
                        	<span class="title">${board.title}</span><br>
                        </p>
                        <p>
                        	<span class="writer">${board.writer}</span><br>
                        	<span class="date"><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                        </p>
                        <div class="content">
                        	${board.content}
                        </div>
                    </div>
                    <a href="mtomlist.do"><button class="btn btn-default">목록</button></a>
                    <c:if test="${user.email==board.writer}">
                    <a href="mtomupdateForm.do?no=${board.boardNo}"><button class="btn btn-default">수정</button></a>
                    <a href="mtomdelete.do?no=${board.boardNo}"><button class="btn btn-default">삭제</button></a>
                    </c:if>
				 </div>
				 <form id='commentForm'>
          			<textarea name='commentInput' id='commentInput' cols='30' rows='5' class='form-control'></textarea>
            		<a href='#' id='commentFormBtn'> 댓글 남기기</a>
            	</form>
				<div class="commentForm">
                    </div>

                   
                </div>
            </div>
</body>
<script>
commentList();
function commentList(boardNo){
	$.ajax({
		url: "<c:url value='/board/mtom/listComment.do'/>",
		data: {"boardNo": "${board.boardNo}"}
	}).done(function(data){
		console.log(data)
		var html = "";
		for(var c of data){
//             html += "<form id='commentForm'>"
//             html += "<textarea name='commentInput' id='commentInput' cols='30' rows='5' class='form-control'></textarea>"
//             html += "<a href='#' id='commentFormBtn'>" + '댓글 남기기 ' + "</a>"
//             html += "</form>"
            html += "<div class='communityContents'>"
            html += "<hr>"
            html += "<p>"
            html += "</p>"
            html += "<p>"
            html += "<span class='commWriter'>" + c.commWriter + "</span><br>"
            html += "<span class='commDate'>" + c.commDate + "</span>"
            html += "</p>"
            html += "<div class='commContent'>" + c.commContent + "</div>"
            html += "</div>"
		}
		$(".commentForm").html(html)
	});
};


// function commentList(boardNo){
//     $.ajax({
//        url: "<c:url value="/listComment.json"/>",
//        data: "boardNo="+ boardNo
//     }).done(function(data){
//        var html="";
//        //console.log(data)
//        for (var c of data){
//       	html +="<li>"
//           html += "<div class='commentBox'>"
//           html += "<div class='commentHead'>"
//           html += "<div class='infoBox'>"
//           html += "<dl>"
//           html +="<dt class='name'>" + c.commWriter + "</dt>"
//           html +="<dd>" + c.commRegDate + "</dd>"
//           html += "</dl>"
//           html +="</div>"
//           html +="<div class='btnBox'>"
//           html +='<a href="#" onclick="deleteComment('+ c.commNo +', '+ boardNo +')">' + "삭제" + '</a>'
//           html += "</div>"
//           html += "</div>"
//           html += "<div class='commentBody'>" + c.commContent + "</div>"
//           html +="</div>"
//           html += "</li>"
//        }
				
//            $(".commentList.list"+ boardNo).html(html)

//     });
//  };	

</script>
</html>