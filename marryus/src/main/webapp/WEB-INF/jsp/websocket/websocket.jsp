<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹소켓 연습하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<div id="loginBox">
	<input type="text" id="id" name="id" />
	<input type="password" id="pass" name="pass" />
	<button id="loginBtn">로그인</button>
</div>
<div id="logoutBox">
	<span></span>님 접속중입니다.
	<button id="logoutBtn">로그아웃</button>
</div>
<div id="msgBox">
	<input type="text" id="message" name="message" />
	<button id="sendBtn">메세지 보내기</button>
</div>

<div id="result"></div>

<script type="text/javascript">

var ws = null;
var loginId = null;

$(function () {
	
    ws = new WebSocket('ws://localhost:8000/marryus/websocket.do');
	ws.onopen = function() {
   	    console.log('웹소켓 서버 접속 성공');
    };
    // 메세지 받기
    ws.onmessage = function(evt) {
        $("#result").prepend(evt.data + "<br>");
    };
    ws.onerror = function(evt) {
   	    $("#result").prepend('웹소켓 에러 발생 : ' + evt.data)
    };
    ws.onclose = function() {
   	    $("#result").prepend("웹소켓 연결이 종료됨.");
    };
    
    $("#msgBox, #logoutBox").hide();
    
});

$('#loginBtn').click(function() { 
	$.ajax({
		url: "<c:url value='/websocket/login.do' />",
		type: "POST",
		data: {
			id: $("#id").val(),
			pass: $("#pass").val()
		}
	})
	.done(function (result) {
		
		loginId = $("#id").val();
		
		$("#logoutBox > span").text(loginId);
		
		ws.send("login:" + loginId);
		
		$("#id").val("");
		$("#pass").val("");
		
		$("#loginBox, #msgBox, #logoutBox").toggle();
		
	});
});


$('#sendBtn').click(function() { 
    var $msg = $("#message");
    // 보낼 수 있는 데이터는 String, Blob, ArrayBuffer 입니다. 
    // 웹소켓 서버에 데이터 전송하기
    ws.send(loginId + ":" + $msg.val());
    $msg.val(""); 
});

$('#logoutBtn').click(function() { 
	$.ajax({
		url: "<c:url value='/websocket/logout.do' />"
	})
	.done(function (result) {
		
		ws.send("logout:" + loginId);
		
		$("#loginBox, #msgBox, #logoutBox").toggle();
		
		loginId = null;
		
		$("#result").html("");
	});
});

</script>

</body>
</html>



