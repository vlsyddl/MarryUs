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
        	width: 1200px;
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
    </style>
</head>
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
	<span class="gnbBar"></span> 
</header>
    <div id="wrap" class="mypage">
        <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li>
                            <a href="<c:url value='/mypage/myweddingService.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                my service 
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/service.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                service add
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/auctionList.do'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                my tender
                            </a>
                        </li>
                    </ul>
            </div>
        </nav>








    <div id="wrap" class="mypage">
        <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mypage/myService.do'/>">
                                    <img src="img/hall_ico.png" alt="" class="img-responsive center-block">
                                My Wedding
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/auctionList.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                Check List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/service.do'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/generalUpdate.do'/>">
                                <img src="img/budget_ico.png" alt="" class="img-responsive center-block">
                                Budget Spent
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/companyUpdate.do'/>">
                                <img src="img/bookmark_ico.png" alt="" class="img-responsive center-block">
                                Bookmark
                            </a>
                        </li>
                    </ul>
            </div>
        </nav>
	<div id="outer_box">
		 <div id="profile_box">

	        <form action=<c:url value="insertComInfo.do"/>  method="post" id="frm"  enctype="multipart/form-data" acceptcharset="UTF-8">
	        <table>
	       	<tr>
	        	<td class="highlight">업체 이름</td>
	        	<td><input type="text" name="comInfoName" value="${auctionList.comInfoName}"/>
	        	<input type="hidden" name="comInfoNo" value="${auctionList.comInfoNo}"/>
	        	<input type="hidden" name="type" value="update"/></td>
	        </tr>
	       	<tr>
	        	<td class="highlight">서비스 카테소리</td>
	        	<td>
	        	<select name="comInfoType" id="comInfoType" class="select-field__menu">
					<option>업종선택</option>
					<option value="v"${auctionList.comInfoType == 'v' ? 'selected="selected"' : '' } >웨딩홀</option>
					<option value="s" ${auctionList.comInfoType == 's' ? 'selected="selected"' : '' }>스튜디오</option>
					<option value="d" ${auctionList.comInfoType == 'd' ? 'selected="selected"' : '' }>드레스</option>
					<option value="m" ${auctionList.comInfoType == 'm' ? 'selected="selected"' : '' }>메이크업</option>
					<option value="h" ${auctionList.comInfoType == 'h' ? 'selected="selected"' : '' }>허니문</option>
					<option value="j" ${auctionList.comInfoType == 'j' ? 'selected="selected"' : '' }>예물</option>
					<option value="e" ${auctionList.comInfoType == 'e' ? 'selected="selected"' : '' }>기타</option>
				</select>
				</td>
	        </tr>
	        <tr>
	        	<td class="highlight">연락처</td>
	        	<td><input type="text" name="comInfoPhone" value="${auctionList.comInfoPhone}"/></td>
	        </tr>
	        
	        
	        <tr>
	        	<td class="highlight">회사 주소</td>
	        	<td>
	        	<input type="text" id="sample4_postcode" placeholder="우편번호"> 
	        	<input type="text" name="comInfoAddr" id="sample4_roadAddress" placeholder="도로명주소" value="${auctionList.comInfoAddr}" > 
	        	<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="hidden">
	        	<input type="button" onclick="address()" value="우편번호 찾기" size="50"><br> <span id="guide" style="color: #999"></span></td>
	        </tr>
	        <tr>
	        	<td class="highlight">회사 상세주소</td>
	        	<td><input type="text" name="comInfoAddrDetail" id="com_addr_detail" class="input-field" value="${auctionList.comInfoAddrDetail}" required></td>
	        </tr>
	        
	        
	        
	        
	        
	        
	        
	        <tr>
	        	<td class="highlight"> 업체 소개</td>
	        	<td><textarea name="comInfoProfile" cols="200" rows="8" style=" width:90%; resize: none; font-size: 18px; " >${auctionList.comInfoProfile}</textarea></td>
	        </tr>
			<tr>
				
					<td class="highlight"><input name="memNo" id=memNo value="10" type="hidden">	서비스 소개</td>  				
					<td><textarea name="comInfoContent" id="smarteditor" rows="10" cols="100" style="width:100%; height:350px;">${auctionList.comInfoContent}</textarea></td>
			</tr>
			<tr>
				<td class="highlight"><a href="javascript:" onclick="fileUploadAction();" class="my_button highlight" >업체 대표  이미지</a></td>
				<td>
				   <div class="input_wrap">
				   		<input type="file" id="input_img" name="file"/>
        			</div>
			        <div class="imgs_wrap">
			            <c:if test="${not empty file.comFileNo}">
			            	<span id='img_rep' class="db_img">
			            		<img src="<c:url value="/${file.comFilePath}/${file.comFileName}"/>" data-file="${file.comFileNo}" class='selProductFile' title='Click to remove'/>
			            		<a href="javascript:void(0);"  onclick="deleteImageAction(${file.comFileNo})" class="xx" >X</a>
			            	</span>
			            </c:if>
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
			            <c:forEach var="f" items="${files}" varStatus="status">
			            	<span id="img_box_${f.comFileNo}" class="db_imgs">
			            		<img src="<c:url value="/${f.comFilePath}/${f.comFileName}"/>" data-file="${f.comFileNo}"  class='selProductFiles' title='주의! 삭제된 사진은 복구가 불가능 합니다.'/>
			            		<a href="javascript:void(0);"  onclick="deleteImagesActions(${f.comFileNo})" class="x" class="img_box_${f.comFileNo}">X</a>
			            	</span>
			            </c:forEach>
			        </div>
				</td>
			</tr>
			</table>
				</form>		
				<div class="form-btn">
	                 <a href=<c:url value="myServiceDelete.do?comInfoNo=${auctionList.comInfoNo}"/> class="cancle btn">삭제</a>
	                 <a href="#" class="save btn" id="savebutton">수정</a>
	            </div>
	       
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
 	           formData.append("files", file);
 	        } 
 		   		formData.append("file", $("input[name=file]")[0].files[0]);
 		   		
 		   		console.log(rep_file);
 		   		if(!rep_file){
 		   			alert("대표사진을 꼭 설정해야 합니다.");
 		   			return false;
 		   		}
 		   		
 		   		console.log(sel_files.length);
  			 $.ajax({
 		    	   url:"insertComInfo.do",
 		    	   type:"POST",
 		    	   processData: false, //쿼리 (데이터 = 값) 형식을 해제하고 문자열? 형태로 보냄
 		           contentType: false, // 기본 타입 말고 multipart/form-data로 설정하게
 		    	   data: formData
 		       }).done(function (){
 		    	   alert("정보 수정이 완료되었습니다.");
 		    	  location.href ="service.do"
 		       }).fail(function(e){
 	        	   alert("정보 수정 중 오류가 발생했습니다.");
 	           }); 
 	       	
	    });
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

        //console.log(sel_files);
    }   
    
    
    function deleteImagesActions(index){
    	console.log(index);
    	if(index){
    		$.ajax({
    			url : "deleteImg.do",
    			data: {"comInfoNo" : index},
				type : "POST"
    		}).done(function(){
    			console.log("대표사진"+index+"번째가 삭제됨...")
    		}).fail(function(){
    			console.log("실패함....")
    		});
    	}
    	
    	
    	
        //console.log("index : "+index);
        //sel_files.splice(index, 1);

        var img_box = "#img_box_"+index;
        console.log(img_box);
        $(img_box).remove();
		console.log("세부사진")
        //console.log(sel_files);
    }
    
    
    function deleteImageAction(index) {   
    	console.log("대표사진....")
    	if(index){
    		$.ajax({
    			url : "deleteImg.do",
    			data: {"comInfoNo" : index},
				type : "POST"
    		}).done(function(){
    			console.log("대표사진"+index+"번째가 삭제됨...")
    		});
    	}
    	$(".imgs_wrap").empty();
    	rep_file ="";
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
 


    </script>
</body>
</html>