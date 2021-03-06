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
                <h2>기타서비스</h2>
                <p>
                    축가 &middot; 케이터링 &middot; 프로포즈
                </p>
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="contentsTab">
                    <ul>
                        <li data-target="tab1"><a href="<c:url value='/service/serviceAdd/addcompanyList.do' />">업체리스트</a></li>
                        <li data-target="tab2" class="on"><a href="<c:url value='/service/serviceAdd/addauctionList.do' />">경매리스트</a></li>
                    </ul>
                    <div class="tabContents">
                        <div class="tab2 on">
                        <!-- Button trigger modal -->
                        <c:if test="${user.type eq 'mg'}">
							<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#insertModal">
							  역경매 신청하기
							</button>
						</c:if>
						
						<!-- Modal -->
						<div class="modal fade insertModal" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">웨딩홀 역경매 신청서</h4>
						      </div>
						      <form action="serviceAddwrite.do" name="addFormCheck" onsubmit="return formCheck()"  method="post" enctype="multipart/form-data">
							      <div class="modal-body">
								        
								        <input type="hidden" name="memNo" value="${user.no}" />
								        <input type="hidden" name="auctionType" value="e" />
									  	<h2>기타서비스 사항</h2>
									  	<div class="form-group">
									  		<div class="col-md-12">
									  			 <textarea name="serviceTitle" id="" class="wish form-control" rows="3" cols="30"></textarea>
									  		</div>
									  	</div>
									  	<h2>기타서비스 상세</h2>
									  	<div class="form-group">
									  		<div class="col-md-12">
									  			<textarea name="serviceDetail" id="" class="wish form-control" rows="3" cols="30"></textarea>
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
                                <th>경매신청인</th>
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
                                <td><a href="#" data-href="${a.auctionNo}" data-type="${a.auctionType}" data-no="${a.member.no}" class="col-md-4 serviceAddBox">${a.member.name}</a></td>
                                <c:if test="${a.auctionType eq 'e'}">
                                <td>기타서비스</td>
                                </c:if>
<!--                                 <td>기타서비스</td> -->
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
							      <c:when test="${beginPage!=1}">href="addauctionList.do?pageNo=${beginPage-1}"</c:when>
							      <c:otherwise>href="#"</c:otherwise>
							    </c:choose>
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<c:forEach var="i" begin="${beginPage}" end="${endPage}">
									<li><a
									<c:choose>
							   		<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/search.json"}'>
							    	href="<c:url value='search.json?pageNo=${i-1}&type=${result.type}&content=${result.content}' />"
							    </c:when>
								
							    <c:otherwise>
							     href="addauctionList.do?pageNo=${i}"
							     </c:otherwise>
							      </c:choose>>
		
										${i}</a></li>
							</c:forEach>
		
							<li><a
								<c:choose>
							      	<c:when test="${endPage != lastPage}"> href="addauctionList.do?pageNo=${endPage+1}" </c:when>
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


<script>
var options = {
        'speed' : 500,				 		//스피드
        'initTop' : 300, 					//기본top위치
        'alwaysTop' : false,				// true
        'default_x' : false 				//레이어가 붙는 아이디 
    }
    $('#sideBar').Floater(options);
    
// 역경매 리스트 디테일
function serviceAddAuctionDetail(auctionNo, auctionType){
	var modal = $("#serviceAddDetailModal")
	var slideBox = $(".slideBox")
	$.ajax({
		url : "<c:url value='/service/serviceAdd/serviceAddAuctionDetail.do'/>",
		data : "auctionNo="+auctionNo
	}).done(function(data){
		modal.find(".modal-title").html(data.memName + "님의 역경매 신청내역입니다.");
		$("#insertAuction .modal-title").html(data.memName + "님의 역경매 신청내역입니다.");
		console.log("auctiondetail ======== " + data)
        modal.find(".ServiceAdd").find(".OtherTitle").children("dd").html(data.auction.serviceTitle)
        modal.find(".ServiceAdd").find(".OtherDetail").children("dd").html(data.auction.serviceDetail)
       
        slideBox.find("dd").html()
        $(".insertBox").attr('data-href', auctionNo);
		$(".insertBox").attr("data-auctype", auctionType);
		$(".insertBox").attr("disabled", true);
		
		loginCheck(auctionType);
	});
   

};



function loginCheck(type) {
	
	$.ajax({
		url : '<c:url value="/service/serviceAdd/loginCheck.json" />',
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
		url: "<c:url value='/service/serviceAdd/tenderwriteForm.do'/>",
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
		url: "<c:url value='/service/serviceAdd/comInfoWrite.do'/>",
		data: "memNo=" + memNo
	}).done(function(data){
		console.dir("dir ======= " + data)
		console.log("log ======= " + data)
// 		console.log("data.tender.comInfoNo" + data.tender.comInfoNo);
// 		console.log("data.tender" + data.tender);
// 		var html="";
		var comInfo= "";
// 		html += '<input type="hidden" name="auctionNo" value="'+auctionNo+'"/>'
		console.log("data.comInfoNo"+ data.comInfoNo);
		comInfo += '<input type="hidden" name="comInfoNo" value="'+data.comInfoNo+'"/>'
		
// 		$(".auction-no").html(html);
		$(".comInfo-no").html(comInfo);
	})
}






$(function(){
	$(".itemBox").click(function(e){
		  e.preventDefault();
		  serviceAddAuctionDetail($(this).data("href"))
	      $('#serviceAddDetailModal').modal('show')
	      var bx;
		  $('#serviceAddDetailModal').on('shown.bs.modal', function () {
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

	$(".serviceAddBox").click(function(e){
		  e.preventDefault();
		  serviceAddAuctionDetail($(this).data("href"), $(this).data("type"), $(this).data("no"))
	      $('#serviceAddDetailModal').modal('show')
	      $('#serviceAddDetailModal').on('shown.bs.modal', function () {
		  });
	    
	$(".insertBox").click(function(e){
		  e.preventDefault();
		  console.log("입찰하기 클릭" + $(this).data("href"));
	      tenderWrite($(this).data("href"));
	      comInfoWrite($(".mem > #memNo").val());
	      $('#serviceAddDetailModal').modal('hide')
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
		  	  title: '역경매 신청이 완료되었습니다. 감사합니다.',
		  	  showConfirmButton: false,
		  	  timer: 11000
		  	})
	}
	
	
	
	function formCheck(){   
		
	    var a = document.addFormCheck
	    if(a.serviceTitle.value == "" ){
	        alert("원하시는 추가 서비스를 적어주세요")
	        a.serviceTitle.focus()
	        return false
	    }
	    if(a.serviceDetail.value == "" ){
	        alert("희망사항을 입력해주세요")
	        a.serviceDetail.focus()
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
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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
                <dt>주소 : </dt>
                <dd></dd>
            </dl>
            <dl class="phone">
                <dt>연락처 : </dt>
                <dd></dd>
            </dl>
            <dl class="Profile">
                <dt>정보 : </dt>
                <dd></dd>
            </dl>
        </div>
        <div class="contentsBox">

        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="serviceAddDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
        <div class="ServiceAdd">
            <dl class="mem">
          	  <input type="hidden" id="memCheckNo" value="${user.no}"/>
            </dl>
            <dl class="OtherTitle">
                <dt>기타서비스 제목: </dt>
                <dd></dd>
            </dl>
            <dl class="OtherDetail">
                <dt> 기타서비스 상세 : </dt>
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
				      <div class="modal-body" id="addservice">
				      <div class="form-group">
				      <div class="mem">
				      	<input type="hidden" id="memNo" name="memNo" value="${user.no}" />
<%-- 				      <input type="hidden" name="auctionNo" value="1" /> --%>
					  	</div>
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