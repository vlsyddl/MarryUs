<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>

    <!--Default installation-->
    <link rel="stylesheet" href="<c:url value='/resources/todo/jquery/jquery-ui.min.css?349'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/bootstrap/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/dist/lobilist.min.css'/>" />

    <!--Installation using bower. Preferred!!! -->
    <!--<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"/>-->
    <!--<link rel="stylesheet" href="bower_components/jquery-ui/themes/ui-lightness/jquery-ui.min.css"/>-->
    <!--<link rel="stylesheet" href="bower_components/lobilist/dist/lobilist.min.css"/>-->
    <link rel="stylesheet" href="<c:url value='/resources/todo/lobibox/css/lobibox.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/highlight/github.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/demo/demo.css'/>" />
   
    
   
</head>
<body>
<header>
	<div class="container">
		<div class="row">
			<div class="logo col-md-3">
				<a href="<c:url value="/main/main.do"/>"><img
					src="<c:url value="/resources/img/logo.png"/>" alt=""
					class="img-responsive center-block"></a>
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
					<li><a href="<c:url value="/service/weddingHall.do"/>">웨딩홀</a></li>
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







<div class="container">
    <div id="lobilist">
        <!--Examples-->
        <div id="lobilist-examples">
            <h1></h1>
            <!--Basic example-->
            <div>
                <div class="bs-example">
                    <div id="todo-lists-basic-demo"></div>
                </div>
            </div>
        </div>
    </div>
</div>

	


<!--Default installation-->

		<script type="text/javascript" src="<c:url value="/resources/todo/jquery/jquery.min.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/jquery/jquery-ui.min.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/jquery/jquery.ui.touch-punch-improved.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/bootstrap/js/bootstrap.min.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/dist/lobilist.js?553"/>" charset="utf-8"></script>


	 
	 
	 
<%-- <script src="<c:url value='/resources/todo/jquery/jquery.min.js'/>"></script>
<script src="/resources/todo/jquery/jquery-ui.min.js"></script>
<script src="/resources/todo/jquery/jquery.ui.touch-punch-improved.js"></script>
<script src="/resources/todo/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/todo/dist/lobilist.js"></script> --%>
 
<!--Installation using bower. Preferred!!! -->
<!--<script src="bower_components/jquery/dist/jquery.min.js"></script>-->
<!--<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>-->
<!--<script src="bower_components/jquery-ui-touch-punch-improved/jquery.ui.touch-punch-improved.js"></script>-->
<!--<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>-->
<!--<script src="bower_components/lobilist/dist/lobilist.min.js"></script>-->

	<script type="text/javascript" src="<c:url value="/resources/todo/lobibox/js/lobibox.min.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/highlight/highlight.pack.js"/>" charset="utf-8"></script>
	<%-- 	<script type="text/javascript" src="<c:url value="/resources/todo/demo/demo.js"/>" charset="utf-8"></script> --%>
	
	<script>
	/**
 * Created by Zura on 4/5/2016.
 */
 
 
 
 
 
$(function () {
    Lobibox.notify.DEFAULTS = $.extend({}, Lobibox.notify.DEFAULTS, {
        size: 'mini',
        // delay: false,
        position: 'right top'
    });
    

	    $('#todo-lists-basic-demo').lobiList({
	        "lists": ${todo}
	    });  

});



	
</script>
	
	
</body>
</html>