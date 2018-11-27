<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marry Us</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/wedding.css"/>">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc6291b36d6e91a7fc6b30e92a9171d3"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
                            <li><a href="#">회원가입</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
                            <li><a href="#"><i class="far fa-bell"></i></a></li>
                        </ul>
                    </div>
                    <div class="gnb_bot cf">
                        <ul class="cf">
                            <li class="on"><a href="<c:url value="/service/weddingHall.do"/>">웨딩홀</a></li>
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
                        <li data-target="tab1" class="on"><a href="javascript:void(0);">업체리스트</a></li>
                        <li data-target="tab2"><a href="javascript:void(0);">경매리스트</a></li>
                    </ul>
                    <div class="tabContents">
                        <div class="tab1 on">
                        <div class="serch">
                        	<h3 class="serchText">장소 검색하기</h3>
                        </div>
                        <div class="form_group">
                        	 <input id="address" type="text"  placeholder="ex) 강남구, 아니면 원하시는 웨딩홀을 입력해주세요" />
                             <button  class="btn btn-default" aria-label="Left Align">검색하기</button>
                        </div>
                            <div id="map"></div>
                            <div>
                      <ul class="card-list">
                     
                    <li class="card">
                        <a class="card-image"/>
                        	업체프로필 사진 자리
                        </a>
                        <a class="card-description" >
                            <h2>대홍관</h2>
                            <p>서울 서초구 스튜디오</p>
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
                    
                    <li class="card">
                        <a class="card-image"/>
                        	업체프로필 사진 자리
                        </a>
                        <a class="card-description" >
                            <h2>대홍관</h2>
                            <p>서울 서초구 스튜디오</p>
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
                    
                    <li class="card">
                        <a class="card-image"/>
                        	업체프로필 사진 자리
                        </a>
                        <a class="card-description" >
                            <h2>대홍관</h2>
                            <p>서울 서초구 스튜디오</p>
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
                    
                    <li class="card">
                        <a class="card-image"/>
                        	업체프로필 사진 자리
                        </a>
                        <a class="card-description" >
                            <h2>대홍관</h2>
                            <p>서울 서초구 스튜디오</p>
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
                    
                    <li class="card">
                        <a class="card-image"/>
                        	업체프로필 사진 자리
                        </a>
                        <a class="card-description" >
                            <h2>대홍관</h2>
                            <p>서울 서초구 스튜디오</p>
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
                    
                    <li class="card">
                        <a class="card-image"/>
                        	<img alt="" src="wedding-hall01.jpg">
                        </a>
                        <a class="card-description" >
                            <h2>대홍관</h2>
                            <p>서울 서초구 스튜디오</p>
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
                    
                    
                    
                </ul>
                            </div>
                        </div>
                        <div class="tab2">
                            tab2
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
         <script>
            $(function(){
                new WOW().init();
    
                var options = {
                    'speed' : 500,				 		//스피드
                    'initTop' : 300, 					//기본top위치
                    'alwaysTop' : false,				// true
                    'default_x' : false 				//레이어가 붙는 아이디 
                }
                $('#sideBar').Floater(options);
                
                //날짜 카운트
                $.fn.CountDownTimer('11/22/2019 00:00 AM');  
            });
        </script>

<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
<script>
// This is "probably" IE9 compatible but will need some fallbacks for IE8
// - (event listeners, forEach loop)

// wait for the entire page to finish loading
    window.addEventListener('load', function() {
        // setTimeout to simulate the delay from a real page load
        setTimeout(lazyLoad, 1000); 
    });

function lazyLoad() {
	var card_images = document.querySelectorAll('.card-image');
	
	// loop over each card image
	card_images.forEach(function(card_image) {
		var image_url = card_image.getAttribute('data-image-full');
		var content_image = card_image.querySelector('img');
		
		// change the src of the content image to load the new high res photo
		content_image.src = image_url;
		
		// listen for load event when the new photo is finished loading
		content_image.addEventListener('load', function() {
			// swap out the visible background image with the new fully downloaded photo
			card_image.style.backgroundImage = 'url(' + image_url + ')';
			// add a class to remove the blur filter to smoothly transition the image change
			card_image.className = card_image.className + ' is-loaded';
		});
		
	});
}
</script>

<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('이태원 맛집', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
</body>
</html>