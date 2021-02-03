<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<style>
@import url('https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese');
*,body{padding: 0;margin: 0;outline: none;list-style: none;text-decoration: none;color: #000;font-family: "Open Sans", sans-serif;}

.container {
    width: 1000px;
    margin: 90px auto;
}
.upload-btn {
    width: 300px;
    height: 150px;
    border: 2px dashed #000;
    margin: 0 auto;
    padding: 24px;
    text-align: center;
    cursor: pointer;
}
.upload-btn i {
    display: block;
    font-size: 100px;
    color: #000;
}
.upload-btn span {
    font-weight: 600;
    margin-top: 11px;
    display: block;
}
.images {
    width: 98%;
    margin: 20px 0;
    display: inline-block;
}
.images img {
    width: 33%;
    height: 250px;
    object-fit: cover;
    margin: 0;
    padding: 0;
    float: left;
    border: .5px solid #ddd;
    cursor: pointer;
    transition: .8s ease-in-out;
}
.images img:hover{opacity: .5;}

input[type="file"]{display: none;}


</style>
<script>
function selectFile(){
	document.getElementById("upload-file").click()
} 
window.URL = window.URL || window.webkitURL;

function uploads(event){
	let files = event.target.files
	let images = document.getElementById("images")
	
	for (let i = 0; i < files.length; i++) {
		let src = URL.createObjectURL(files[i])
		images.innerHTML += `
		<img src="${src}">
		`
		console.log('src:',src);
	
	}
}

</script>


<div class="container">
	<form method="post" action='<c:url value="/Gallary/GallaryWrite.do"/>' enctype="multipart/form-data">
		<div class="form-group">
        <label for="name">Title</label>
        <input class="form-control" type="text" name="title" id="title" placeholder="제목을 입력하세요?" />
    	</div>


    	<div class="form-group">
      		<label for="message">Content</label>
      		<textarea class="form-control" name="content" rows="15" cols="30" placeholder="내용 입력하세요?"></textarea>
    	</div>
		<div class="upload-btn" onclick="selectFile()">
					<i class="fas fa-cloud-upload-alt"></i>
					<span>Choose files to Upload</span>
					<input type="file" name="upload" id="upload-file" onchange="uploads(event)" multiple="multiple" accept="image/*">
		</div>
		<div class="images" id="images"></div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-primary">등록</button>
			</div>		
		</div>
		
	</form>

</div>
