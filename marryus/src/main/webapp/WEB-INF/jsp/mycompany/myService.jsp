 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/marryus/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- 부가적인 테마 -->
<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		
		
		
		
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/additional-methods.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/localization/messages_ko.js"></script>	




    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
    <style>
    	body{
    		width: 100%;
    	}
    	
    	#profile_box{
    		padding: 30px 0;
    	}
        #profile_box #profile_img,  #profile_box #profile_text{
            width: 30%; 
            height: 250px;
            border-radius: 10px;
            float: left;
            background-color: rgb(245, 243, 243);
            text-align: center;
            margin: auto;
        }
        #company_info{
            width: 60%;
            float: none;
        }
        p{
        	text-align: left;
        }
        
        table{
        	border: 2px solid #333333;
        	margin: 10px;
        }
        table tr, td{
        	border-collapse: collapse;
        	border: 3.2px solid #f1d5e3;
        	padding: 20px 15px;
        }
        table td:first-child {
			width: 170px;
		}
		.highlight{
			font-size: 20px;
			font-weight: 700;
			vertical-align: top;
		}
		
		.x{	font-size: 20px;
			position: relative;
			left: -12px;
			top : -185px;
			background: black;
			color: white;
		}
		.selProductFiles{
			width: 300px;
			height: 200px;
		}
		
		.xx{	font-size: 20px;
			position: relative;
			left: -12px;
			top : -390px;
			background: black;
			color: white;
		}
		
		.selProductFile{
		   width: 500px;
		   height: 400px;
		}
		.label{
			color: black;
			font-size: 20px;
			font-weight: 700;
		}
		.hidden{
			display: hidden;
		}
		input, select{
			height: 26px;
		}
		.btn{
			background: #d4deec;
			margin-top: 20px;
		}
		
		
		
		#profile_box img {
			-webkit-filter: grayscale(0) blur(0);
			filter: grayscale(0) blur(0);
			-webkit-transition: .3s ease-in-out;
			transition: .3s ease-in-out;
			margin-top: 20px; margin-bottom: 40px; 
		}
		#profile_box img:hover {
			-webkit-filter: grayscale(50%) blur(2px);
			filter: grayscale(50%) blur(2px);
		}
    </style>
</head>
<body>
<header>
 <c:import url="/common/importHeader.jsp"/>
    <div id="wrap" class="myCompany">
   <nav class="myCompanyNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mycompany/myCompany.do'/>">
                                <img src="<c:url value="/resources/"/>img/company_ico.png" alt="" class="img-responsive center-block">
                                업체 정보
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/service.do'/>">
                                    <img src="<c:url value="/resources/"/>img/card_ico.png" alt="" class="img-responsive center-block">
                               업체 등록
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/auctionList.do'/>">
                                <img src="<c:url value="/resources/"/>img/graph_ico.png" alt="" class="img-responsive center-block">
                                입찰 현황
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/reservationView.do'/>">
                                <img src="<c:url value="/resources/"/>img/reservation_icon2.png" alt="" class="img-responsive center-block" style="padding: 5px;">
                                예약 현황
                            </a>
                        </li> 
                    </ul>
            </div>
        </nav>
        
        

        
        
        

        
        
		 <div id="profile_box">
			<div class="container">
	        <form id="myServiceInsertFrom" action="<c:url value='/myCompany/insertComInfoProfile.do'/>" method="post"  enctype="multipart/form-data" acceptcharset="UTF-8">
	        <table class="table">
	       	<tr>
	        	<td class="highlight">업체 이름</td>
	        	<td><input type="text" name="comInfoName" required/>
	        	<input type="hidden" name="type" value="insert"/></td>
	        </tr>
	       	<tr>
	        	<td class="highlight">서비스 카테소리</td>
	        	<td>
	        	<c:forEach var="CT" items="${comInfoType}">
	        		<input type="hidden" class="comInfoTypeDisable" onclick="selectDisable('${CT}')">
	        	</c:forEach>
	        	<select name="comInfoType" id="comInfoType" class="select-field__menu">
	        			<option value="v">웨딩홀</option>
	        			<option value="s">스트디오</option>
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
	        	<td><input type="text" name="comInfoPhone" required/></td>
	        </tr>
	        
	        
	        <tr>
	        	<td class="highlight">회사 주소</td>
	        	<td>
	        	<input type="text" id="sample4_postcode" placeholder="우편번호" class="hidden"> 
	        	<input type="text" name="comInfoAddr" id="sample4_roadAddress" placeholder="도로명주소" required> 
	        	<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="hidden" required>
	        	<input type="button" onclick="address()" value="우편번호 찾기" size="50"><br> <span id="guide" style="color: #999"></span></td>
	        </tr>
	        <tr>
	        	<td class="highlight">회사 상세주소</td>
	        	<td><input type="text" name="comInfoAddrDetail" id="com_addr_detail" class="input-field" required></td>
	        </tr>
	        
	        
	       
	        
	        
	        
	        
	        
	        
	        
	        <tr>
	        	<td class="highlight"> 업체 소개</td>
	        	<td><textarea name="comInfoProfile" cols="200" rows="8" style=" width:90%; resize: none; font-size: 18px; " required></textarea></td>
	        </tr>
			<tr>
				
					<td class="highlight"><input name="memNo" id=memNo value="${user.no}" type="hidden">	서비스 소개</td>  				
					<td><textarea name="comInfoContent" id="smarteditor" rows="10" cols="100" style="width:100%; height:350px;" required></textarea></td>
			</tr>
			<tr>
				<td class="highlight"><a href="javascript:" onclick="fileUploadAction();" class="my_button highlight" >업체 대표  이미지</a></td>
				<td>
				   <div class="input_wrap">
				   		<input type="file" id="input_img" name="file"/>
        			</div>
			        <div class="imgs_wrap">
			            <img id="img" />
			        </div>
				</td>
			</tr>
			<tr>
				<td class="highlight"><a href="javascript:" onclick="filesUploadAction();" class="my_button highlight" >업체 이미지 등록</a></td>
				<td>
				   <div class="input_wraps">
				   		<input type="file" id="input_imgs" multiple/>
        			</div>
			        <div class="imgs_wraps">
			            <img id="img" />
			        </div>
				</td>
			</tr>
			</table>
				</form>		
				<div class="form-btn text-right">
	                 <a href="service.do" class="cancle btn">취소</a>
	                 <a href="#" class="save btn" id="savebutton">등록</a>
	            </div>
	       		</div>
	    </div>
    
    
    
    </div>
    <script>
    $(function(){

    	 $(".comInfoTypeDisable").trigger("click");
    	
    	
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
 	       	var formData = new FormData(document.getElementById('myServiceInsertFrom'));
 			for(let file of sel_files) {
 	           formData.append("files", file);
 	        } 
 		   		formData.append("file", $("input[name=file]")[0].files[0]);
 		   		
 		   		if(!rep_file){
 		   			alert("대표사진을 꼭 설정해야 합니다.");
 		   			return false;
 		   		}
 		   		
 		   		
 		   		
 	  			 $.ajax({
 	 		    	   url:"insertComInfo.do",
 	 		    	   type:"POST",
 	 		    	   processData: false, //쿼리 (데이터 = 값) 형식을 해제하고 문자열? 형태로 보냄
 	 		           contentType: false, // 기본 타입 말고 multipart/form-data로 설정하게
 	 		    	   data: formData
 	 		       }).done(function (data){
 	 		    	   alert("서비스 작성이 완료되었습니다.");
 	 		    	  location.href ="service.do"
 	 		       }).fail(function(e){
 	 	        	   alert("서비스 수정 중 오류가 발생했습니다.");
 	 	           }) 
 	       	
	    })
	    
	    
	   
	    

	});
   
    
    
    
    var sel_files = [];
    var rep_file ="";

    
    
    $(document).ready(function() {
        $("#input_imgs").on("change", handleImgsFileSelect);
        $("#input_img").on("change", handleImgFileSelect);
    }); 

    function filesUploadAction() {
        console.log("filesUploadAction");
        $("#input_imgs").trigger('click');
    }
    
    
    function fileUploadAction() {
        console.log("fileUploadAction");
        $("#input_img").trigger('click');
    }
    
    
    function deleteImagesAction(index) {            
        console.log("index : "+index);
        sel_files.splice(index, 1);

        var img_box = "#img_box_"+index;
        $(img_box).remove();

        console.log(sel_files);
    }   
    function deleteImageAction(index) {   
    	$(".imgs_wrap").empty();
    }
    function handleImgFileSelect(e) {
    	$(".imgs_wrap").empty();
    	rep_file ="";
    	rep_file= $("input[name=file]")[0].files[0];
    	var reader = new FileReader();
    	 reader.onload= function (e) {
    		 html2 = "<span id='img_rep'><img src=\"" + e.target.result + "\" data-file='"+rep_file.name+"' class='selProductFile' title='Click to remove'/><a href=\"javascript:void(0);\"  onclick=\"deleteImageAction()\" class=\"xx\" >X</a></span>";
             $(".imgs_wrap").append(html2);
    	 }
    	 
    	 
    	 reader.readAsDataURL($("input[name=file]")[0].files[0]);
    }
    function handleImgsFileSelect(e) {

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var index = 0;
        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_files.push(f);

            var readers = new FileReader();
            readers.onload = function(e) {
           //html = "<a href=\"javascript:void(0);\" onclick=\"reImageAction("+index+")\" oncontextmenu=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
           	 html = "<span id=\"img_box_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFiles' title='Click to remove'/><a href=\"javascript:void(0);\"  onclick=\"deleteImagesAction("+index+")\" class=\"x\" id=\"img_id_"+index+"\">X</a></span>";
                $(".imgs_wraps").append(html);
                index++;

            }
            readers.readAsDataURL(f);
            
        });
    }
    
    
    function selectDisable (comInfoType){
    			$("select[name='comInfoType']").children("[value='"+comInfoType+"']").attr( 'disabled', true );
    			$("select[name='comInfoType']").children("[value='"+comInfoType+"']").next().attr( 'selected', true );
    		}

        
        
        
        
 // 다음 주소 api
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function address() {
		new daum.Postcode({
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
			};
			
			
			
			


			

 
			/**********************************************************************************
			validation 플러그인 사용 
		**********************************************************************************/


 	/* 	$.validator.addMethod("phone", function(phone_number, element) {
			phone_number = phone_number.replace(/\s+/g, ""); 
			return this.optional(element) || phone_number.length > 9 &&
				phone_number.match(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/);
		}, "Please specify a valid phone number");


		$(document).ready(function(){
			console.log(${comInfoType});
		}

		$( "#myServiceInsertFrom" ).validate({
			onkeyup:true, 
			rules: {
				comInfoName: {
			      required: true,
			      minlength: 5,
			    },
			    comInfoType:{
			      required : true,
			      minlength: 2 ,
			    },
				comInfoPhone:{
					required : true,
					phone:true
				},
				comInfoAddr:{
				    required : true,
				    minlength: 2 ,
				},
				comInfoAddrDetail:{
				    required : true,
				    minlength: 2 ,
				},
				comInfoProfile:{
				    required : true,
				    minlength: 2 ,
				},
				comInfoContent:{
				    required : true,
				    minlength: 2 ,
				 }
			  },
			  messages:{
				  comInfoName:{
		              required : "필수로입력하세요",
		              minlength : "최소 {0}글자이상이어야 합니다",
		                       
		        },
		        comInfoType:{
		        	required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다"
		  	      
		  	    },
				comInfoPhone:{
					required: "연락처를 입력하세요.",
					phone: "잘못된 문자가 입력되었습니다."
				},
				comInfoAddr:{
		        	required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다"
				},
				comInfoAddrDetail:{
		        	required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다"
				},
				comInfoProfile:{
		        	required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다"
				},
				comInfoContent:{
		        	required : "필수로입력하세요",
		            minlength : "최소 {0}글자이상이어야 합니다"
				 }
				
			  },
			  onsubmit: true,

			  errorClass : "validation-error",

			 validClass : "validation-valid", 
			  success: function(label) {
				   label.addClass("validation-valid").text("Ok!")
			  } 
			});
		}); */
 
		
		</script>
</body>
</html>