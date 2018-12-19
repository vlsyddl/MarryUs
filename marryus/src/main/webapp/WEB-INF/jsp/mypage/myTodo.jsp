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
    <link rel="stylesheet" href="<c:url value='/resources/todo/jquery/jquery-ui.min.css?344549'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/bootstrap/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/dist/lobilist.min.css'/>" />

    <!--Installation using bower. Preferred!!! -->
    <!--<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"/>-->
    <!--<link rel="stylesheet" href="bower_components/jquery-ui/themes/ui-lightness/jquery-ui.min.css"/>-->
    <!--<link rel="stylesheet" href="bower_components/lobilist/dist/lobilist.min.css"/>-->
    <link rel="stylesheet" href="<c:url value='/resources/todo/lobibox/css/lobibox.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/highlight/github.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/demo/demo.css'/>" />
    <style>
    	a {
		    text-decoration: none;
		    color: #333;
		}
    </style>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
        <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li>
                            <a href="<c:url value='/mypage/mywedding.do'/>">
                                    <img src="<c:url value="/resources/"/>img/hall_ico.png" alt="" class="img-responsive center-block">
                                My Wedding
                            </a>
                        </li>
                        <li class="on">
                            <a href="<c:url value='/mypage/myTodo.do'/>">
                                    <img src="<c:url value="/resources/"/>img/chk_ico.png" alt="" class="img-responsive center-block">
                                Check List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myAuction.do?choo=tab1&memNo=${user.no}&auctionType=v'/>">
                                <img src="<c:url value="/resources/"/>img/auction_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myBudget.do'/>">
                                <img src="<c:url value="/resources/"/>img/budget_ico.png" alt="" class="img-responsive center-block">
                                Budget Spent
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
                                <img src="<c:url value="/resources/"/>img/bookmark_ico.png" alt="" class="img-responsive center-block">
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
</div>
	


<!--Default installation-->

		<script type="text/javascript" src="<c:url value="/resources/todo/jquery/jquery.ui.touch-punch-improved.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/dist/lobilist.js?454"/>" charset="utf-8"></script>


	 
	 

	<script type="text/javascript" src="<c:url value="/resources/todo/lobibox/js/lobibox.min.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/highlight/highlight.pack.js"/>" charset="utf-8"></script>
	

	
	   	<script>
	/**
 * Created by Zura on 4/5/2016.
 */
 
/*  $(document).ready(function(){
	    myTodo();
	});  */
	
	
/* 	$(window).on("load", function(){
		 myTodo();
		}); */
	

 
 
 
$(function () {
    Lobibox.notify.DEFAULTS = $.extend({}, Lobibox.notify.DEFAULTS, {
        size: 'mini',
        // delay: false,
        position: 'right top'
    });
   	
	$('#todo-lists-basic-demo').lobiList({
	    ${todo}
	});

});
		var pathname = window.location.origin;
	


	
</script>
	
	
	
</body>
</html>