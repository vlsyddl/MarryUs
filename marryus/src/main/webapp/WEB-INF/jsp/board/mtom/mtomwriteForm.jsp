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
<script type="text/javascript" src="/marryus/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/marryus/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
	 <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
</head>
<style>
/* 	.selectBox{ */
/* 		margin-bottom: 10px; */
/* 	} */
/* 	.form-control{ */
/* 		width: 102%; */
/* 	} */
</style>
<body>
<header>
	<div class="container">
		<div class="row">
			<div class="logo col-md-3">
				<a href="<c:url value="/main/main.do"/>"><img
					src="<c:url value="/resources/img/logo.png"/>" alt=""
					class="img-responsive center-block"></a>
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
					<li><a href="<c:url value="/service/weddingHall.do"/>">웨딩홀</a></li>
					<li><a href="#">스&middot;드&middot;메</a></li>
					<li><a href="#">허니문</a></li>
					<li><a href="#">예물</a></li>
					<li><a href="#">추가서비스</a></li>
				</ul>
			</div>
			</nav>
		</div>
	</div>
	<span class="gnbBar"></span> </header>

<div id="wrap" class="community">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>1:1질문</h2>     
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="communityTab">
                    <ul>
                        <li ><a href="<c:url value='/board/notice/list.do'/>">공지게시판</a></li>
                        <li ><a href="review.html">후기 게시판</a></li>
                        <li ><a href="<c:url value='/board/free/list.do'/>">신부 대기실    </a></li>
                        <li class="on"><a href="<c:url value='/board/mtom/mtomlist.do'/>">1:1 질문</a></li>
                        <li ><a href="javascript:void(0);">FAQ</a></li>
                    </ul>
                    <div class="communityContents">
		          		<form action="mtomwrite.do" method="post" id="frm" onsubmit="return doCheck()">
				                <div class="panel-heading">
									<input class="form-control" id="title" type="text" name="title" placeholder="제목을 입력 해 주세요" />	
								</div>
								<div>
								비밀글 설정:  <select class="selectBox">
										 <option value="1" />설정
									     <option value="2" />설정하지 않음
										 </select>
								</div>
								<div>
									<input type="hidden" name="writer" value="${user.email}" />
								</div>
						    	<textarea name="content" id="smarteditor" rows="10" cols="100" style="width:100%; height:350px;"></textarea>
							    <div class="form-btn">
								    <a class="cancle"><input type="button" id="savebutton" value="등록" /></a>
							    	<a href="mtomlist.do" class="cancle">취소</a>
							    </div>
						</form>
                    </div>
                    
            	</div>
					
</body>
  <script>
  $(function(){
	    //전역변수선언
	    var editor_object = [];
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        elPlaceHolder: "smarteditor",
	        sSkinURI: "/marryus/resources/se2/SmartEditor2Skin.html",  
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
	     
	    //전송버튼 클릭이벤트
	    $("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
	    })
	})
  
	
	
	
	function doCheck(){
			if($("input[name='title']").val()==""){
				alert("제목을 입력하세요");
				$("input[name='title']").focus();
				return false;
			}
		}
	
	
    </script>
</html>