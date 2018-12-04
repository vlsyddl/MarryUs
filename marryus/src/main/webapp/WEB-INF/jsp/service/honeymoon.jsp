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
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/wedding.css"/>">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
<style>
	


</style>
</head>
<body>
     <header>
        <div class="container">
            <div class="row">
                <div class="logo col-md-3">
                    <a href="<c:url value="/main/main.do"/>"><img src="<c:url value="/resources/img/logo.png"/>" alt="" class="img-responsive center-block"></a>
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
                            <li ><a href="<c:url value="/service/weddingHall.do"/>">웨딩홀</a></li>
                            <li><a href="#" class='mm-item'>스&middot;드&middot;메</a></li>
                            <li class="on"><a href="#">허니문</a></li>
                            <li><a href="#">예물</a></li>
                            <li><a href="#">추가서비스</a></li>
                        </ul>
                    </div> 
                </nav>
            </div>
        </div>
        <span class="gnbBar"></span>
    </header>
    <div id="wrap" class="wedding">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>허니문</h2>
                <p>
                    하와이 &middot; 괌 &middot; 한라산
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
		                      <ul class="card-list">
			                    <li class="card">
			                        <a href="#" class="card-image"   data-toggle="modal"  data-target=".bs-example-modal-lg"  ><img src="/marryus/img/comProfile/사진"  /></a>
			                        <a>업체이름</a>
			                        <a class="card-description" >
			                            <h2>업체주소</h2>
			                            <p>업체주소</p>
			                        </a>
			                        <ul>
			                            <li>
			                                <i class="glyphicon glyphicon-user">인원 50~100</i>
			                            </li>
			                            <li>
			                                <span >별점</span>
			                                <span class="glyphicon glyphicon-star"></span>
			                                <span class="glyphicon glyphicon-star"></span>
			                                <span class="glyphicon glyphicon-star"></span>
			                                <span class="glyphicon glyphicon-star"></span>
			                            </li>
			                      
			                        </ul>
			                        <div class="btn-group" role="group">
			                            <button type="button" class="btn btn-default">관심업체 등록</button>
			                        </div>
			                    </li>
		                  
		                  <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-lg">
							    <div class="modal-content">
							      <div class="comName">
							      		<h1>업체이름:</h1>
							      </div>
							      <section class="portfolio-slideshow-wrapper">
									    <ul class="carousel">
									        <li class="items main-pos" data-id="1"><p>업체이미지</p></li>
									        <li class="items right-pos" data-id="2"><p>2</p></li>
									        <li class="items back-pos" data-id="3"><p>3</p></li>
									        <li class="items back-pos" data-id="4"><p>4</p></li>
									        <li class="items back-pos" data-id="5"><p>5</p></li>
									        <li class="items left-pos" data-id="6"><p>6</p></li>
									    </ul>
									    <span>
									        <input type="button" value="Prev" class="prev">
									        <input type="button" value="Next" class="next">
									    </span>
									</section>
									
									<div class="comIntro">
										<a>업체 소개:</a>
									</div>
								
							    </div>
							  </div>
						</div>
		    
		                  <nav>
		                    	<div class="text-center">
		                    	<ul class="pagination">
								<li><a
								<c:choose>
							      <c:when test="${beginPage!=1}">href="weddingHall.do?pageNo=${beginPage-1}"</c:when>
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
							     href="weddingHall.do?pageNo=${i}"
							     </c:otherwise>
							      </c:choose>>
		
										${i}</a></li>
							</c:forEach>
		
							<li><a
								<c:choose>
							      	<c:when test="${endPage != lastPage}"> href="weddingHall.do?pageNo=${endPage+1}" </c:when>
							    	<c:otherwise>href="#"</c:otherwise>
						    	</c:choose>
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
							</ul>
						 </nav>
		                    
		                 
		                </ul>
                  		</div>
                        </div>
                        <div class="tab2">
                        <!-- Button trigger modal -->
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
						  역경매 신청하기
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">웨딩홀 역경매 신청서</h4>
						      </div>
						      <form action="write.do"  method="post" enctype="multipart/form-data">
							      <div class="modal-body">
								        <h2 class="hopeVenue">희망예식장소</h2>
								        <input type="hidden" name="memNo" value="${user.no}" />
								        <input type="hidden" name="auctionType" value="v" />
								        <br>
											<select name="weddingVenue" id="sido1"></select>
											<select name="weddingVenue" id="gugun1"></select>
											<br>
	
										  <div class="input" >
		                                  	희망예식날짜 & 시간 <p>Date: <input type="text" name="weddingDate" id="date_pretty"/></p>
		                                  </div>
		                                  
		                                <div class="btn-group" data-toggle="buttons" name="weddingTime">
											  <label class="btn btn-primary active" >
											    <input name="weddingTime" type="checkbox" value="1" /> 12시 이전 가능
											  </label>
											  <label  class="btn btn-primary">
											    <input name="weddingTime" type="checkbox" value="2" />12시 ~ 2시
											  </label>
											  <label  class="btn btn-primary">
											    <input name="weddingTime" type="checkbox" value="3" /> 2시 이후 시간대 가능
											  </label>
										</div><br>
									  	
											예식타입:<select class="selectBox1" name="weddingType" id="weddingType">
					                                    <option value="1">일반예식</option>
					                                    <option value="2">하우스웨딩</option>
					                                    <option value="3">야외예식</option>
					                                    <option value="4">종교예식</option>
		                            				</select><br>
			                            	하객수:<select class="selectBox2" name="weddingVistor" id="weddingVistor">
				                                    <option value="100">100명</option>
				                                    <option value="150">150명</option>
				                                    <option value="200">200명</option>
				                                    <option value="250">250명 이상</option>
				                            	</select><br>
				                                                              기타의견사항: <textarea name="weddingWish" id="" class="wish" rows="3" cols="30"></textarea><br>
				                                                              희망예산: <input type="text" id="weddingBudget" name="weddingBudget"/>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">신청</button>
							      </div>
	                         </form>
						    </div>
						  </div>
						</div>
                        
                   <table class="table table-hover">
                            <tr>
                                <th>경매번호</th>
                                <th>경매타입</th>
                                <th>경매상태</th>
                                <th>역경매 시작일</th>
                                <th>역경매 종료일</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>허니문</td>
                                <td>진행중</td>
                                <td><fmt:formatDate value="" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value="" pattern="yyyy-MM-dd" /></td>
                            </tr>
                    </table>
                      <nav>
		                    	<div class="text-center">
		                    	<ul class="pagination">
								<li><a
								<c:choose>
							      <c:when test="${beginPage!=1}">href="weddingHall.do?pageNo=${beginPage-1}"</c:when>
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
							     href="weddingHall.do?pageNo=${i}"
							     </c:otherwise>
							      </c:choose>>
		
										${i}</a></li>
							</c:forEach>
		
							<li><a
								<c:choose>
							      	<c:when test="${endPage != lastPage}"> href="weddingHall.do?pageNo=${endPage+1}" </c:when>
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
     <aside id="sideBar">
            <ul>
                <li><a href="<c:url value="/mypage/mywedding.do"/>"><i class="fas fa-user-edit"></i>마이페이지</a></li>
                <li><a href="<c:url value="/community/notice.do"/>"><i class="fas fa-headset"></i></i>공지 게시판</a></li>
                <li><a href="#"><i class="fas fa-chalkboard-teacher"></i>후기 게시판</a></li>
                <li><a href="#"><i class="far fa-kiss-wink-heart"></i>신부대기실</a></li>
                <li><a href="#"><i class="far fa-comments"></i>1 : 1 질문</a></li>
                <li><a href="#"><i class="far fa-question-circle"></i>FAQ</a></li>
            </ul>
        </aside>

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



<!-- 업체상세정보 이미지 -->

//slideshow style interval
var autoSwap = 0; //setInterval(swap, 3500);

//pause slideshow and reinstantiate on mouseout
/*
$('ul, span').hover(
    function(){
        clearInterval(autoSwap);
}, 
    function(){
        autoSwap = setInterval(swap, 3500);
});
*/

//global variables
var items = [];
var startItem = 1;
var position = 0;
var itemCount = $('.portfolio-slideshow-wrapper .carousel li.items').length;
var leftpos = itemCount;
var resetCount = itemCount;

//unused: gather text inside items class
$('li.items').each(function(index) {
    items[index] = $(this).text();
});

// get position of image (for moving to forward)
function portfolio_ss_pos(positionvalue)
{
    if(positionvalue != 'leftposition')
    {
        //increment image list id
        position++;
        
        //if final result is greater than image count, reset position.
        if((startItem+position) > resetCount)
        {
            position = 1-startItem;
        }
    }
    
    //setting the left positioned item
    if(positionvalue == 'leftposition')
    {
        //left positioned image should always be one left than main positioned image.
        position = startItem - 1;
      
        //reset last image in list to left position if first image is in main position
        if(position < 1)
        {
            position = itemCount;
        }
    }
   
    return position;
}  

//swap images function
function portfolio_ss_swap(action, box)
{
    var direction         = action;
    var slideshow_wrapper = box;
  
    //moving carousel backwards
    if(direction == 'counter-clockwise')
    {
        var leftitem = slideshow_wrapper.find('.left-pos').attr('data-id') - 1;
        if(leftitem == 0)
        {
            leftitem = itemCount;
        }
    
        slideshow_wrapper.find('li.right-pos').removeClass('right-pos').addClass('back-pos');
        slideshow_wrapper.find('li.main-pos').removeClass('main-pos').addClass('right-pos');
        slideshow_wrapper.find('li.left-pos').removeClass('left-pos').addClass('main-pos');
        slideshow_wrapper.find('li.items[data-id='+leftitem+']').removeClass('back-pos').addClass('left-pos');
    
        startItem--;
        if(startItem < 1)
        {
            startItem = itemCount;
        }
    }
  
    //moving carousel forward
    if(direction == 'clockwise' || direction == '' || direction == null )
    {
        slideshow_wrapper.find('li.items[data-id='+ startItem +']').removeClass('main-pos').addClass('left-pos');
        slideshow_wrapper.find('li.items[data-id='+ (startItem+portfolio_ss_pos()) +']').removeClass('right-pos').addClass('main-pos');
        slideshow_wrapper.find('li.items[data-id='+ (startItem+portfolio_ss_pos()) +']').removeClass('back-pos').addClass('right-pos');
        slideshow_wrapper.find('li.items[data-id='+ portfolio_ss_pos('leftposition') +']').removeClass('left-pos').addClass('back-pos');

        startItem++;
        position=0;
        if(startItem > itemCount)
        {
            startItem = 1;
        }
    }
}

//next button click function
$('.portfolio-slideshow-wrapper .next').click(function() {
    portfolio_ss_swap('clockwise', $(this).parent().parent());
});

//prev button click function
$('.portfolio-slideshow-wrapper .prev').click(function() {
    portfolio_ss_swap('counter-clockwise', $(this).parent().parent());
});

//if any visible items are clicked
$('.portfolio-slideshow-wrapper li.items').click(function() {
    if($(this).attr('class') == 'items left-pos')
    {
        portfolio_ss_swap('counter-clockwise', $(this).parent().parent()); 
    }
    else if($(this).attr('class') == 'items right-pos')
    {
        portfolio_ss_swap('clockwise', $(this).parent().parent()); 
    }
});





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
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });

	 

	 // 시/도 선택시 구/군 설정

	 $("select[name^=weddingVenue]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 군구 객체
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


  
  detail();
  
  function detail(CompanyInfo){
	  $.ajax({
		  url: "<c:url value='/service/weddingDetail.do' />",
		  data: "comInfoNo=" +CompanyInfo
	  }).done(function(data){
		  console.log("첫번째 data ========= "+data);
		  
	  })
  }
  
  
  
  
  
  
  </script>
</body>
</html>