<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style>
body{
	font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
	color: rgb(112, 112, 112);
	line-height:30px;
	font-weight: 500;
	font-size: 18px;
}
.detail_box span.highlight{
	width: 40px; height: 40px;
	background: #dfdfdf; 
}
.detail_box .picture{
	float: left;
}
.detail_box .detail{
	font-weight: 500;
	text-indent: 30px;
}

.detail_box .red{
	font-size: 12px;
	color: rgb(212, 37, 37);
}

button{
	padding: 6px 20px;
	border-radius: 10px;
	margin: 0px 10px 0px 0px;
}

.btn1{
	background: #fbdcd0;
	border:5px double #ffff;
}

.btn2{
	background: #cbd8d6;
	border:1px solid #ffff;
}

body .left{
	text-align: right;
}



</style>
</head>
<body>
	<div="content">
	<div class="info_box left">
		<div>2018-11-22 ~ 2018-12-22</div>
		<div>3개의 입찰서</div>
		<div><button class="btn2">내 경매 조건 보기</button></div>
		<div></div>
	</div>
	<div class="detail_box">
		<h4><span class="highlight">1</span>메리스 에이프런<span class="left">      2018-11-24</span></h4>
		<div class="picture">
			<img src="../mypage/img/wedding.jpg" width="200px" height="130px"/>
		</div>
		<div class="detail">
			<div>서울시 강남구 </div>
			<div><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>0507-511-5331</div>
			<div><span class="red">5%할인    </span>1,305,700원</div>
			<div><button class="btn1">견적서 보기</button><button class="btn1">예약하기</button></div>
		</div>
	</div>
	<div>
	
</body>
</html>