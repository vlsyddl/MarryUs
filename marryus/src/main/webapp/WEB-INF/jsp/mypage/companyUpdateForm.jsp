<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	<style>
		.label{
			color: black;
			font-size: 10px;
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
					<li><a href="<c:url value='companyUpdate.do' />">회원가입</a></li>
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
	<div id="grid">

		<div></div>

		<div id="grid__content">
			<div id="card">
				<form class="form" action="validMember.do" method="post">

					<h1 id="title">Marry Us 업체회원 가입</h1>



					<div class="signup__field">
						<label for="com_name" class="label">회사 이름</label> 
						<input type="text" name="memName" id="com_name" class="input-field" value="${member.memName}">
						<input type="text" name="email" id="mem_email" class="input-field" value="${member.memEmail}">
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
							type="text" name="comPhone" id="com_phone" class="input-field" maxlength="13"
							 required value="${member.memPhone}">
					</div>

					<div class="signup__field">
						<label for="com_phone" class="label">회사 주소</label> <input
							type="text" name="comAddr" id="sample4_roadAddress"
							placeholder="도로명주소" value="${member.comAddr}"> <input type="button"
							onclick="address()" value="우편번호 찾기"><br> <span
							id="guide" style="color: #999"></span>
					</div>
					<div class="signup__field">
						<label for="com_addr_detail" class="label" >회사 상세주소</label> <input
							type="text" name="comAddrDetail" id="com_addr_detail" value="${member.comAddrDetail}"
							class="input-field" required>
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
						<button id="submit" class="button" type="submit">Signup</button>
					</div>

				</form>
			</div>
		</div>

		<div></div>

	</div>
	</div>
	<script>
	 

		// 다음 주소 api
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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