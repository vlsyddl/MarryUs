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
  
  
    <style type="text/css">
        .imgs_wrap {
            width: 90%;
            margin-top: 50px;
        }
        .imgs_wrap img {
            max-width: 30%;
        }
        .x{
	       position: relative;
	       right: 0px; top: 0px;
        }
 
    </style>
 
</head>
 
<body>
 
    <div>
        <div class="input_wrap">
            <a href="javascript:" onclick="fileUploadAction();" class="my_button">file upload</a>
            <input type="file" id="input_imgs" multiple/>
        </div>
    </div>
 
    <div>
        <div class="imgs_wrap">
            <img id="img" />
        </div>
    </div>
 
    <a href="javascript:" class="my_button" onclick="submitAction();">upload</a>



 <script type="text/javascript">
        var sel_files = [];
 
 
        $(document).ready(function() {
            $("#input_imgs").on("change", handleImgFileSelect);
        }); 
 
        function fileUploadAction() {
            console.log("fileUploadAction");
            $("#input_imgs").trigger('click');
        }
 
        function handleImgFileSelect(e) {
 ÂÂ
            sel_files = [];
            $(".imgs_wrap").empty();
 
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            var index = 0;
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("ì¬ë°ë¥¸ íìì´ ìëëë¤.");
                    return;
                }
 
                sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                	var html = "<div id=\"img_id_"+index+"\"><a class=\"x\" href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" \">X</a><img onclick=\"reImageAction("+index+")\" src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></div>";
                	
   
                	
                	
                    $(".imgs_wrap").append(html);
                    index++;
 
                }
                reader.readAsDataURL(f);
                
            });
            
        }
        

        

        
        function deleteImageAction(index) {
            console.log("index : "+index);
            sel_files.splice(index, 1);
 
            var img_id = "#img_id_"+index;
            $(img_id).remove();
 
            console.log(sel_files);
            console.log(sel_files.length);
        }        
        
        
        function reImageAction(index) {
            var img_id = "#img_id_"+index;
            $(" img[name=re]").removeAttr("name");
            $(img_id+" img").attr("name","re");
        }        


        function submitAction() {   
        	console.log("dsfklsdjfl");
            var data = new FormData();
 
            for(var i=0, len=sel_files.length; i<len; i++) {
                var name = "image_"+i;
                data.append(name, sel_files[i]);
                console.log(sel_files[i])
            }
            data.append("image_count", sel_files.length);
           
 
            var xhr = new XMLHttpRequest();
            xhr.open("POST","./image.do");
            xhr.onload = function(e) {
                if(this.status == 200) {
                    console.log("Result : "+e.currentTarget.responseText);
                }
            }
 
            xhr.send(data);
 
        }

</script>

</body>
</html>