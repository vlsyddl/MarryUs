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
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/wedding.css"/>">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc6291b36d6e91a7fc6b30e92a9171d3"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="wedding">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>웨딩홀</h2>
                <p>
                    웨딩홀 &middot; 스몰웨딩 &middot; 셀프웨딩
                </p>
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
            <div class="communityTab">
                    <ul>
                        <li ><a href="<c:url value='/board/notice/list.do'/>">공지게시판</a></li>
                        <li class="on"><a href="<c:url value='/board/review/list.do'/>">후기 게시판</a></li>
                        <li ><a href="<c:url value='/board/free/list.do'/>">신부 대기실</a></li>
                        <li ><a href="<c:url value='/board/mtom/mtomlist.do'/>">1:1 질문</a></li>
                        <li ><a href="javascript:void(0);">FAQ</a></li>
                    </ul>
                    <div class="tabContents">
                      	<div class="tab1 on">
                        	<div class="serch">
                      			<ul class="card-list">
									<c:forEach var="b" items="${reviewList}">
	                    				<li class="card">
					                        <a class="card-image" href="detail.do?boardNo=${b.boardNo}"/>
					                        	<img src="<c:url value='${b.attach.filePath}/${b.attach.fileName}' />" width="100%" height="250px">
					                        </a>
					                        <a class="card-description" >
					                            <h2><a href="detail.do?boardNo=${b.boardNo}">${b.title}</a></h2>
					                            <p>${b.writer}</p>
					                        </a>
					                        <ul>
					                            <li>
					                                <fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd hh:mm"/>
					                            </li>
					                            <li>
					                                <span >${b.viewCnt}</span>
					                            </li>
					                        </ul>
	                    				</li>
									</c:forEach>
		                		</ul>
                        </div>
                        <div class="tab2">
                            tab2
                        </div>
                    </div>
                </div>
	         	<div id="writeButton">
		           	<a href="writeForm.do"><button>글쓰기</button></a>
	            </div>
	            <div id="paginationDiv">
	                <ul class="pagination">
							<li><a
												<c:choose>
						      <c:when test="${beginPage!=1}">href="list.do?pageNo=${beginPage-1}"</c:when>
						      <c:otherwise>href="#"</c:otherwise>
							    </c:choose>
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
											<c:forEach var="i" begin="${beginPage}" end="${endPage}">
												<li><a
													<c:choose>
													   	<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/search.json"}'>
													    href="<c:url value='/board/review/search.json?pageNo=${i-1}&type=${result.type}&content=${result.content}' />"
													    </c:when>
													
													    <c:otherwise>
													     href="list.do?pageNo=${i}"
													     </c:otherwise>
												     </c:choose>>
													${i}</a>
												</li>
											</c:forEach>
						
											<li><a
												<c:choose>
						      <c:when test="${endPage != lastPage}"> href="list.do?pageNo=${endPage+1}" </c:when>
						    	<c:otherwise>href="#"</c:otherwise>
						    	</c:choose>
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
						</ul>
					</div>
					               		</div>
			            <form id="searchForm" method="post">
			            	<div id="search">
			            		<select name="type">
			            			<option value="1">제목</option>
			            			<option value="2">내용</option>
			            			<option value="3">글쓴이</option>
			            			<option value="4">제목+내용</option>
			            		</select>
			            		<input type="hidden" name="pageNo" value="1" />
			            		<input type="text" id="searchContent" name="content" placeholder="검색어를 입력해주세요." />
			            		<button type="button" id="searchBtn">검색</button>
			            	</div>
			            </form>
			            </div>
            </div>
        </section>
		<c:import url="/common/importFooter.jsp" />
    </div>
	<c:import url="/common/importSideBar.jsp" />
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
                
                //날짜 카운트
                $.fn.CountDownTimer('11/22/2019 00:00 AM');
            });
            
            $("#searchBtn").click(function () {
	           	 if ($("#searchContent").val() == "") {
	           		 alert("검색어를 입력해주세요.");
	           		 return false;
	           	 }
	           	 $("#paginationDiv").empty();
	           	 
	           		var beginPage = ${beginPage};
	           		var endPage = ${endPage};
	           		var lastPage = ${lastPage};
	           		var pageNo = ${pageNo};
           	 
	           		console.log("beginPage ======= " + beginPage);
	           		console.log("endPage ======= " + endPage);
	           		console.log("lastPage ======= " + lastPage);
	           		console.log("pageNo ======= " + pageNo);
	           		
	           	 $.ajax({
	           		url : "<c:url value='/board/review/search.json' />",
	           		method : "POST",
	           		data : $("#searchForm").serialize(),
	           		cache : false
	           	 }).done (function (result) {
	           		 console.log(result);
	           		var html = "";
	           		
	           		for ( var i = 0; i < result.length; i++) {
		           			html += "<ul class='pagination'>";
		           			html += "<li class='card'>";
		           			html += '<a class="card-image" href="detail.do?boardNo='+result[i].boardNo+'"/>';
		           			html += '<img src="'+result[i].attach.filePath/result[i].attach.fileName+'" /> width="100%" height="250px">'
		           			html += '</a>'
		           			html += '<a class="card-description" >'
		           			html += '<h2><a href="detail.do?boardNo='+result[i].boardNo+'">'+result[i].title+'</a></h2>'
		           			html += '<p>'+result[i].writer+'</p>'
		           			html += '</a>'
		           			html += '<ul>'
		           			html += '<li>'+result[i].regDate+'</li>'
		           			html +=  '<li><span>'+result[i].viewCnt+'</span></li>'
		           			html += '</ul>'
		           			html += '</li>'
		           			html += '</ul>'
	           		}
	       			$(".serch").html(html);

		           	});
            });
        </script>

</body>
</html>