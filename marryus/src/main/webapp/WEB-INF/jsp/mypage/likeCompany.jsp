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

    <link rel="stylesheet" href="<c:url value="/resources/css/wedding.css"/>">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc6291b36d6e91a7fc6b30e92a9171d3"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/wedding.css"/>">
<style>
	

        nav{
           margin: auto;
           
        }

</style>
</head>
<body>
  	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
<nav class="myPageNav">
      <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mypage/mywedding.do'/>">
                                    <img src="<c:url value="/resources/"/>img/hall_ico.png" alt="" class="img-responsive center-block">
                                나의 웨딩
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myTodo.do'/>">
                                    <img src="<c:url value="/resources/"/>img/chk_ico.png" alt="" class="img-responsive center-block">
                                체크리스트
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myBudget.do'/>">
                                <img src="<c:url value="/resources/"/>img/budget_ico.png" alt="" class="img-responsive center-block">
                                예산
                            </a>
                        </li>
                         <li>
                            <a href="<c:url value='/mypage/myAuction.do?choo=tab1&memNo=${user.no}&auctionType=v'/>">
                                <img src="<c:url value="/resources/"/>img/auction_ico.png" alt="" class="img-responsive center-block">
                                역경매 현황
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
                                <img src="<c:url value="/resources/"/>img/bookmark_ico.png" alt="" class="img-responsive center-block">
                                북마크
                            </a>
                        </li>
                    </ul>
            </div>
        </nav>
    

    <div id="wrap" class="wedding">
        <section class="contents contents01">
            <div class="container">
                <div class="contentsTab">
                    <div class="tabContents">
                        <div class="tab1 on">
                    	<div>
                    	<div class="row itemWrap">
                        <c:forEach var="l" items="${like}">
                                <div class="col-md-4 itemBox" data-href="${l.comInfoNo}">
                                    <div class="item">
                                        <div class="imgBox">
                                            <a href="#"><img src="<c:url value="/${l.comFilePath}/${l.comFileName}"/>" alt="" class="img-responsive center-block" onError="javascript:this.src='<c:url value="/resources/img/sorry.png"/>'"></a>
                                        </div>
                                        <div class="textBox">
                                            <h5><a href="#">${l.comInfoName}</a></h5>
                                            <p>
                                            	<%-- ${l.comInfoType} <br/> --%>
                                                ${l.comInfoAddr} <br/>
                                                ${l.comInfoAddrDetail}
                                            </p>
                                        </div>
                                    </div>
                                    </div>
                            </c:forEach>
    

                            </div>
                             <div >      
 	<c:if test="${count != 0}">
			<nav style="text-align: center;">
			  <ul class="pagination">
			    <li <c:if test="${beginPage==1}">class="disabled"</c:if> >
			    <c:choose>
			    	<c:when test="${beginPage!=1}">
			    		<a href="${pageResult.beginPage - 1}" aria-label="Previous">
			    	</c:when>
			    	<c:otherwise><a href="#" aria-label="Previous"></c:otherwise>
			    </c:choose>
			      
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
				<c:forEach var="i" begin="${beginPage}" end="${endPage}">
					<li <c:if test="${i eq pageNo}">class="active"</c:if> >
						<c:choose>
							<c:when test="${i ne pageNo}" >
								<a href="auctionList.do?pageNo=${i}">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="#">${i}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
			    <li <c:if test="${lastPage==endPage}">class="disabled"</c:if> >
			        <c:choose>
				    	<c:when test="${lastPage!=endPage}">
				    		<a href="auctionList.do?pageNo=${pageResult.beginPage + 1}" aria-label="Next">
				    	</c:when>
				    	<c:otherwise><a href="#" aria-label="Next"></c:otherwise>
			    	</c:choose>
			    	<span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</c:if>
             </div>  
                        </div>
                      
                    </div>
                </div>
            </div>
   </div>
   </section>
   </div>
    </div>

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



</body>
</html>