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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <c:import url="/common/importCss.jsp"/>
	<c:import url="/common/importJs.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/wedding.css"/>">
<style>
	.btn-recom ,.btn-recom:focus,.btn-recom:active{
		background-color: rgb(232, 210, 34);
		color: #fff;
	}
</style>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="wedding">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>예물</h2>
                <p>
                    다이아 &middot; 금 &middot; 보석
                </p>
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="contentsTab">
                    <ul>
                        <li data-target="tab1" class="on"><a href="/service/jewelry/companyList.do">업체리스트</a></li>
                        <li data-target="tab2"><a href="<c:url value='/service/jewelry/auctionList.do'/>">경매리스트</a></li>
                    </ul>
                    <div class="tabContents">
                        <div class="tab1 on">
						   	<div class="map_wrap">
						        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						    
						    </div>
                    	<div>
                    	<div class="row itemWrap">
                        <c:forEach var="j" items="${jewelryCompanyList}">
                                <div class="col-md-4 itemBox" data-comNo="${j.comInfoNo}" data-no="${j.memNo}" >
                                    <div class="item">
                                        <div class="imgBox">
                                            <a href="#"><img src="/marryus/img/comProfile/${j.comFileName}" alt="" class="img-responsive center-block" onError="javascript:this.src='<c:url value="/resources/img/sorry.png"/>'"></a>
                                        </div>
                                        <div class="textBox">
                                            <h5><a href="#">${j.comInfoName}</a></h5>
                                            <p>
                                                ${j.comInfoAddr} <br/>
                                                ${j.comInfoAddrDetail}
                                            </p>
                                        </div>
                                    </div>
                                    </div>
                            </c:forEach>
                           
                        </div>
                         <nav>
		                    	<div class="text-center">
		                    	<ul class="pagination">
								<li><a
								<c:choose>
							      <c:when test="${beginPage!=1}">href="companyList.do?pageNo=${beginPage-1}"</c:when>
							      <c:otherwise>href="#"</c:otherwise>
							    </c:choose>
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<c:forEach var="i" begin="${beginPage}" end="${endPage}">
									<li><a
									<c:choose>
							   		<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/search.do"}'>
							    	href="<c:url value='search.do?pageNo=${i-1}&type=${result.type}&content=${result.content}' />"
							    </c:when>
								
							    <c:otherwise>
							     href="companyList.do?pageNo=${i}"
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
							</div>
						 </nav>
		                    
                          <div class="searchWrap">
                          	 <form action="weddingsearch.do" id="searchForm">
	                                <select class="form-control" name="type" id="searchType">
	                                    <option value="1">홀 이름</option>
	                                    <option value="2">홀지역</option>
	                                </select>
	                                <input type="text" class="form-control" name="content" id="searchContent" placeholder="Search for...">
	                                <span class="input-group-btn">
	                                  <button class="btn btn-default" type="button" id="searchBtn"><i class="fas fa-search"></i></button>
	                                </span>
                               </form>
                          </div>
                  		</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <c:import url="/common/importSideBar.jsp" />
    <c:import url="/common/importFooter.jsp" />
<script>

var comLikeCnt;
var userNo = "${user.no}";





$("#searchBtn").click(function () {
	 if ($("#searchContent").val() == "") {
		 alert("검색어를 입력해주세요.");
		 return false;
	 }
	 var serialize = $("#searchForm").serialize() 
	 console.log("시리얼라이지====" + serialize)
	 $.ajax({
		url : "<c:url value='/service/jewelry/jewelrysearch.do' />",
		method : "POST",
		data : $("#searchForm").serialize(),
		cache : false
	 }).done (function (data) {
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
		 console.log(data)
		 var html = "";
		for(var w of data){
			html+= '<div class="col-md-4 itemBox" data-href="'+w.comInfoNo+'">'
        	html+='<div class="item">'
           html+='<div class="imgBox">'
           html+= '<a href="#"><img src="/marryus/img/comProfile/'+w.comFileName+'" alt="" class="img-responsive center-block" onError="javascript:this.src=\'/marryus/resources/img/sorry.png\'"/></a>'
           html+='</div>'
           html+='<div class="textBox">'
           html+='<h5><a href="#">'+w.comInfoName+'</a></h5>'
           html+='<p>'
           html+=' '+w.comInfoAddr+' <br/>'
           html+='  '+w.comInfoAddrDetail+' '
           html+='</p>'
           html+='</div>'
           html+='<div class="infoBox">'
           html+='<ul>'
           html+='</ul>'
           html+='</div>'
        	html+='</div>'
        	html+='</div>'
        		
		}
		$(".itemWrap").html(html);
		
	 });
});











var options = {
        'speed' : 500,				 		//스피드
        'initTop' : 300, 					//기본top위치
        'alwaysTop' : false,				// true
        'default_x' : false 				//레이어가 붙는 아이디 
    }
    $('#sideBar').Floater(options);

var array = new Array();

<c:forEach var="c" items="${weddinigList}" varStatus="status">
	array["${status.index}"] = "${c.comInfoAddr}"
</c:forEach>

console.log(array)




var mapContainer = document.getElementById('map');
var mapOption = {
		center: new daum.maps.LatLng(37.56667, 126.97806),
	    level: 9
};  


var array = new Array();

<c:forEach var="j" items="${jewelryCompanyList}" varStatus="status">
	array["${status.index}"] = "${j.comInfoAddr}" + "${j.comInfoName}"
</c:forEach>

console.log(array)



var map = new daum.maps.Map(mapContainer, mapOption); 
var geocoder = new daum.maps.services.Geocoder();
var listData = array
listData.forEach(function(addr, index) {
    geocoder.addressSearch(addr, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

            var marker = new daum.maps.Marker({
                map: map,
                position: coords
            });
            var infowindow = new daum.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listData[index] + '</div>',
                disableAutoPan: true
            });
            infowindow.open(map, marker);
        } 
    });
});
	

  $(document).ready(function(){
	  
	});

//디테일 모달
function detail(comInfoNo){
	var modal = $("#detailModal")
	var slideBox = $(".slideBox")
	slideBox.find("ul").html("")
	$.ajax({
		url : "<c:url value='/service/jewelry/companyDetail.json'/>",
		data : "comInfoNo="+comInfoNo
	}).done(function(data){
		modal.find(".modal-title").html(data.info.comInfoName)
		var html = "";
		html += '<dl class="adress">'
		html += '<dt>주소 : </dt>'
		html += '<dd>'+data.info.comInfoAddr + data.info.comInfoAddrDetail+'</dd>'
		html += '</dl>'
		html += '<dl class="phone">'
		html += '<dt>번호 : </dt>'
		html += '<dd>'+data.info.comInfoPhone+'</dd>'
		html += '</dl>'
		html += '<dl class="Profile">'
		html += '<dl class="contentsBox">'
		html += '<dt>업체소개 : </dt>'
		html += '<dd>'+data.info.comInfoContent+'</dd>'
		html += '</dl>'
		
        $(".detailInfoBox").html(html);
		$(".detailLikeBtn").attr("data-comno", data.info.comInfoNo);
		
        var fileList="";
        for(var f of data.files){
			fileList +='<li>'        	
			fileList +='<img src="/marryus/img/comProfile/'+f.comFileName+'" alt="" class="img-responsive center-block">'        	
			fileList +='</li>'        	
        }
        slideBox.find("ul").html(fileList)
	})
};

function comLikeCheck(comNo) {
	console.log(comNo);
	
	$.ajax({
		url : "<c:url value='/service/jewelry/comLikeCheck.json' />",
		data : {
			"memNo" : userNo,
			"comInfoNo" : comNo
		},
		cache : false
	}).done(function (result) {
		console.log("result +++ " + result);
		console.log("userNo" + userNo);
		if (result == 0) {
            $(".detailLikeBtn").html('<i class="far fa-star"></i> 관심업체 등록');
            $(".detailLikeBtn").attr("class", "btn btn-default detailLikeBtn");
		} else {
            $(".detailLikeBtn").html('<i class="far fa-star"></i> 관심업체 해제');
            $(".detailLikeBtn").attr("class", "btn btn-recom detailLikeBtn");
		}
		comLikeCnt = result;
	});
	
};

function detailBtn() {
	var html = "";
	html += '<button type="button" class="btn btn-default detailLikeBtn"><i class="far fa-star"></i> 관심업체 등록</button>';
	html += '<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>';
	$(".modal-footer").html(html);

	 $(".detailLikeBtn").click(function(){
		  likeBtn($(this).data("comno")); 
	  })
};

$(function(){
	$(".itemBox").click(function(e){
		  e.preventDefault();
		  detail($(this).data("comno"));
		  comLikeCheck($(this).data("comno"));
		  detailBtn($(this).data("comno"));
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
	 
});

function likeBtn(comNo) {
	var likeUrl = "comLike";
	
	if (comLikeCnt == 1) {
		likeUrl = "comLikeCancel";
	}
	$.ajax({
		url : "/marryus/service/jewelry/"+ likeUrl + ".json",
		data : {
			"comInfoNo" : comNo,
			"memNo" : userNo
		},
		cache : false
	}).done(function (result) {
		console.log("btn" + result);
		if (comLikeCnt == 0) {
			alert("관심업체로 등록하셨습니다..");
			comLikeCnt = 1;
            $(".detailLikeBtn").html('<i class="far fa-star"></i> 관심업체 해제');
            $(".detailLikeBtn").attr("class", "btn btn-recom detailLikeBtn");
		} else {
			alert("관심업체 등록을 취소하셨습니다.");
			comLikeCnt = 0;
            $(".detailLikeBtn").html('<i class="far fa-star"></i> 관심업체 등록');
            $(".detailLikeBtn").attr("class", "btn btn-default detailLikeBtn");
		}
	});
};


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
        <div class="detailInfoBox">
            <dl class="adress">
                <dt>주소 : </dt>
                <dd></dd>
            </dl>
        </div>
        <div class="contentsBox">
        </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
</body>
</html>