<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <link rel="stylesheet" href="<c:url value='/resources/todo/dist/lobilist.min.css?454'/>" />

    <!--Installation using bower. Preferred!!! -->
    <!--<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"/>-->
    <!--<link rel="stylesheet" href="bower_components/jquery-ui/themes/ui-lightness/jquery-ui.min.css"/>-->
    <!--<link rel="stylesheet" href="bower_components/lobilist/dist/lobilist.min.css"/>-->
    <link rel="stylesheet" href="<c:url value='/resources/todo/lobibox/css/lobibox.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/highlight/github.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/demo/demo.css?34'/>" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/printThis/1.14.0/printThis.js"></script>
    <style>
    	a {
		    text-decoration: none;
		    color: #333;
		}
.mypage .info_left{
    height: 200px;
    background: url(../resources/img/mypage_image.png)no-repeat center center/cover;
}


.mypage .info_left .time{
    text-align: right;
    position: absolute;
    bottom: -10px;
    right: 120px;
}

.mypage .info_right{
    padding: 0px 50px;
    height: 200px;
}
.infoBox{
	margin: 30px 0px;
	border: 1px solid #efeeee;
}
button{
 margin : 10px 10px 0px 10px;
 padding : 10px;
 text-align: right;
}
.progress-bar {
background-color: #ffbfce;
}
#lobilist-examples .btnBox{
	margin-top: 15px;
}
#lobilist-examples .btnBox:after{
	display: block;
	clear: both;
	content: '';
}
#lobilist-examples .btnBox a{
    display: block;
    float: left;
    width: 180px;
    padding: 10px 0;
    background: #ffc7c7;
    text-align: center;
    font-size: 1.2em;
    border: 1px solid #d9d9d9;
    letter-spacing: 5px;
    transition: all 0.5s;
}
#lobilist-examples .btnBox a:hover{
	background: #fff;
	color: #333;
    text-decoration: none;
}
#lobilist-examples .btnBox a.downLoadBtn{
	border-radius: 10px 0 0 10px;
}
#lobilist-examples .btnBox a.printBtn{
	border-radius: 0 10px 10px 0;
}

    </style>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="mypage">
<nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li >
                            <a href="<c:url value='/mypage/mywedding.do'/>">
                                    <img src="<c:url value="/resources/"/>img/hall_ico.png" alt="" class="img-responsive center-block">
                                나의 웨딩
                            </a>
                        </li>
                        <li class="on">
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


   <input type="hidden" id="no" value="${user.no}">




<div class="container">
    <div id="lobilist">
        <!--Examples-->
        <div id="lobilist-examples">
	                        <form id="downForm" action="downExcel.do">
	        				 <input type="hidden" id="memNo" name="memNo" value="${user.no}">
	                        </form>
	                        <div class="btnBox">	                        	
		                        <a href="#" class="downLoadBtn">DownLoad</a>
		                        <a href="#" class="printBtn">Print</a>
	                        </div>
               <div class="infoBox cf">
                    <div class="col-md-6 no-padding info_left">
                        <div class="time cf">
                            <dl class="day">
                                <dt>Days</dt>
                                <dd>0</dd>
                            </dl>
                            <dl class="hours">
                                <dt>Hours</dt>
                                <dd>0</dd>
                            </dl>
                            <dl class="min">
                                <dt>Min</dt>
                                <dd>0</dd>
                            </dl>
                            <dl class="sec">
                                <dt>Sec</dt>
                                <dd>0</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="col-md-6 no-padding info_right">
                        <div class="progressBar">
                            <p style=" font-size: 23px; font-style: italic; font-family:맑은고딕; font-weight: 700;">TODO 진행도</p>
                            <fmt:parseNumber var="t" value="${todoDone/todoTotal*100}" integerOnly="true" />
                            <div class="progress" style="height: 20px;">
  								<div class="progress-bar" role="progressbar" style="width: ${t}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
                            <p style=" font-size: 22px; text-align: right; ">${todoDone} out of ${todoTotal}</p>
                            <p style=" font-size: 17px; font-style: italic; font-family:맑은고딕; text-align: right; font-weight: 900;"><span style=" font-size: 45px;font-weight: 900; ">${t}</span>%</p>
                        </div>
                    </div>
                </div>
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
		<script type="text/javascript" src="<c:url value="/resources/todo/dist/lobilist.js?44df"/>" charset="utf-8"></script>


	 
	 

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
	
        $(function(){
        $(document).ready(function(){
          	var memNo  = $("#memNo").val() 
          	  $.ajax({
                    url:"/marryus/mypage/MyproFileWeddingDate.json",
                    data:{memNo:memNo },
                    type:"post"
                 })
                 .done(function(result){
                    var wd = moment(result.wedDate).format('YYYY-MM-DD');
                    $.fn.CountDownTimer(wd); 
                 });
                
          });
        });
		
		$(".printBtn").on("click", function(){
			$('#lobilist-examples').printThis({
				
			});
		});

 $(".downLoadBtn").click(function(e){
	 e.preventDefault();
	 $("#downForm").submit();
 })
 
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