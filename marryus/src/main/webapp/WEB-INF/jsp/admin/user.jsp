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
        <c:import url="/common/importAdminHeader.jsp"/>
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
	<div id="wrap" class="user cf">
		<h2 class="title">
            Admin User
        </h2>
        <section class="itemWrap">
        		<div class="contentsTab">
	                <ul>
	                    <li data-target="gm" class="on"><a href="javascript:void(0);">일반회원</a></li>
	                    <li data-target="cm"><a href="javascript:void(0);">기업 회원</a></li>
	                </ul>
	                <div class="tabContents">
	                    <div class="tab1 on">
	                    	<table class="table userTable gmTable">
                                <colgroup>
                                    <col width="5%"/>
                                    <col width="*"/>
                                    <col width="15%"/>
                                    <col width="15%"/>
                                    <col width="8%"/>
                                    <col width="8%"/>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>회원번호</th>
                                        <th>이메일</th>
                                        <th>이름</th>
                                        <th>전화번호</th>
                                        <th>타입</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>a@aaa.com</td>
                                        <td>a</td>
                                        <td>01000000000</td>
                                        <td>일반회원</td>
                                        <td>이용중</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>a@aaa.com</td>
                                        <td>a</td>
                                        <td>01000000000</td>
                                        <td>일반회원</td>
                                        <td>이용중</td>
                                    </tr>
                                </tbody>
                            </table>
                            <nav class="text-center">
						  <ul class="pagination">
						   
						  </ul>
                         </nav>
                          <div class="searchWrap">
                          	 <form action="" id="search">
                                <select class="form-control" id="searchType">
                                    <option value="title" selected>제목</option>
                                    <option value="writer">글쓴이</option>
                                </select>
                                <input type="text" class="form-control" id="searchContent" placeholder="Search for...">
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="button" id="searchBtn"><i class="fas fa-search"></i></button>
                                </span>
                               </form>
                          </div>
	                    </div>
	                    <div class="tab2">
	                    	<table class="table userTable gmTable">
                                <colgroup>
                                    <col width="5%"/>
                                    <col width="*"/>
                                    <col width="15%"/>
                                    <col width="15%"/>
                                    <col width="8%"/>
                                    <col width="8%"/>
                                    <col width="8%"/>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>회원번호</th>
                                        <th>이메일</th>
                                        <th>이름</th>
                                        <th>전화번호</th>
                                        <th>타입</th>
                                        <th>상태</th>
                                        <th>설정</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>a@aaa.com</td>
                                        <td>a</td>
                                        <td>01000000000</td>
                                        <td>일반회원</td>
                                        <td>이용중</td>
                                        <td>
                                            <select class="form-control">
                                                <option value="1" selected>미승인</option>
                                                <option value="1">승인</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>a@aaa.com</td>
                                        <td>a</td>
                                        <td>01000000000</td>
                                        <td>일반회원</td>
                                        <td>이용중</td>
                                        <td>
                                            <select class="form-control">
                                                <option value="1" >미승인</option>
                                                <option value="1" selected>승인</option>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <nav class="text-center">
						  <ul class="pagination">
						   
						  </ul>
                         </nav>
                          <div class="searchWrap">
                          	 <form action="" id="search">
                                <select class="form-control" id="searchType">
                                    <option value="title" selected>제목</option>
                                    <option value="writer">글쓴이</option>
                                </select>
                                <input type="text" class="form-control" id="searchContent" placeholder="Search for...">
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="button" id="searchBtn"><i class="fas fa-search"></i></button>
                                </span>
                               </form>
                          </div>
	                    </div>
                    </div>
                </div>
        </section>
	</div>
	<script>
		$(function(){
			 $(".tab2").hide()
			callList(1,"mg")
		})
        $(".contentsTab ul li").click(function(){
            var target = $(this).data("target");
            if(target =="gm"){
                $(".tab2").hide()
                $(".tab1").show()
                callList(1,"mg")
            }else{
                $(".tab1").hide()
                $(".tab2").show()
                callList(1,"mc")
            }
        })
        function callList(pageNo,type){
        	$(".table.userTable > tbody").html(""); //게시판 로드시 본래 게시판 삭제	
    		var searchWord = ''; //처음 검색어 비우기

    		if($("#searchContent").val() == ''){ //검색어 처리
    			searchWord = 'null'			  
    		}else{
    			searchWord = $("#searchContent").val()
    		}

    		$.ajax({
    			url : "<c:url value="/admin/userList.do"/>",
    			data : "memType="+type+"&pageNo="+pageNo+"&type="+$("#searchType").val()+"&content="+searchWord
    		}).done(function(data){
    			console.log(data)
    			var html;
				var staus;
				var memberType;
				if(type=="mg"){
					memberType="일반회원"
				}else if(type="mc"){
					memberType="기업회원"
				}
    			if(data.list.length==0){	//게시물 없을시 텍스트
    				html+="<tr>"
    				html+="<td colspan='5'>게시물이 존재하지 않습니다</td>"
    				html+="</tr>"
    			}else{		 			
    				for(var b of data.list){
    					if(b.status=="sm"){
    						status = "이용중"
    					}else{
    						status = "탈퇴"
    					}
    					html+='<tr>'
    					html +='<td>'+b.no+'</td>'
    					html +='<td>'+b.email+'</td>'
    					html +='<td>'+b.name+'</td>'
    					html +='<td>'+b.phone+'</td>'
    					html +='<td>'+memberType+'</td>'
    					html +='<td>'+status+'</td>'
    					if(type=="mc"){
    						html+='<td>'
    						html+='<select class="form-control okaySelect">'
   							if(b.company.comOkay=="n"){
   								html+='<option value="n" selected>미승인</option>'
	    						html+='<option value="y">승인</option>'
   	   						}else{
   	   							html+='<option value="n">미승인</option>'
   	    						html+='<option value="y" selected>승인</option>'
   	   						}
    						
    						html+='</select>'
    						html+='</td>'
   							
    					}
    					html+='</tr>'
    				}
    				
    			}
    			$(".table.userTable > tbody").html(html); //게시판 리스트 출력	

    			if(data.pageResult!=0){ //페이징 처리
    				var pHtml = '';
    				var active;
    				if((parseInt(data.pageResult.beginPage)-1)!=0){
    					pHtml+="<li><a href='#'data-type='"+type+"' data-href='"+(parseInt(data.pageResult.beginPage)-1)+"'><span aria-hidden='true'>&laquo;</span></a></li>"
    				}
    				for(var i = data.pageResult.beginPage; i<=data.pageResult.endPage; i++){
    					active = "";
    					if(i==data.pageResult.pageNo){
    						active = "active"
    					}
    					pHtml +="<li class='"+active+"'>"
    					pHtml +="<a href='#' data-type='"+type+"' data-href='"+i+"'>"+i+"</a>"
    					pHtml +="</li>"
    				}
    				pHtml+="<li><a href='#' data-type='"+type+"' data-href='"+(parseInt(data.pageResult.endPage)+1)+"'><span aria-hidden='true'>&raquo;</span></a></li>"
    			}
    			$(".pagination").html(pHtml)

    			$(".pagination li a").click(function(e){ //페이징 이동 처리
    				e.preventDefault();
    				callList($(this).data("href"),$(this).data("type"))
    			})

    			$(".table.userTable> tbody > tr > td > a").click(function(e){ //디테일 처리
    				e.preventDefault();
    				detail($(this).data("href"))
    			})

    		})
        }
	</script>
</body>
</html>