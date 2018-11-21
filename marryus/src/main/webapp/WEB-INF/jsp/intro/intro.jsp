<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
@import url('https://fonts.googleapis.com/css?family=Bonbon');
 body{
     padding: 0;
     margin: 0;
     
 }
.drawsvg{width: 100%; height: 100vh;
    padding: 0;
     margin: 0;
     position: relative;
     overflow: hidden;
} 
svg{
    padding: 0;
     margin: 0;
    width: 100%; height: 100vh;
    z-index: 4;
    position: relative;
}
.bg{
    display: block;
    width: 100%;
    height: 100%;
    position: absolute;
    content:'';
    background: rgba(0,0,0,0.2);
    top: 0;
    left: 0;
    z-index: 3;
    opacity: 1;
    animation: opa 5s; 
         animation-timing-function: cubic-bezier(.25, .46, .45, .94) ;
}

.stroke {stroke: #fff; 
        stroke-width: 3px; 
         stroke-opacity: 1; 
         fill: none; 
         animation: stroke_offset 5s; 
         animation-timing-function: cubic-bezier(.25, .46, .45, .94) ;
         text-shadow:
       3px 3px 0 #000,
     -1px -1px 0 #000,  
      1px -1px 0 #000,
      -1px 1px 0 #000,
       1px 1px 0 #000;
         } 
img{
    animation: scale 10s;
    position: absolute;
    transform: scale(1.2);
    z-index: 2;
    top: 0;
    left: 0;
}
@keyframes scale{
    0%{transform: scale(1)}
    100%{transform: scale(1.2)}
}

@keyframes stroke_offset { 
    100% {stroke-dasharray: 100 0; stroke-opacity: 1 } 
    0% {stroke-dasharray:  0 100; stroke-opacity: 0 } 
} 
.fill { fill:transparent; 
        fill-opacity: 0; 
        } 
 @keyframes fill_offset { 
    0% { fill-opacity: 0 }
     100% { fill-opacity: 1 } } 
@keyframes opa{
    0%{opacity: 0;}
    100%{opacity: 1;}
}
#fade-text { font-family:  'Bonbon', cursive; font-size: 14em; font-weight: normal;}


    </style>
</head>
<body>
        <div class="drawsvg"> 
            <img src="<c:url value="/resources/img/intro_bg.jpg"/>" alt="">
            <svg version="1.1"> 
                <symbol id="fade-text"> 
                    <text x="50%" y="40%" text-anchor="middle">Marry</text> 
                    <text x="60%" y="70%" text-anchor="middle">Us</text> 
                </symbol> 
                <g> 
                    <use class="stroke" xlink:href="#fade-text"/> 
                    <use class="fill" xlink:href="#fade-text"/> 
                </g> 
            </svg>	
            <span class="bg"></span>
        </div>
        <script>
             setTimeout(function(){
                window.location.href="main.html"
             },8000)
        </script>
</body>
</html>