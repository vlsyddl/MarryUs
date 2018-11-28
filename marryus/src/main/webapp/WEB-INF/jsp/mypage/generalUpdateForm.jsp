<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      
              <h1 id="title">Marry Us 회원 정보 수정</h1>
     
      
              <div class="signup__field">
                <label for="last_name" class="label">이름</label>
                <input type="text" name="genName" id="name" class="input-field" value="${member.memName}" placeholder="이름을 입력해주세요.">
                 <input type="hidden" name="genEmail" id="name" class="input-field" value="${member.memEail}" placeholder="이름을 입력해주세요.">
              </div>

              <div class="signup__field">
                <label for="password" class="label">비밀번호</label>
                <input type="password" name="prePass" id="password" class="input-field"  placeholder="4자 이상 16자 이하" required>
              </div>
              
              
              <div class="signup__field">
                <label for="password" class="label">새비밀번호</label>
                <input type="password" name="pass" id="password" class="input-field" placeholder="4자 이상 16자 이하" required>
              </div>

              <div class="signup__field">
                    <label for="password" class="label">새비밀번호 확인</label>
                    <input type="password" name="rePass" id="rePassword" class="input-field" placeholder="한번더 입력해주세요." required>
              </div>
      
              <div class="signup__field">
                    <label for="last_name" class="label">핸드폰 번호</label>
                   <input type="text" name="genPhone" id="gen_phone" class="input-field" value="${member.memPhone}" iplaceholder="ex)01012346087" required>
              </div>
              <div class="signup__field">
                    <label for="last_name" class="label">생년월일</label>
                    <input type="text" name="genBirth" id="gen_birth" class="input-field" value="${member.genBirth}" placeholder="ex)19900619" required>
              </div>
              <input type="hidden" value="mg" name="type"/>


              <div class="signup__button">
                <button id="submit" class="button" type="button">Signup</button>
              </div>
      
            </form>
          </div>
        </div>
      
        <div></div>
      
      </div>
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

$.(function(){
	if(${result}){
		$("#button").attr("type", "submit");
	}
})



</script>      
</body>
</html>