<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<nav>
	<div class="text-center">
		<ul class="pagination">
			<c:choose>
		    	 <c:when test="${pageResult.beginPage!=1}"><li><a href="<c:url value="/board"/>/list.do?pageNo=${beginPage-1}&category=${param.category}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li></c:when>
		     	<c:otherwise><li class="disabled"><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li></c:otherwise>
		   	</c:choose>
			<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
			<c:choose>
		  		<c:when test='${pageResult.pageNo eq i }'>
					<li class="active"><a href="#"  >${i}</a></li>
				</c:when>
				<c:otherwise>
					  <li><a href="<c:url value="/board"/>/list.do?pageNo=${i}&category=${param.category}<c:if test="${param.type != null}">&type=${param.type}</c:if><c:if test="${param.content != null}">&content=${param.content}</c:if>" >${i}</a></li></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
			<c:choose>
		      	<c:when test="${pageResult.endPage != lastPage}"><li><a href="<c:url value="/board"/>/list.do?pageNo=${pageResult.endPage+1}&category=${param.category}" aria-label="Next" > <span aria-hidden="true">&raquo;</span></a></li> </c:when>
		    	<c:otherwise><li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li></c:otherwise>
		   	</c:choose>
		</ul>
	</div>
 </nav>
<div class="searchWrap">
               	 <form action="<c:url value="/board/list.do"/>" id="search">
	<input type="hidden" name="category" value="${param.category}">
    <select class="form-control" id="searchType" name="type">
        <option value="title" selected>제목</option>
        <option value="content">내용</option>
        <option value="writer">글쓴이</option>
      </select>
      <input type="text" class="form-control" id="searchContent" placeholder="Search for..." name="content">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" id="searchBtn"><i class="fas fa-search"></i></button>
      </span>
   </form>
</div>
<script>	
    $("#searchBtn").click(function(){
    	if($("#searchContent").val()==""){
    		alert("검색어를 입력해주세요")
    		return;
    	}
   	 	$("#search").submit();
    })                   
</script>
                   
                   