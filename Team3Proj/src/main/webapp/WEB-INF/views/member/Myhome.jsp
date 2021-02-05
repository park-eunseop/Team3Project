<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/galleryList.css"/>">

<script>
	$(function() { //화면 다 뜨면 시작
		var arraydata;
		$.ajax({
			type : 'post',
			url : "<c:url value="/json"/>",
			dataType : "json",
			success : function(data) {
				console.log("%O", Object.values(data));
				arraydata = Object.values(data);
				console.log(arraydata);
				$("#search").autocomplete({
					source : arraydata,
					select : function(event, ui) {
						console.log(ui.item);
					},
					focus : function(event, ui) {
						return false;
					}
				});
			}
		});//ajax	
		
		
		
		$('#commentIcon').click(function(){
			console.log('댓글 아이콘 클릭');
			
			$('#commentInput').focus();
			
		});
		///스크랩 아이콘 클릭
		$('#scrapIcon').click(function(){
			
			//console.log($('#scrapIcon').attr('class'));
			var scrap = $('#scrapIcon').attr('class');
			var scrap_ = scrap.split(' ')[0];
			var for_no = $('#for_no').val();
			console.log(scrap_);
			
			if(scrap_=='far'){
				//scrap insert
				$('#scrapIcon').attr("class",'fas fa-bookmark fa-2x');
				
				 $.ajax({
	                 url:"<c:url value='/Gallary/Scrap/addscrap.do'/>",
	                 data:{"gallary_no":for_no},
	                 dataType:'text',
	                 type:'post',
	                 success:function(data){            
	               	  
	                 },
	                 error:function(e){console.log(e);}                 
	              });
				
				
			}
			else{
				//scrap delete
				$('#scrapIcon').attr("class",'far fa-bookmark fa-2x');
				
				$.ajax({
	                url:"<c:url value='/Gallary/Scrap/deletescrap.do'/>",
	                data:{"gallary_no":for_no},
	                dataType:'text',
	                type:'post',
	                success:function(data){            
	              	  
	                },
	                error:function(e){console.log(e);}                 
	             });
				
			}
			
		});
		///Dec
		$('#gallaryDec').click(function(){
			var for_no = $('#for_no').val();
			prompt_dec(for_no);
			
		});
		///
		$('#boardHeart').click(function(){
			console.log('하트 아이콘 클릭');
			var UserID = $('#logincheck').val(); 
			if(UserID==''){console.log('null이야'); login();}
			var for_no = $('#for_no').val();
			console.log('하트 게시물 번호',for_no)
			var color = $('#heartColor').attr("style");
			console.log(color);
			if(color=='color:black'){
				//heart insert
				$('#heartColor').attr("style",'color:red');
				 $.ajax({
	                 url:"<c:url value='/Gallary/Like/addheart.do'/>",
	                 data:{"gallary_no":for_no},
	                 dataType:'text',
	                 type:'post',
	                 success:function(data){            
	               	  
	                 },
	                 error:function(e){console.log(e);}                 
	              });
				
				
			}
			else{
				//heart delete
				$('#heartColor').attr("style",'color:black');
				$.ajax({
	                url:"<c:url value='/Gallary/Like/deleteheart.do'/>",
	                data:{"gallary_no":for_no},
	                dataType:'text',
	                type:'post',
	                success:function(data){            
	              	  
	                },
	                error:function(e){console.log(e);}                 
	             });
			}
			
		});
		
	    
	    $('#commentInput').keyup(function(e){
	    	var UserID = $('#logincheck').val();    	
	    	if(e.keyCode == 13){
	    		if(UserID==''){console.log('null이야'); login();}
	    		var for_no = $('#for_no').val();
	    		var content = $('#commentInput').val();
	    		
	    		$.ajax({
	                url:"<c:url value='/Gallary/Comment/write.do'/>",
	                data:{"gallary_no":for_no,"content":content},
	                dataType:'json',
	                type:'post',
	                success:function(data){
	        			console.log('댓글 작성!');
	        			$('#board_comment').html(" ");
	        			$('#commentInput').val('');
	        			
	        			var comments = "";
	        	    	   if (data.length == 0) {
	        	    	      console.log("if문안에 들어옴")
	        	    	      $('#board_comment').html("등록된 댓글이 없어요");
	        	    	   }
	        	    	   $.each(data,
	        	    	      function(index, element) {
	        	    	         comments += "<div>";
	        	    	         comments += "<span style='padding-right: 1em; font-weight: bold;'>"+element['NICKNAME']+"</span>";
	        	    	         comments += "<span style='padding-right: 1em'>"+element['CONTENT']+"</span>";
	        	    	         comments += "<span>"+element['POSTDATE']+"</span>";
	        	    	         comments += "</div>";
	        	    	      });
	        	    	   $('#board_comment').html(comments);
		  
	                },
	                error:function(e){console.log(e);}                
	             });    		
	    		
	    	}
	    	
	    })	
		
		

		
		
	});
</script>
<!-- 새로 만든 스타일 -->
<style>
#first_container {
	padding-top: 200px;
	/* 132px이 딱 맞는 크기*/
}

#basicProfile {
	text-align: center;
}

#profileImage {
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
}

.nav-item {
	padding: 0 30px;
}

.nav-item a {
	color: #000;
}

.nav-item a.active {
	background-color: #F3D55A !important;
}


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
<style>
#user_profile {
    width: 45px;
    height: 45px; 
    border-radius: 70%;
    overflow: hidden;
}
#board_comment::-webkit-scrollbar {
   display: none;
}

</style>

<!--뷰페이지  -->
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
				<a href="#close" id="closeView">CLOSE&nbsp;&nbsp;</a>
			</p>			
			<div class="flex" style="display: flex;">	
				<img alt="#" src="#" id="user_profile"  onerror="this.src='/veve/resources/assets/images/basic_profile.gif';"/>
				<span id="user_nickname" style="width:50%; padding-left: 20px;padding-top:10px; font-weight: bold; font-size: 1.5em">nick</span>
				<span class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fas fa-ellipsis-h"></i>
							</a>
							<ul class="dropdown-menu">
								<li><a id="gallaryDec">신고하기</button></li>
							</ul>
				</span>
			</div>
			<hr width="100%">
			
			<div id="board_title" style="padding-top: 10px; font-size: 1.5em;height:50px"></div>
			<div id="board_content" style="padding-top: 10px;font-size: 1.5em;height:100px"></div>
			<hr width="100%">
			<div id="board_comment" style="padding-top: 10px;height:130px; overflow:scroll;"></div>
			<hr width="100%">
			<div style="padding-top: 10px;height:50px">			
			<span id="heartColor" style="color:red"><i id="boardHeart" class="fas fa-heart fa-2x" aria-hidden="true"></i></span>
			<i id="commentIcon" class="fas fa-comment fa-2x" aria-hidden="true"></i>
			<i id ="scrapIcon" class="far fa-bookmark fa-2x"></i>		
			
			<span style="padding-left: 150px" id="board_date"></span>
			</div>
			<hr width="100%">
			<input id="commentInput" type="text" placeholder="댓글 달기..." style="width: 95%;"/>
			<div style="height: 20px">
			<input type="hidden" id="for_no"/>
			<input type="hidden" value="${UserID}" id="logincheck"/>
			</div>
		</div>
		<!-- div left -->

	</div>
	<!-- 외곽 flex container -->
</div>
<!-- View -->








<!-- 새로 만든 틀 -->
<div class="container" id="first_container">
	<div class="row">
		<div class="col-md-12">

			<div class="row">
				<div class="col-md-4">
					<c:if test="${empty KakaoUserId}" var="isNotKakaologin">

						<img id="profileImage" alt="이미지 오류"
							src='<c:url value="/upload/${filedto.f_name}"/>'
							onerror="this.src='/veve/resources/assets/images/basic_profile.gif';" />

					</c:if>
					<c:if test="${not isNotKakaologin }">
						<img id="profileImage" alt="이미지 오류" src='${KakaoUserImg}'
							onerror="this.src='/veve/resources/assets/images/basic_profile.gif';" />

					</c:if>
					<p>
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.nickname}</p>
					<p>
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-large w3-text-teal"></i>${userdto.vg_level}</p>
					<a id="modal-193710" href="#modal-container-193710" role="button"
						class="btn" data-toggle="modal">팔로워</a>

					<div class="modal fade" id="modal-container-193710" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">팔로워</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">

									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>NickName</th>
												<th>ID</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="following" items="${followerinfos}"
												varStatus="stauts">
												<tr>
													<c:if test="${following.k1n0 eq '1'}" var="isNotKakaologin">
														<td><img alt="#" style="width: 30px; height: 30px"
															src='${followerfileinfos[stauts.index]}' /></td>
													</c:if>
													<c:if test="${!isNotKakaologin}">
														<td><img alt="이미지 오류"
															style="width: 30px; height: 30px"
															src='<c:url value="/upload/${followerfileinfos[stauts.index]}"/>' /></td>
													</c:if>
													<td>${following.nickname}</td>
													<td>${following.userID}</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>


								</div>
								<div class="modal-footer">


									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>

					</div>

					<a id="modal-751188" href="#modal-container-751188" role="button"
						class="btn" data-toggle="modal">팔로잉</a>

					<div class="modal fade" id="modal-container-751188" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">팔로잉</h5>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>

								<div class="modal-body">


									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>NickName</th>
												<th>ID</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="following" items="${followinginfos}"
												varStatus="stauts">
												<tr>
													<c:if test="${following.k1n0 eq '1'}" var="isNotKakaologin">
														<td><img alt="#" style="width: 30px; height: 30px"
															src='${followingfileinfos[stauts.index]}' /></td>
													</c:if>
													<c:if test="${!isNotKakaologin}">
														<td><img alt="이미지 오류"
															style="width: 30px; height: 30px"
															src='<c:url value="/upload/${followingfileinfos[stauts.index]}"/>' /></td>
													</c:if>
													<td>${following.nickname}</td>
													<td>${following.userID}</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>



								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>

					</div>
					<!-- 모달 -->
					<div style="padding-top: 15px">
						<a href="<c:url value="/Member/Mypage.do"/>"
							class="btn btn-nav ">개인정보 수정 </a>
						<c:if test="${empty KakaoUserId}" var="isNotKakaologin">
							<a href="javascript:logout()" class="btn  btn-nav">로그아웃
							</a>
						</c:if>
						<c:if test="${not isNotKakaologin }">
							<a href="<c:url value="/logout"/>" class="btn  btn-nav">로그아웃</a>
						</c:if>
					</div>
					<div style="padding-top: 5px">
						<form method="get" action="<c:url value="/Member/OtherHome.do"/>">
							<input id="search" name="otherid" style="width: 200px" /> <input
								id="serarchBtn" type="submit" class="btn"
								style="font-size: 5px; padding: 5px 5px" value="검색">
						</form>
					</div>


				</div>
				<div class="col-md-4">
					<div class="col-md-12">
						<h4>나의 하루 영양 현황</h4>
						단백질
						<div class="progress">
							<div id="todayProtein" class="progress-bar progress-bar-striped"
								style="width: ${strproteinPercent}%"></div>
						</div>
						<br> 비타민B12
						<div class="progress">
							<div id="todayB12"
								class="progress-bar bg-success progress-bar-striped progress-bar-animated"
								style="width: ${strbPercent}%"></div>
						</div>
						<br> 비타민D
						<div class="progress">
							<div id="todayD"
								class="progress-bar bg-info progress-bar-striped progress-bar-animated"
								style="width: ${strdPercent}%"></div>
						</div>
						<br> 아연
						<div class="progress">
							<div id="todayAyen"
								class="progress-bar bg-warning progress-bar-striped progress-bar-animated"
								style="width: ${strzincPercent}%"></div>
						</div>
						<br> 칼슘
						<div class="progress">
							<div id="todayCal"
								class="progress-bar bg-danger progress-bar-striped progress-bar-animated"
								style="width: ${strcalPercent}%"></div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
			
				</div>
			</div>
			<hr />
			<!-- tab -->
			<div class="tabbable" id="category_tabs">
				<ul class="nav nav-pills justify-content-center">
					<li class="nav-item"><a class="nav-link active" href="#tab1"
						data-toggle="tab">내 피드</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab2"
						data-toggle="tab">내 레시피</a></li>
					<li class="nav-item"><a class="nav-link" href="#tab3"
						data-toggle="tab">스크랩</a></li>
				</ul>
				<div class="tab-content">
					<!-- tab1 내 피드 -->
					<div class="tab-pane active" id="tab1">
						<!-- sumnail  -->
						<main style="padding-top: 10px">
							<div class="container_main">
								<div class="gallery" id="appendPosition">
									<c:forEach var="item" items="${boardList}" varStatus="var">
										<div class="gallery-item" tabindex="0">
											<img
												src="<c:url value='/upload/${fileList[var.index].fileName}'/>"
												class="gallery-image" alt=""
												style="width: 300px; height: 300px">
											<div class="gallery-item-info"
												onclick="view(${item.gallary_no})"
												style="width: 300px; height: 300px">
												<ul>
													<li class="gallery-item-likes"><span
														class="visually-hidden">Likes:</span><i
														class="fas fa-heart" aria-hidden="true"></i>
														${likeList[var.index] }</li>
													<li class="gallery-item-comments"><span
														class="visually-hidden">Comments:</span><i
														class="fas fa-comment" aria-hidden="true"></i>
														${commentList[var.index] }</li>
												</ul>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- End of container -->
							<a id="a_open" href="#open" hidden=""></a>
						</main>
						<!-- sumnail  -->

					</div>
					<!-- tab1 내 피드 -->

					<!-- 두번째 tab 내 레시피 -->
					<div class="tab-pane" id="tab2">
						<c:forEach var="item" items="${reboardList}" varStatus="var">
							<div class="col-sm-3">
								<div class="list" style="background-color: #fffff0;">
									<c:forEach var="file" items="${refileList}" varStatus="var">
										<c:if test="${item.rec_no == file.rec_no}">
											<img src="<c:url value='/upload/${file.f_name}'/>" style="height: 255px; width: 100%;" />
										</c:if>
									</c:forEach>
			
									<div class="summary">
										<h2>
											<a href="<c:url value='/RecipeBBS/view.do?rec_no=${item.rec_no}'/>">${item.title}</a>
										</h2>
			
										<a href="<c:url value='/RecipeBBS/view.do?rec_no=${item.rec_no}'/>">${item.content }</a>
										<p></p>
										<p>${item.userID }</p>
										<p>${item.postDate }</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 두번째 tab 내 레시피 -->

					<!-- 세번째 tab 내 레시피 -->
					<div class="tab-pane" id="tab3">
						<main style="padding-top: 10px">
							<div class="container_main">
								<div class="gallery" id="appendPosition">
									<c:forEach var="item" items="${scrapboardList}" varStatus="var">
										<div class="gallery-item" tabindex="0">
											<img
												src="<c:url value='/upload/${scrapfileList[var.index].fileName}'/>"
												class="gallery-image" alt=""
												style="width: 300px; height: 300px">
											<div class="gallery-item-info"
												onclick="view(${item.gallary_no})"
												style="width: 300px; height: 300px">
												<ul>
													<li class="gallery-item-likes"><span
														class="visually-hidden">Likes:</span><i
														class="fas fa-heart" aria-hidden="true"></i>
														${scraplikeList[var.index] }</li>
													<li class="gallery-item-comments"><span
														class="visually-hidden">Comments:</span><i
														class="fas fa-comment" aria-hidden="true"></i>
														${scrapcommentList[var.index] }</li>
												</ul>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- End of container -->
							<a id="a_open" href="#open" hidden=""></a>
						</main>
					</div>
					<!-- 세번째 tab 내 레시피 -->


				</div>
				<!-- tab-content -->
			</div>
			<!-- tab -->




		</div>
		<!--최외각 col-md-12 -->
	</div>
	<!-- row -->
</div>
<!-- first_container -->




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
			console.log('하트',data["myLike"])
			//1.좋아요 유무 확인
			if(data["myLike"]=='1'){
				console.log('하트 빨간색')
				$('#heartColor').attr('style','color:red');
			}
			else{
				$('#heartColor').attr('style','color:black');
			}
			
			//2.댓글 가져오기
			$('#for_no').val(data["boardNo"]);
			showComments(data["boardNo"]);
			
			console.log("scrap:"+data["myScrap"]);
			//3.scrap
			if(data["myScrap"]==1)
				$('#scrapIcon').attr('class',"fas fa-bookmark fa-2x")
			else
				$('#scrapIcon').attr('class',"far fa-bookmark fa-2x")
			
			
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
    	  console.log(data)
    	  var comments = "";
    	   if (data.length == 0) {
    	      console.log("if문안에 들어옴")
    	      $('#board_comment').html("등록된 댓글이 없어요");
    	   }
    	   $.each(data,
    	      function(index, element) {
    	         //console.log("댓글 리스트 확인:")
    	         comments += "<div>";
    	         comments += "<span style='padding-right: 1em; font-weight: bold;'>"+element['NICKNAME']+"</span>";
    	         comments += "<span style='padding-right: 1em'>"+element['CONTENT']+"</span>";
    	         comments += "<span>"+element['POSTDATE']+"</span>";
    	         comments += "</div>";
    	      });
    	   $('#board_comment').html(comments);
    	  
    	  
    	  
    	  
      },
      error:function(e){console.log(e);}
      
   });
   
}//////////////showComments

function prompt_dec(for_no) {
    var content = prompt("신고내용을 입력해주세요.");
    
    $.ajax({
        url:"<c:url value='/Gallary/Dec/insertdec.do'/>",
        data:{"gallary_no":for_no,"content":content},
        dataType:'text',
        type:'post',
        success:function(data){ 
        	alert("접수되셨습니다.");
      	  
        },
        error:function(e){console.log(e);}                 
     });
    
    

    
}

</script>
