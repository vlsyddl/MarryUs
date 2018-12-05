<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/signupGeneral.css"/>">
<%--  <c:import url="/common/importJs.jsp"/> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/additional-methods.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/localization/messages_ko.js"></script>

<script src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script> 
</head>
<body>

    <div id="grid">

        <div></div>
      
        <div id="grid__content">
          <div id="card">
            <form id="generalForm" name="generalForm" class="form" action="general.do" method="post">
      
              <h1 id="title">Marry Us 회원가입</h1>
      
              <div class="signup__field">
                <label class="label-form" for="first_name" class="label">아이디(이메일)</label>
                <input type="email" name="email" id="e_mail" class="input-field" placeholder="ex)marryUs@naver.com" required  autofocus>
              </div>
      
              <div class="signup__field">
                <label class="label-form" for="last_name" class="label">이름</label>
                <input type="text" name="name" id="name" class="input-field" placeholder="이름을 입력해주세요." required>
              </div>

              <div class="signup__field">
                <label class="label-form" for="password" class="label">비밀번호</label>
                <input type="password" name="pass" id="pass" class="input-field" placeholder="4자 이상 16자 이하" required>
              </div>

              <div class="signup__field">
                    <label class="label-form" for="password" class="label">비밀번호 확인</label>
                    <input type="password" name="pass2" id="pass2" class="input-field" placeholder="한번더 입력해주세요." required>
              </div>
      
              <div class="signup__field">
                    <label class="label-form" for="last_name" class="label">핸드폰 번호</label>
                    <input type="text" name="phone" id="phone" class="input-field" placeholder="ex)01012346087" required>
              </div>
              <div class="signup__field">
                    <label class="label-form" for="last_name" class="label">생년월일</label>
                    <input type="text" name="genBirth" id="genBirth" class="input-field" placeholder="ex)19900619" required>
              </div>
              <input type="hidden" value="mg" name="type"/>
            <!--신랑 신부 select box-->
              <fieldset>
                <legend>Bri or Gro</legend>
                <div class="signup__field" style="margin-top:12px;">
                  <label class="label-form" class="label" for="gen_gender">신부님이세요? 신랑님이세요?</label>
                  <div class="select-field">
                    <select name="genGender" id=gen_gender class="select-field__menu">
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

/**********************************************************************************
	validation 플러그인 사용 
**********************************************************************************/
jQuery.validator.setDefaults({
	  debug: true,
	  success: "valid"
	});
$.validator.addMethod("passwordCk",  function( value, element ) {

	return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);

	});
$.validator.addMethod("phone", function(phone_number, element) {
	phone_number = phone_number.replace(/\s+/g, ""); 
	return this.optional(element) || phone_number.length > 9 &&
		phone_number.match(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/);
}, "Please specify a valid phone number");


출처: http://amajoy.tistory.com/entry/jquery의-validate-사용법 [내 삶의 즐거움]
$( "#generalForm" ).validate({
	rules: {
		email: {
	      required: true,
	      minlength: 2
	    },
	    name:{
	      required : true,
	      minlength: 2 ,
	      
	    },
	    pass:{
            required : true,
            passwordCk:true
        },
        pass2:{
			required : true,
			passwordCk:true,
			equalTo : pass
		},
		phone:{
			required : true,
			phone:true
			
		},
		genBirth:{
			
		}
	  },
	  messages:{
		  email:{
              required : "필수로입력하세요",
              minlength : "최소 {0}글자이상이어야 합니다",
              email : "메일규칙에 어긋납니다",
                       
        },
        name:{
        	required : "필수로입력하세요",
            minlength : "최소 {0}글자이상이어야 합니다"
  	      
  	    },
  	    pass:{
        	required : "필수로입력하세요",
        	passwordCk:"영문, 숫자, 특수문자 포함 8~16자",
            minlength : "최소 {0}글자이상이어야 합니다"
  	      
  	    },
  	    pass2:{
			required : "필수로입력하세요",
			passwordCk:"영문, 숫자, 특수문자 포함 8~16자",
			equalTo : "비밀번호가 일치하지 않습니다."
		},
		phone:{
			required: "연락처를 입력하세요.",
			phone: "잘못된 문자가 입력되었습니다."


		}
	  }
	});
/* $(function(){
	  $('#generalForm').validate({
		  rules : {

	            
	            e_mail:{
	                  required:ture,
	                  minlength : 2,
	                  eail : true
	                   remote:
	                  {
	                     url:"/",
	                     type:"post",
	                     success:function(data){
	                     if(fa)
	                  }
	                  
	            },
	            name:{
	                  required : true,   
	            
	            },
	            pass:{
	                  required : true,
	                  minlength : 6
	            },
	            pass2:{
	                  required : true,
	                  minlength : 6,
	                  equalTo : pass
	            },
	            phone:{
	                  required : true,   
	            
	            },
	            genBirth:{
	                  required : true,   
	            }
	            
	         },
	         messages:{
	            e_mail:{
	                  required : "필수로입력하세요",
	                  minlength : "최소 {0}글자이상이어야 합니다",
	                  email : "메일규칙에 어긋납니다",
	                  remote : "존재하는 아이디입니다"            
	            },
	            name:{
	                  required : "필수로입력하세요",
	                  minlength : "최소 {0}글자이상이어야 합니다",
	            },
	            pass:{
	                  required : "필수로입력하세요",
	                  minlength : "최소 {0}글자이상이어야 합니다",
	                  
	            },
	            pass2:{
	                  required : "필수로입력하세요",
	                  minlength : "최소 {0}글자이상이어야 합니다",
	                  equalTo : "비밀번호가 일치하지 않습니다."
	            },
	            phone:{
	               required : "필수로입력하세요"
	            
	            },
	            genBirth:{
	               required : "필수로입력하세요"
	            }
	         }
	   
	         
	   
		  
	  });
}); 
*/
/* 
// 입력란 비어있는지 체크 하는 함수
	function checkForm(){
		var gForm = document.generalForm;
			// 아이디 입력 체크
			if(gForm.email.value == ""){
				swal('아이디를 입력해주세요','','error')
				gForm.email.focus()
				return false;
			}
			//  이름 입력란 체크 
			if(gForm.name.value == ""){
				swal('이름을 입력해주세요','','error')
				gForm.name.focus()
				return false;
			}
			// 비밀번호 입력 체크
			if(gForm.pass.value == ""){
				swal('비밀번호를 입력해주세요','','error')
				gForm.pass.focus()
				return false;
			}
			// 비밀번호 확인 입력란 체크
			if(gForm.pass2.value == ""){
				swal('비밀번호확인을 입력해주세요','','error')
				gForm.pass2.focus()
				return false;
			}
			// 핸드폰번호 입력란 체크 
			if(gForm.phone.value == ""){
				swal('핸드폰번호를 입력해주세요','','error')
				gForm.phone.focus()
				return false;
			}
			// 생년월일 입력란 체크 
			if(gForm.genBirth.value == ""){
				swal('생년월일을 입력해주세요','','error')
				gForm.genBirth.focus()
				return false;
			}
			
			
			// 비밀번호 확인 체크 
			if(gForm.pass.value != gForm.pass2.value){
				swal('비밀번혼가 달라요','다시입력해주세요','error')
				gForm.pass.focus()
				gForm.pass.select()
				
				gForm.pass2.value = "";
				return false;
			}
			return true; 
			
	}
			*/
</script>      
</body>
</html>