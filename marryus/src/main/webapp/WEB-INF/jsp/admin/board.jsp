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
                <li class="active"><a href="<c:url value="/admin/board.do" />"><i class="fas fa-list"></i> Boarad</a></li>
                <c:if test="${admin.admType eq 'sadm'}">
                	<li><a href="<c:url value="/admin/user.do"/>"><i class="fas fa-user-cog"></i> User</a></li>
                </c:if>
                <li><a href="#"><i class="fas fa-gift"></i> Event</a></li>
            </ul>
        </nav>
    </aside>
    <div id="wrap" class="board cf">
        <h2 class="title">
            Admin Board
        </h2>
        <section class="itemWrap">
           	<div class="contentsTab">
                <ul>
                    <li data-target="nt" class="on"><a href="javascript:void(0);">공지게시판</a></li>
                    <li data-target="rv"><a href="javascript:void(0);">후기게시판</a></li>
                    <li data-target="fr"><a href="javascript:void(0);">신부대기실</a></li>
                    <li data-target="mm"><a href="javascript:void(0);">1:1 문의</a></li>
                    <li data-target="fq"><a href="javascript:void(0);">FAQ</a></li>
                </ul>
                <div class="tabContents">
                    <div class="tab1 on">
                       <table class="table list" data-category="nt">
                            <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th>글제목</th>
                                    <th>글쓴이</th>
                                    <th class="answerStat" style="display: none;">답변여부</th>
                                    <th>조회수</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                        </table>
                        <a href="#" class="writeBtn">글쓰기</a>
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
                    <div class="tab2" style="display:none;">
                    	<div class="faqWrap">
                    		<dl>
                    			<dt class="title on">
                    				<a href="#">
                    					title
                    				</a>
                    			</dt>
                    			<dd class="content" style="display: block;">
                    				content
                    			</dd>
                    		</dl>
                    		<dl>
                    			<dt class="title">
                    				<a href="#">
                    					title
                    				</a>
                    			</dt>
                    			<dd class="content">
                    				content
                    			</dd>
                    		</dl>
                    		<dl>
                    			<dt class="title">
                    				<a href="#">
                    					title
                    				</a>
                    			</dt>
                    			<dd class="content">
                    				content
                    			</dd>
                    		</dl>
                    	</div>
                    	  <a href="#" class="writeBtn">글쓰기</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- Modal -->
    <!-- 게시판 디테일 -->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title detailTitle" id="myModalLabel"></h4>
	        <div class="detailInfo">
	        	<span class="name"></span> | 
	        	<span class="date"></span> | 
	        	<span class="viewCnt"></span>
	        </div>
	      </div>
	      <div class="modal-body">
	        <div class="detailContent"></div>
	        <div class="detailAnswer" >
	        	<div class="content">
	        		
	        	</div>
	        	<div class="btnBox">
	        		<a href="#" class="answer_modify_form">수정</a>
	        		<a href="#" class="delete">삭제</a>
	        	</div>
	        </div>
	        <div class="insertAnswer" >
	        	<div class="content">
	        		<form id="answerInsertForm">
	        			<input type="hidden" name="questionNo" id="questionNo">
	        			<textarea rows="5" cols="30" id="answer_insert_content" name="content" style="width:100%; " class="form-control"></textarea>
	        		</form>
	        	</div>
	        	<div class="btnBox">
	        		<a href="#" class="insert" id="answer_insert">등록</a>
	        		<a href="#" class="delete">취소</a>
	        	</div>
	        </div>
	        <div class="modifyAnswer">
	        	<form id="answerModifyForm">
	        		<input type="hidden" name="answerNo" id="answerNo">
        			<textarea rows="5" cols="30" id="answer_modify_content" name="content" style="width:100%; " class="form-control"></textarea>
        		</form>
        		<div class="btnBox">
	        		<a href="#" class="modify" id="answer_modify">수정</a>
	        		<a href="#" class="delete">취소</a>
	        	</div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary modifyBoard">수정</button>
	        <button type="button" class="btn btn-primary deleteBoard" data-target="">삭제</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 게시판 등록 -->
	<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	        <form id="insertForm" action="/board/insertBoard.do" method="post"  enctype="multipart/form-data" acceptcharset="UTF-8">
			<input name="writer" id="insert_writer" value="${admin.admName}" type="hidden">
			<input name="category" id="insert_category" value="" type="hidden">
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
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="insert">등록</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 게시판 수정 -->
	<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	        <form id="modifyForm"  method="post"  enctype="multipart/form-data" acceptcharset="UTF-8">
			<input name="boardNo" id="modify_no" value="" type="hidden">
			<div class="form-group">
                               <label for="study_title" class="control-label">글 제목</label>
                               <input class="input form-control" type="text" name="title" id="modify_title" placeholder="글 제목"/>
                           </div>
			<div class="form-group contentForm">
                               <label for="study_content" class="control-label">글 내용</label>                       
                               <textarea rows="10" cols="30" id="modify_content" name="content" style="width:100%; height:350px; "></textarea>
                           </div>
                          
		</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="modify">등록</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    <Script>
    //페이지 실행시 로드
    $(function(){
    	callBoard(1)
    })
    
    //글쓰기 폼 호출
    $(".writeBtn").click(function(){
    	callForm("insert")
    	$("#insert_category").val($(".table.list").data("category"));
    	$('#insertModal').modal('show')
    })
    
	//탭 클릭시 게시판 리로드    
     $(".contentsTab > ul >li").click(function(){
        var target = $(this).data("target")
        $(".tab1").show()
        $(".tab2").hide()
        if(target=="fq"){
	    	$(".tab1").hide()
	    	$(".tab2").show()
	    	callFaq()
        }
        $(".contentsTab > ul >li").removeClass("on")
        $(this).addClass("on")
        $(".table.list").data("category",target);
        $("#searchContent").val("")
        callBoard(1)
    })
    
    
    //검색
	$("#searchBtn").click(function(){
		callBoard(1)
	})
	//엔터 키프레스 이벤트
	$('#searchContent').on('keydown', function(e) {
		if (e.which == 13) {
			callBoard(1)
		}
	});
    
	//게시판 로드 함수
	function callBoard(pageNo){

		$(".table.list > tbody").html(""); //게시판 로드시 본래 게시판 삭제	
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

		$.ajax({
			url : "<c:url value="/admin/boardList.do"/>",
			data : "category="+category+"&pageNo="+pageNo+"&type="+$("#searchType").val()+"&content="+searchWord
		}).done(function(data){
			var html;

			if(data.list.length==0){	//게시물 없을시 텍스트
				html+="<tr>"
				html+="<td colspan='5'>게시물이 존재하지 않습니다</td>"
				html+="</tr>"
			}else{		 			
				for(var b of data.list){
					html +="<tr>"
					html +="<td>"+b.boardNo+"</td>"
					html +="<td><a href='#' data-href='"+b.boardNo+"' data-toggle='modal' data-target='#detailModal'>"+b.title+"</a></td>"
					html +="<td>"+b.writer+"</td>"
					if(category=="mm"){
						html +="<td>"+b.answer+"</td>"
					}
					html +="<td>"+b.viewCnt+"</td>"
					html +="<td>"+new Date(b.regDate).format("yyyy-MM-dd")+"</td>"
					html +="</tr>"
				}
			}
			$(".table.list > tbody").html(html); //게시판 리스트 출력	

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
				pHtml+="<li><a href='#' data-href='"+(parseInt(data.pageResult.endPage)+1)+"'><span aria-hidden='true'>&raquo;</span></a></li>"
			}
			$(".pagination").html(pHtml)

			$(".pagination li a").click(function(e){ //페이징 이동 처리
				e.preventDefault();
				callBoard($(this).data("href"))
			})

			$(".table.list> tbody > tr > td > a").click(function(e){ //디테일 처리
				e.preventDefault();
				detail($(this).data("href"))
			})

		})
	}
		
    	//게시판 디테일
	function detail(no){
		var title = $(".detailTitle");
		var name = $(".detailInfo .name");
		var date = $(".detailInfo .date");
		var viewCnt = $(".detailInfo .viewCnt");
		var content = $(".detailContent");
		var detailAnswer = $(".detailAnswer");
		var insertAnswer = $(".insertAnswer");
		var modifyAnswer = $(".modifyAnswer");
		title.html("");
		name.html("");
		date.html("");
		viewCnt.html("");
		content.html("");
		detailAnswer.hide();
		insertAnswer.hide();
		modifyAnswer.hide();
		$.ajax({
			url : "<c:url value="/admin/boardDetail.do" />",
			data : "boardNo="+no
		}).done(function(data){
			title.html(data.title)		
			name.html(data.writer)		
			date.html(new Date(data.regDate).format("yyyy-MM-dd"))		
			viewCnt.html(data.viewCnt)		
			content.html(data.content)
			if(data.category=="mm"){
				if(data.answer=="n"){
					$("#questionNo").val(data.boardNo)
					insertAnswer.show();
					$("#answer_insert").click(function(){
						insert_answer()
					})
				}else{
					detail_answer(data.boardNo);
					detailAnswer.show();
				}
			}
			$(".deleteBoard").attr("onclick","deleteBoard("+data.boardNo+")")

			$(".modifyBoard").click(function(){
				$("#modify_no").val("")	
				$("#modify_title").val("")
				$("#modify_no").val(data.boardNo)	
				$("#modify_title").val(data.title)
				callForm("modify",data.content)
				$('#detailModal').modal("hide")
				$('#modifyModal').modal('show')
			})
		})
	}

	//게시판 등록
	function insertBoard(){
		var formData = new FormData($("#insertForm")[0]);

		$.ajax({
			url : "/marryus/admin/boardInsert.do",
			data : formData,
			type : "POST",
			processData : false,
			contentType : false
		}).done(function(data){
			if(data=="success"){
				alert("게시물이 등록되었습니다.")
				$('#insertModal').modal('hide')
				callBoard(1);
			}else{
				alert("게시물이 등록이 실패하였습니다.</br>다시 확인해 주세요")
			}
			
		}) 
	}

	//게시판 수정
	function updateBoard(){
		var formData = new FormData($("#modifyForm")[0]);
		$.ajax({
			url : "/marryus/admin/boardUpdate.do",
			data : formData,
			type : "POST",
			processData : false,
			contentType : false
		}).done(function(data){
			if(data=="success"){
				alert("게시물이 수정되었습니다.")
				$('#modifyModal').modal('hide')
				callBoard(1);
			}else{
				alert("게시물이 수정이 실패하였습니다.</br>다시 확인해 주세요")
			}
		}) 
	}
    	
	//게시판 삭제
	function deleteBoard(boardNo){
		$.ajax({
			url : "/marryus/admin/boardDelete.do",
			data : "boardNo="+boardNo
		}).done(function(data){
			if(data=="success"){
				alert("게시물이 삭제되었습니다.")
				$('#detailModal').modal('hide')
				callBoard(1);
			}else{
				alert("게시물이 삭제 실패하였습니다.</br>다시 확인해 주세요")
			}
			
		}) 
	}
	
	//답변등록
	function insert_answer(){
		var formData = new FormData($("#answerInsertForm")[0]);
		$.ajax({
			url:"/marryus/admin/answerInsert.do",
			data : formData,
			type : "POST",
			processData : false,
			contentType : false
		}).done(function(data){
			if(data=="success"){
				alert("답변이 등록되었습니다.")
				$('#detailModal').modal('hide')
				callBoard(1)
			}else{
				alert("답변 등록이 실패하였습니다.</br>다시 확인해 주세요")
			}
		})
	}
	
	//답변 디테일
	function detail_answer(questionNo){
		$.ajax({
			url : "/marryus/admin/answerDetail.do",
			data : "questionNo="+questionNo
		}).done(function(data){
			console.log(data)
			$(".detailAnswer .content").html(data.content)
			$(".answer_modify_form").click(function(){
				$("#answerNo").val(data.answerNo)
				$("#answer_modify_content").val(data.content)
				$(".detailAnswer").hide();
				$(".modifyAnswer").show();
				$("#answer_modify").click(function(){
					modify_answer();
				})
			})
		})
	}
	
	//답변수정
	function modify_answer(){
		var formData = new FormData($("#answerModifyForm")[0]);
		$.ajax({
			url:"/marryus/admin/answerUpdate.do",
			data : formData,
			type : "POST",
			processData : false,
			contentType : false
		}).done(function(data){
			if(data=="success"){
				alert("답변이 수정되었습니다.")
				$('#detailModal').modal('hide')
			}else{
				alert("답변 수정이 실패하였습니다.</br>다시 확인해 주세요")
			}
		})
	}
	
   	//faq 호출
   	function callFaq(){
   		$.ajax({
   			url: "/marryus/admin/faqList.do",
   		}).done(function(data){
   			var html="";
   			if(data.length==0){
   				html +="<h2>등록된 FAQ가 없습니다</h2>"
   			}else{
   				for( var b of data){
   	   				html+="<dl>"
   	   				html+="<dt><a href='#'>"+b.title+"</a></dt>"
   	   				html+="<dd>"+b.content+"</dd>"
   	   				html+="</dl>"
   	   			}
   			}
   			$(".faqWrap").html(html)
   			$(".faqWrap dl").eq(0).find("dt").addClass("on")
   			$(".faqWrap dl").eq(0).find("dd").css({"display":"block"})
   			$(".faqWrap dl dt a").click(function(e){
				e.preventDefault();
				$(".faqWrap dl dt").removeClass("on")
				$(this).parent().addClass("on")
				$(".faqWrap dl dd").slideUp(300)
				$(this).parent().siblings("dd").slideDown(300)
			})
   		})
   	}
    	//게시판 수정
    	
	//스마트에디터 호출
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
			var content = $("#"+area+"Form").find("#"+area+"_content").val();
			if($("#"+area+"Form").find("input[name=title]").val()==""){
				alert("제목을 입력해 주세요")
				$("#"+area+"_title").focus()
				return;
			}
			if(area=="insert"){
				if( content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>')  {
					alert("내용을 입력해주세요.");
					oEditors.getById[area+"_content"].exec("FOCUS"); //포커싱
					return;
				}
			}

			if(area == "insert"){
				insertBoard();	  
			}else if(area=="modify"){
				updateBoard();
			}
		});   

		if($(".form-group").find("iframe").length>1){
			$(".form-group").find("iframe").eq(0).remove();
		}
	}
    	
    	//날짜 처리
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
    </Script>
</body>
</html>