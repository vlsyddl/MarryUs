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

<input type="text" id="message" name="message" />
<button id="sendBtn">메세지 보내기</button>

<div></div>

<script type="text/javascript">

var ws = null;
$(function () {
    ws = new WebSocket('ws://localhost:8000/marryus/websocket.do');
	ws.onopen = function() {
   	    console.log('웹소켓 서버 접속 성공');
   	 	ws.send("user:TestUser2")
    };
    // 메세지 받기
    ws.onmessage = function(evt) {
        $("div").prepend(evt.data + "<br>");
    };
    ws.onerror = function(evt) {
   	    $("div").prepend('웹소켓 에러 발생 : ' + evt.data)
    };
    ws.onclose = function() {
   	    $("div").prepend("웹소켓 연결이 종료됨.");
    };
    
});

$('#sendBtn').click(function() { 
    var $msg = $("#message");
    // 보낼 수 있는 데이터는 String, Blob, ArrayBuffer 입니다. 
    // 웹소켓 서버에 데이터 전송하기
    ws.send("user-admin:" + $msg.val());
    $msg.val(""); 
});
</script>

</body>
</html>



