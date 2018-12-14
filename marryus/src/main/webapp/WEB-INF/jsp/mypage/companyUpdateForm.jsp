<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script> 
 
<script src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script> 
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	<style>
			.label{
			color: black;
			font-size: 16px;
			line-height: 3em;
			font-family: 맑은 고딕;
			font-weight: 800;
		}
		
		
		input, select{
			height: 26px;
			width: 150px;
			font-family: 맑은 고딕;
		}
		
		#grid{
			margin: 30px 30px 30px 60px;
		}
		
		
		body {
		  margin: 0;
		  padding: 0;
		  min-height: 100vh;
		}
		
		.container_box {
		  padding: 90px 50px;
		}
		
		
		.box {
		  width: 800px;
		  margin: 0 auto;
		  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.10);
		  position: relative;
		  border-radius: 10px;
		  position: relative;
		}
		
		
		
		.box__header {
		  width: 100%;
		  height: 80px;
		  background-color: rgba(231, 190, 209, 0.445);
		  background: url(https://images.unsplash.com/photo-1429679310900-bad303d0e63a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c9b51348554d75e0d0924eec1908af6f&auto=format&fit=crop&w=1050&q=80) ;
		  background: linear-gradient(135deg, rgba(237,141,161,1) 0%,rgba(249,178,195,1)30%,rgba(250,186,240,1) 60%,rgba(249,178,195,1) 100%);
		  display: flex;
		  align-items: center;
		  overflow: hidden;
		  border-radius: 10px 10px 0px 0px;
		  }
		  p.title{
		  	text-indent: 30px;
		  	font-size: 22px;
		  	font-weight: 800;
		  	color: white;
		  	font-family: 맑은 고딕;
		  
		  }
		  
		  
		  .btn{
		  	position: relative;
		  	left: 600px;
		  	border: 2.2px solid #575757;
		  	background : white;
		  	padding: 5px 12px;
		  	margin: 30px 10px;
		  	font-weight: 700;
		  	font-family: 맑은 고딕;
		  	color:#575757;
		  }
		  
		    .btn:hover{
		  	background: #575757;
		  	border: 2.2px solid #575757;
		  	color: white;
		  }
		  .hidden{dispaly: hidden;}
		  

	</style>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
          <nav class="myCompanyNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mycompany/myCompany.do'/>">
                                <img src="<c:url value="/resources/"/>img/company_ico.png" alt="" class="img-responsive center-block">
                                My Company
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/service.do'/>">
                                    <img src="<c:url value="/resources/"/>img/card_ico.png" alt="" class="img-responsive center-block">
                                My Service
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/auctionList.do'/>">
                                <img src="<c:url value="/resources/"/>img/graph_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        
                    </ul>
            </div>
        </nav>
        
        
        <div class="container_box">
  <div class="box">
    <div class="box__header">
      <div class="menu">

        <div class="menu__elements">
          	<p class="title">Marry Us 업체회원 정보 수정</p>
        </div>
      </div>
    </div>
    
    <div id="grid">

		<div></div>

		<div id="grid__content">
			<div id="card">
				<form id="UpdateProfileForm" method="POST">



					<div class="signup__field">
						<label for="name" class="label">회사 이름</label> 
						<input type="text" name="name" id="com_name" class="input-field" value="${member.memName}">
						<input type="hidden" name="email" id="mem_email" class="input-field" value="${member.memEmail}">
						<input type="hidden" name="no" id="no" class="input-field" value="${member.memNo}">
						<input type="hidden" name="comNo" id="com_no" class="input-field" value="${member.memNo}">
					</div>
					
					
					
					<div class="signup__field">
						<label for="password" class="label">비밀번호</label> <input
							type="password" name="prePass" id="password" class="input-field"
							required>
					</div>
					<div class="signup__field">
						<label for="password" class="label">새 비밀번호</label> <input
							type="password" name="pass" id="password" class="input-field"
							>
					</div>
					<div class="signup__field">
						<label for="password" class="label">새 비밀번호 확인</label> <input
							type="password" name="passCheck" id="password" class="input-field"
							>
					</div>

					<div class="signup__field">
						<label for="com_phone" class="label">회사 전화번호</label> <input
							type="text" name="phone" id="com_phone" class="input-field" maxlength="13"
							 required value="${member.memPhone}">
					</div>

					
					<div class="signup__field">
						<label for="com_phone" class="label">회사 주소</label> 
						<input type="text" id="sample4_postcode" class="hidden" placeholder="우편번호"> 
						<input type="text" name="comAddr" id="sample4_roadAddress"placeholder="도로명주소" value="${member.comAddr}">  
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="hidden">
						<input type="button" class="btn" onclick="address()" value="우편번호 찾기" style="position: relative; left: 0px;">
						<span id="guide" style="color:#999"></span>
					</div>
					<div class="signup__field">
						<label for="com_addr_detail" class="label">회사 상세주소</label> 
						<input type="text" name="comAddrDetail" id="comAddrDetail" class="input-field" value="${member.comAddrDetail}" required >
					</div>
					
					
					



					<fieldset>

						<div class="signup__field" style="margin-top: 12px;">
							<label class="label" for="comType">대표업종 선택</label>
							<span class="select-field">
								<select name="comType" id="comType" class="select-field__menu">
									<option>업종선택</option>
									<option value="v"${member.comType == 'v' ? 'selected="selected"' : '' } >웨딩홀</option>
									<option value="s" ${member.comType == 's' ? 'selected="selected"' : '' }>스튜디오</option>
									<option value="d" ${member.comType == 'd' ? 'selected="selected"' : '' }>드레스</option>
									<option value="m" ${member.comType == 'm' ? 'selected="selected"' : '' }>메이크업</option>
									<option value="h" ${member.comType == 'h' ? 'selected="selected"' : '' }>허니문</option>
									<option value="j" ${member.comType == 'j' ? 'selected="selected"' : '' }>예물</option>
									<option value="e" ${member.comType == 'e' ? 'selected="selected"' : '' }>기타</option>
								</select>
							</span>
						</div>

					</fieldset>
					<input type="hidden" value="mc" name="type" />
					<div class="signup__button">
						<a  type="button" class="btn"  onclick="updateProfile()">정보수정</a>
					</div>

				</form>
			</div>
		</div>

		<div></div>

	</div>
    
    
  </div>
</div>
	
	</div>
	<script>
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

	
	
	function updateProfile(){
		console.log("들어옴....");
		 $.ajax({
			 url:"<c:url value="/mypage/validMember.do"/>",
			   type : "POST",
		   	   data: $("#UpdateProfileForm").serialize()
		      }).done(function (result){
		    	  console.log(result);
		    	  if(result=="success"){
		    		  
			    	  $.ajax({
					   	   url:"companyUpdate.do",
					   	   type:"POST",
					   	   data: $("#UpdateProfileForm").serialize()
			    	  }).done(function(){
			    		  alert("정보가 수정되었습니다.");
					   	  location.href ="mywedding.do"
			    	  });
		
		      	}else{
		      		alert("비밀번호가 일치하지 않아 정보 수정이 불가능합니다."); 
		      	}
		      }).fail(function(e){
		    	  console.log(e);
		    	  console.log(e.status);
		    	     
		      });
	}
	

	
	</script>
</body>
</html>