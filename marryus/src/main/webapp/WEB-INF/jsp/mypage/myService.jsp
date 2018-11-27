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
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
        
        table{
        	width: 800px;
        }
        table tr, td{
        	
        }
        table td:first-child {
			width: 200px;
		}
		.highlight{
			font-size: 20px;
			font-weight: 700;
			vertical-align: top;
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
	        	<td class="highlight">업체 이름</td>
	        	<td><input type="text" name="comInfoName"/></td>
	        </tr>
	       	<tr>
	        	<td class="highlight">서비스 카테소리</td>
	        	<td>
	        	<select name="comInfoType" id="comInfoType" class="select-field__menu">
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
	        	<td class="highlight">연락처</td>
	        	<td><input type="text" name="comInfoPhone"/></td>
	        </tr>
	        
	        
	        <tr>
	        	<td class="highlight">주소</td>
	        	<td><label for="com_phone" class="label">회사 주소</label> <input
							type="text" id="sample4_postcode" placeholder="우편번호"> <input
							type="text" name="comInfoAddr" id="sample4_roadAddress"
							placeholder="도로명주소"> <input type="button"
							onclick="address()" value="우편번호 찾기"><br> <span
							id="guide" style="color: #999"></span></td>
	        </tr>
	        <tr>
	        	<td class="highlight">회사 상세주소</td>
	        	<td><label for="com_addr_detail" class="label">회사 상세주소</label> <input
							type="text" name="comInfoAddrDetail" id="com_addr_detail"
							class="input-field" required></td>
	        </tr>
	        
	        
	        
	        
	        
	        
	        
	        <tr>
	        	<td class="highlight"> 업체 소개</td>
	        	<td><textarea name="comInfoProfile" cols="200" rows="8" style=" width:90%; resize: none; font-size: 18px; " ></textarea></td>
	        </tr>
			<tr>
				
					<td class="highlight"><input name="memNo" id=memNo value="10" type="hidden">	서비스 소개</td>  				
					<td><textarea name="comInfoContent" id="smarteditor" rows="10" cols="100" style="width:100%; height:350px;"></textarea></td>
			</tr>
			<tr>
				<td class="highlight"><a href="javascript:" onclick="fileUploadAction();" class="my_button" >업체 이미지 등록</a></td>
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
        
        
        
        
        
    	function address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample4_roadAddress').value = fullRoadAddr;
							document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';

							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}
 


    </script>
</body>
</html>