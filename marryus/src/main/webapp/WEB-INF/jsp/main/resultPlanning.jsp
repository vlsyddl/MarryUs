<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="https://fonts.googleapis.com/css?family=Crete+Round:400i|Lato:400,900s" />

<style>
html {
  box-sizing: border-box;
  font-size: 10px;
  line-height: 1.42857143;
}
*,
*:before,
*:after {
  box-sizing: inherit;
}
body {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100vh;
  position: relative;
  background: #ebebeb;
  font-family: 'Lato', sans-serif;
  font-weight: 700;
  color: #333333;
  padding: 2rem;
}
h1 {
  font-family: 'Crete Round', serif;
  margin: 0;
  font-size: 4rem;
  line-height: 1;
  font-weight: 200;
}
h1 img {
  float: right;
  vertical-align: top;
}
@media (max-width: 630px) {
  h1 img {
    width: 40px;
  }
}
p {
  font-size: 1.4rem;
  font-weight: 400;
}
.sub-head {
  margin: 0.6rem 0;
  color: #999999;
}
main {
  margin: auto;
}
.description {
  width: 74%;
}
@media (max-width: 485px) {
  .description {
    width: 100%;
  }
}
.receipt {
  width: 100%;
  padding: 4rem;
  min-height: 200px;
  background: #FFF;
  border-top: 5px solid #006341;
  position: relative;
}
.receipt:after {
  background: linear-gradient(-45deg, transparent 8px, #FFF 0), linear-gradient(45deg, transparent 8px, #FFF 0);
  background-position: left bottom;
  background-size: 8px 32px;
  content: "";
  width: 100%;
  height: 8px;
  position: absolute;
  bottom: -8px;
  left: 0px;
}
@media (min-width: 630px) {
  .receipt {
    margin: auto;
    width: 600px;
    padding: 5rem;
  }
}
header {
  margin-bottom: 5rem;
}
footer {
  margin: 4rem 0;
  text-align: center;
  color: #aaaaaa;
}
footer p {
  font-size: 1.2rem;
}
address {
  font-weight: 400;
  font-style: normal;
}
table {
  border-spacing: 0;
  border-collapse: collapse;
  width: 100%;
  margin-top: 3rem;
}

table td {
  font-size: 1.4rem;
  font-weight: 400;
  vertical-align: top;
  border-top: 1px solid #dddddd;
  padding: 2rem 0;
}
.table__img {
  width: 20%;
}
.table__desc {
  width: 65%;
  padding: 2rem 2rem;
}
.table__price {
  width: 15%;
  text-align: right;
}
.table__total {
  text-align: right;
  border-width: 3px;
  border-color: #444;
}
.u-shadow {
  box-shadow: 1px 1px 2px #DDD;
}

</style>
</head>
<body>
        <main>
                <div class="receipt">
                    <header>
                        <h1>
                          Your To do List
                        </h1>
                        <p class="sub-head">Your order has been received and is now being processed.</p>
                        <p>이름 : </p>
                    <hr>
                    </header>
                    <div class="description">
                        <p><strong>D-100</strong></p>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                               
                            </tr>
                            <tr>
                                <td class="table__img">
                                    혼수
                                </td>
                                <td class="table__desc">
                                    <strong>혼수 리스트 뽑아보기</strong><br>
                                </td>
                            </tr>
                            <tr>
                                <td class="table__img">
                                    웨딩
                                </td>
                                <td class="table__desc">
                                    <strong>웨딩홀 리스트 뽑아보기</strong><br>
                                </td>
                                
                            </tr>
                            
                        </tbody>
                    </table>
                    <div class="description">
                            <p><strong>D-80</strong></p>
                    </div>
                    <table>
                            <tbody>
                                <tr>
                                   
                                </tr>
                                <tr>
                                    <td class="table__img">
                                        혼수
                                    </td>
                                    <td class="table__desc">
                                        <strong>혼수 리스트 뽑아보기</strong><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table__img">
                                        웨딩
                                    </td>
                                    <td class="table__desc">
                                        <strong>웨딩홀 리스트 뽑아보기</strong><br>
                                    </td>
                                    
                                </tr>
                                
                            </tbody>
                        </table>
                        <div class="description">
                                <p><strong>D-60</strong></p>
                            </div>
                            <table>
                                <tbody>
                                    <tr>
                                       
                                    </tr>
                                    <tr>
                                        <td class="table__img">
                                            혼수
                                        </td>
                                        <td class="table__desc">
                                            <strong>혼수 리스트 뽑아보기</strong><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table__img">
                                            웨딩
                                        </td>
                                        <td class="table__desc">
                                            <strong>웨딩홀 리스트 뽑아보기</strong><br>
                                        </td>
                                        
                                    </tr>
                                    
                                </tbody>
                            </table>
                </div>
                
               
            </main>
            
</body>
</html>