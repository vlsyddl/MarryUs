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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc6291b36d6e91a7fc6b30e92a9171d3&libraries=services"></script>
    <script src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script>
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
                <h2>허니문</h2>
                <p>
                    하와이 &middot; 괌 &middot; 몰디브
                </p>
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="contentsTab">
                    <ul>
                        <li data-target="tab1" class="on"><a href="<c:url value='/service/honeymoon/honeymoonCompanyList.do' />">업체리스트</a></li>
                        <li data-target="tab2"><a href="<c:url value='/service/honeymoon/honeymoonAuctionList.do'/>">경매리스트</a></li>
                    </ul>
                    <div class="tabContents">
                        <div class="tab2 on">
                        <!-- Button trigger modal -->
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#insertModal">
						  역경매 신청하기
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">웨딩홀 역경매 신청서</h4>
						      </div>
						      	      <form action="honeywrite.do"  method="post" name="honeyAuctionForm" onsubmit="return formCheck()" enctype="multipart/form-data">
							      <div class="modal-body">
								        <input type="hidden" name="memNo" value="${user.no}" />
								        <input type="hidden" name="auctionType" value="h" />
								       
								        <br>
											희망여행지: <input type="text" name="honeyPlace">
											<br>
	
										  <div class="input" >
		                                  	희망여행날짜 :  <input type="text" name="honeyDate" id="date_pretty"/> ~ 
		                                  	            <input type="text" name="honeyDate" id="datepicker1">
		                                  </div>
				                                                              기타의견사항: <textarea name="honeyHope" id="" class="wish" rows="3" cols="30"></textarea><br>
				                            <div>
				                                                             희망예산:<input type="text" name="honeyBudget">만원
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
                            <tr>
                                <th>경매번호</th>
                                <th>경매신청자</th>
                                <th>경매타입</th>
                                <th>경매상태</th>
                                <th>역경매 시작일</th>
                                <th>역경매 종료일</th>
                            </tr>
                          <c:forEach var="a" items="${auctionList}">
                            <tr>
                                <td>${a.auctionNo}</td>
                                <td><a href="#" data-href="${a.auctionNo}" data-type="${a.auctionType}" data-no="${a.member.no}" class="col-md-4 TravelBox">${a.member.name}</a></td>
                                <td>허니문</td>
                                <td>${a.auctionStatus}</td>
                                <td><fmt:formatDate value="${a.auctionSdate}" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value="${a.auctionEdate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
                            </c:forEach>
                    </table>
                      <nav>
		                    	<div class="text-center">
		                    	<ul class="pagination">
								<li><a
								<c:choose>
							      <c:when test="${beginPage!=1}">href="honeymoonAuctionList.do?pageNo=${beginPage-1}"</c:when>
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
							     href="honeymoonAuctionList.do?pageNo=${i}"
							     </c:otherwise>
							      </c:choose>>
		
										${i}</a></li>
							</c:forEach>
		
							<li><a
								<c:choose>
							      	<c:when test="${endPage != lastPage}"> href="honeymoonAuctionList.do?pageNo=${endPage+1}" </c:when>
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









  $(document).ready(function(){
	    $("#date_pretty").datepicker({ 
	    });
	    var myDate = new Date();
	    var month = myDate.getMonth() + 1;
	    var prettyDate = month + '/' + myDate.getDate() + '/' + myDate.getFullYear();
	    $("#date_pretty").val(prettyDate);
	});
  $(document).ready(function(){
	    $("#datepicker1").datepicker({ 
	    });
	    var myDate = new Date();
	    var month = myDate.getMonth() + 1;
	    var prettyDate = month + '/' + myDate.getDate() + '/' + myDate.getFullYear();
	    $("#datepicker1").val(prettyDate);
	});

//디테일 모달
function detail(comInfoNo){
	var modal = $("#detailModal")
	var slideBox = $(".slideBox")
	slideBox.find("ul").html("")
	$.ajax({
		url : "<c:url value='/service/honeymoon/comHoneyDetail.do'/>",
		data : "comInfoNo="+comInfoNo
	}).done(function(data){
		console.log(data)
		modal.find(".modal-title").html(data.info.comInfoName)
        modal.find(".infoBox").find(".adress").children("dd").html(data.info.comInfoAddr+" "+data.info.comInfoAddrDetail)
        modal.find(".infoBox").find(".phone").children("dd").html(data.info.comInfoPhone)
        modal.find(".infoBox").find(".profile").children("dd").html(data.info.comInfoProfile)
        modal.find(".contentsBox").html(data.info.comInfoContent)
        var fileList="";
        for(var f of data.files){
			fileList +='<li>'        	
			fileList +='<img src="/marryus/img/comProfile/'+f.comFileName+'" alt="" class="img-responsive center-block">'        	
			fileList +='</li>'        	
        }
        slideBox.find("ul").html(fileList)
	})
   

}

//역경매 리스트 디테일
function honeyDetail(auctionNo, auctionType){
	var modal = $("#TravelBoxModal")
	var slideBox = $(".slideBox")
	console.log("auctionNo: =====" + auctionNo)
	$.ajax({
		url : "<c:url value='/service/honeymoon/honeyAuctionDetail.do'/>",
		data : "auctionNo="+auctionNo
	}).done(function(data){
		console.log(data)
        modal.find(".Teavel").find(".hopeTravel").children("dd").html(data.auction.honeyPlace)
        modal.find(".Teavel").find(".TravelDate").children("dd").html(data.auction.honeyDate)
        modal.find(".Teavel").find(".Hope").children("dd").html(data.auction.honeyHope)
        modal.find(".contentsBox").html(data.auction.comInfoContent)
        slideBox.find("dd").html()
        $(".insertBox").attr('data-href', auctionNo);
		$(".insertBox").attr("data-auctype", auctionType);
		$(".insertBox").attr("disabled", true);

		loginCheck(auctionType);
	})
   

}




function loginCheck(type) {
	
	$.ajax({
		url : '<c:url value="/service/honeymoon/loginCheck.json" />',
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
		url: "<c:url value='/service/honeymoon/tenderwriteForm.do'/>",
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
		url: "<c:url value='/service/honeymoon/comInfoWrite.do'/>",
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
	    
	  })

})

$(function(){
	$(".TravelBox").click(function(e){
		  e.preventDefault();
		  honeyDetail($(this).data("href"), $(this).data("type"), $(this).data("no"))
	      $('#TravelBoxModal').modal('show')
	    
	  });
	      $(".insertBox").click(function(e){
			  e.preventDefault();
			  console.log("입찰하기 클릭" + $(this).data("href"));
			  tenderWrite($(this).data("href"));
		      comInfoWrite($("#memCheckNo").val());
		      $('#TravelBoxModal').modal('hide')
		      $('#insertAuction').modal('show')
		    
		  });

})







function maskingName(strName) {
    if(strName === undefined || strName === '') {
        return '';
    }
    var pattern = /.$/; // 정규식
    return strName.replace(pattern, "*");
}



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
	
    var h = document.honeyAuctionForm
    if(h.honeyPlace.value == "" ){
        alert("신혼여행지를 적어주세요")
        h.honeyPlace.focus()
        return false
    }
    if(h.honeyHope.value == "" ){
        alert("희망사항을 입력해주세요")
        h.honeyHope.focus()
        return false
    }
    if(h.honeyBudget.value == "" ){
        alert("희망예산을 입력해주세요")
        h.honeyBudget.focus()
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


<div class="modal fade" id="TravelBoxModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
        <div class="Teavel">
	        <dl class="mem">
	            <input type="hidden" id="memCheckNo" value="${user.no}"/>
            </dl>
            <dl class="hopeTravel">
                <dt>희망여행지 : </dt>
                <dd></dd>
            </dl>
            <dl class="TravelDate">
                <dt>여행일자: </dt>
                <dd></dd>
            </dl>
            <dl class="Hope">
                <dt>희망사항 : </dt>
                <dd></dd>
            </dl>
        </div>
        <div class="contentsBox">

        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary insertBox"><a href="#">입찰하기</a></button>
      </div>
    </div>
  </div>
</div>













	<div class="modal fade" id="insertAuction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog  modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	      	</div>
				<form action="tenderwrite.do"  method="post" name="auctionForm" onsubmit="return doAction()" enctype="multipart/form-data">
				      <div class="modal-body">
				      <div class="form-group">
				      <input type="hidden" name="memNo" value="${user.no}" />
<%-- 				      <input type="hidden" name="auctionNo" value="1" /> --%>
					  	</div>
					  	<div class="auction-no">
					  	</div>
					  	<div class="comInfo-no">
					  	</div>
						<div class="form-group">
					  		<div class="col-md-4">
					  			제목:<textarea class="form-control" id="tenderTitle" type="text" name="tenderTitle" placeholder="제목을 입력 해 주세요" /></textarea>	
					  		</div>
					  	</div><br>
						
					  	<h2>서비스 소개</h2>
					  	<div class="form-group">
					  		<div class="col-md-4">	
					  			<textarea name="tenderInfo" id="tenderInfo" class="wish form-control" rows="3" cols="30"></textarea>
					  		</div>
					  	</div><br>
					  	
					  	<h2>입찰 예산</h2>
					  	<div class="form-group">
					  		<div class="col-md-4">
					  			<input type="text" id="tenderBudget" name="tenderBudget" class="form-control"/>
					  		</div>
					  	</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary">입찰하기</button>
				      </div>
				</form>
	    </div>
	  </div>
	</div>



</body>
</html>