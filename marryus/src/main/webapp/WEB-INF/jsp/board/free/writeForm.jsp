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
	<script type="text/javascript" src="/marryus/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
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
                    	<form id="editorform" action="<c:url value="/board/write.do"/>" method="post">
                    		<input type="hidden" name="category" value="${param.category }"/>
                    		<div class="row">                    			
	                    		<div class="form-group">
	                    			<div class="col-md-2">
	                    				<label for="">제목</label>
	                    			</div>
	                    			<div class="col-md-10">
	                    				<input type="text" name="title" id="insertTitle" class="form-control" value="${board.title }">
	                    			</div>
	                    		</div>
	                    		<div class="form-group">
	                    			<div class="col-md-2">
	                    				<label for="">작성자</label>
	                    			</div>
	                    			<div class="col-md-10">
	                    				<input type="text" name="writer" value="${user.email}" readonly="readonly" class="form-control"/>
	                    			</div>
	                    		</div>
	                    		<div class="form-group">
	                    			<div class="col-md-2">
	                    				<label for="">내용</label>
	                    			</div>
	                    			<div class="col-md-10">
	                    				<textarea name="content" id="smarteditor" rows="10" cols="100" style="width:100%; height:350px;"></textarea>
	                    			</div>
	                    		</div>
                    		</div>
	                    	<div class="btnBox">
							    <a href="#" id="savebutton">등록</a>
						    	<a href="#" class="listBtn" onclick="location.href='<%= request.getHeader("REFERER") %>'; return false;">취소</a>
						    </div>
	                    </form>
                    </div>
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
     	        },

    			fOnAppLoad : function(){
    				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
    				editor_object.getById["smarteditor"].exec("PASTE_HTML", ["${board.content}"]);
    			},
    			fCreator: "createSEditor2"
     	    });
     	     
     	    //전송버튼 클릭이벤트
     	    $("#savebutton").click(function(e){
     	    	e.preventDefault();
     	        //id가 smarteditor인 textarea에 에디터에서 대입
     	        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
     	       var content = $("#smarteditor").val();
     	         if($("input[name=title]").val()==""){
	        	alert("제목을 입력해 주세요")
	        	$("#"+area+"_title").focus()
	        	return;
	         }
				if( content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>')  {
		             alert("내용을 입력해주세요.");
		             oEditors.getById[area+"_content"].exec("FOCUS"); //포커싱
		             return;
		        } 
     	        // 이부분에 에디터 validation 검증
     	         
     	        //폼 submit
     	        $("#editorform").submit();
     	    })
     	})
    </script>
</body>
</html>