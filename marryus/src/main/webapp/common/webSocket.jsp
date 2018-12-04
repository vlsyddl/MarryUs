<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(document).ready(function(){
	var ws = null;
    var loginId = null;
    var textBox = $("#chatBot .textWrap .textBox");
    var inputBox = $("#chatBotInput");
    var adminBox = '<div class="chatAdmin"><dl><dt><img src="/marryus/resources/img/chat_adm.png" alt="" class="img-responsive center-block"></dt><dd></dd></dl></div>';
   	var btnBox = $("#chatBot .textWrap .textBox .btnBox")
   	btnBox.hide();
    $("#chatBot .title").click(function(){
        $("#chatBot").addClass("on")
        setTimeout(function(){
         sendAdmin("안녕하세요 고객님</br>어떤 점이 궁금하신가요?")
        },1000)
    })
    
    $(".btnClosed").click(function(e){
        e.preventDefault();
         sendAdmin("실시간 상담 을 종료합니다.")
        setTimeout(function(){
         $("#chatBot").removeClass("on")
         textBox.html("");
        },1500)
    })
     $("#chatBot").ready(function(){
        $(".inputChatbot .send").click(function(){
            sendCustomer();
        })
        $("#chatBotInput").keydown(function(e) {
             if(e.keyCode==13){
                 sendCustomer();
             }
         });
    })
    /*보내기*/
    function sendCustomer(){
        var msg = inputBox.val();
         textBox.append('<div class="chatCustomer"><dl><dt><img src="/marryus/resources/img/chat_cut.png" alt="" class="img-responsive center-block"></dt><dd>'+msg+'</dd></dl></div>')
         inputBox.val("");
         textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
         reciveBot(msg)
    }
    function sendAdmin(){
        var msg = arguments;
        for(i=0;i<arguments.length;i++){
            (function(x){
            setTimeout(function(){
             textBox.append('<div class="chatAdmin"><dl><dt><img src="/marryus/resources/img/chat_adm.png" alt="" class="img-responsive center-block"></dt><dd>'+msg[x]+'</dd></dl></div>')
             inputBox.val("");
             textBox.animate({scrollTop: textBox.prop("scrollHeight")}, 500);
            },500*(x+1))
            })(i)
        }   
    }

   function reciveBot(msg){
     if ( msg.indexOf('안녕') != -1) {
         sendAdmin("안녕하세요 고객님</br>어떤 점이 궁금하신가요?")
     }else if(msg.indexOf('웨딩')!=-1 ||msg.indexOf('홀')!=-1 ||msg.indexOf('식장')!=-1 ){
         sendAdmin("웨딩홀에 관하여 궁금하신가요?</br>담당자를 연결해 드릴게요")
     }else if(msg.indexOf('스튜디오')!=-1||msg.indexOf('드레스')!=-1||msg.indexOf('메이크업')!=-1||msg.indexOf('메이크 업')!=-1||msg.indexOf('스드메')!=-1||msg.indexOf('스 드 메')!=-1||msg.indexOf('스,드,메')!=-1){
         sendAdmin("스튜디오,메이크업,드레스에 관하여 궁금하신가요? </br> 담당자를 연결해 드릴게요. ")
     }else if(msg.indexOf('허니문')!=-1||msg.indexOf('허니 문')!=-1||msg.indexOf('신혼여행')!=-1||msg.indexOf('신혼 여행')!=-1||msg.indexOf('여행지')!=-1){
         sendAdmin("허니문,신혼여행에 관하여 궁금하신가요? </br> 담당자를 연결해 드릴께요")
     }else if(msg.indexOf('예물')!=-1||msg.indexOf('예단')!=-1){
         sendAdmin("예물 예단에 관하여 궁금 하신가요? </br> 담당자를 연결해 드릴게요")
     }else if(msg.indexOf('프로포즈')!=-1||msg.indexOf('케이터링')!=-1||msg.indexOf('이벤트')!=-1){
         sendAdmin("프로포즈,케이터링,이벤트 등이 궁하신가요? </br> 담당자를 연경해 드릴게요")
     }else if(msg.indexOf('추가서비스')!=-1||msg.indexOf('추가 서비스')!=-1||msg.indexOf('추가')!=-1||msg.indexOf('서비스')!=-1){
         sendAdmin("추가서비스에 관하여 궁금하신가요?","추가서비스는 프로포즈 케이터링 이벤트 축가등을 소개해드립니다","추가서비스 담당자를 연결해 드릴까요?")
     }else if(msg.indexOf('씨발')!=-1||msg.indexOf('시발')!=-1||msg.indexOf('ㅅㅂ')!=-1||msg.indexOf('ㅅ1발')!=-1||msg.indexOf('미친')!=-1||msg.indexOf('병신')!=-1||msg.indexOf('ㅄ')!=-1||msg.indexOf('개새끼')!=-1||msg.indexOf('개새')!=-1||msg.indexOf('ㄳㄲ')!=-1||msg.indexOf('ㄳㅋ')!=-1){
         sendAdmin("반사","욕하지마라","나도 욕한다?")
         agreeWebsocket()
         $(".inputChatbot").css({"display":"none"})
         $(".inputWebSocket").css({"display":"block"})
     }else{
         sendAdmin("무슨말인지 잘모르겠어요 ㅠㅠ","웨딩홀,스드메,예물,허니문,추가 서비스등 ","웨딩에 관련된 질문을 해주시면 ","답변해드릴게요")
			}
		}
   
	function agreeWebsocket(){
		btnBox.fadeIn(300)
	}
   

   function websocket(){
   	
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
   };

   $('#webSocketSend').click(function() { 
       var $msg = $("#webSocketInput");
       // 보낼 수 있는 데이터는 String, Blob, ArrayBuffer 입니다. 
       // 웹소켓 서버에 데이터 전송하기
       ws.send($msg.val());
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

   
	})
	
</script>