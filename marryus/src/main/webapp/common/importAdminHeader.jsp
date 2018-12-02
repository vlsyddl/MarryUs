<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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