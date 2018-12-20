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
               <!--  <li><a href="#"><i class="fas fa-gift"></i> Event</a></li> -->
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
	                    <li data-target="mg" class="on"><a href="javascript:void(0);">일반회원</a></li>
	                    <li data-target="mc"><a href="javascript:void(0);">기업 회원</a></li>
	                    <li data-target="admin"><a href="javascript:void(0);">관리자</a></li>
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
                                    
                                </tbody>
                            </table>
                            <nav class="text-center">
						  <ul class="pagination">
						   
						  </ul>
                         </nav>
                          <div class="searchWrap">
                          	 <form action="" id="search">
                                <select class="form-control searchTypemg">
                                    <option value="mem_no" selected>회원번호</option>
                                    <option value="mem_email">이메일</option>
                                    <option value="mem_name">이름</option>
                                    <option value="mem_status">상태</option>
                                </select>
                                <input type="text" class="form-control searchContentmg" placeholder="Search for...">
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="button" id="searchBtnmg"><i class="fas fa-search"></i></button>
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
                                    
                                </tbody>
                            </table>
                            <nav class="text-center">
						  <ul class="pagination">
						   
						  </ul>
                         </nav>
                          <div class="searchWrap">
                          	 <form action="" id="search">
                                <select class="form-control searchTypemc" >
                                    <option value="mem_no" selected>회원번호</option>
                                    <option value="mem_email">이메일</option>
                                    <option value="mem_name">이름</option>
                                    <option value="mem_status">상태</option>
                                </select>
                                <input type="text" class="form-control searchContentmc" placeholder="Search for...">
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="button" id="searchBtnmc"><i class="fas fa-search"></i></button>
                                </span>
                               </form>
                          </div>
	                    </div>
	                    <div class="tab3">
	                    	<table class="table adminTable">
                                <thead>
                                    <tr>
                                        <th>관리자 번호</th>
                                        <th>아이디</th>
                                        <th>이름</th>
                                        <th>타입</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                            <nav class="text-center">
						  <ul class="pagination">
						   
						  </ul>
                         </nav>
                          <div class="searchWrap">
                          	 <form action="" id="search">
                                <select class="form-control searchTypeadmin">
                                    <option value="adm_id" selected>아이디</option>
                                    <option value="adm_name" >제목</option>
                                    <option value="adm_type">타입</option>
                                    <option value="adm_ok">상태</option>
                                </select>
                                <input type="text" class="form-control searchContentadmin" id="searchContent" placeholder="Search for...">
                                <span class="input-group-btn">
                                  <button class="btn btn-default" type="button" id="searchBtnAdm"><i class="fas fa-search"></i></button>
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
			 $(".tab3").hide()
			callList(1,"mg")
		})
        $(".contentsTab ul li").click(function(){
            var target = $(this).data("target");
            $(".searchContent"+target).val("") 
            if(target =="mg"){
                $(".tab2").hide()
                $(".tab3").hide()
                $(".tab1").show()
                callList(1,target)
            }else if(target=="mc"){
                $(".tab1").hide()
                $(".tab3").hide()
                $(".tab2").show()
                callList(1,target)
            }else if(target=="admin"){
            	$(".tab1").hide()
                $(".tab2").hide()
                $(".tab3").show()
                callAdm(1)
            }
        })
        //회원 리스트
        function callList(pageNo,type){
        	$(".table.userTable > tbody").html(""); //게시판 로드시 본래 게시판 삭제	
    		var searchWord = ''; //처음 검색어 비우기

    		if($(".searchContent"+type).val() == ''){ //검색어 처리
    			searchWord = 'null'			  
    		}else{
    			searchWord = $(".searchContent"+type).val()
    		}

    		$.ajax({
    			url : "<c:url value="/admin/userList.do"/>",
    			data : "memType="+type+"&pageNo="+pageNo+"&type="+$(".searchType"+type).val()+"&content="+searchWord
    		}).done(function(data){
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
    						html+='<select class="form-control okaySelect" onchange="changeUserStatus('+b.no+',this.value)">'
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
				$("#searchBtn"+type).click(function(){
					callList(1,type)
				})
    		})
        }
		
		//관리자 리스트
		function callAdm(pageNo){
			$(".table.adminTable > tbody").html(""); //게시판 로드시 본래 게시판 삭제	
    		var searchWord = ''; //처음 검색어 비우기

    		if($(".searchContentadmin").val() == ''){ //검색어 처리
    			searchWord = 'null'			  
    		}else{
    			searchWord = $(".searchContentadmin").val()
    		}

    		$.ajax({
    			url : "<c:url value="/admin/admList.do"/>",
    			data : "pageNo="+pageNo+"&type="+$(".searchTypeadmin").val()+"&content="+searchWord
    		}).done(function(data){
    			var html;
				var staus;
				
    			if(data.list.length==0){	//게시물 없을시 텍스트
    				html+="<tr>"
    				html+="<td colspan='5'>게시물이 존재하지 않습니다</td>"
    				html+="</tr>"
    			}else{		 			
    				for(var b of data.list){
    					html+='<tr>'
                        html+='<td>'+b.admNo+'</td>'
                        html+='<td>'+b.admId+'</td>'
                        html+='<td>'+b.admName+'</td>'
                        html+='<td>'
   						html+='<select class="form-control okaySelect" onchange="changeAdminType('+b.admNo+',this.value)">'
						if(b.admType=="sadm"){
							html+='<option value="sadm" selected>최고 관리자</option>'
							html+='<option value="gadm">일반 관리자</option>'
  						}else{
  							html+='<option value="sadm" >최고 관리자</option>'
  								html+='<option value="gadm" selected>일반 관리자</option>'
  						}
   						html+='</select>'
   						html+='</td>'
                        html+='<td>'
   						html+='<select class="form-control okaySelect" onchange="changeAdminStatus('+b.admNo+',this.value)">'
						if(b.admOk=="n"){
							html+='<option value="n" selected>미승인</option>'
							html+='<option value="y">승인</option>'
  						}else{
  							html+='<option value="n">미승인</option>'
   							html+='<option value="y" selected>승인</option>'
  						}
   						html+='</select>'
   						html+='</td>'
                    	html+='</tr>'
    				}
    				
    			}
    			$(".table.adminTable > tbody").html(html); //게시판 리스트 출력	

    			if(data.pageResult!=0){ //페이징 처리
    				var pHtml = '';
    				var active;
    				if((parseInt(data.pageResult.beginPage)-1)!=0){
    					pHtml+="<li><a href='#' data-href='"+(parseInt(data.pageResult.beginPage)-1)+"'><span aria-hidden='true'>&laquo;</span></a></li>"
    				}
    				for(var i = data.pageResult.beginPage; i<=data.pageResult.endPage; i++){
    					active = "";
    					if(i==data.pageResult.pageNo){
    						active = "active"
    					}
    					pHtml +="<li class='"+active+"'>"
    					pHtml +="<a href='#' data-href='"+i+"'>"+i+"</a>"
    					pHtml +="</li>"
    				}
    				pHtml+="<li><a href='#'  data-href='"+(parseInt(data.pageResult.endPage)+1)+"'><span aria-hidden='true'>&raquo;</span></a></li>"
    			}
    			$(".pagination").html(pHtml)

    			$(".pagination li a").click(function(e){ //페이징 이동 처리
    				e.preventDefault();
    				callAdm($(this).data("href"))
    			})

    			$(".table.userTable> tbody > tr > td > a").click(function(e){ //디테일 처리
    				e.preventDefault();
    				detail($(this).data("href"))
    			})
    			
    			$("#searchBtnAdm").click(function(){
					callAdm(1)
				})

    		})
		}
		
		function changeUserStatus(comNo,comOkay){
			$.ajax({
				url : "<c:url value="/admin/userStatusUpdate.do"/>",
				data : "comNo="+comNo+"&comOkay="+comOkay
			}).done(function(data){
				console.log(data)
			})
		}
		function changeAdminStatus(admNo,admOk){
			$.ajax({
				url : "<c:url value="/admin/adminStatusUpdate.do"/>",
				data : "admNo="+admNo+"&admOk="+admOk
			}).done(function(data){
				console.log(data)
			})
		}
		function changeAdminType(admNo,admType){
			$.ajax({
				url : "<c:url value="/admin/adminTypeUpdate.do"/>",
				data : "admNo="+admNo+"&admType="+admType
			}).done(function(data){
				console.log(data)
			})
		}
	</script>
</body>
</html>