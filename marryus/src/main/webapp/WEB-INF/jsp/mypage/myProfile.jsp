<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
    	body{
    		width: 100%;
    	}
    	#outer_box{
    		display: inline-block;
    		width: 60% auto;
    	}
        #profile_box #profile_img,  #profile_box #profile_text{
            width: 30%; 
            height: 250px;
            border-radius: 10px;
            float: left;
            margin: 10px;
            background-color: rgb(245, 243, 243);
            text-align: center;
        }
        #company_info{
            width: 60%;
            float: none;
        }
        p{
        	text-align: left;
        }
    </style>
</head>
<body>
	<div id="outer_box">
		 <div id="profile_box">
	        <div id='profile_img'>
	        <p id="p1"> 업체 이미지</p>
	        <a href='<c:url value='/mypage/fileUpload.do'/>' target="_blank" ><img id="profile_image" src="img/chk_ico.png"></a>
	        </div>
	        <div id="profile_text">
	        <p id="p1"> 업체 프로필 소개</p>
	        <textarea name="profile" cols="200" rows="8" style=" width:90%; resize: none; font-size: 18px; " ></textarea>
	        </div>
	        <div id="company_info">
				<form id="modifyForm" action="/board/insertBoard.do" method="post"  enctype="multipart/form-data" acceptcharset="UTF-8">
					<input name="no" id="modify_no" value="" type="hidden">
					<div class="form-group contentForm">
	                        <p>업체 소개</p>                      
	                              <textarea rows="10" cols="30" id="insert_content" name="content" style="width:100%; height:350px; "></textarea>
	                </div>
	                            
	                                <div class="form-btn">
	                                    <a href="#" class="cancle">취소</a>
	                                    <a href="#" class="save" id="insert">등록</a>
	                                </div>
				</form>
				
				


	        </div>
	    </div>
    </div>
    
    
    
    
    <script>
    
    $(function(){
    	callForm("insert");
    })
    
    
    
	function callForm(area,content){
		if(content == undefined){
			content = ""
		}
		 var oEditors = [];
		
		
		 nhn.husky.EZCreator.createInIFrame({
		          oAppRef: oEditors,
		          elPlaceHolder: area+"_content", //textarea에서 지정한 id와 일치해야 합니다. 
		          //SmartEditor2Skin.html 파일이 존재하는 경로
		          sSkinURI: "/marryus/resources/se2/SmartEditor2Skin.html",  
		          htParams : {
		              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseToolbar : true,             
		              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseVerticalResizer : true,     
		              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseModeChanger : true,         
		              fOnBeforeUnload : function(){
		              }
		          },
		          
		          fOnAppLoad : function(){
		              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
		              oEditors.getById[area+"_content"].exec("PASTE_HTML", [content]);
		          },
		          fCreator: "createSEditor2"
		      });

			 $("#"+area).click(function(){
				
				 oEditors.getById[area+"_content"].exec("UPDATE_CONTENTS_FIELD", []);
				var content = $("#"+area+"_content").val();
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
	          if(area == "insert"){
	        	  insertBoard();	  
	          }else if(area=="modify"){
	        	  updateBoard();
	          }
	      });   
	}
    
 


    </script>
</body>
</html>