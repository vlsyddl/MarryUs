<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="us">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
 
    <title>Start Up</title>
    
     <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
  </head>
  <body>
   <c:import url="/common/importHeader.jsp"/>
    <div id="wrap" class="myCompany">
        <nav class="myCompanyNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mycompany/myCompany.do'/>">
                                <img src="<c:url value="/resources/"/>img/company_ico.png" alt="" class="img-responsive center-block">
                                My Company
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/service.do'/>">
                                    <img src="<c:url value="/resources/"/>img/card_ico.png" alt="" class="img-responsive center-block">
                                My Service
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mycompany/auctionList.do'/>">
                                <img src="<c:url value="/resources/"/>img/graph_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        
                    </ul>
            </div>
        </nav>
        <section class="contents contents01">
            <div class="container">
                <div class="infoBox cf">
                    <div class="col-md-4 no-padding info_left">
                       
                    </div>
                    <div class="col-md-8 no-padding info_right">
                    <a href="<c:url value='/mycompany/companyUpdateForm.do'/>">
                        <div class="profile">
                            <div class="name">
                                <h2>Seungjae Lee</h2>
                            </div>
                        </div>
                        </a>
                        <div class="infoCount">
                            <ul>
                                <li class="price">
                                    <dl>
                                        <dt>총 낙찰 액수</dt>
                                        <dd><span>172830000</span></dd>
                                    </dl>
                                </li>
                                <li class="auction">
                                    <dl>
                                        <dt>평균 견적가</dt>
                                        <dd><span>3000000</span></dd>
                                    </dl>
                                </li>
                                <li class="auction">
                                    <dl>
                                        <dt>관심 수</dt>
                                        <dd><span>132</span></dd>
                                    </dl>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
       <section class="contents contents02">
           <div class="container">
               <div class="row">
                   <div class="col-md-4">
                        <dl>
                            <dt>입찰중인 경매</dt>
                            <dd><span>1</span>건</dd>
                        </dl>
                   </div>
                   <div class="col-md-4">
                        <dl>
                            <dt>낙찰된 경매</dt>
                            <dd><span>1</span>건</dd>
                        </dl>
                   </div>
                   <div class="col-md-4">
                        <dl>
                            <dt>유찰된 경매</dt>
                            <dd><span>1</span>건</dd>
                        </dl>
                   </div>
               </div>
           </div>
       </section>
    </div>
    <footer>
        <div class="container">
            <h3>©2018 MarryUs. All rights reserved.</h3>
        </div>
    </footer>
   <c:import url="/common/importSideBar.jsp"/>
        <script>
            $(function(){
                new WOW().init();
    
                var options = {
                    'speed' : 500,				 		//스피드
                    'initTop' : 300, 					//기본top위치
                    'alwaysTop' : false,				// true
                    'default_x' : false 				//레이어가 붙는 아이디 
                }
                $('#sideBar').Floater(options);
                
            });
        </script>
</body>
</html>