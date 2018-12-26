<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<c:import url="/common/importCss.jsp" />
<c:import url="/common/importJs.jsp" />
<head>
<script type="text/javascript"
	src="/scripts/bootstrap-datetimepicker.*js"></script>
</head>

<style>
@import
	url('https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css')
	;

*, *:after, *:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.clearfix:before, .clearfix:after {
	content: " ";
	display: table;
}

.clearfix:after {
	clear: both;
}

h1 {
	text-align: center;
}

a {
	color: black;
	text-decoration: none;
	outline: none;
}

/*Fun begins*/
.tab_container {
	margin: 0 auto;
	position: relative;
	font-size: 12px;
	background: rgba(255, 191, 222, 0.3);
	/*     box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0); */
}

input[type=radio], section {
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

label span {
	font-weight: 700;
}

#tab1:checked ~ #content, #tab2:checked ~ #content, #tab3:checked ~
	#content, #tab4:checked ~ #content, #tab5:checked ~ #content, #tab6:checked 
	~ #content, #tab7:checked ~ #content {
	display: block;
	padding: 20px;
	background: #fff;
	color: rgb(73, 78, 80);
	border-bottom: 2px solid #f0f0f0;
}

.tab_container .tab-content p, .tab_container .tab-content h3 {
	-webkit-animation: fadeInScale 0.7s ease-in-out;
	-moz-animation: fadeInScale 0.7s ease-in-out;
	animation: fadeInScale 0.7s ease-in-out;
}

.tab_container .tab-content h3 {
	text-align: center;
}

.tab_container [id^="tab"]:checked+label {
	background: rgba(255, 191, 222, 1);
	/* box-shadow: inset 0 5px rgb(176, 203, 207); */
	border-bottom: 5px solid #8c8880;
}

.tab_container [id^="tab"]+label {
	transition: all 0.5s;
}

.tab_container [id^="tab"]+label:hover {
	background: rgba(255, 191, 222, 0.5);
}

.tab_container [id^="tab"]:checked+label .fa {
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
}

/*Content Animation*/
@
keyframes fadeInScale { 0% {
	transform: scale(0.9);
	opacity: 0;
}

100%
{
transform
:
 
scale
(1);

    	
opacity
:
 
1;
}
}
.no_wrap {
	text-align: center;
	color: rgb(176, 203, 207);
}

.link {
	text-align: center;
}

body {
	color: rgb(112, 112, 112);
	line-height: 30px;
	font-weight: 500;
	font-size: 18px;
}

.simple_box h.highlight {
	background: #f1d6d6;
	padding: 3px 9px;
	font-weight: 800;
	color: rgb(78, 78, 78);
	clear: both;
}

.simple_box .picture {
	float: left;
}

.simple_box .detail div {
	font-weight: 500;
	text-indent: 30px;
}

.simple_box .red {
	font-size: 12px;
	color: rgb(212, 37, 37);
}

button {
	background: #fff;
	padding: 5px 14px;
	border: 2.2px double #82aaaf;
	color: #82aaaf;
	/* border:2.2px double #595e64; 
  color: #595e64;  */
	font-weight: 800;
	font-family: 맑은 고딕;
	font-size: 17px;
}

.btn1 {
	margin: 0px 10px 0px 0px;
}

.btn2 {
	font-size: 14px;
	border: none;
}

.img_eff {
	height: 130px;
	width: 200px;
	object-fit: contain;
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

body .left {
	text-align: right;
}

.info_box div, .simple_box div {
	font-size: 16px;
	line-height: 1.5em;
}

.simple_box {
	height: 130px;
	vertical-align: bottom;
}

h4 {
	font-size: 22px;
	font-weight: 600;
	margin-top: 80px;
	margin-bottom: 10px;
}

.auction_box {
	padding-top: 70px;
}

.more_btn {
	background: #f9f9f8;
	width: 1000px;
	margin: 18px 40px;
	padding: 10px 30px;
	clear: both;
}

.inner_box {
	width: 1000px;
	margin: 18px 40px;
	padding: 10px 30px;
}

.close_btn {
	text-align: right;
	position: relative;
	left: 920px;
	font-size: 30px;
	font-weight: 900;
}

.hidden {
	dispaly: hidden;
}

#title_area {
	font-size: 20px;
	font-weight: 800;
	line-height: 2em;
}

.paging {
	text-align: right;
}

.paging li {
	background-color: #334455;
	margin: 10px;
}

.title {
	font-size: 17px;
	font-weight: 700;
	line-height: 2em;
	display: inline-block;
	margin-right: 10px;
}

#resSubmitForm p {
	font-size: 18px;
	font-weight: 700;
	line-height: 2em;
	margin-bottom: 10px;
}

#resSubmitForm input, select {
	line-height: 1.5em;
}

#resSubmitForm select {
	padding: 5px;
}

#auction_detail {
	margin: 30px;
}

#Done {
	padding: 10px;
	background-color: rgb(151, 186, 190);
	color: black;
	border: 2px solid black;
}
</style>





</head>

<body>
	<c:import url="/common/importHeader.jsp" />
	<div id="wrap" class="mypage">
		<nav class="myPageNav"> <nav class="myPageNav">
		<div class="container">
			<ul>
				<li class="on"><a href="<c:url value='/mypage/mywedding.do'/>">
						<img src="<c:url value="/resources/"/>img/hall_ico.png" alt=""
						class="img-responsive center-block"> 나의 웨딩
				</a></li>
				<li><a href="<c:url value='/mypage/myTodo.do'/>"> <img
						src="<c:url value="/resources/"/>img/chk_ico.png" alt=""
						class="img-responsive center-block"> 체크리스트
				</a></li>
				<li><a href="<c:url value='/mypage/myBudget.do'/>"> <img
						src="<c:url value="/resources/"/>img/budget_ico.png" alt=""
						class="img-responsive center-block"> 예산
				</a></li>
				<li><a
					href="<c:url value='/mypage/myAuction.do?choo=tab1&memNo=${user.no}&auctionType=v'/>">
						<img src="<c:url value="/resources/"/>img/auction_ico.png" alt=""
						class="img-responsive center-block"> 역경매 현황
				</a></li>
				<li><a
					href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
						<img src="<c:url value="/resources/"/>img/bookmark_ico.png" alt=""
						class="img-responsive center-block"> 북마크
				</a></li>
			</ul>
		</div>
		</nav>




		<div class="auction_box">
			<div class="container">
				<div class="tab_container">

					<input id="tab1" type="radio" name="tabs"
						onClick="window.location.href='myAuction.do?choo=tab1&auctionType=v&memNo=${user.no}'"
						${choose == 'tab1' ? 'checked="checked"' : '' } checked="checked" />
					<label for="tab1"><span>예식장</span></label> <input id="tab2"
						type="radio" name="tabs"
						onClick="window.location.href='myAuction.do?choo=tab2&auctionType=s&memNo=${user.no}'"
						${choose == 'tab2' ? 'checked="checked"' : '' }> <label
						for="tab2"><span>스튜디오</span></label> <input id="tab3" type="radio"
						name="tabs"
						onClick="window.location.href='myAuction.do?choo=tab3&auctionType=d&memNo=${user.no}'"
						${choose == 'tab3' ? 'checked="checked"' : '' }> <label
						for="tab3"><span>드레스</span></label> <input id="tab4" type="radio"
						name="tabs"
						onClick="window.location.href='myAuction.do?choo=tab4&auctionType=m&memNo=${user.no}'"
						${choose == 'tab4' ? 'checked="checked"' : '' }> <label
						for="tab4"><span>메이크업</span></label> <input id="tab5" type="radio"
						name="tabs"
						onClick="window.location.href='myAuction.do?choo=tab5&auctionType=h&memNo=${user.no}'"
						${choose == 'tab5' ? 'checked="checked"' : '' }> <label
						for="tab5"><span>허니문</span></label> <input id="tab6" type="radio"
						name="tabs"
						onClick="window.location.href='myAuction.do?choo=tab6&auctionType=j&memNo=${user.no}'"
						${choose == 'tab6' ? 'checked="checked"' : '' }> <label
						for="tab6"><span>예물</span></label> <input id="tab7" type="radio"
						name="tabs"
						onClick="window.location.href='myAuction.do?choo=tab7&auctionType=e&memNo=${user.no}'"
						${choose == 'tab7' ? 'checked="checked"' : '' }> <label
						for="tab7"><span>기타 서비스</span></label>


					<section id="content" class="tab-content"> <c:choose>
						<c:when test="${not empty myAuction[0].auctionNo}">
							<div class="info_box left">
								<div>
									<fmt:formatDate value='${myAuction[0].auctionSdate}'
										pattern='yyyy-MM-dd' />
									~
									<fmt:formatDate value='${myAuction[0].auctionEdate}'
										pattern='yyyy-MM-dd' />
								</div>
								<div>${myAuction[0].tenderCnt}개의입찰서</div>
								<div>
									<button class="btn1 auctionDetail" type="button"
										data-href1="${myAuction[0].auctionNo}"
										data-href2="${myAuction[0].auctionType}">> 내 경매 조건 보기</button>
								</div>
								<div></div>
							</div>
						</c:when>
						<c:otherwise>
							<h3>입찰한 내역이 없습니다.</h3>
						</c:otherwise>
					</c:choose> <c:forEach var="auction" items="${myAuction[0].tenderList}"
						varStatus="status">
						<div class="simple_box">
							<h4>
								<h class="highlight">${status.count}</h>
								${auction.comInfoName}&emsp; <span class="left"> <fmt:formatDate
										value='${auction.tenderRegdate}' pattern='yyyy-MM-dd' /></span>
							</h4>
							<div class="picture">
								<img class="img_eff"
									src="<c:url value="/${auction.comFilePath}/${auction.comFileName}"/>" />
							</div>
							<div class="detail">
								<div>${auction.comInfoAddr}</div>
								<div id="com_phone"
									onclick="comPhone('${auction.comInfoPhone}')">${auction.comInfoPhone}</div>
								<div>
									<fmt:formatNumber type='currency'
										value='${auction.tenderBudget}' pattern='###,###' />
									만원
								</div>
								<div>
									<button class="btn1 more_detail" type="button"
										data-href="${auction.comInfoNo}">상세보기</button>




									<!-- 번호 추가해서 가져오기 -->
									<c:if
										test="${myAuction[0].dday>0  && myAuction[0].auctionStatus=='ing'}">
										<c:if test="${auction.tenderStatus=='ing'  }">
											<button
												class="more_reservation more_reservation${status.count} btn1"
												type="button" data-href="${auction.tenderNo}"
												onclick="gen_reservation(${auction.tenderNo},${status.count})">예약하기</button>
										</c:if>
										<c:if test="${auction.tenderStatus=='choo'}">
											<button class=" btn1" type="button" id="res_com"
												onclick="purchase(${myAuction[0].auctionNo}, ${auction.tenderNo},${status.count})">결정하기</button>
										</c:if>
									</c:if>
									<c:if
										test="${ myAuction[0].auctionStatus=='done' && auction.tenderStatus=='done'}">
										<button class="Done" type="button">선택됨</button>
									</c:if>
								</div>
							</div>
							<button class="btn2"></button>
						</div>




						<p>
							<button class="more_btn" data-toggle="collapse"
								href="#collapseExample${status.count}" role="button"
								aria-expanded="false"
								aria-controls="collapseExample${status.count}">경매 상세사항
								보기</button>
						</p>




						<div class="collapse" id="collapseExample${status.count}">
							<div class="card card-body">
								<div class="inner_box">
									<div id="title_area">${auction.tenderTitle}</div>
									<div id="content_area">${auction.tenderInfo}
										<p>
											<a class="close_btn" data-toggle="collapse"
												href="#collapseExample${status.count}" role="button"
												aria-expanded="false"
												aria-controls="collapseExample${status.count}">^</a>
										</p>
									</div>
								</div>
							</div>
						</div>

					</c:forEach> <c:if test="${count != 0}">
						<nav class="paging">
						<ul class="pagination">
							<li
								<c:if test="${pageNo==1||pageNo==null}">class="disabled"</c:if>>
								<c:choose>
									<c:when test="${pageNo!=1}">
										<a
											href="myAuction.do?choo=${choose}&memNo=${user.no}&auctionType=${myAuction[0].auctionType}&pageNo=${pageNo-1}"
											aria-label="Previous">
									</c:when>
									<c:otherwise>
										<a href="#" aria-label="Previous">
									</c:otherwise>
								</c:choose> <span aria-hidden="true">이전</span> </a>
							</li>

							<li <c:if test="${pageNo==count}">class="disabled"</c:if>>
								<c:choose>
									<c:when test="${pageNo!=count}">
										<a
											href="myAuction.do?choo=${choose}&memNo=${user.no}&auctionType=${myAuction[0].auctionType}&pageNo=${pageNo+ 1}"
											aria-label="Next">
									</c:when>
									<c:otherwise>
										<a href="#" aria-label="Next">
									</c:otherwise>
								</c:choose> <span aria-hidden="true">다음</span> </a>
							</li>
						</ul>
						</nav>
					</c:if>
				</div>



				</section>
			</div>
		</div>
	</div>








	<script>
$(function(){
	$(".more_detail").click(function(e){
		  e.preventDefault();
		  detail($(this).data("href"))
	      $('#detailModal').modal('show')
	      var bx;
		  $('#detailModal').on('shown.bs.modal', function () {
		    if(bx === undefined){
		      bx= slider = $('.slideBox ul').bxSlider({
		  	    mode: 'fade',
			    captions: true
			});
		    } else {
		      bx.reloadSlider(); 
		    }
		  });
	});
	

 	$(".more_reservation").click(function(e){
		  e.preventDefault();
	      $('#ModalReservation').modal('show')
	      var bx;
		  $('#ModalReservation').on('shown.bs.modal', function () {
		    
		  });
	    
	  }); 
 	
 	
 	$(".auctionDetail").click(function(e){
		  e.preventDefault();
		  auctionDetailModal($(".auctionDetail").data("href1"),$(".auctionDetail").data("href2"))
	      $('#auctionDetailModal').modal('show')
		  $('#auctionDetailModal').on('shown.bs.modal', function () {

		  });
	});
 	
 	$("#com_phone").trigger("click");
	
});//즉시 실행 함수

function gen_reservation(auctionNo, no){
	 $("input[name='tenderNo']").val(auctionNo); 
}

function purchase(auctionNo, tenderNo){
    msg = "이 업체를 최종 선택하시겠습니까??";
    if (confirm(msg)!=0) {
    	$.ajax({
    		url : "<c:url value='/mypage/purchase.do'/>",
    		type : "POST",
    		data : "auctionNo="+auctionNo+"&tenderNo="+tenderNo+"&tenderStatus=done"
    	}).done(function(no){
    		if(no>0){
    			alert("감사합니다.");
    			location.reload();
    		}
    	});
    } else {
    	  location.reload();
}
} // myconfirm


//전화번호 -
function comPhone(textinput) {
		textinput = textinput.replace(/[^0-9]/g, '');
		var tmp = ""

		if (textinput.length > 3 && textinput.length <= 7) {
			tmp += textinput.substr(0, 3);
			tmp += '-';
			tmp += textinput.substr(3);
			$("#com_phone").html(tmp);
		} else if (textinput.length > 7) {
			tmp += textinput.substr(0, 3);
			tmp += '-';
			tmp += textinput.substr(3, 4);
			tmp += '-';
			tmp += textinput.substr(7);
			$("#com_phone").html(tmp);
		}
};


function openForm (NY){
	if(NY=='N'){
		$("#res_date_time").addClass("hidden");	
		$("input[name=resDate]").val("");
		$("select[name=resTime] option").prop("selected", false);
	}
	if(NY=="Y"){
		$("#res_date_time").removeClass("hidden");	
	}
}





function resSubmit(){
	$.ajax({
		url : "<c:url value='/mypage/reservation.do'/>",
		type : "POST",
		data : $("#resSubmitForm").serialize()
	}).done(function(no){
		if(no>0){
			alert("예약이 완료되었습니다.")
   			$('#ModalReservation').modal('hide');
			location.reload();
		}
	});
} 

function detail(comInfoNo){
	var modal = $("#detailModal")
	var slideBox = $(".slideBox")
	slideBox.find("ul").html("")
	$.ajax({
		url : "<c:url value='/service/wedding/comDetail.do'/>",
		data : "comInfoNo="+comInfoNo
	}).done(function(data){
		modal.find(".modal-title").html(data.info.comInfoName)
        modal.find(".infoBox").find(".adress").children("dd").html(data.info.comInfoAddr+" "+data.info.comInfoAddrDetail)
        modal.find(".infoBox").find(".phone").children("dd").html(data.info.comInfoPhone)
        modal.find(".infoBox").find(".profile").children("dd").html(data.info.comInfoProfile)
        modal.find(".contentsBox").html(data.info.comInfoContent)
        $(".detailLikeBtn").attr("data-comno", data.info.comInfoNo);
        var fileList="";
        for(var f of data.files){
			fileList +='<li>'        	
			fileList +='<img src="/marryus/img/comProfile/'+f.comFileName+'" alt="" class="img-responsive center-block">'        	
			fileList +='</li>'        	
        }
        slideBox.find("ul").html(fileList);
	});
}
	
function auctionDetailModal(auctionNo, auctionType){
	$.ajax({
		url : "<c:url value='/mypage/auctionView.do'/>",
		data : {"auctionNo":auctionNo, "auctionType" : auctionType}
	}).done(function(data){
		var div ="";
		if(auctionType=='v'){
			div+="<p><span class='title'>희망예식장소</span> "+data.hopeVenue!=undefined ? data.hopeVenue : ""+"</p>";
			div+="<p><span class='title'>희망예식날짜</span>"+data.weddingDate+"</p>";
			div+="<p><span class='title'>시간</span>"+data.weddingTime+"</p>";
			div+="<p><span class='title'>예식 타입</span>"+data.weddingType+"</p>";
			div+="<p><span class='title'>하객 수</span>"+data.weddingVistor+"</p>";
			div+="<p><span class='title'>기타의견 사항</span>"+data.weddingWish+"</p>";
			div+="<p><span class='title'>희망예산</span>"+data.weddingBudget+"</p>";
		}
		if(auctionType=='s'){
			div+="<p><span class='title'>희망 위치</span>"+data.studioPlace+"</p>";
		    div+="<p><span class='title'>야외촬영여부</span>"+data.studioOutdoor+"</p>";
		    div+="<p><span class='title'>스냅샷촬영여부</span>"+data.studioSnapshot+"</p>";
		    div+="<p><span class='title'>비디오촬영여부</span>"+data.studioVideo+"</p>";
		    div+="<p><span class='title'>픽업여부</span>"+data.studioPickup+"</p>";
		    div+="<p><span class='title'>희망 예산</span>"+data.studioBudget+"</p>";
		    div+="<p><span class='title'>희망 사항</span>"+data.studioMore+"</p>";
		}
		if(auctionType=='d'){
			div+="<p><span class='title'>희망 위치</span>"+data.dressPlace+"</p>";
		    div+="<p><span class='title'>넥라인</span>"+data.dressNeckline+"</p>";
		    div+="<p><span class='title'>드레스타입</span>"+data.dressType+"</p>";
		    div+="<p><span class='title'>예상견적</span>"+data.dressPrice+"</p>";
		    div+="<p><span class='title'>희망 사항</span>"+data.dressMore+"</p>";
		}
		if(auctionType=='m'){
			div+="<p><span class='title'>희망 위치</span>"+data.mkuPlace+"</p>";
			div+="<p><span class='title'>신부화장</span>"+data.mkuMakeup+"</p>";
			div+="<p><span class='title'>혼주화장</span>"+data.mkuMom+"</p>";
			div+="<p><span class='title'>출장희망</span>"+data.mkuWorkout+"</p>";
			div+="<p><span class='title'>희망 예산</span>"+data.mkuBudget+"</p>";
			div+="<p><span class='title'>희망 사항</span>"+data.mkuMore+"</p>";
		}
		if(auctionType=='h'){
			div+="<p><span class='title'>희망 여행지</span>"+data.honeyPlace+"</p>";
			div+="<p><span class='title'>희망 여행 날짜</span>"+data.honeyDate+"</p>";
			div+="<p><span class='title'>기타 의견사항</span>"+data.honeyHope+"</p>";
			div+="<p><span class='title'>희망 예산</span>"+data.honeyBudget+"</p>";
		}
		if(auctionType=='j'){
			div+="<p><span class='title'>희망 위치</span>"+data.jewelryPlace+"</p>";
			div+="<p><span class='title'>예물 종류</span>"+data.jewelryType+"</p>";
			div+="<p><span class='title'>희망 예산</span>"+data.jewelryBudget+"</p>";
			div+="<p><span class='title'>희망 사항</span>"+data.jeweMore+"</p>";
		}
		if(auctionType=='e'){
			div+="<p><span class='title'>기타서비스 사항</span>"+data.serviceTitle+"</p>";
			div+="<p><span class='title'>기타서비스 상세</span>"+data.serviceDetail+"</p>";
		}
		
		$("#auction_detail").html(div);
		
	});
}


</script>

	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<div class="slideBox">
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
						</ul>
					</div>
					<div class="infoBox">
						<dl class="adress">
							<dt>주소 :</dt>
							<dd></dd>
						</dl>
						<dl class="phone">
							<dt>연락처 :</dt>
							<dd></dd>
						</dl>
						<dl class="Profile">
							<dt>정보 :</dt>
							<dd></dd>
						</dl>
					</div>
					<div class="contentsBox"></div>
					<div id="detailBtn"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<div class="modal fade" id="ModalReservation" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">예약하기</h4>
				</div>
				<div class="modal-body">
					<form id="resSubmitForm" method="POST">
						<input type="hidden" name="tenderNo" value=""> <input
							type="hidden" name="tenderStatus" value="choo">
						<p>방문을 해보시겠습니까?</p>
						<select name="resVisit" onchange="openForm(this.value)">
							<option value="N">아니오</option>
							<option value="Y">네</option>
						</select>

						<div id="res_date_time" class="hidden">
							<p>방문을 예정일과 요청시간</p>
							<input type="Date" name="resDate" /> <select name="resTime">
								<option value=''>--선택안함--</option>
								<c:forEach var="i" begin="8" end="20">
									<option value='${i}'>${i}시</option>
								</c:forEach>
							</select>
						</div>
						<hr>
						<p>연락받으실 수단을 선택해주세요</p>
						<p>
							이메일 : <input type="text" class="" name="resEmail" />
						</p>
						<p>
							연락처 : <input type="text" class="" name="resPhone" />
						</p>
						<hr>
						<p>요청사항 또는 추가로 궁금하신 사항이 있으면 알려주세요.</p>
						<textarea cols="3000" rows="7" name="resMessage"
							style="width: 850px"></textarea>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" onclick="resSubmit()" class="btn btn-default">보내기</button>
				</div>
			</div>
		</div>
	</div>



	<div class="modal fade" id="auctionDetailModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div id="auction_detail"></div>
			</div>
		</div>
</body>

</html>

