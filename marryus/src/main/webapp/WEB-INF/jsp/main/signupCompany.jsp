<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/signupCompany.css"/>">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
     <div id="grid">

                <div></div>
              
                <div id="grid__content">
                  <div id="card">
                    <form class="form" action="company.do" method="post">
              
                      <h1 id="title">Marry Us 업체회원 가입</h1>
              
                      <div class="signup__field">
                        <label for="email" class="label">아이디(이메일)</label>
                        <input type="email" name="email" id="Email" class="input-field" autofocus>
                      </div>
                      
                      <div class="signup__field">
                        <label for="password" class="label">비밀번호</label>
                        <input type="password" name="pass" id="password" class="input-field" required>
                      </div>
                      <div class="signup__field">
                            <label for="password" class="label">비밀번호 확인</label>
                            <input type="password" name="pass" id="password" class="input-field" required>
                      </div>

                      <div class="signup__field">
                        <label for="com_name" class="label">회사 이름</label>
                        <input type="text" name="comName" id="com_name" class="input-field">
                      </div>
              
                      <div class="signup__field">
                        <label for="com_phone" class="label">회사 전화번호</label>
                        <input type="text" name="comPhone" id="com_phone" class="input-field" required>
                      </div>
              
                      <div class="signup__field">
                          <label for="com_phone" class="label">회사 주소</label>
                          <input type="text" id="sample4_postcode" placeholder="우편번호">
                          <input type="text" name="comAddr" id="sample4_roadAddress" placeholder="도로명주소">
                          <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                        <span id="guide" style="color:#999"></span>
                      </div>
                      <div class="signup__field">
                            <label for="com_addr_detail" class="label">회사 상세주소</label>
                            <input type="text" name="comAddrDetail" id="com_addr_detail" class="input-field" required>
                      </div>
              
                      <fieldset>
                        <legend>Favorites</legend>
              
                        <div class="signup__field" style="margin-top:12px;">
                          <label class="label" for="comType">대표업종 선택</label>
                          <div class="select-field">
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
                          </div>
                        </div>
             			
                      </fieldset>
                       <input type="hidden" value="mc" name="type"/>
                      <div class="signup__button">
                        <button id="submit" class="button" type="submit">Signup</button>
                      </div>
              
                    </form>
                  </div>
                </div>
              
                <div></div>
              
              </div>
              <script>
              // Default styles


// 다음 주소 api
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</body>
</html>