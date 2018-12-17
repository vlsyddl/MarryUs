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
		  	left: 550px;
		  	border: 2.2px solid #575757;
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
		  
		  .hidden{
		  display: hidden;}
	</style>

</head>
<body>



	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
 <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mypage/mywedding.do'/>">
                                    <img src="img/hall_ico.png" alt="" class="img-responsive center-block">
                                My Wedding
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myTodo.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                Check List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myBudget.do'/>">
                                <img src="img/budget_ico.png" alt="" class="img-responsive center-block">
                                Budget Spent
                            </a>
                        </li>
                                                <li>
                            <a href="<c:url value='/mypage/myAuction.do?choo=tab1&memNo=${user.no}&auctionType=v'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
                                <img src="img/bookmark_ico.png" alt="" class="img-responsive center-block">
                                Bookmark
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
          	<p class="title">Marry Us 일반회원 정보 수정</p>
        </div>
      </div>
    </div>
    <div id="grid">

        <div></div>
      
        <div id="grid__content">
          <div id="card">
            <form id="UpdateProfileForm" method="post" enctype="multipart/form-data" acceptcharset="UTF-8">
      
              
              

			<div class="imgs_wrap">
				<c:choose>
					<c:when test="${not empty member.genProfilepath && not empty member.genProfilename}">
					
					<img src="<c:url value="/${member.genProfilepath}/${member.genProfilename}" />"
				     	onclick="fileUploadAction();" id="genProfile" class="img-circle img-responsive center-block profile" style=" width: 150px; height: 150px;  object-fit: cover; object-position: top;" style="margin: 30px;"/>
				    </c:when>
				    <c:otherwise>
				           <img src="https://images.unsplash.com/photo-1470320691330-ae8e9288fb77?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=2eb2635304319feaaa15b104729138e4&auto=format&fit=crop&w=1050&q=80"  
				     	onclick="fileUploadAction();" id="genProfile" class="img-circle img-responsive center-block" style=" width: 150px; height: 150px;  object-fit: cover; object-position: top;"/>
				    </c:otherwise>
				</c:choose>
			 </div>
			<input type="file" id="input_img" name="file" class="hidden"/>
		
		
     
      
              <div class="signup__field">
                <label for="last_name" class="label">이름</label>
                <input type="text" name="name" id="name" class="input-field" value="${member.memName}" placeholder="이름을 입력해주세요.">
                <input type="hidden" name="email" id="mem_email" class="input-field" value="${member.memEmail}">
				<input type="hidden" name="no" id="no" class="input-field" value="${member.memNo}">
				<input type="hidden" name="genNo" id="gen_no" class="input-field" value="${member.memNo}">
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
                   <input type="text" name="phone" id="gen_phone" class="input-field" value="${member.memPhone}" iplaceholder="ex)01012346087" required>
              </div>
              <div class="signup__field">
                    <label for="last_name" class="label">생년월일</label>
                    <input type="text" name="genBirth" id="gen_birth" class="input-field" value="${member.genBirth}" placeholder="ex)19900619" required>
              </div>
              <input type="hidden" value="mg" name="type"/>


             
	                 <a href="<c:url value="mywedding.do" />" class="cancle btn"  >취소</a>
	                 <a href="#" class="save btn" id="savebutton" onclick="updateProfile()">등록</a>
      
            </form>
          </div>
        </div>
      
        <div></div>
      
      </div>
    
    
  </div>
</div>
      
      
<script>

$(document).ready(function() {
    $("#input_img").on("change", handleImgFileSelect);
}); 






function fileUploadAction() {
    $("#input_img").trigger('click');
}




function handleImgFileSelect(e) {
	console.log("sdjfldsjflkdsjfl");
	var rep_file= $("input[name=file]")[0].files[0];
	var reader = new FileReader();
	 reader.onload= function (e) {
		 console.log($("#genProfile").html());
         $("#genProfile").attr("src",e.target.result);
	 }
	 
	 
	 reader.readAsDataURL($("input[name=file]")[0].files[0]);
}



function updateProfile(){
	console.log("들어옴....");
	 $.ajax({
	   	   url:"validMember.do",
		   type : "POST",
	   	   data: $("#UpdateProfileForm").serialize()
	      }).done(function (result){
	    	  console.log(result);
	    	  if(result=="success"){
	    		var formData = new FormData(document.getElementById('UpdateProfileForm'));
	    		formData.append("file", $("input[name=file]")[0].files[0]);
	    		  
		    	  $.ajax({
				   	   url:"generalUpdate.do",
			    	   type:"POST",
			    	   processData: false, //쿼리 (데이터 = 값) 형식을 해제하고 문자열? 형태로 보냄
			           contentType: false, // 기본 타입 말고 multipart/form-data로 설정하게
			    	   data: formData
		    	  }).done(function(){
		    		  alert("정보가 수정되었습니다.");
				   	  location.href ="mywedding.do"
		    	  });
	
	      	}else{
	      		alert("비밀번호가 일치하지 않아 정보 수정이 불가능합니다."); 
	      	}
	      });
}





</script>      
</body>
</html>