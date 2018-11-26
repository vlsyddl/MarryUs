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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
	        <%-- 	        <div id='profile_img'>
	        <p id="p1"> 업체 이미지</p>
	        <button onclick="window.open('<c:url value='/mypage/fileUpload.do'/>,'window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">button</button>
	        <a onclick="window.open('<c:url value='/mypage/fileUpload.do'/>','프로필 이미지','width=800,height=500,location=no,status=no,scrollbars=yes')" target="_blank" ><img id="profile_image" src="img/chk_ico.png"></a>
	        </div> --%>

	        <form action="/mypage/insertComInfoProfile.do" method="post" id="frm"  enctype="multipart/form-data" acceptcharset="UTF-8">
	        <table>
	       	<tr>
	        	<td>업체 이름</td>
	        	<td><input type="text" name="companyName"/></td>
	        </tr>
	       	<tr>
	        	<td>서비스 카테소리</td>
	        	<td>
	        	<select name="comType" id="comType" class="select-field__menu">
									<option>업종선택</option>
									<option value="v">웨딩홀</option>
									<option value="s">스튜디오</option>
									<option value="d">드레스</option>
									<option value="m">메이크업</option>
									<option value="h">허니문</option>
									<option value="j">예물</option>
									<option value="e">기타</option>
				</select>
				</td>
	        </tr>
	        <tr>
	        	<td> 업체 소개</td>
	        	<td><textarea name="comInfoProfile" cols="200" rows="8" style=" width:90%; resize: none; font-size: 18px; " ></textarea></td>
	        </tr>
			<tr>
				
					<td><input name="memNo" id=memNo value="10" type="hidden">	서비스 소개</td>  				
					<td><textarea name="comInfoContent" id="smarteditor" rows="10" cols="100" style="width:100%; height:350px;"></textarea></td>
			</tr>
			<tr>
				<td><a href="javascript:" onclick="fileUploadAction();" class="my_button">업체 이미지 등록</a></td>
				<td>
				   <div class="input_wrap">
				   		<input type="file" id="input_imgs" multiple/>
        			</div>
			        <div class="imgs_wrap">
			            <img id="img" />
			        </div>
				</td>
			</tr>
			</table>
				</form>		
				<div class="form-btn">
	                 <a href="#" class="cancle">취소</a>
	                 <a href="#" class="save" id="savebutton">등록</a>
	            </div>
	       
	    </div>
    </div>
    
    
    
    
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
 	        //$("#editorform").submit();
 	       	var formData = new FormData(document.getElementById('frm'));
 			for(let file of sel_files) {
 	           formData.append("file", file);
 	        } 
 			
 			 $.ajax({
 		    	   url:"/marryus/mypage/insertComInfo.do",
 		    	   type:"POST",
 		    	   processData: false, //쿼리 (데이터 = 값) 형식을 해제하고 문자열? 형태로 보냄
 		           contentType: false, // 기본 타입 말고 multipart/form-data로 설정하게
 		    	   data: formData
 		       }).done(function (data){
 		    	   console.log(data);
 		    	   console.log("성공");
 		       }).fail(function(e){
 	        	   console.log("실패");
 	        	   console.log(e);
 	        	   console.log(e.status);
 	           })
 	       	
	    })
	})
   
    
    
    
    var sel_files = [];
    
    
    $(document).ready(function() {
        $("#input_imgs").on("change", handleImgFileSelect);
    }); 

    function fileUploadAction() {
        console.log("fileUploadAction");
        $("#input_imgs").trigger('click');
    }
    
    
 
    
    
    function reImageAction(index) {
        var img_id = "#img_id_"+index;
        $(" img[name=re]").removeAttr("name");
        $(img_id+" img").attr("name","re");
    }        
    
    
    function deleteImageAction(index) {            
        console.log("index : "+index);
        sel_files.splice(index, 1);

        var img_id = "#img_id_"+index;
        $(img_id).remove();

        console.log(sel_files);
    }        

    function handleImgFileSelect(e) {

        // 이미지 정보들을 초기화
        sel_files = [];
        $(".imgs_wrap").empty();

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var index = 0;
        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_files.push(f);

            var reader = new FileReader();
            reader.onload = function(e) {
           	 html = "<a href=\"javascript:void(0);\" onclick=\"reImageAction("+index+")\" oncontextmenu=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
                $(".imgs_wrap").append(html);
                index++;

            }
            reader.readAsDataURL(f);
            
        });
    }
    
    
    

        document.addEventListener("contextmenu", function(e){
          e.preventDefault();
        });
 


    </script>
</body>
</html>