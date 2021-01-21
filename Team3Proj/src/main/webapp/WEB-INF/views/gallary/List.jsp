<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<style>
#first_container {
	padding-top: 200px;
	/* 132px이 딱 맞는 크기*/
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<div id="first_container"></div>
<!-- 위의 칸 띄우기 용 -->



<!-- modal 용 css -->

<style>
#user_profile {
    width: 45px;
    height: 45px; 
    border-radius: 70%;
    overflow: hidden;
}
</style>


<!-- modal 모양 View -->

<div class="white_content" id="open">
	<div id="flex_container" style="display: flex;">
		<div style="display: flex; width: 60%;">
			<div id="demo" class="carousel slide" data-ride="carousel" style="height: 100%; width: 100%; box-sizing: border-box;">
				<ol class="carousel-indicators">
				
				</ol>
				<div class="carousel-inner" style="height: 100%; width: 100%; box-sizing: border-box;">
				
				</div>
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
		<!-- div right -->

		<div style="display: flex; width: 40%; flex-direction: column; padding-left: 10px">
			<p align="right">
				<a href="#close">CLOSE&nbsp;&nbsp;</a>
			</p>			
			<div class="flex" style="display: flex;">	
				<img alt="#" src="#" id="user_profile"  onerror="this.src='/veve/resources/assets/images/basic_profile.gif';"/>
				<span id="user_nickname" style="width:50%; padding-left: 20px;padding-top:10px; font-weight: bold; font-size: 2em">nick</span>
				
			</div>
			<hr width="100%">
			
			<div id="board_title" style="padding-top: 10px;font-weight: bold; font-size: 3em;height:50px"></div>
			<div id="board_content" style="padding-top: 10px;font-size: 2.5em;height:150px"></div>
			<hr width="100%">
			<div id="board_comment" style="padding-top: 10px;height:130px">댓글</div>
			<hr width="100%">
			<div style="padding-top: 10px;height:50px"">
			<i class="fas fa-heart fa-2x" aria-hidden="true"></i>
			<span style="color:red"><i class="fas fa-heart fa-2x" aria-hidden="true"></i></span>
			<i class="fas fa-comment fa-2x" aria-hidden="true"></i>
			<span id="board_date"></span>
			</div>
			<hr width="100%">
			<input type="text" placeholder="댓글 달기..." style="width: 95%;"/>
			<div style="height: 20px">
			</div>
		</div>
		<!-- div left -->

	</div>
	<!-- 외곽 flex container -->
</div>







<!-- 모달 모양 css style -->
<style>
.white_content {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.6);
	opacity: 0;
	-webkit-transition: opacity 400ms ease-in;
	-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;
	pointer-events: none;
	z-index: 10;
}

.white_content:target {
	opacity: 1;
	pointer-events: auto;
}

.white_content>div {
	position: absolute;
	top: 15%;
	left: 15%;
	width: 75%;
	height: 75%;
	background-color: white;
	overflow: hidden;
}

.gallery-item a:hover {
	color: white;
	text-decoration: underline;
}
</style>




<!-- mian 인스타 페이지 -->
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/galleryList.css"/>">
<main>
	<div class="container">
		<div class="gallery">
			<c:forEach var="item" items="${boardList}" varStatus="var">
				<div class="gallery-item" tabindex="0">
					<img src="<c:url value='/upload/${fileList[var.index].fileName}'/>"
						class="gallery-image" alt="">
					<div class="gallery-item-info" onclick="view(${item.gallary_no})">
						<ul>
							<li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
								class="fas fa-heart" aria-hidden="true"></i> 56</li>
							<li class="gallery-item-comments"><span
								class="visually-hidden">Comments:</span><i
								class="fas fa-comment" aria-hidden="true"></i> 2</li>
						</ul>
					</div>

				</div>
			</c:forEach>
		</div>
		<!-- End of gallery -->
		<div class="loader"></div>
	</div>
	<!-- End of container -->
	<a id="a_open" href="#open" hidden=""></a>

</main>



















<div style="height: 170px"></div>
<div class="row">
	<div class="col-md-10 text-right">
		<a href="<c:url value="/Gallary/GallaryWrite.do"/>"
			class="btn btn-success">작성</a>
	</div>
</div>



<script>
function view(board_no){
	console.log("테이블 번호:",board_no);
	
	$.ajax({
		type:"post",
		url:"<c:url value='/Gallary/View.do'/>",
		dataType: 'json',
		//traditional: true,
		data:{'gallary_no':board_no},
		success:function(data){
			//var json = JSON.parse(data);
			var filenames = data["filenames"];
			console.log(filenames);
			var fileCount = filenames.split("/").length-1
			console.log(fileCount);
			var files = filenames.split("/");
			console.log(files);
			var src = '/veve/upload/';
			console.log(src)
			//$('#user_profile')
			var userk1n0 = data["userk1n0"];
			console.log(userk1n0);
			if(userk1n0=='1'){
				$('#user_profile').attr('src',data["userfile"]);
			}
			else{
				$('#user_profile').attr('src',src+data["userfile"]);
			}
			//userNickname
			$('#user_nickname').html(data["usernickname"]);
			$('#board_title').html(data["boardTitle"]);
			$('#board_content').html(data["boardContent"]);
			$('#board_date').html(data["boardDate"]);
			
		
			
			$(".carousel-inner *").remove();
			$(".carousel-indicators *").remove();

			$.each(files,function(index,value){
				if(index==0){
					//appendDivFirst(value,src);
					$('.carousel-indicators').append('<li data-target="#demo" data-slide-to="0" class="active"></li>');	
					$('.carousel-inner').append(`
							<div class="carousel-item active" style="height: 100%; width: 100%;">
				         <img src="`+src+value+`" class="gallery-image" alt="" style="height:100%; widhth:100%" > 
				        </div> `);	
					
				
					
				}
				else if(index != fileCount){
					$('.carousel-indicators').append('<li data-target="#demo" data-slide-to="'+index+'"></li>');	
					$('.carousel-inner').append(`
						<div class="carousel-item" style="height: 100%; width: 100%;">
				        <img src="`+src+value+`" class="gallery-image" alt="" style="height:100%; widhth:100%" > 
				        </div> `);	
						
				}

				
			});//each
			
			//showComments(board_no);
			
			$('#a_open').get(0).click();
			
		}//success	
		
	});//ajax	
	
	
	

}
//현재 글번호에 대한 모든 댓글을 요청하는 함수
function showComments(board_no){
   console.log('showComments board_no',board_no);
   $.ajax({
      url:"<c:url value='/Gallary/Comment/list.do'/>",
      data:{"gallary_no":board_no},
      dataType:'json',
      type:'post',
      success:function(data){
    	  console.log('댓글 완료!');
      },
      error:function(e){console.log(e);}
      
   });
   
}//////////////showComments




</script>








