<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
 
    <title>Start Up</title>
    
    
     <script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
  
  
    <style type="text/css">
        .imgs_wrap {
            width: 750px;
            margin-top: 50px;
        }
        .imgs_wrap img {
            max-width: 250px;
            max-height: 200px
        }
        .x{
           background: white;
           width: 10px; height: 10px;
           border-radius: 5px;
           border: 2.2px solid black;
	       position: relative;
	       left: 400px; top:-230px;
        }
        
 		a:visited, a:hover, a:link { color: black; text-decoration: none;}

 		        table{
        	width: 600px;
        }
        table td:first-child {
			width: 200px;
		}
    </style>
 
</head>
 
<body>
 
    <div>
        <h2><b>이미지 미리보기</b></h2>
        <div class="input_wrap">
            <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
            <input type="file" id="input_imgs" multiple/>
        </div>
    </div>
 
    <div>
        <div class="imgs_wrap">
            <img id="img" />
        </div>
    </div>
 
    <a href="javascript:" class="my_button" onclick="submitAction();">업로드</a>



 <script type="text/javascript">
 
 var sel_files = [];
 
 
 $(document).ready(function() {
     $("#input_imgs").on("change", handleImgFileSelect);
 }); 

 function fileUploadAction() {
     console.log("fileUploadAction");
     $("#input_imgs").trigger('click');
 }
 
 
 function reImageAction(index) {
     var img_id = "#img_id_"+index;
     $(" img[name=re]").removeAttr("name");
     $(img_id+" img").attr("name","re");
 }        

 function handleImgFileSelect(e) {

     // 이미지 정보들을 초기화
     sel_files = [];
     $(".imgs_wrap").empty();

     var files = e.target.files;
     var filesArr = Array.prototype.slice.call(files);

     var index = 0;
     filesArr.forEach(function(f) {
         if(!f.type.match("image.*")) {
             alert("확장자는 이미지 확장자만 가능합니다.");
             return;
         }

         sel_files.push(f);

         var reader = new FileReader();
         reader.onload = function(e) {
        	 html = "<a href=\"javascript:void(0);\" onclick=\"reImageAction("+index+")\"   onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
             $(".imgs_wrap").append(html);
             index++;

         }
         reader.readAsDataURL(f);
         
     });
 }

        

        

        
   



</script>

</body>
</html>