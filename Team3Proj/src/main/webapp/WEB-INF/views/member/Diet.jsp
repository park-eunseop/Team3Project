<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
	
<!-- 새로 만든 스타일 -->
<style>
#first_container {
	padding-top: 200px;
}
  p {font-size: 16px;}
  .margin {margin-bottom: 45px;}
  .bg-1 { 
    background-color: #474e5d; 
    color: #ffffff;
  }

  .container-fluid {
    padding-top: 50px;
    padding-bottom: 50px;
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
              $.ajax({
                  url:"<c:url value='/Member/MemberDietpost.do'/>",
                  data:{"data":data},
                  dataType:'json',
                  type:'post',
                  success:function(json){
                	  console.log('정보 입력 완료!');
                  },
                  error:function(e){console.log(e);}
                  
               });
              
              
              
       

            });
     
     
    });
</script>

<!-- 새로 만든 스타일 -->
<div class="container" id="first_container">
	<div class="row">
		<div class="col-md-4" style="height: 800px">
			<h4>오늘 메뉴를 넣어주세요</h4>
			<div style="width: 100%; height: 80%">
			<!-- 사진 분석 -->
				<div class="container-fluid bg-1 text-center">

					<img id="face-image" src="<c:url value="/resources/assets/images/upload.png"/>"
						class="img-responsive img-circle margin dragAndDropDiv"
						style="display: inline; background-color: white;" alt="Bird"
						width="150" height="150"> <input type="file"
						name="fileUpload" id="fileUpload" style="display: none;" />
					<h5>분석할 메뉴를 올려주세요</h5>
					<button id="sendinfo" class="btn btn-large btn-success"
						type="button">분석하기</button>
					<button class="btn btn-large btn-success add" onclick="predict()"
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
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-12">
					<h2>일일 영양현황</h2>
					단백질
					<div class="progress">
					<div class="progress-bar progress-bar-striped" style="width: 30%"></div>
					</div>
					<br>
					비타민B12
					<div class="progress">
						<div
							class="progress-bar bg-success progress-bar-striped progress-bar-animated"
							style="width: 40%"></div>
					</div>
					<br>
					비타민D
					<div class="progress">
						<div
							class="progress-bar bg-info progress-bar-striped progress-bar-animated"
							style="width: 50%"></div>
					</div>
					<br>
					아연
					<div class="progress">
						<div
							class="progress-bar bg-warning progress-bar-striped progress-bar-animated"
							style="width: 60%"></div>
					</div>
					<br>
					칼슘
					<div class="progress">
						<div
							class="progress-bar bg-danger progress-bar-striped progress-bar-animated"
							style="width: 70%"></div>
					</div>
				</div>
				<div class="col-md-12">
					<h2 style="padding-top: 30px">월 영양현황</h2>
					<div class="progress">
						<div class="progress-bar progress-bar-striped" style="width: 30%"></div>
					</div>
					<br>
					<div class="progress">
						<div
							class="progress-bar bg-success progress-bar-striped progress-bar-animated"
							style="width: 40%"></div>
					</div>
					<br>
					<div class="progress">
						<div
							class="progress-bar bg-info progress-bar-striped progress-bar-animated"
							style="width: 50%"></div>
					</div>
					<br>
					<div class="progress">
						<div
							class="progress-bar bg-warning progress-bar-striped progress-bar-animated"
							style="width: 60%"></div>
					</div>
					<br>
					<div class="progress">
						<div
							class="progress-bar bg-danger progress-bar-striped progress-bar-animated"
							style="width: 70%"></div>
					</div>
				</div>
				<div class="col-md-12">
					<h2 style="padding-top: 30px">부족한 영양소</h2>
				</div>
			</div>
		</div>
		
		
		
		<div class="col-md-4">
			<div class="col-md-12">
					<h4 style="padding-top: 30px">추천 메뉴 / 레시피</h4>
			</div>
		
			<div class="carousel slide" id="carousel-172006">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-172006"></li>
					<li data-slide-to="1" data-target="#carousel-172006" class="active">
					</li>
					<li data-slide-to="2" data-target="#carousel-172006"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap First"
							src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
						<div class="carousel-caption">
							<h4>First Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap Second"
							src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third"
							src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
						<div class="carousel-caption">
							<h4>Third Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
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
				<div class="col-md-12"></div>
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

    }

    async function predict() {
			// predict can take in an image, video or canvas html element
			var image = document.getElementById("face-image");
      const prediction = await model.predict(image,false);
      console.log(prediction)

			var name = prediction[0].className;
			var value = prediction[0].probability.toFixed(2);

			
			for (let i = 1; i < maxPredictions; i++) {
				if(value < prediction[i].probability.toFixed(2)){
					value = prediction[i].probability.toFixed(2);
					name = prediction[i].className;
				}
      }
      foods+=name+"/";
      document.getElementById("label-container").value=foods;
      
      function reciveMenu(name){  
        console.log('append 할거야')
        console.log(name)
        $('.menu_list').append(`
            <button class="btn" type="button" style="padding-left:5px; background-color:yellow;font-color:black">`+name+`</button>
          `)
      }

      reciveMenu(name)


		}
</script>

