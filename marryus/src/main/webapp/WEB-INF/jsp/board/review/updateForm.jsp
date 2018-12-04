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
                        <li class="on" ><a href="review.html">후기 게시판</a></li>
                        <li ><a href="<c:url value='/board/free/list.do'/>">신부 대기실    </a></li>
                        <li ><a href="<c:url value='/board/mtom/mtomlist.do'/>">1:1 질문</a></li>
                        <li ><a href="javascript:void(0);">FAQ</a></li>
                    </ul>
                    <div class="communityContents">
                    	<form id="editorform" action="update.do" method="post" enctype="multipart/form-data">
	                        <table class="table table-hover">
	                            <tr>
	                                <th>제목</th>
	                                <td>
	                                	<input type="text" name="title" value="${reviewDetail.title}"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>작성자</th>
	                                <td>
	                                	<input type="hidden" name="boardNo" value="${reviewDetail.boardNo}"/>
	                                	<input type="text" name="writer" value="${user.email}" readonly="readonly"/>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<th>대표사진 등록</th>
	                            	<td>
	                                	<input type="hidden" name="filePath" value="${reviewAttach.filePath}"/>
	                                	<input type="file" name="fileName" value="${reviewAttach.fileName}"/>
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<th>내용</th>
	                            	<td>
						    			<textarea name="content" id="smarteditor" rows="10" cols="100" style="width:100%; height:350px;">${reviewDetail.content}</textarea>
	                            	</td>
	                            </tr>
	                    	</table>
	                    	<div class="form-btn">
								    <a><input type="button" id="savebutton" value="수정" /></a>
							    	<a href="list.do" class="cancle">취소</a>
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