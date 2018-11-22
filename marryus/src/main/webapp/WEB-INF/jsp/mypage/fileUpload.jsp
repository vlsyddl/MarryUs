<!DOCTYPE html>
<html lang="kr">
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
            width: 1200px;
            margin-top: 50px;
        }
        .imgs_wrap img {
            max-width: 400px;
            max-height: 250px
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
 
        // 이미지 정보들을 담을 배열
        var sel_files = [];
 
 
        $(document).ready(function() {
            $("#input_imgs").on("change", handleImgFileSelect);
        }); 
 
        function fileUploadAction() {
            console.log("fileUploadAction");
            $("#input_imgs").trigger('click');
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