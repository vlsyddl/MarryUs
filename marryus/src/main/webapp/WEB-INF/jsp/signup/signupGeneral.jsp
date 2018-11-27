<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/signupGeneral.css"/>">

</head>
<body>

    <div id="grid">

        <div></div>
      
        <div id="grid__content">
          <div id="card">
            <form name="generalForm" class="form" action="general.do" method="post">
      
              <h1 id="title">Marry Us 회원가입</h1>
      
              <div class="signup__field">
                <label for="first_name" class="label">아이디(이메일)</label>
                <input type="email" name="email" id="e_mail" class="input-field" placeholder="ex)marryUs@naver.com" autofocus>
              </div>
      
              <div class="signup__field">
                <label for="last_name" class="label">이름</label>
                <input type="text" name="genName" id="genName" class="input-field" placeholder="이름을 입력해주세요.">
              </div>

              <div class="signup__field">
                <label for="password" class="label">비밀번호</label>
                <input type="password" name="pass" id="pass" class="input-field" placeholder="4자 이상 16자 이하" required>
              </div>

              <div class="signup__field">
                    <label for="password" class="label">비밀번호 확인</label>
                    <input type="password" name="pass2" id="pass2" class="input-field" placeholder="한번더 입력해주세요." required>
              </div>
      
              <div class="signup__field">
                    <label for="last_name" class="label">핸드폰 번호</label>
                    <input type="text" name="genPhone" id="genPhone" class="input-field" placeholder="ex)01012346087" required>
              </div>
              <div class="signup__field">
                    <label for="last_name" class="label">생년월일</label>
                    <input type="text" name="genBirth" id="genBirth" class="input-field" placeholder="ex)19900619" required>
              </div>
              <input type="hidden" value="mg" name="type"/>
            <!--신랑 신부 select box-->
              <fieldset>
                <legend>Bri or Gro</legend>
                <div class="signup__field" style="margin-top:12px;">
                  <label class="label" for="gen_gender">신부님이세요? 신랑님이세요?</label>
                  <div class="select-field">
                    <select name="genGender" id="genGender" class="select-field__menu">
                      <option name="genGender" value="bri">신부님</option>
                      <option name="genGender" value="gro">신랑님</option>
                    </select>
                  </div>
                </div>
              </fieldset>

              <div class="signup__button">
                <button id="submit" class="button" type="submit" onclick="checkForm()">Signup</button>
              </div>
      
            </form>
          </div>
        </div>
      
        <div></div>
      
      </div>
      
      
<script>
// Default styles
document.getElementsByTagName("html")[0].className = "bri";
document.getElementById("title").className = "bri";
document.getElementsByTagName("fieldset")[0].className = "bri";
var inputArray = document.getElementsByTagName("input");
for (var i = 0; i < inputArray.length; i++) {
  document.getElementsByTagName("input")[i].className = "bri";
}
document.getElementById("submit").className = "bri";

// Select event
document.getElementById("gen_gender").onchange = function() {
  updateColors()
};
// update color
function updateColors() {
  var x = document.getElementById("gen_gender");
  var xcolor = "bri";
  if (x.value != 'bri...') {
    var xcolor = x.value.toLowerCase();
  } 
  // updating
  console.log(x.value, xcolor);
  document.getElementsByTagName("html")[0].className = xcolor;
  document.getElementById("title").className = xcolor;
  document.getElementsByTagName("fieldset")[0].className = xcolor;
  var inputArray = document.getElementsByTagName("input");
  for (var i = 0; i < inputArray.length; i++) {
    document.getElementsByTagName("input")[i].className = xcolor;
  }
  document.getElementById("submit").className = xcolor;

}

	// 입력란 비어있는지 체크 하는 함수
	function checkForm(){
		var gForm = document.generalForm;
			// 아이디 입력 체크
			if(gForm.email.value == ""){
				alert("이메일을 입력하세요.")
				gForm.email.focus()
				return false;
			}
			//  이름 입력란 체크 
			if(cForm.genName.value == ""){
				alert("이름을 입력하세요.")
				cForm.genName.focus()
				return false;
			}
			// 비밀번호 입력 체크
			if(gForm.pass.value == ""){
				alert("비밀번호를 입력하세요.")
				gForm.pass.focus()
				return false;
			}
			// 비밀번호 확인 입력란 체크
			if(gForm.pass2.value == ""){
				alert("패스워드 확인을 입력하세요.")
				gForm.pass2.focus()
				return false;
			}
			// 핸드폰번호 입력란 체크 
			if(gForm.genPhone.value == ""){
				alert("핸드폰 번호를 입력하세요.")
				gForm.genPhone.focus()
				return false;
			}
			// 생년월일 입력란 체크 
			if(gForm.genBirth.value == ""){
				alert("생년월일을 입력하세요.")
				gForm.genBirth.focus()
				return false;
			}
			
			
			// 비밀번호 확인 체크 
			if(gForm.pass.value != gForm.pass2.value){
				alert("입력된 패스워드가 다릅니다. ")
				gForm.pass.focus()
				gForm.pass.select()
				
				gForm.pass2.value = "";
				return false;
			}
			return true;
	}
</script>      
</body>
</html>