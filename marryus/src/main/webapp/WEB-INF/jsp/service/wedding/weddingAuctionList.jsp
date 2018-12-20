<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marry Us</title>
    
<script type="text/javascript" src="/marryus/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc6291b36d6e91a7fc6b30e92a9171d3&libraries=services"></script>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/wedding.css"/>">
    
<style>
	


</style>
</head>
<body>
<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="wedding">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>웨딩홀</h2>
                <p>
                    웨딩홀 &middot; 스몰웨딩 &middot; 셀프웨딩
                </p>
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="contentsTab">
                    <ul>
                        <li data-target="tab1" ><a href="<c:url value='/service/wedding/weddingCompanyList.do' />">업체리스트</a></li>
                        <li data-target="tab2" class="on"><a href="<c:url value='/service/wedding/weddingAuctionList.do'/>">경매리스트</a></li>
                    </ul>
                    <div class="tabContents">
                        <div class="tab2 on">
                        <!-- Button trigger modal -->
                        <c:if test="${user.type eq 'mg'}">
							<button type="button" name="wedBtn" class="btn btn-primary btn-lg"  data-toggle="modal" data-target="#insertModal">
							  역경매 신청하기
							</button>
						</c:if>
						
						<!-- Modal -->
						<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button"  class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">웨딩홀 역경매 신청서</h4>
						      </div>
						      <form action="write.do"  method="post" name="wedAuctionForm" onsubmit="return formCheck()" enctype="multipart/form-data">
							      <div class="modal-body">
								        
								        <input type="hidden" name="memNo" value="${user.no}" />
								        <input type="hidden" name="auctionType" value="v" />
							        	<h2 class="hopeVenue">희망예식장소(필수)</h2>	
								        <div class="form-group">
								        	<div class="col-md-6">
								        		<select name="weddingVenue" id="sido1" class="form-control"></select>
								        	</div>							        
								        	<div class="col-md-6">
								        		<select name="weddingVenue" id="gugun1" class="form-control"></select>
								        	</div>							        
								        </div>
							        	<h2 class="hopeTime">희망예식날짜 & 시간 </h2>
								        <div class="form-group">
								        	<div class="col-md-2">
								        		<label for="date_pretty">Date : </label>
								        	</div>
								        	<div class="col-md-10">
								        		<input type="text" name="weddingDate" id="date_pretty" class="form-control"/>
								        	</div>
								        	
								        </div>
		                                <div class="btn-group" name="weddingTime">
											  <select class="selectBox1 form-control" name="weddingTime" id="weddingTime" >
				                                    <option value="선택하세요">선택하세요</option>
				                                    <option value="열두시이전">열두시이전</option>
				                                    <option value="12시부터2시">12시부터2시</option>
				                                    <option value="2시이후">2시이후</option>
	                            				</select>
										</div>
									  	<h2>예식 타입</h2>
									  	<div class="form-group">
									  		<div class="col-md-6">									  		
										  		<select class="selectBox1 form-control" name="weddingType" id="weddingType" >
				                                    <option value="일반예식">일반예식</option>
				                                    <option value="하우스예식">하우스웨딩</option>
				                                    <option value="야외예식">야외예식</option>
				                                    <option value="종교예식">종교예식</option>
	                            				</select>
									  		</div>
									  	</div>
									  	<h2>하객수</h2>
									  	<div class="form-group">
									  		<div class="col-md-6">									  			
										  		<select class="selectBox2 form-control" name="weddingVistor" id="weddingVistor">
				                                    <option value="100">100명</option>
				                                    <option value="150">150명</option>
				                                    <option value="200">200명</option>
				                                    <option value="250">250명 이상</option>
				                            	</select>
									  		</div>
									  	</div>
									  	<h2>기타 의견 사항</h2>
									  	<div class="form-group">
									  		<div class="col-md-12">
									  			 <textarea name="weddingWish" id="" class="wish form-control" rows="3" cols="30"></textarea>
									  		</div>
									  	</div>
									  	<h2>희망 예산</h2>
									  	<div class="form-group">
									  		<div class="col-md-4">
									  			<input type="text" id="weddingBudget" name="weddingBudget" class="form-control"/>
									  		</div>
									  		<div class="col-md-8">
									  			<p style="padding-top: 7px;">
									  				만원
									  			</p>
									  		</div>
									  	</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">신청</button>
							      </div>
	                         </form>
						    </div>
						  </div>
						</div>
                        
                   <table class="table table-hover serviceTable">
                   		<colgroup>
                   			<col width="10%"/>
                   			<col width="*"/>
                   			<col width="10%"/>
                   			<col width="10%"/>
                   			<col width="10%"/>
                   			<col width="10%"/>
                   		</colgroup>
                   		<thead>                   		
                            <tr>
                                <th>경매번호</th>
                                <th>경매 신청자</th>
                                <th>경매타입</th>
                                <th>경매상태</th>
                                <th>역경매 시작일</th>
                                <th>역경매 종료일</th>
                            </tr>
                   		</thead>
                   		<tbody>                   			
                         <c:forEach var="a" items="${auctionList}">
                            <tr>
                                <td>${a.auctionNo}</td>
                                <td><a href="#" data-href="${a.auctionNo}" data-type="${a.auctionType}" data-no="${a.member.no}" class="weddingBox">${a.member.name}</a></td>
                                 <c:if test="${a.auctionType eq 'v'}">
                                <td>웨딩홀</td>
                                </c:if>
<!--                                 <td>웨딩홀</td> -->
                                <c:if test="${a.auctionStatus eq 'ing'}">
                                <td>진행중</td>
                                </c:if>
                                <c:if test="${a.auctionStatus eq 'done'}">
                                <td>마감</td>
                                </c:if>
<%--                                 <td>${a.auctionStatus}</td> --%>
                                <td><fmt:formatDate value="${a.auctionSdate}" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value="${a.auctionEdate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
						</c:forEach>
                   		</tbody>
                    </table>
                      <nav>
		                    	<div class="text-center">
		                    	<ul class="pagination">
								<li><a
								<c:choose>
							      <c:when test="${beginPage!=1}">href="weddingAuctionList.do?pageNo=${beginPage-1}"</c:when>
							      <c:otherwise>href="#"</c:otherwise>
							    </c:choose>
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<c:forEach var="i" begin="${beginPage}" end="${endPage}">
									<li><a
									<c:choose>
							   		<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/category.do"}'>
							    	href="<c:url value='category.do?pageNo=${i-1}&select=${result.select}&text=${result.text}' />"
							    </c:when>
								
							    <c:otherwise>
							     href="weddingAuctionList.do?pageNo=${i}"
							     </c:otherwise>
							      </c:choose>>
		
										${i}</a></li>
							</c:forEach>
		
							<li><a
								<c:choose>
							      	<c:when test="${endPage != lastPage}"> href="weddingAuctionList.do?pageNo=${endPage+1}" </c:when>
							    	<c:otherwise>href="#"</c:otherwise>
						    	</c:choose>
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
							</ul>
						 </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>
    <c:import url="/common/importSideBar.jsp" />
    <c:import url="/common/importFooter.jsp" />


<!-- 카카오지도 -->
<script>






var options = {
        'speed' : 500,				 		//스피드
        'initTop' : 300, 					//기본top위치
        'alwaysTop' : false,				// true
        'default_x' : false 				//레이어가 붙는 아이디 
    }
    $('#sideBar').Floater(options);


$('document').ready(function() {
	 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구",     "북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

	 

	 // 시/도 선택 박스 초기화

	 $("select[name^=weddingVenue]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.parent().next().children().append("<option value=''>구/군 선택</option>");
	 });

	 

	 // 시/도 선택시 구/군 설정

	 $("select[name^=weddingVenue]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).parent().next().children(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화

	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });


	});






  $(document).ready(function(){
	    $("#date_pretty").datepicker({ 
	    });
	    var myDate = new Date();
	    var month = myDate.getMonth() + 1;
	    var prettyDate = month + '/' + myDate.getDate() + '/' + myDate.getFullYear();
	    $("#date_pretty").val(prettyDate);
	});

	
// 역경매 리스트 디테일
function weddingAuctionDetail(auctionNo, auctionType){
	var modal = $("#weddingDetailModal")
	var slideBox = $(".slideBox")
	$.ajax({
		url : "<c:url value='/service/wedding/weddingAuctionDetail.do'/>",
		data : "auctionNo="+auctionNo
	}).done(function(data){
		console.log("auctiondetail ======== " + data)
		modal.find(".modal-title").html(data.memName + "님의 역경매 신청내역입니다.");
		$("#insertAuction .modal-title").html(data.memName + "님의 역경매 신청내역입니다.");
        modal.find(".wedVenue").find(".venue").children("dd").html(data.wedList.weddingVenue)
        modal.find(".wedVenue").find(".wedDate").children("dd").html(data.wedList.weddingDate)
        modal.find(".wedVenue").find(".wedTime").children("dd").html(data.wedList.weddingTime)
        modal.find(".wedVenue").find(".wedType").children("dd").html(data.wedList.weddingType)
        modal.find(".wedVenue").find(".wedVisitor").children("dd").html(data.wedList.weddingVistor)
        modal.find(".wedVenue").find(".wedWish").children("dd").html(data.wedList.weddingWish)
        modal.find(".wedVenue").find(".wedBudget").children("dd").html(data.wedList.weddingBudget)
       
        slideBox.find("dd").html()
        $(".insertBox").attr('data-href', auctionNo);
		$(".insertBox").attr("data-auctype", auctionType);
		$(".insertBox").attr("disabled", true);

		loginCheck(auctionType);
	});
   

};


function loginCheck(type) {
	
	$.ajax({
		url : '<c:url value="/service/wedding/loginCheck.json" />',
		method : 'POST',
		data : {
			"memNo" : $("#memCheckNo").val(),
			"comInfoType" : type
		},
		cache : false
	}).done(function (data) {
		console.log($("#memCheckNo").val());
		console.log(type);
		console.log("logInCheck" + data.type);
		console.log("loginCheck ===== " + data.comInfo.comInfoType);
		
		if ( data.type == "mc" && data.comInfo.comInfoType == type ) {
			$(".insertBox").attr("disabled", false);
		}
		console.log("왔다링~~");
	});
};



function tenderWrite(auctionNo){
	console.log("tenderWrite...auctionNo ======= " + auctionNo);
	$.ajax({
		url: "<c:url value='/service/wedding/tenderwriteForm.do'/>",
		data: "auctionNo=" + auctionNo
	}).done(function(data){
		console.dir("dir ======= " + data)
// 		console.log("data.tender.comInfoNo" + data.tender.comInfoNo);
// 		console.log("data.tender" + data.tender);
		var html="";
		var cominfo= "";
		html += '<input type="hidden" name="auctionNo" value="'+auctionNo+'"/>'
// 		cominfo += '<input type="hidden" name="comInfoNo" value="'+data.tender.comInfoNo+'"/>'
		
		$(".auction-no").html(html);
// 		$(".comInfo-no").html(cominfo);
	})
}

function comInfoWrite(memNo){
	console.log("comInfoWrite...memNo ======= " + memNo);
	$.ajax({
		url: "<c:url value='/service/wedding/comInfoWrite.do'/>",
		data: "memNo=" + memNo
	}).done(function(data){
		console.dir("dir ======= " + data)
		console.log("log ======= " + data)
// 		console.log("data.tender.comInfoNo" + data.tender.comInfoNo);
// 		console.log("data.tender" + data.tender);
// 		var html="";
		var comInfo= "";
// 		html += '<input type="hidden" name="auctionNo" value="'+auctionNo+'"/>'
		comInfo += '<input type="hidden" name="comInfoNo" value="'+data.comInfoNo+'"/>'
		
// 		$(".auction-no").html(html);
		$(".comInfo-no").html(comInfo);
	})
}






$(function(){
	$(".itemBox").click(function(e){
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

});

// 역경매 리스트 디테일

	$(".weddingBox").click(function(e){
		  e.preventDefault();
		  weddingAuctionDetail($(this).data("href"),$(this).data("type"), $(this).data("no"))
	      $('#weddingDetailModal').modal('show')
	      $('#weddingDetailModal').on('shown.bs.modal', function () {
		  });
	    
	$(".insertBox").click(function(e){
		  e.preventDefault();
		  console.log("입찰하기 클릭" + $(this).data("href"));
	      tenderWrite($(this).data("href"));
	      comInfoWrite($("#memCheckNo").val());
	      $('#weddingDetailModal').modal('hide')
	      $('#insertAuction').modal('show')
	    
	  });
	  });
	  
	  
	 
	function doAction(){   
	    var f = document.auctionForm
	    
	    if(f.tenderTitle.value == "" ){
	        alert("제목을 입력해주세요")
	        f.tenderTitle.focus()
	        return false
	    }
	    
	    if(f.tenderInfo.value == ""){
	        alert("소개를 입력해주세요")
	        f.tenderInfo.focus()
	        return false
	    }
	    if(f.tenderBudget.value == ""){
	        alert("희마예산을 입력하세요")
	        f.tenderBudget.focus()    
	        return false
	    }
	    
	    Swal({
	    	  position: 'center',
	    	  type: 'success',
	    	  title: '입찰이 완료되었습니다. 감사합니다.',
	    	  showConfirmButton: false,
	    	  timer: 11000
	    	})
	}
	
	
	function formCheck(){   
		
	    var d = document.wedAuctionForm
	    
	    if(d.weddingWish.value == "" ){
	        alert("의견사항을 적어주세요")
	        d.weddingWish.focus()
	        return false
	    }
	    if(d.weddingBudget.value == "" ){
	        alert("희망 예산을 적어주세요")
	        d.weddingBudget.focus()
	        return false
	    }
	    Swal({
	    	  position: 'center',
	    	  type: 'success',
	    	  title: '역경매 신청이 완료되었습니다. 감사합니다.',
	    	  showConfirmButton: false,
	    	  timer: 11000
	    	})
	}



</script>


<div class="modal fade" id="weddingDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
        <div class="wedVenue">
            <dl class="mem">
            <input type="hidden" id="memCheckNo" value="${user.no}"/>
            </dl>
            <dl class="venue">
                <dt>희망예식장소 : </dt>
                <dd></dd>
            </dl>
            <dl class="wedDate">
                <dt>희망예식날짜: </dt>
                <dd></dd>
            </dl>
            <dl class="wedTime">
                <dt> 시간 : </dt>
                <dd></dd>
            </dl>
            <dl class="wedType">
                <dt>예식 타입 : </dt>
                <dd></dd>
            </dl>
            <dl class="wedVisitor">
                <dt>하객 수 : </dt>
                <dd></dd>
            </dl>
            <dl class="wedWish">
                <dt>기타의견 사항 : </dt>
                <dd></dd>
            </dl>
            <dl class="wedBudget">
                <dt>희망예산 : </dt>
                <dd></dd>
            </dl>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button"   class="btn btn-primary insertBox">입찰하기</button>
      </div>
    </div>
  </div>
</div>



     
	<div class="modal fade insertModal" id="insertAuction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog  modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	      	</div>
				<form action="tenderwrite.do"  method="post" id="frm" name="auctionForm" onsubmit="return doAction()" enctype="multipart/form-data">
				      <div class="modal-body" id="weddingAu">
				      <div class="form-group">
				      <input type="hidden" name="memNo" value="${user.no}" />
<%-- 				      <input type="hidden" name="auctionNo" value="1" /> --%>
					  	</div>
					  	<div class="auction-no">
					  	</div>
					  	<div class="comInfo-no">
					  	</div>
					  	<h2>서비스 제목</h2>
					  	<div class="form-group">
					  		<div class="col-md-12">
					  			<input class="form-control" type="text" id="tenderTitle" name="tenderTitle" class="form-control" placeholder="제목을 입력해 주세요" />
					  		</div>
					  	</div><br>
					  	<h2>서비스 소개</h2>
					  	<div class="form-group">
					  		<div class="col-md-12">	
					  			<textarea  name="tenderInfo" id="tenderInfo" class="wish form-control" rows="3" cols="30" placeholder="내용을 입력해 주세요" ></textarea>
					  		</div>
					  	</div><br>
					  	
					  	<h2>입찰 예산(만원)</h2>
					  	<div class="form-group">
					  		<div class="col-md-4">
					  			<input class="form-control" type="text" id="tenderBudget" name="tenderBudget" class="form-control" placeholder="예산을 입력해 주세요" />
					  		</div>
					  	</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary" id="savebutton">입찰하기</button>
				      </div>
				</form>
	    </div>
	  </div>
	</div>





</body>
</html>