<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marry Us</title>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	 <link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
	 <link rel="stylesheet" href="<c:url value="/resources/js/waitme/waitMe.css"/>">
	 <script src="<c:url value="/resources/js/waitme/waitMe.js"/>"></script>
	 <script type="text/javascript" src="/marryus/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
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
	                       	<li><a href="<c:url value='/board/list.do?category=nt'/>">공지게시판</a></li>
	                        <li class="on"><a href="<c:url value='/board/review.do'/>">후기 게시판</a></li>
	                        <li ><a href="<c:url value='/board/list.do?category=fr'/>">신부 대기실    </a></li>
	                        <li ><a href="<c:url value='/board/list.do?category=mm'/>">1:1 질문</a></li>
	                        <li ><a href="<c:url value='/board/list.do?category=fq'/>">FAQ</a></li>
	                    </ul>
	                   <div class="communityContents">
		                   <div class="searchWrap reviewSearch">
			               	 <form action="" id="search">
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
							   <c:if test="${user != null }">							   	
								   <div class="btnBox">
									   <a href="#" class="myBtn">내가 쓴 글보기</a>
									   <a href="#" class="allBtn">전체 글보기</a>
									   <a href="#" class="writeBtn" >글쓰기</a>							   
								   </div>
							   </c:if>
							</div>
	                   		<div id="columns" class="review">
                      				<%-- <figure class="wow bounceIn" data-wow-delay="0.5s" data-href="${b.boardNo}">
                          				<div class="figureWrap">
										<img src="<c:url value="/resources/"/>img/review01.jpg" class="img-responsive center-block"> 
										<figcaption>
											<dl>
												<dt>${b.title}</dt>
												<dd>
													<span class="name">${b.writer}</span>님 <span class="date"><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd" /></span>
												</dd>
												<dd>
													<ul>
														<li class="views"><i class="far fa-kiss-wink-heart"></i> ${b.viewCnt}</li>
														<li class="comment"><i class="far fa-comment-dots"></i> 123</li>
													</ul>
												</dd>
											</dl>
										</figcaption>
                          				</div> 
								</figure> --%>
								<div class="lastPage" style="width: 100%; text-align: center; position: absolute; bottom: 0; padding: 10px 0; color: #fff; background: rgba(0,0,0,0.5); display: none;">마지막 페이지 입니다</div>
							</div>
	                   </div>
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
                
                callReview(1)
            });
            
            $(".writeBtn").click(function(e){
            	e.preventDefault();
            	callForm("insert")
            	$("#insert_title").val("")
				$(".dropzone").find("img").hide(300);
				$(".dropzone").find("span").show(300);
            	if($("#insertForm .form-group").find("iframe").length>1){
     			     $("#insertForm .form-group").find("iframe").eq(0).remove();
     		     }
            	$("#insertModal").modal("show")
            })
            $("#searchBtn").click(function(e){
            	e.preventDefault();
            	$("#columns").html("")
            	callReview(1)
            })
            $(".myBtn").click(function(e){
            	e.preventDefault();
            	$("#searchContent").val("${user.email}")
            	$("#searchType").find("option:eq(2)").prop("selected", true);
            	$("#columns").html("")
            	callReview(1)
            })
            $(".allBtn").click(function(e){
            	e.preventDefault();
            	$("#searchContent").val("")
            	$("#searchType").find("option:eq(0)").prop("selected", true);
            	$("#columns").html("")
            	callReview(1)
            })
         
            var pageNo = 1;
            var boardCount;
           	var lastPage;
           	
           	//리스트 로드
            function callReview(pageNo){
            	waitMe();
            	var searchWord = ''; //처음 검색어 비우기
        		var category=$(".table.list").data("category"); //카테고리 셋팅

        		if(category=="mm"){ 		//게시판별 품목 수정
        			$(".answerStat").show()
        		}else{
        			$(".answerStat").hide()
        		}

        		if($("#searchContent").val() == ''){ //검색어 처리
        			searchWord = 'null'			  
        		}else{
        			searchWord = $("#searchContent").val()
        		}

            	if(pageNo > lastPage){
            		$(".lastPage").show(300)
            		setTimeout(function(){
            			$("#columns").waitMe("hide")
            		},500)
            		return;
            	}
            	$.ajax({
            		url:"<c:url value="/board/review/list.json"/>",
            		data : "pageNo="+pageNo+"&type="+$("#searchType").val()+"&content="+searchWord
            	}).done(function(data){
            		var html="";
            		var rSec
            		boardCount = data.boardCount
            		lastPage = data.pageResult.lastPage; 
            		if(data.list.length==0){
            			html="<h2>게시물이 존재하지 않습니다.</h2>"
           				
            		}else{
            			for(var b of data.list){
            				
            				rSec = Math.floor(Math.random()*10)/10;
            				html+='<figure class="wow bounceIn" data-wow-delay="'+rSec+'s" data-href="'+b.boardNo+'">'
              				html+='<div class="figureWrap">'
							html+='<img src="/marryus/'+b.attach.filePath+'/'+b.attach.fileName+'" onError="javascript:this.src=\'<c:url value="/resources/img/sorry.png"/>\'"class="img-responsive center-block">' 
							html+='<figcaption>'
							html+='<dl>'	
							html+='<dt>'+b.title+'</dt>'		
							html+='<dd>'		
							html+='<span class="name">'+b.writer+'</span>님 <span class="date">'+new Date(b.regDate).format("yyyy-MM-dd")+'</span>'			
							html+='</dd>'		
							html+='<dd>'		
							html+='<ul>'
							html+='<li class="views"><i class="far fa-kiss-wink-heart"></i>'+b.viewCnt+'</li>'
							html+='<li class="comment"><i class="far fa-comment-dots"></i> 123</li>'
							html+='</ul>'				
							html+='</dd>'			
							html+='</dl>'									
							html+='</figcaption>'	
							html+='</div>'
              				html+='</figure>' 
            			}
            		}
            		$("#columns").append(html)
            		setTimeout(function(){
            			$("#columns").waitMe("hide")
            		},500)
            		
            		$("figure").click(function(){
            			var boardNo = $(this).data("href")
            			detail(boardNo);
            			$("#detailModal").modal("show")
            			 $('#detailModal').on('shown.bs.modal', function (){            				 
	            			$("#detailModal .textWrap").css({"height":$("#detailModal .imgWrap").outerHeight()+"px" })
	            			
            			 })
            		})
            		
            	})
            }
           
           	//디테일 
            function detail(boardNo){
            	var modal = $("#detailModal")
            	modal.find(".modal-title").html("")
            	$.ajax({
            		url:"<c:url value="/board/review/detail.json"/>",
            		data : "boardNo="+boardNo
            	}).done(function(data){
            		modal.find(".modal-title").html(data.board.title)
            		modal.find(".infoBox").find(".name").find("dd").html(data.board.writer)
            		modal.find(".infoBox").find(".date").find("dd").html(new Date(data.board.regDate).format("yyyy-MM-dd"))
            		modal.find(".infoBox").find(".view").find("dd").html(data.board.viewCnt)
            		modal.find(".textWrap").html(data.board.content)
            		$("#detailModal .imgWrap img").attr("src","/marryus/"+data.attach.filePath+"/"+data.attach.fileName)
       				$("#deleteBtn").attr("onclick","deleteBoard("+data.board.boardNo+")")
            		if(data.board.writer== "${user.email}"){
            			$("#modifyBtn").show();
            			$("#deleteBtn").show();
            		}else{
            			$("#modifyBtn").hide();
            			$("#deleteBtn").hide();
            		}
            		$("#commentBoardNo").val(data.board.boardNo)
            	})
            	commentList(boardNo)
            	$("#modifyBtn").click(function(){
            		modifyForm(boardNo)
            		$("#detailModal").modal("hide")
            		$("#modifyModal").modal("show")
            	})
                   
            }
           	 
            
           	//덧글
            function commentList(boardNo){
            	$(".commentList").html("")
            	$.ajax({
            		url : "<c:url value="/board/review/commentList.json"/>",
            		data : "boardNo="+boardNo
            	}).done(function(data){
            		var html ='';
            		for(var c of data){
            			html+='<li>'
		       			html+='<div class="commentInfo">'
		       			html+='<span class="commentName">'+c.commWriter+'</span>'
		       			html+='<span class="commentDate">'+new Date(c.commDate).format("yyyy-MM-dd")+'</span>'
		       			if(c.commWriter=="${user.email}"){		       				
			       			html+='<a class="deleteComment" href="#" onclick="deleteComment('+c.commNo+','+boardNo+')"><i class="fas fa-trash-alt"></i> 삭제</a>'		
		       			}
		       			html+='</div>'		
	       				html+='<div class="commentContents">'+c.commContent+'</div>'	
		       			html+='</li>'		       			
            		}
            		$(".commentList").html(html)
            	})
            } 
           	
           	//파일미리보기
			var files = new Array();
            $(function () {
				var obj = $(".dropzone");

				obj.on('dragenter', function (e) {
					e.stopPropagation();
					e.preventDefault();
					$(this).css('border', '2px solid #5272A0');
				});

				obj.on('dragleave', function (e) {
					e.stopPropagation();
					e.preventDefault();
					$(this).css('border', '2px dotted #8296C2');
				});

				obj.on('dragover', function (e) {
					e.stopPropagation();
					e.preventDefault();
				});

				obj.on('drop', function (e) {
					e.preventDefault();
					$(this).css('border', '2px dotted #8296C2');

					 files = e.originalEvent.dataTransfer.files;
					if(files.length < 1)
						return;
					console.log(files)
					$(this).find("span").hide(300);
					$(this).find("img").show(300);
					var reader = new FileReader();

						reader.onload = function(e) {
							$('.dropzone img').attr('src', e.target.result);
						}

						reader.readAsDataURL(files[0]);
				});

			});
            
            
            //글등록
			function insertBoard(){
				var formData = new FormData($("#insertForm")[0]);
				if(files.length !=0){					
					formData.append('file', files[0]);
				}else{
					alert("대표사진을 등록해주세요")
					return;
				}
				$.ajax({
					url : "<c:url value="/board/review/write.json"/>",
					data : formData,
					type : "POST",
					processData : false,
					contentType : false
				}).done(function(data){
					$("#columns").html("")
					callReview(1)
					console.log(data)
					$("#insertModal").modal("hide")
           			detail(data);
           			$("#detailModal").modal("show")
           			 $('#detailModal').on('shown.bs.modal', function (){            				 
            			$("#detailModal .textWrap").css({"height":$("#detailModal .imgWrap").outerHeight()+"px" })
            			
           			 })
				}) 
			}
            
			//수정폼
            function modifyForm(boardNo){
            	var modal = $("#modifyModal")
            	$.ajax({
            		url:"<c:url value="/board/review/detail.json"/>",
            		data : "boardNo="+boardNo
            	}).done(function(data){
    	            $("#modify_no").val(data.board.boardNo)
    	            $("#file_no").val(data.attach.fileNo)
    	            $("#modify_title").val(data.board.title)
    	            $(".dropzone").find("img").attr("src","/marryus/"+data.attach.filePath+"/"+data.attach.fileName)
        			callForm("modify",data.board.content)
        		      //저장버튼 클릭시 form 전송
        			if($("#modifyForm .form-group").find("iframe").length>1){
    	   			     $("#modifyForm .form-group").find("iframe").eq(0).remove();
    	   		     }
    	            $(".dropzone").find("span").hide(300);
					$(".dropzone").find("img").show(300);
            	})
            }
			// 글수정
            function updateBoard(){
				var formData = new FormData($("#modifyForm")[0]);
				if(files.length !=0){					
					formData.append('file', files[0]);
				}
				$.ajax({
					url : "<c:url value="/board/review/update.json"/>",
					data : formData,
					type : "POST",
					processData : false,
					contentType : false
				}).done(function(data){
					$("#columns").html("")
					callReview(1)
					console.log(data)
					$("#modifyModal").modal("hide")
           			detail(data);
           			$("#detailModal").modal("show")
           			 $('#detailModal').on('shown.bs.modal', function (){            				 
            			$("#detailModal .textWrap").css({"height":$("#detailModal .imgWrap").outerHeight()+"px" })
            			
           			 });
				}) ;
			};
			
			//글삭제
            function deleteBoard(boardNo){
				$.ajax({
					url : "<c:url value="/board/review/deleteBoard.json"/>",
					data : "boardNo="+boardNo
				}).done(function(data){					
					console.log(data);
					if(data.result=="success"){
						alert("게시물이 삭제되었습니다")
					}else{
						alert("삭제 실패했습니다")
					}
					$("#detailModal").modal("hide")
					$("#columns").html("");
					callReview(1);
				}).fail(function(data){
					alert("실패")
				})
			};
			
			//댓글 입력
			function insertComment(){
				var formData = new FormData($("#insertComment")[0])
				$.ajax({
					url : "<c:url value="/board/review/insertComment.json"/>",
					data : formData,
					type : "POST",
					processData : false,
					contentType : false
				}).done(function(data){
					$("#commentContent").val("")
					commentList(formData.get("boardNo"))
				});
			};
			
			//댓글 삭제
			function deleteComment(commNo,boardNo){
				$.ajax({
					url : "<c:url value="/board/review/deleteComment.json"/>",
					data : "commNo="+commNo
				}).done(function(data){
					commentList(boardNo)
				})			
			}
			
           	//스크롤 로딩
            $(window).scroll(function(){
         	   var sct = $(window).scrollTop()
         	   var height = $("#columns").outerHeight();
         	   
         	   if(sct > height-300){
         		   pageNo ++;
         		   setTimeout(callReview(pageNo),300)
         		   
         	   };
            });
            
            //레이지로드
            function waitMe(){
	    		$("#columns").waitMe({
					effect : 'win8',
					text : 'Loding',
					bg : 'rgba(0,0,0,0.3)',
					color : '#ffffff',
					fontSize : '32px'
				});
	    	}
			
			//네이버에디터 
            function callForm(area,content){
            	 
	    		if(content == undefined){
	    			content = ""
	    		}
	    		 var oEditors = [];

	    		 nhn.husky.EZCreator.createInIFrame({
	 		          oAppRef: oEditors,
	 		          elPlaceHolder: area+"_content", //textarea에서 지정한 id와 일치해야 합니다. 
	 		          //SmartEditor2Skin.html 파일이 존재하는 경로
	 		          sSkinURI: "/marryus/resources/se2/SmartEditor2Skin.html",  
	 		          htParams : {
	 		              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	 		              bUseToolbar : true,             
	 		              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	 		              bUseVerticalResizer : true,     
	 		              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	 		              bUseModeChanger : true,         
	 		              fOnBeforeUnload : function(){
	 		              }
	 		          },
	 		          
	 		          fOnAppLoad : function(){
	 		              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	 		              oEditors.getById[area+"_content"].exec("PASTE_HTML", [content]);
	 		          },
	 		          fCreator: "createSEditor2"
	 		      });
	
	 			 $("#"+area).click(function(){
	 				
	 				 oEditors.getById[area+"_content"].exec("UPDATE_CONTENTS_FIELD", []);
	 				var content = $("#"+area+"_content").val();
	 				/*  if($("input[name=title]").val()==""){
			        	alert("제목을 입력해 주세요")
			        	$("#"+area+"_title").focus()
			        	return;
			         }
	 				if( content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>')  {
	 		             alert("내용을 입력해주세요.");
	 		             oEditors.getById[area+"_content"].exec("FOCUS"); //포커싱
	 		             return;
	 		        } */
			          if(area == "insert"){
			        	  insertBoard();	  
			          }else if(area=="modify"){
			        	  updateBoard();
			          }
			      });   
	    	}
            
            //날짜 정리
            Date.prototype.format = function(f) {
                if (!this.valueOf()) return " ";
             
                var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
                var d = this;
                 
                return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
                    switch ($1) {
                        case "yyyy": return d.getFullYear();
                        case "yy": return (d.getFullYear() % 1000).zf(2);
                        case "MM": return (d.getMonth() + 1).zf(2);
                        case "dd": return d.getDate().zf(2);
                        case "E": return weekName[d.getDay()];
                        case "HH": return d.getHours().zf(2);
                        case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
                        case "mm": return d.getMinutes().zf(2);
                        case "ss": return d.getSeconds().zf(2);
                        case "a/p": return d.getHours() < 12 ? "오전" : "오후";
                        default: return $1;
                    }
                });
            };
             
            String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
            String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
            Number.prototype.zf = function(len){return this.toString().zf(len);};
        </script>
	<!-- Modal -->
	<!-- 디테일 모달 -->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
	        <div class="infoBox">
	        	<dl class="name">
	        		<dt>작성자 : </dt>
	        		<dd></dd>
	        	</dl>
	        	<dl class="date">
	        		<dt>작성일 : </dt>
	        		<dd></dd>
	        	</dl>
	        	<dl class="view">
	        		<dt>조회수 : </dt>
	        		<dd></dd>
	        	</dl>
	        </div>
	      </div>
	      <div class="modal-body">
	       <div class="row">	       	
		        <div class="col-md-6 detailLeft">
		        	<div class="imgWrap">
		        		<img alt="" src="" class="img-responsive center-block">
		        	</div>
		        </div>
		        <div class="col-md-6 detailRight">
		        	<div class="textWrap">
		        		
		        	</div>
		        </div>
	       </div>
	       <div class="commentBox">
	       		<c:if test="${user != null }">	       			
		       		<div class="inputBox">
		       			<div class="row">	       				
			       			<form id="insertComment" class="col-md-10">
			       				<input type="hidden" name="boardNo" id="commentBoardNo" value=""/>
			       				<input type="hidden" name="commWriter" value="${user.email}"/>
			       				<textarea rows="3" cols="100" class="form-control" name="commContent" id="commentContent"></textarea>
			       			</form>
			       			<div class="col-md-2">
			       				<a class="commentInputBtn" href="#" onclick="insertComment()">댓글 남기기</a>
			       			</div>
		       			</div>
		       		</div>
	       		</c:if>
	       		<ul class="commentList">
	       			<!-- <li>
	       				<div class="commentInfo">
	       					<span class="commentName">이름</span>
	       					<span class="commentDate">2018-12-06</span>
	       					<a class="modifyComment" href="#"><i class="fas fa-wrench"></i> 수정</a>
	       					<a class="deleteComment" href="#"><i class="fas fa-trash-alt"></i> 삭제</a>
       					</div>
	       				<div class="commentContents">
	       					코멘트 컨텐츠
	       				</div>
	       			</li> -->
	       		</ul>
	       </div>
	      </div>
	      <div class="modal-footer">
  		 	<button type="button" class="btn btn-default" id="modifyBtn" style="display: none;">수정</button>
  		 	<button type="button" class="btn btn-default" id="deleteBtn" style="display: none;">삭제</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 글쓰기 모달 -->
	<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">글 쓰기</h4>
	      </div>
	      <div class="modal-body">
			<div class="row">
				<div class="col-md-4 form-left">					
					<div class="dropzone" ><span>대표사진을 올려주세요</span> <img src="" id="blah" class="img-responsive center-block"></div> 
				</div>
				<div class="col-md-8 form-right">					
					<form id="insertForm">
						<input name="writer" id="insert_writer" value="${user.email}" type="hidden">
						<div class="form-group">
							<label for="insert_title" class="control-label">글 제목</label>
							<input class="input form-control" type="text" name="title" id="insert_title" placeholder="글 제목"/>
						</div>
						<div class="form-group contentForm">
							<label for="insert_content" class="control-label">글 내용</label>                       
							<textarea rows="10" cols="30" id="insert_content" name="content" style="width:100%; height:350px; "></textarea>
						</div>
					</form>
				</div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="insert">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 수정 모달 -->
	<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">글 쓰기</h4>
	      </div>
	      <div class="modal-body">
			<div class="row">
				<div class="col-md-4 form-left">					
					<div class="dropzone" ><span>대표사진을 올려주세요</span> <img src="" id="blah" class="img-responsive center-block"></div> 
				</div>
				<div class="col-md-8 form-right">					
					<form id="modifyForm">
						<input type="hidden" name="boardNo" id="modify_no" value="">
						<input type="hidden" name="fileNo" id="file_no" value="">
						<input name="writer" id="modify_writer" value="${user.email}" type="hidden">
						<div class="form-group">
							<label for="insert_title" class="control-label">글 제목</label>
							<input class="input form-control" type="text" name="title" id="modify_title" placeholder="글 제목"/>
						</div>
						<div class="form-group contentForm">
							<label for="modify_content" class="control-label">글 내용</label>                       
							<textarea rows="10" cols="30" id="modify_content" name="content" style="width:100%; height:350px; "></textarea>
						</div>
					</form>
				</div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="modify">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script>
	
	</script>
</body>
</html>