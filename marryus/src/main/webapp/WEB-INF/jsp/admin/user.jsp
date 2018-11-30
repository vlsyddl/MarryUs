<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marry Us</title>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/admin.css"/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
    <script type="text/javascript" src="/marryus/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body>
    <aside id="gnb">
        <div class="profile">
            <span class="name"><c:out value="${admin.admName}"/></span>
            <script>
            	$(document).ready(function(){
            		var type = "${admin.admType}";
                	
                	var grant;
                	if(type=='sadm'){
    					grant = "최고관리자";      		
                	}else{
                		grant = "일반관리자";
                	}
                	$(".grant").html(grant);
            	})
            	
            </script>
            <span class="grant"></span>
            <div class="btnBox">
                <a href="#" class="modify">Modify</a>
                <a href="<c:url value="/admin/logout.do"/>" class="logout">Log Out</a>
            </div>
        </div>
        <nav>
            <ul>
                <li><a href="<c:url value="/admin/main.do" />"><i class="fas fa-th-large"></i> Main</a></li>
                <li ><a href="<c:url value="/admin/board.do" />"><i class="fas fa-list"></i> Boarad</a></li>
                <c:if test="${admin.admType eq 'sadm'}">
                	<li class="active"><a href="<c:url value="/admin/user.do"/>"><i class="fas fa-user-cog"></i> User</a></li>
                </c:if>
                <li><a href="#"><i class="fas fa-gift"></i> Event</a></li>
            </ul>
        </nav>
    </aside>
	<div id="wrap" class="User cf">
		<h2 class="title">
            Admin User
        </h2>
        <section class="itemWrap">
        		<div class="contentsTab">
	                <ul>
	                    <li data-target="nt" class="on"><a href="javascript:void(0);">일반회원</a></li>
	                    <li data-target="rv"><a href="javascript:void(0);">기업 회원</a></li>
	                </ul>
	                <div class="tabContents">
	                    <div class="tab1 on">
	                    </div>
                    </div>
                </div>
        </section>
	</div>
</body>
</html>