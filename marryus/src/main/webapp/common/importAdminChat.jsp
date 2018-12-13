<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="<c:url value="/resources/js/notify.js"/>"></script>
<div class="chatAdmin">

<div class="btnClosed">
	<a href="#"><i class="fas fa-times"></i></a>
</div>
<div class="textWrap">
	<div class="textBox">
		
	</div>
</div>
       
    <div class="inputBox inputWebSocket" >
        <textarea name="webSocketInput" style="resize: none;" id="webSocketInput" cols="30"  class="form-control"></textarea>
        <button class="send" id="webSocketSend">보내기</button>
    </div>
    
</div>
<style>
	.notifyjs-foo-base {
  opacity: 0.85;
  width: 200px;
  background: #F5F5F5;
  padding: 5px;
  border-radius: 10px;
}

.notifyjs-foo-base .title {
  width: 100%;
}


</style>
<script type="text/javascript">


	var ws = null;
    var loginId = null;
    var textBox = $("#chatAdmin .textWrap .textBox");
    var inputBox = $("#webSocketInput");
    var adminBox = '<div class="chatAdmin"><dl><dt><img src="/marryus/resources/img/chat_adm.png" alt="" class="img-responsive center-block"></dt><dd></dd></dl></div>';
   	var btnBox = $("#chatBot .textWrap .textBox .btnBox")
   	var user = new Array();
   	var admin = "${admin}"
  
   		
$(function () {	
	if(admin != "" ){   			
	    ws = new WebSocket('ws://192.168.0.88:8000/marryus/websocket.do');
		
	    ws.onopen = function() {
	   	    console.log('웹소켓 서버 접속 성공');
	    };
	    
	}
	    // 메세지 받기
	    ws.onmessage = function(evt) {
	    	
	    	console.log(evt)
	    	
	    	var data = evt.data
	    	var userName = data.split(":")[0]
	    	console.log(userName)
	    	console.log(user.length)
	    	
	    	if(user.length != 0){
				for(var i = 0; i<user.length; i++){
					if(user[i] != userName){
						user.push(userName)
						
						$.notify.addStyle('foo', {
					   	  html: 
					   	    "<div>" +
					   	      "<div class='clearfix'>" +
					   	        "<div class='name' data-notify-html='title' data-href='"+userName+"'/>" +
					   	      "</div>" +
					   	    "</div>"
					   	});
						
						$.notify({
				    		title : data
				    	}, {
				    		style:"foo",
				    		autoHide: false,
				    		className: ['success'],
				    	});
						
					}
					createChatBox(evt);
				}
	    	}else{
				user.push(userName)
				
				$.notify.addStyle('foo', {
			   	  html: 
			   	    "<div>" +
			   	      "<div class='clearfix'>" +
			   	        "<div class='name' data-notify-html='title' data-href='"+userName+"'/>" +
			   	      "</div>" +
			   	    "</div>"
			   	});
				
				$.notify({
		    		title : data
		    	}, {
		    		style:"foo",
		    		autoHide: false,
		    		className: ['success'],
		    	});
				createChatBox(evt);
	    	}
	    	
	    	console.log(user)
	    	$('.chatAdmin[data-href="'+userName+'"] .textBox').append('<div class="chatCustomer"><dl><dt><img src="/marryus/resources/img/chat_cut.png" alt="" class="img-responsive center-block"></dt><dd>'+evt.data+'</dd></dl></div>')
	    	textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
	    };
	    
	    function createChatBox(evt){
	    	var data = evt.data
	    	var userName = data.split(":")[0]
	    	var html = '<div class="chatAdmin" data-href="'+userName+'">'+
	    					'<div class="btnClosed">'+
	    						'<a href="#"><i class="fas fa-times"></i></a>'+
	    					'</div>'+
	    					'<div class="textWrap">'+
	 							'<div class="textBox">'+
	 							'</div>'+
	 						'</div>'+
	 						'<div class="inputBox inputWebSocket" >'+
		 						'<textarea name="webSocketInput" style="resize: none;"  cols="30"  class="form-control webSocketInput"></textarea>'+
		 						'<button class="send webSocketSend" onclick="+sendAdmin('+userName+')">보내기</button>'+
	 						'</div>'+
 						'</div>';
 			$("body").append(html);
	    }
	  
	    
	    ws.onerror = function(evt) {
	    	console.log(evt)
	    	//textBox.append('<div class="chatAdmin"><dl><dt><img src="/marryus/resources/img/chat_adm.png" alt="" class="img-responsive center-block"></dt><dd>웹소켓 에러 발생 : ' + evt.data+'</dd></dl></div>')
	    	textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
	    };
	    ws.onclose = function(evt) {
	    	console.log(evt)
	    	//textBox.append('<div class="chatAdmin"><dl><dt><img src="/marryus/resources/img/chat_adm.png" alt="" class="img-responsive center-block"></dt><dd>웹소켓 연결이 종료됨.</dd></dl></div>')
	    	textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
	    };
	    
	});
	$(document).on('click', '.notifyjs-foo-base .no', function() {
	  //programmatically trigger propogating hide event
	  console.log("!!!!")
	});
	$("#webSocketSend").click(function(){
		sendAdmin();
	})
$(".btnClosed").click(function(e){
    e.preventDefault();
     sendCustom("실시간 상담 을 종료합니다.")
    setTimeout(function(){
     $("#chatBot").removeClass("on")
     textBox.html("");
    },1500)
})
function sendCustomer(){
        var msg = inputBox.val();
         textBox.append('<div class="chatCustomer"><dl><dt><img src="/marryus/resources/img/chat_cut.png" alt="" class="img-responsive center-block"></dt><dd>'+msg+'</dd></dl></div>')
         inputBox.val("");
         textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
         reciveBot(msg)
    }
 function sendAdmin(userName){
	 var msg = inputBox.val();
	 textBox.append('<div class="chatAdmin"><dl><dt><img src="/marryus/resources/img/chat_adm.png" alt="" class="img-responsive center-block"></dt><dd>'+msg+'</dd></dl></div>')
	    ws.send("message/admin-"+userName+"/" +msg);
  		inputBox.val("");
     textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
      
    }
</script>