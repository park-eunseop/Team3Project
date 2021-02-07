<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>

  <!-- 부트스트랩 4.5.2 --> <!--부트스트랩4 튜토리얼 : https://www.w3schools.com/bootstrap4/default.asp-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  
  
  <!--아이콘(폰트어썸)-->
  <script src="https://kit.fontawesome.com/01f3b3b8bd.js" crossorigin="anonymous"></script>
  <!-- owl 캐러셀 -->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/owl.carousel.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/owl.theme.default.min.css"/>">
  <!-- summernote -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  
  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/style.css"/>"><!-- 템플릿 베이직 CSS -->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/nav.css"/>"><!-- 네비게이션바 CSS-->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/owl.css"/>"><!-- owl캐러셀 CSS-->
  

   
   <!-- 전체 jquery 필수 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	

	
  <!-- datepicker
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"> -->
  <!-- datepicker js -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
    
  





<!-- 새로 만든 스타일 -->
<style>


p {
	font-size: 16px;
}

.margin {
	margin-bottom: 45px;
}

.bg-1 {
	background-color: #474e5d;
	color: #ffffff;
}

.container-fluid {
	padding-top: 50px;
	padding-bottom: 50px;
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


</style>
<script>
     $(document).ready(function(){
            var objDragAndDrop = $(".dragAndDropDiv");

          
            objDragAndDrop.on('click',function (e){
                    $('input[type=file]').trigger('click');
            });
            $("#fileUpload").change(function(){
		        if(this.files && this.files[0]) {
			        var reader = new FileReader;
			        reader.onload = function(data) {
		 		    $(".dragAndDropDiv").attr("src", data.target.result).width(150).height(150);        
			        }
			        reader.readAsDataURL(this.files[0]);
		  }
      });//첨부파일 사진
      //정보 보내기
      $('#sendinfo').click(function(){
               var data = document.getElementById("label-container").value;
               document.getElementById("label-container").value="";
               foods="";
               console.log(data);
               
               console.log(document.getElementById("label-container").value);
               $(".dragAndDropDiv").attr("src","/veve/resources/assets/images/upload.png");
              $('.menu_list *').remove();
              $('.needDiet *').remove();
              $.ajax({
                  url:"<c:url value='/Member/MemberDietpost.do'/>",
                  data:{"data":data},
                  dataType:'json',
                  type:'post',
                  success:function(json){
                	  console.log('정보 입력 완료!');
                	  
                	  
                	  
                	  
                	  
                	  $('#todayProtein').attr('style','width:'+json["todayProtein"]+'%');
                	  $('#todayB12').attr('style','width:'+json["todayB12"]+'%');
                	  $('#todayD').attr('style','width:'+json["todayD"]+'%');
                	  $('#todayAyen').attr('style','width:'+json["todayZinc"]+'%');
                	  $('#todayCal').attr('style','width:'+json["todayCal"]+'%');
                	  
                	  
                	  var needObjects = json["needDiet"];     
                	  console.log('???:',needObjects);
          			  var files = needObjects.split("/");
          			  console.log(files);
                	  $('#needDiet *').remove();
                	  $('.justify-content-center *').remove();
                	  $('.tab-content *').remove();
                	 
          			  
                	  $.each(files,function(index,value){
                		  if(index==0){
                			  if(value=='pro'){
                				  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link active" href="#tab0"
          								data-toggle="tab">단백질</a></li>                					  
                    				`);
                				  $('.tab-content').append(`
                						  <div class="tab-pane active" id="tab0">
                						  <div class="col-md-12">
            								<div class="row">
            									<div class="col-md-12">
            										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/protein.jpg"/>" />
            									</div>
            									<div class="col-md-12">
            										<ul>
            										<li>피곤, 우을증</li>
            										<li>피부트러블</li>
            										<li>식욕저하</li>
            										</ul>
            									</div>
            								</div>
            						  	</div>  
                				  		</div>               				  
                				  `); 
                    		  }
    						  if(value=='cal'){
    							  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link active" href="#tab0"
          								data-toggle="tab">칼슘</a></li>                					  
                    				`);
    							  $('.tab-content').append(`
                						  <div class="tab-pane active" id="tab0">
    									  <div class="col-md-12">
	          								<div class="row">
	          									<div class="col-md-12">
	          										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/calcium.jpg"/>" />
	          									</div>
	          									<div class="col-md-12">
	          										<ul>
	          										<li>기분의 급격한 변화</li>
              										<li>빈번한 감기와 독감</li>
              										<li>지속적인 피로감</li>
	          										</ul>
	          									</div>
	          								</div>
	          						  	</div>                						  
                						  </div>               				  
                				  `); 
                    		  }
    						  if(value=='zinc'){
    							  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link active" href="#tab0"
          								data-toggle="tab">아연</a></li>                					  
                    				`);
    							  $('.tab-content').append(`
                						  <div class="tab-pane active" id="tab0">
    									  <div class="col-md-12">
          								<div class="row">
          									<div class="col-md-12">
          										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/zinc.jpg"/>" />
          									</div>
          									<div class="col-md-12" style="padding-top:10px">
          										<ul>
          										<li>기분의 급격한 변화</li>
          										<li>빈번한 감기와 독감</li>
          										<li>지속적인 피로감</li>
          										</ul>
          									</div>
          								</div>
          						  	</div>  
    							  			
    							  			</div>               				  
                				  `); 
                    		  }
    						  if(value=='vB'){
    							  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link active" href="#tab0"
          								data-toggle="tab">비타민 B12</a></li>                					  
                    				`);
    							  $('.tab-content').append(`
                						  <div class="tab-pane active" id="tab0">
    									  <div class="col-md-12">
            								<div class="row">
            									<div class="col-md-12">
            										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/vitaB12.jpg"/>" />
            									</div>
            									<div class="col-md-12">
            										<ul>
            										<li>정신 기능 손상</li>
            										<li>근육 쇠약</li>
            										<li>지속적인 피로감</li>
            										</ul>
            									</div>
            								</div>
            						  	</div>  
    							  	
    							  		</div>               				  
                				  `); 
                    		  }
    						  if(value=='vD'){
    							  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link active" href="#tab0"
          								data-toggle="tab">비타민 D</a></li>                					  
                    				`);
    							  $('.tab-content').append(`
                						  <div class="tab-pane active" id="tab0">
    									  <div class="col-md-12">
          								<div class="row">
          									<div class="col-md-12">
          										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/vitaD.jpg"/>" />
          									</div>
          									<div class="col-md-12">
          										<ul>
          										<li>근육통, 쇠약 및 뼈 통증</li>
          										<li>구루병</li>
          										</ul>
          									</div>
          								</div>
          						  	</div> 
    							  
    							  		</div>               				  
                				  `); 
                    		  }	
                			  
                			 
                			  
                		  }
                		  else{
                			  var tab = "#tab"+index;
                			  var tabid ="tab"+index;
                			  console.log(tab);
                			  
                			  if(value=='pro'){
                				  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link " href="`+tab+`"
          								data-toggle="tab">단백질</a></li>                					  
                    				`);
                				  $('.tab-content').append(`
                						  <div class="tab-pane " id="`+tabid+`">
              						  	<div class="col-md-12">
              								<div class="row">
              									<div class="col-md-12">
              										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/protein.jpg"/>" />
              									</div>
              									<div class="col-md-12">
              										<ul>
              										<li>피곤, 우을증</li>
              										<li>피부트러블</li>
              										<li>식욕저하</li>
              										</ul>
              									</div>
              								</div>
              						  	</div>    							  	
  							  		  </div>               				  
                				  `); 
                    		  }
    						  if(value=='cal'){
    							  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link " href="`+tab+`"
          								data-toggle="tab">칼슘</a></li>                					  
                    				`);
    							  $('.tab-content').append(`
                						  <div class="tab-pane " id="`+tabid+`">
                						  <div class="col-md-12">
		          								<div class="row">
		          									<div class="col-md-12">
		          										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/calcium.jpg"/>" />
		          									</div>
		          									<div class="col-md-12">
		          										<ul>
		          										<li>골다공증</li>
		          										<li>근육, 신경이상</li>
		          										<li>기억력 저하</li>
		          										</ul>
		          									</div>
		          								</div>
		          						  	</div>                   						  
                						  </div>               				  
                				  `); 
                    		  }
    						  if(value=='zinc'){
    							  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link " href="`+tab+`"
          								data-toggle="tab">아연</a></li>                					  
                    				`);
    							  $('.tab-content').append(`
                						  <div class="tab-pane " id="`+tabid+`">
                						  	<div class="col-md-12">
                								<div class="row">
                									<div class="col-md-12">
                										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/zinc.jpg"/>" />
                									</div>
                									<div class="col-md-12">
                										<ul>
                										<li>기분의 급격한 변화</li>
                										<li>빈번한 감기와 독감</li>
                										<li>지속적인 피로감</li>
                										</ul>
                									</div>
                								</div>
                						  	</div>    							  	
    							  		  </div>               				  
                				  `); 
                    		  }
    						  if(value=='vB'){
    							  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link " href="`+tab+`"
          								data-toggle="tab">비타민 B12</a></li>                					  
                    				`);
    							  $('.tab-content').append(`
    									  <div class="tab-pane " id="`+tabid+`">
              						  	<div class="col-md-12">
              								<div class="row">
              									<div class="col-md-12">
              										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/vitaB12.jpg"/>" />
              									</div>
              									<div class="col-md-12">
              										<ul>
              										<li>정신 기능 손상</li>
              										<li>근육 쇠약</li>
              										<li>지속적인 피로감</li>
              										</ul>
              									</div>
              								</div>
              						  	</div>    							  	
  							  		  </div>                				  
                				  `); 
                    		  }
    						  if(value=='vD'){
    							  $('.justify-content-center').append(`
                    					  <li class="nav-item"><a class="nav-link " href="`+tab+`"
          								data-toggle="tab">비타민 D</a></li>                					  
                    				`);
    							  $('.tab-content').append(`
    									  <div class="tab-pane " id="`+tabid+`">
                						  	<div class="col-md-12">
                								<div class="row">
                									<div class="col-md-12">
                										<img alt="Bootstrap Image Preview" style="width:260px;height:200px;padding-top: 20px" src="<c:url value="/resources/assets/images/vitaD.jpg"/>" />
                									</div>
                									<div class="col-md-12">
                										<ul>
                										<li>근육통, 쇠약 및 뼈 통증</li>
                										<li>구루병</li>
                										</ul>
                									</div>
                								</div>
                						  	</div>    							  	
    							  		  </div>                 				  
                				  `); 
                    		  }                			  
                		  }
                		  
                		  
                		  
                		  						
						  
						  
                		  
                		  
                		  
                	  });    
                	  console.log(json["mini"]);
                	  $.ajax({
							type : 'post',
							url : "http://localhost:8383/crawl",
							data : {"data":json["mini"]},
							dataType : "json",
							success : function(data) {
								console.log('파이썬에서 돌아왔어',data)
								var videoLink = data["href"];
								$('#img1').attr('src',data["img1"]);
								$('#img2').attr('src',data["img2"]);
								$('#img3').attr('src',data["img3"]);
								$('#recommandMenu').html(data["food"]);
								$('#crawlVideo').attr('src',videoLink.replace('watch?v=','embed/'));
								
							}
					  });//ajax
                	  
       	  
                	  
                  },
                  error:function(e){console.log(e);}
                  
               });
              
              
              
       

            });
     
     
    });
</script>

<!-- 새로 만든 스타일 -->
<div class="container" id="first_container" style="background-color: #F9F8EF">
	<div class="row">
		<div class="col-md-4" style="height: 800px">
			<p style="font-family: serif;font-weight: bold;font-size: 2em;">메뉴를 올려주세요</p>
			<div style="width: 100%; height: 80%">
				<!-- 사진 분석 -->
				<div class="container-fluid bg-1 text-center">

					<img id="face-image"
						src="<c:url value="/resources/assets/images/upload.png"/>"
						class="img-responsive img-circle margin dragAndDropDiv"
						style="display: inline; background-color: white;" alt="Bird"
						width="150" height="150"> <input type="file"
						name="fileUpload" id="fileUpload" style="display: none;" />
					<h5>분석할 메뉴를 올려주세요</h5>
					<button id="sendinfo" class="btn  btn-nav"
						type="button">분석하기</button>
					<button class="btn  btn-nav add" onclick="predict()"
						type="button">Add</button>
					<script class="jsbin"
						src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
					</br>
					<div style="padding-bottom: 10px;"></div>
					<div class="menu_list"
						style="height: 200px; background-color: white; padding-top: 10px;">



					</div>
					<input type="text" value="" id="label-container" name="menu"
						style="color: black;" hidden />
					</form>
				</div>
				<!-- 사진 분석 -->

			</div>
		</div>
		<div class="col-md-4" style="padding-right: 15px">
			<div class="row">
				<div class="col-md-12">
					<p style="font-family: serif;font-weight: bold;font-size: 2em;">Today 영양 상태</p>
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
				<div class="col-md-12">
					<h2 style="padding-top: 30px">부족한 영양소</h2>
					<div id="needDiet"></div>
					<!-- tab -->
					<div class="tabbable" id="category_tabs">
						<ul class="nav nav-pills justify-content-center">
							
						</ul>
						<div class="tab-content">
							


						</div>
						<!-- tab-content -->
					</div>
					<!-- tab -->

				</div>
			</div>
		</div>



		<div class="col-md-4" style="padding-left: 15px">
			<p style="font-family: serif;font-weight: bold;font-size: 2em;">Recommended food</p>
			<div id="foodname"></div>
			<div class="carousel slide" id="carousel-172006">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-172006"></li>
					<li data-slide-to="1" data-target="#carousel-172006" class="active">
					</li>
					<li data-slide-to="2" data-target="#carousel-172006"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item">
						<img id="img1" class="d-block w-100"
							alt="Carousel Bootstrap First"
							src="<c:url value='/resources/assets/images/recom_1.jpg'/>"
							style="width: 300px; height: 300px" />

					</div>
					<div class="carousel-item active">
						<img id="img2" class="d-block w-100"
							alt="Carousel Bootstrap Second"
							src="<c:url value='/resources/assets/images/recom_2.jpg'/>"
							style="width: 300px; height: 300px" />

					</div>
					<div class="carousel-item">
						<img id="img3" class="d-block w-100"
							alt="Carousel Bootstrap Third"
							src="<c:url value='/resources/assets/images/recom_3.jpg'/>"
							style="width: 300px; height: 300px" />

					</div>
				</div>
				<a class="carousel-control-prev" href="#carousel-172006"
					data-slide="prev"><span class="carousel-control-prev-icon"></span>
					<span class="sr-only">Previous</span></a> <a
					class="carousel-control-next" href="#carousel-172006"
					data-slide="next"><span class="carousel-control-next-icon"></span>
					<span class="sr-only">Next</span></a>
			</div>
			<div class="row">
				<div class="col-md-12" style="padding-top: 10px">
					<iframe id="crawlVideo" src=" " style="width: 100%; height: 300px">

					</iframe>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

    const URL = "/veve/resources/my_model/";

	let model, webcam, labelContainer, maxPredictions;
	var foods ="";
	init(); //작동하기

    // Load the image model and setup the webcam
    async function init() {
		console.log('작동중!');
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();
        console.log('model:',model)
        console.log('maxPredictions:',maxPredictions)
        var image = document.getElementById("face-image");
        const prediction = await model.predict(image,false);

    }

    async function predict() {
			// predict can take in an image, video or canvas html element
	  console.log('예측 시작!');
	  var image = document.getElementById("face-image");
      const prediction = await model.predict(image,false);
      console.log('후보1번');
      console.log(prediction)

			var name = prediction[0].className;
			var value = prediction[0].probability.toFixed(2);

			
			for (let i = 1; i < maxPredictions; i++) {
				if(value < prediction[i].probability.toFixed(2)){
					value = prediction[i].probability.toFixed(2);
					name = prediction[i].className;
				}
    		}
	  console.log('후보 2번');	
      foods+=name+"/";
      document.getElementById("label-container").value=foods;
      
      function reciveMenu(name){  
        console.log('append 할거야')
        console.log(name)
        $('.menu_list').append(`
            <span style="background-color:#CCFF99"><a class="btn">`+name+`</a></span>
          `)
      }

      reciveMenu(name)


	}
</script>
<!-- 부트스트랩 4.5.2 플러그인들 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- summernote -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- owl 캐러셀 -->
<script src="<c:url value="/resources/assets/js/owl.carousel.min.js"/>"></script>

<!-- 커스텀 js -->
<script src="<c:url value="/resources/assets/js/nav.js"/>"></script><!--네비게이션 바-->
<script src="<c:url value="/resources/assets/js/day.js"/>"></script><!--메인화면 요일 표기-->
<script src="<c:url value="/resources/assets/js/rolling.js"/>"></script><!--메인화면 채식메뉴 롤링-->
<script src="<c:url value="/resources/assets/js/carousel.js"/>"></script><!--캐러셀 -->
<script>
	window.onresize = function() {
		$('#display_width').html(window.innerWidth);
	};
</script>
