<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script> 
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
  
  img{
  	width: 90%;
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
.simple_box h.highlight{
  background: #f1d6d6; 
  padding: 3px 9px;
  font-weight: 800;
  color: rgb(78, 78, 78);
  clear: both;
}
.simple_box .picture{
	float: left;
}
.simple_box .detail div{
  font-weight: 500;
  text-indent: 30px;
}

.simple_box .red{
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


.img_eff{
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

.img_eff:hover {
  opacity: 1;
	-webkit-filter: grayscale(30%) blur(1px);
	filter: grayscale(30%) blur(1px);
}




body .left{
	text-align: right;
}


.info_box div, .simple_box div{
	font-size: 16px;
	line-height: 1.5em;
}
.simple_box{
	height: 130px;
	vertical-align: bottom;}

h4{
	font-size: 22px;
	font-weight: 600;
	margin-top: 80px;
	margin-bottom: 10px;
}
.auction_box{  	padding-top: 70px;}
 .more_btn{
 	width: 80%;
 	margin: 18px 40px;
 	padding : 10px 30px;
 	clear:  both;
 }
 
 .hidden{
 	dispaly : hidden;
 }
 
 ul{
 	clear :both;
 }
 
 

  </style>
  
  
      <link rel="stylesheet" href="css/style.css">

  
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
			<c:when test="${not empty myAuction[0].auctionNo}">
            <div class="info_box left">
               <div><fmt:formatDate value='${myAuction[0].auctionSdate}' pattern='yyyy-MM-dd' />~<fmt:formatDate value='${myAuction[0].auctionEdate}' pattern='yyyy-MM-dd' /></div>
             <div>${myAuction[0].tenderCnt}개의 입찰서</div>
              <div><a href="#" class="btn1" data-toggle="modal" data-target="#signUpModal">> 내 경매 조건 보기</a></div>
              <div></div>
            </div>
            </c:when>
            <c:otherwise><h3>입찰한 내역이 없습니다.</h3></c:otherwise>
          </c:choose> 
            
            
             <c:forEach var="auction" items="${myAuction[0].tenderList}" varStatus="status">
             <div class="simple_box">
     		<h4><h class="highlight">${status.count}</h>  ${auction.comInfoName}<span class="left">      <fmt:formatDate value='${auction.tenderRegdate}' pattern='yyyy-MM-dd' /></span></h4>
              <div class="picture">
                <img class="img_eff" src="<c:url value="/${auction.comFilePath}/${auction.comFileName}"/>" />
              </div>
              <div class="detail">
                <div>${auction.comInfoAddr} </div>
                <div>${auction.comInfoPhone}</div>
                <div><fmt:formatNumber type='currency' value='${auction.tenderBudget}' pattern='###,###'/>원</div>
                <div><button class="btn1">상세보기</button><button class="btn1">예약하기</button></div>
              </div>
              <button class="btn2"></button>
              </div>
              
              
              
              
              <p>
  <button class="more_btn" data-toggle="collapse" href="#collapseExample${status.count}" role="button" aria-expanded="false" aria-controls="collapseExample${status.count}">
     경매 상세사항 보기
  </button>
</p>




<div class="collapse" id="collapseExample${status.count}">
  <div class="card card-body">
                  <div class="inner_box" >
              <div id="title">${auction.tenderTitle}</div>
              <div id="content">${auction.tenderInfo}
                <a class="more_btn" data-toggle="collapse" href="#collapseExample${status.count}" role="button" aria-expanded="false" aria-controls="collapseExample${status.count}">접기</a>
              </div>
              </div>
  </div>
</div>

          	</c:forEach> 


              </div>

          	
          	 <c:if test="${count != 0}">
			<nav>
			  <ul class="pagination">
			    <li <c:if test="${pageNo==1||pageNo==null}">class="disabled"</c:if> >
			    <c:choose>
			    	<c:when test="${pageNo!=1}">
			    		<a href="myAuction.do?choo=${choose}&memNo=${user.no}&auctionType=${myAuction[0].auctionType}&pageNo=${pageNo-1}" aria-label="Previous">
			    	</c:when>
			    	<c:otherwise><a href="#" aria-label="Previous"></c:otherwise>
			    </c:choose>
			      
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    
			    <li <c:if test="${pageNo==count}">class="disabled"</c:if> >
			        <c:choose>
				    	<c:when test="${pageNo!=count}">
				    		<a href="myAuction.do?choo=${choose}&memNo=${user.no}&auctionType=${myAuction[0].auctionType}&pageNo=${pageNo+ 1}" aria-label="Next">
				    	</c:when>
				    	<c:otherwise><a href="#" aria-label="Next"></c:otherwise>
			    	</c:choose>
			    	<span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</c:if>
			
			
			</section>
			</div>

	</div>

<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog ">
    <div class="modal-content">
    	modal입니다.
    	<c:if test="${myAuction[0].auctionType=='v'}">
    		<p><span class="title">희망예식장소</span></p>
	    	<p><span class="title">희망예식날짜</span></p>
	    	<p><span class="title">시간</span></p>
	    	<p><span class="title">예식 타입</span></p>
	    	<p><span class="title">하객 수</span></p>
	    	<p><span class="title">기타의견 사항</span></p>
	    	<p><span class="title">희망예산</span></p>
    	</c:if>
    	<c:if test="${myAuction[0].auctionType=='s'}">
	    	<p><span class="title">희망 위치</span></p>
	    	<p><span class="title">야외촬영여부</span></p>
	    	<p><span class="title">스냅샷촬영여부</span></p>
	    	<p><span class="title">비디오촬영여부</span></p>
	    	<p><span class="title">픽업여부</span></p>
	    	<p><span class="title">희망 예산</span></p>
	    	<p><span class="title">희망 사항</span></p>
    	</c:if>
    	<c:if test="${myAuction[0].auctionType=='d'}">
	    	<p><span class="title">희망 위치</span></p>
	    	<p><span class="title">넥라인</span></p>
	    	<p><span class="title">드레스타입</span></p>
	    	<p><span class="title">예상견적</span></p>
	    	<p><span class="title">희망 사항</span></p>
    	</c:if>
    	<c:if test="${myAuction[0].auctionType=='m'}">
	    	<p><span class="title">희망 위치</span></p>
	    	<p><span class="title">신부화장</span></p>
	    	<p><span class="title">혼주화장</span></p>
	    	<p><span class="title">출장희망</span></p>
	    	<p><span class="title">희망 예산</span></p>
	    	<p><span class="title">희망 사항</span></p>
    	</c:if>
    </div>
    </div>
    </div>

  
  






</body>

</html>