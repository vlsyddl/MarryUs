<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
 <style>
  @import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css');

  *,
  *:after,
  *:before {
  	-webkit-box-sizing: border-box;
  	-moz-box-sizing: border-box;
  	box-sizing: border-box;
  }

  .clearfix:before,
  .clearfix:after {
  	content: " ";
  	display: table;
  }

  .clearfix:after {
  	clear: both;
  }

  body {
  	font-family:맑은 고딕;
  	background: #f6f9fa;
  }

  h1 {
  	text-align: center;
  }

  a {
    color: #ccc;
    text-decoration: none;
    outline: none;
  }

  /*Fun begins*/
  .tab_container {
  	width: 70%;
  	margin: 0 auto;
    position: relative;
    font-size: 12px;
    background: #f4e2ec;
  }

  input, section {
    clear: both;
    padding-top: 10px;
    display: none;
  }

  label {
    font-weight: 900;
    font-size: 16px;
    display: block;
    float: left;
    width: 12.5%;
    padding: 1.5em;
    color: rgb(81, 91, 95);
    cursor: pointer;
    text-decoration: none;
    text-align: center;
/*     background: #f0f0f0; */
  }
  label span{
  font-family: 맑은 고딕;
  font-weight: 700;}

  #tab1:checked ~ #content,
  #tab2:checked ~ #content,
  #tab3:checked ~ #content,
  #tab4:checked ~ #content,
  #tab5:checked ~ #content,
  #tab6:checked ~ #content,
  #tab7:checked ~ #content {
    display: block;
    padding: 20px;
    background: #fff;
    color: rgb(73, 78, 80);
    border-bottom: 2px solid #f0f0f0;
  }
	
  .tab_container .tab-content p,
  .tab_container .tab-content h3 {
    -webkit-animation: fadeInScale 0.7s ease-in-out;
    -moz-animation: fadeInScale 0.7s ease-in-out;
    animation: fadeInScale 0.7s ease-in-out;
  }
  .tab_container .tab-content h3  {
    text-align: center;
  }

  .tab_container [id^="tab"]:checked + label {
    background: rgb(255, 255, 255,0.3);
    /* box-shadow: inset 0 5px rgb(176, 203, 207); */
    border-bottom: 5px solid #8c8880 ;
    
  }

  .tab_container [id^="tab"]:checked + label .fa {
    color: rgb(176, 203, 207);
  }

  label .fa {
    font-size: 1.3em;
    margin: 0 0.4em 0 0;
  }

  /*Media query*/
  @media only screen and (max-width: 900px) {
    label span {
      display: none;
    }
    
    .tab_container {
      width: 98%;
    }
  }

  /*Content Animation*/
  @keyframes fadeInScale {
    0% {
    	transform: scale(0.9);
    	opacity: 0;
    }
    
    100% {
    	transform: scale(1);
    	opacity: 1;
    }
  }

  .no_wrap {
    text-align:center;
    color: rgb(176, 203, 207);
  }
  .link {
    text-align:center;
  }


  body{
	color: rgb(112, 112, 112);
	line-height:30px;
	font-weight: 500;
	font-size: 18px;
}
.detail_box h.highlight{
  background: #f1d6d6; 
  padding: 3px 9px;
  font-weight: 800;
  color: rgb(78, 78, 78);
  clear: both;
}
.detail_box .picture{
	float: left;
}
.detail_box .detail div{
  font-weight: 500;
  text-indent: 30px;
}

.detail_box .red{
	font-size: 12px;
	color: rgb(212, 37, 37);
}

button{
  background: #fff;
  padding: 3px 14px;
  border:2.2px double rgb(151, 186, 190);
  color: rgb(151, 186, 190);
  font-weight: 800;
}

.btn1{
  margin: 0px 10px 0px 0px;
}

.btn2{
  font-size: 14px;
  border: none;
}


img{
  height: 130px;
  width: 200px;
   object-fit:contain;
   max-height: 100%;
   max-width: 100%;    
   display: block;
   margin: auto auto;
   -webkit-filter: grayscale(0) blur(0);
	filter: grayscale(0) blur(0);
	-webkit-transition: .3s ease-in-out;
  transition: .3s ease-in-out;
  border: 1px solid rgb(243, 243, 243);
}

img:hover {
  opacity: 1;
	-webkit-filter: grayscale(30%) blur(1px);
	filter: grayscale(30%) blur(1px);
}




body .left{
	text-align: right;
}


.info_box div, .detail_box div{
	font-size: 16px;
	line-height: 1.5em;
}
.detail_box{
	height: 130px;
	vertical-align: bottom;}

h4{
	font-size: 22px;
	font-weight: 600;
	margin-top: 80px;
	margin-bottom: 10px;
}
.auction_box{  	padding-top: 70px;}
 

  </style>
  
  
      <link rel="stylesheet" href="css/style.css">

  
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
                            <a href="<c:url value='/mypage/myAuction.do?memNo=${user.no}&auctionType=v'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myBudget.do'/>">
                                <img src="img/budget_ico.png" alt="" class="img-responsive center-block">
                                Budget Spent
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





<div class="auction_box">
		<div class="tab_container">
		
			<input id="tab1" type="radio" name="tabs" onClick="window.location.href='myAuction.do?choo=tab1&auctionType=v&memNo=${user.no}'" ${choose == 'tab1' ? 'checked="checked"' : '' } />
			<label for="tab1"><span>예식장</span></label>

			<input id="tab2" type="radio" name="tabs"  onClick="window.location.href='myAuction.do?choo=tab2&auctionType=s&memNo=${user.no}'" ${choose == 'tab2' ? 'checked="checked"' : '' }>
			<label for="tab2"><span>스튜디오</span></label>
			

			<input id="tab3" type="radio" name="tabs"  onClick="window.location.href='myAuction.do?choo=tab3&auctionType=d&memNo=${user.no}'" ${choose == 'tab3' ? 'checked="checked"' : '' }>
			<label for="tab3"><span>드레스</span></label>
			
			
			<input id="tab4" type="radio" name="tabs"  onClick="window.location.href='myAuction.do?choo=tab4&auctionType=m&memNo=${user.no}'" ${choose == 'tab4' ? 'checked="checked"' : '' } >
			<label for="tab4"><span>메이크업</span></label>
			
			
			<input id="tab5" type="radio" name="tabs"  onClick="window.location.href='myAuction.do?choo=tab5&auctionType=h&memNo=${user.no}'" ${choose == 'tab5' ? 'checked="checked"' : '' } >
			<label for="tab5"><span>허니문</span></label>
			
			
			<input id="tab6" type="radio" name="tabs"  onClick="window.location.href='myAuction.do?choo=tab6&auctionType=j&memNo=${user.no}'" ${choose == 'tab6' ? 'checked="checked"' : '' }>
			<label for="tab6"><span>예물</span></label>
			
			
			<input id="tab7" type="radio" name="tabs"  onClick="window.location.href='myAuction.do?choo=tab7&auctionType=e&memNo=${user.no}'" ${choose == 'tab7' ? 'checked="checked"' : '' } >
			<label for="tab7"><span>기타 서비스</span></label>
			
			
			<section id="content" class="tab-content">
			<c:choose>
			<c:when test="${not empty myAuction[0].comInfoName}">
            <div class="info_box left">
               <div><fmt:formatDate value='${myAuction[0].auctionSdate}' pattern='yyyy-MM-dd' />~<fmt:formatDate value='${myAuction[0].auctionEdate}' pattern='yyyy-MM-dd' /></div>
             <%--  <div>${count}개의 입찰서</div> --%>
              <div><button >> 내 경매 조건 보기</button></div>
              <div></div>
            </div>
            </c:when>
            <c:otherwise><h3>입찰한 내역이 없습니다.</h3></c:otherwise>
            </c:choose>
            
            
             <c:forEach var="auction" items="${myAuction}" varStatus="status">
             <div class="detail_box">
     		<h4><h class="highlight">${status.count}</h>  ${auction.comInfoName}<span class="left">      <fmt:formatDate value='${auction.tenderRegdate}' pattern='yyyy-MM-dd' /></span></h4>
              <div class="picture">
                <img src="<c:url value="/${auction.comFilePath}/${auction.comFileName}"/>" />
              </div>
              <div class="detail">
                <div>${auction.comInfoAddr} </div>
                <div>${auction.comInfoPhone}</div>
                <div><fmt:formatNumber type='currency' value='${auction.tenderBudget}' pattern='###,###'/>원</div>
                <div><button class="btn1">상세보기</button><button class="btn1">예약하기</button></div>
              </div>
              <button class="btn2"></button>
              </div>
          	</c:forEach>
			
			
			</section>
			</div>

	</div>



  
  

    <script  src="js/index.js"></script>




</body>

</html>
