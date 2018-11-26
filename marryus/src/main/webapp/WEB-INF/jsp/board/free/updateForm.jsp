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
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="/marryus/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="/marryus/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
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
                            <li><a href="#">회원가입</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
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
                        <li ><a href="javascript:void(0);">1:1 질문</a></li>
                        <li ><a href="javascript:void(0);">FAQ</a></li>
                    </ul>
                    <div class="communityContents">
                    	<form id="editorform" action="update.do" method="post">
	                        <table class="table table-hover">
	                            <tr>
	                                <th>제목</th>
	                                <td>
	                                	<input type="text" name="title" value="${freeDetail.title}"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>작성자</th>
	                                <td>
	                                	<input type="hidden" name="boardNo" value="${freeDetail.boardNo}"/>
	                                	<input type="text" name="writer" value="${user.email}" readonly="readonly"/>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<th>내용</th>
	                            	<td>
						    			<textarea name="content" id="smarteditor" rows="10" cols="100" style="width:100%; height:350px;" value="${freeDetail.content}"></textarea>
	                            	</td>
	                            </tr>
	                    	</table>
	                    	<div class="form-btn">
								    <a><input type="button" id="savebutton" value="등록" /></a>
							    	<a href="list.do" class="cancle">취소</a>
						    </div>
	                    </form>
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
            <li><a href="#"><i class="far fa-comments"></i>1 : 1 질문</a></li>
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
     	        $("#editorform").submit();
     	    })
     	})
    </script>
</body>
</html>