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
                        <li data-target="tab1" class="on"><a href="javascript:void(0);">업체리스트</a></li>
                        <li data-target="tab2"><a href="javascript:void(0);">경매리스트</a></li>
                    </ul>
                    <div class="tabContents">
                        <div class="tab1 on">
						   	<div class="map_wrap">
						        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						    
						        <div id="menu_wrap" class="bg_white">
						            <div class="option">
						                <div>
						                    <form onsubmit="searchPlaces(); return false;">
						                       	 키워드 : <input type="text" value="강남구 웨딩홀" id="keyword" size="15"> 
						                        <button type="submit">검색하기</button> 
						                    </form>
						                </div>
						            </div>
						            <hr>
						            <ul id="placesList"></ul>
						            <div id="pagination"></div>
						        </div>
						    </div>
                    	<div>
                    	<div class="row itemWrap">
                        <c:forEach var="h" items="${honeymoonList}">
                                <div class="col-md-4 itemBox" data-href="${h.comInfoNo}">
                                    <div class="item">
                                        <div class="imgBox">
                                            <a href="#"><img src="/marryus/img/comProfile/${h.comFileName}" alt="" class="img-responsive center-block" onError="javascript:this.src='<c:url value="/resources/img/sorry.png"/>'"></a>
                                        </div>
                                        <div class="textBox">
                                            <h5><a href="#">${h.comInfoName}</a></h5>
                                            <p>
                                                ${h.comInfoAddr} <br/>
                                                ${h.comInfoAddrDetail}
                                            </p>
                                        </div>
                                        <div class="infoBox">
                                            <ul>
                                                <li><span>별점</span> <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <a href="#" class="itemBtn">관심업체 등록</a>
                                    </div>
                                    </div>
                            </c:forEach>
                            <nav>
		                    	<div class="text-center">
		                    	<ul class="pagination">
								<li><a
								<c:choose>
							      <c:when test="${beginPage!=1}">href="honeymoon.do?pageNo=${beginPage-1}"</c:when>
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
							     href="honeymoon.do?pageNo=${i}"
							     </c:otherwise>
							      </c:choose>>
		
										${i}</a></li>
							</c:forEach>
		
							<li><a
								<c:choose>
							      	<c:when test="${endPage != lastPage}"> href="honeymoon.do?pageNo=${endPage+1}" </c:when>
							    	<c:otherwise>href="#"</c:otherwise>
						    	</c:choose>
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
							</ul>
							</div>
						 </nav>
		                    
                          <div class="searchWrap">
                          	 <form action="" id="search">
                                <select class="form-control" id="searchType">
                                    <option value="title" selected>제목</option>
                                    <option value="writer">글쓴이</option>
                                </select>
                                <input type="text" class="form-control" id="searchContent" placeholder="Search for...">
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="button" id="searchBtn"><i class="fas fa-search"></i></button>
                                </span>
                               </form>
                          </div>
                        </div>

                  		</div>
                        </div>
                        <div class="tab2">
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
						      	      <form action="Honeywrite.do"  method="post" enctype="multipart/form-data">
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
				                                                             희망예산:<input type="text" name="honeyBudget">
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
                          <c:forEach var="a" items="${AuctionList}">
                            <tr>
                                <td>${a.auctionNo}</td>
                                <td><a href="#" data-href="${a.auctionNo}" class="col-md-4 TravelBox">${a.member.name}</a></td>
                                <td>허니문</td>
                                <td>${a.auctionStatus}</td>
                                <td><fmt:formatDate value="${a.auctionSdate}" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value="${a.auctionEDate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
                            </c:forEach>
                    </table>
                      <nav>
		                    	<div class="text-center">
		                    	<ul class="pagination">
								<li><a
								<c:choose>
							      <c:when test="${beginPage!=1}">href="honeymoon.do?pageNo=${beginPage-1}"</c:when>
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
							     href="honeymoon.do?pageNo=${i}"
							     </c:otherwise>
							      </c:choose>>
		
										${i}</a></li>
							</c:forEach>
		
							<li><a
								<c:choose>
							      	<c:when test="${endPage != lastPage}"> href="honeymoon.do?pageNo=${endPage+1}" </c:when>
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

//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}







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

// 역경매 리스트 디테일
function honeyDetail(auctionNo){
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
	})
   

}




function tenderWrite(auctionNo){
	console.log("tenderWrite...auctionNo ======= " + auctionNo);
	$.ajax({
		url: "<c:url value='/service/honeymoon/TenderwriteForm.do'/>",
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
		  honeyDetail($(this).data("href"))
	      $('#TravelBoxModal').modal('show')
	    
	  });
	      $(".insertBox").click(function(e){
			  e.preventDefault();
			  console.log("입찰하기 클릭" + $(this).data("href"));
			  tenderWrite($(this).data("href"));
		      comInfoWrite($(".mem > #memNo").val());
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
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


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
	            <input type="hidden" id="memNo" value="${user.no}"/>
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
				<form action="Tenderwrite.do"  method="post" enctype="multipart/form-data">
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