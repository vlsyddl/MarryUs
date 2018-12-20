<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="<c:url value="/resources/js/notify.js"/>"></script>
<!-- <div class="chatAdmin">

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
    
</div> -->
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
	    		if(user.indexOf(userName) == -1){
	    			user.push(userName)				
					createChatBox(evt);
	    		}
	    		$.notify.addStyle('foo', {
				   	  html: 
				   	    "<div>" +
				   	      "<div class='clearfix'>" +
				   	        "<div class='name' data-notify-html='title' data-href='"+userName+"'/>" +
				   	        "<div class='content' data-notify-html='content' data-href='"+userName+"'/>" +
				   	      "</div>" +
				   	    "</div>"
				   	});
					
					$.notify({
			    		title : data.split(":")[0],
			    		content : data.split(":")[1],
			    	}, {
			    		style:"foo",
			    		autoHide: false,
			    		className: ['success'],
			    	});		
	    	}else{
				user.push(userName)
				
				$.notify.addStyle('foo', {
			   	  html: 
			   	    "<div>" +
			   	      "<div class='clearfix'>" +
			   		 	 "<div class='name' data-notify-html='title' data-href='"+userName+"'/>" +
		   	       		 "<div class='content' data-notify-html='content' data-href='"+userName+"'/>" +
			   	      "</div>" +
			   	    "</div>"
			   	});
				
				$.notify({
					title : data.split(":")[0],
		    		content : data.split(":")[1],
		    	}, {
		    		style:"foo",
		    		autoHide: false,
		    		className: ['success'],
		    	});
				createChatBox(evt);
	    	}
	    	
	    	console.log(user)
	    	$('.chatAdmin[data-href="'+userName+'"] .textBox').append('<div class="chatCustomer"><dl><dt><img src="/marryus/resources/img/chat_cut.png" alt="" class="img-responsive center-block"></dt><dd>'+data.split(":")[1]+'</dd></dl></div>')
	    	$('.chatAdmin[data-href="'+userName+'"] .textBox').animate({scrollTop: textBox.prop("scrollHeight")}, 500);
	    };
	    
	    function createChatBox(evt){
	    	var data = evt.data
	    	var userName = data.split(":")[0]
	    	var html = '<div class="chatAdmin" data-href="'+userName+'">'+
	    					'<div class="btnClosed" onclick="closeChat(\''+userName+'\')">'+
	    						'<a href="#"><i class="fas fa-times"></i></a>'+
	    					'</div>'+
	    					'<div class="textWrap">'+
	 							'<div class="textBox">'+
	 							'</div>'+
	 						'</div>'+
	 						'<div class="inputBox inputWebSocket" >'+
		 						'<textarea name="webSocketInput" style="resize: none;"  cols="30"  class="form-control webSocketInput"></textarea>'+
		 						'<button class="send webSocketSend" onclick="sendAdmin(\''+userName+'\')">보내기</button>'+
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
	$(document).on('click', '.notifyjs-foo-base .name', function() {
	  //programmatically trigger propogating hide event
	  console.log("!!!!")
	  var target = $(this).data("href")
	  console.log(target)
	  $('.chatAdmin').animate({"right":"-100%"},300) 
	  $('.chatAdmin[data-href="'+target+'"]').animate({"right":"100px"},300) 
	});
	
	function closeChat(target){
	    setTimeout(function(){
	   	 $('.chatAdmin[data-href="'+target+'"]').animate({"right":"-100%"},300) 	
	     $("#chatBot").removeClass("on")
	    },1500)
		
	}

  
 function sendAdmin(userName){
	 var $msg = $('.chatAdmin[data-href="'+userName+'"] .webSocketInput') 
	 var textBox = $('.chatAdmin[data-href="'+userName+'"] .textBox');
	 if( $msg.val() != "") {
	        message={};
	        message.message = $msg.val();
	        message.type = "message";
	        message.to = userName;
	        message.from = "admin";
	        ws.send(JSON.stringify(message));
	        textBox.append('<div class="chatAdm"><dl><dt><img src="/marryus/resources/img/chat_cut.png" alt="" class="img-responsive center-block"></dt><dd>'+$msg.val()+'</dd></dl></div>')
	        textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
	        $msg.val("");
	    }      
    }
 
 
 
</script>