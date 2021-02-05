<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<style>
#preview img {
	width: auto;
	height: 100%;
}

#preview p {
	text-overflow: ellipsis;
	overflow: hidden;
}

.preview-box {
	border: 1px solid;
	padding: 5px;
	border-radius: 2px;
	margin-bottom: 10px;
}

.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 490px;
	height : 490px;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	font-size: 100%;
	overflow: hidden; 
	justify-content:center; 
	align-items:center; 
	display:flex;
	cursor:pointer;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}
.darkness {
  position:absolute;
  top:0;
  left:15px;
  width:inherit;
  height:inherit;
  background:#ffffff;
  /* 추가된 부분 */
  opacity:0;
  transition:all .3s linear;
}

.dragAndDropDiv:hover .darkness{
opacity:0.4;
}
</style>

<script>
	$(document)
			.ready(
					function() {
						var objDragAndDrop = $(".dragAndDropDiv");

						$(document).on("dragenter", ".dragAndDropDiv",
								function(e) {
									e.stopPropagation();
									e.preventDefault();
									$(this).css('border', '2px solid #0B85A1');
								});
						$(document).on("dragover", ".dragAndDropDiv",
								function(e) {
									e.stopPropagation();
									e.preventDefault();
								});
						$(document).on("drop", ".dragAndDropDiv", function(e) {

							$(this).css('border', '2px dotted #0B85A1');
							e.preventDefault();

							var files = e.originalEvent.dataTransfer.files;

							handleFileUpload(files, objDragAndDrop);
						});

						$(document).on('dragenter', function(e) {
							e.stopPropagation();
							e.preventDefault();
						});
						$(document).on('dragover', function(e) {
							e.stopPropagation();
							e.preventDefault();
							objDragAndDrop.css('border', '2px dotted #0B85A1');
						});
						$(document).on('drop', function(e) {
							e.stopPropagation();
							e.preventDefault();
						});
						
						//drag 영역 클릭시 파일 선택창
						objDragAndDrop.on('click', function(e) {
							$('input[type=file]').trigger('click');
						});

						$('input[type=file]').on('change', function(e) {
							var files = e.originalEvent.target.files;
							handleFileUpload(files, objDragAndDrop);
						});

						function handleFileUpload(files, obj) {
							for (var i = 0; i < files.length; i++) {
								var fd = new FormData();
								fd.append('file', files[i]);
							}
						}

						
						function sendFileToServer(formData, status) {
							var uploadURL = "/upload"; //Upload URL
							var extraData = {}; //Extra Data.
							var jqXHR = $
									.ajax({
										xhr : function() {
											var xhrobj = $.ajaxSettings.xhr();
											if (xhrobj.upload) {
												xhrobj.upload
														.addEventListener(
																'progress',
																function(event) {
																	var percent = 0;
																	var position = event.loaded
																			|| event.position;
																	var total = event.total;
																	if (event.lengthComputable) {
																		percent = Math
																				.ceil(position
																						/ total
																						* 100);
																	}
																	//Set progress
																	status
																			.setProgress(percent);
																}, false);
											}
											return xhrobj;
										},
										url : uploadURL,
										type : "POST",
										contentType : false,
										processData : false,
										cache : false,
										data : formData,
										success : function(data) {
											status.setProgress(100);

											//$("#status1").append("File upload Done<br>");           
										}
									});

							status.setAbort(jqXHR);
						}

					});
</script>
<style>
body {
	background-color: #F9F8EF;
}
</style>


<!-- 네비게이션바 거리유지 -->
<section class="pad">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">d</div>
		</div>
	</div>
</section>
<!--네비게이션바 거리유지 끝-->



<!--서비스 소개 시작-->
<section class="introduce">
	<div class="container">
		<div class="sign-title m-top-70">
			<h3>
				<strong>레시피 작성</strong>
			</h3>
		</div>
	</div>
</section>
<!--서비스 소개 끝-->


<!--레시피 입력 시작-->
<section class="recipe-form roomy-20">
	<div class="container">

		<form class="form-horizontal" method="post"
			action="<c:url value='/RecipeBBS/write.do'/>"
			enctype="multipart/form-data" role="form" autocomplete="off">
			<!-- 씨큐리티 적용:csrf취약점 방어용 -->
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

			<!--레시피 기본 정보-->
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<!--레시피 이름-->
							<div class="row">
								<label class="col-md-4" for="title">레시피 이름</label>
								<div class="form-group col-md-8">
									<input type="text" class="form-control " id="title"
										placeholder="예: 아보카도 요거트 볼  (최대 30자)" name="title" required>
								</div>
							</div>

							<!--레시피 소개-->
							<div class="row">
								<label class="col-md-4" for="content">레시피 소개</label>
								<div class="form-group col-md-8">
									<textarea class="form-control" rows="5" id="content"
										name="content" placeholder="이 레시피에 대한 간단한 설명을 적어주세요!" required></textarea>
								</div>
							</div>
							
							

							<!--카테고리-->
							<div class="row">
								<label class="col-md-4" for="category">카테고리</label>
									<div class="form-group col-md-8">
										<select class="form-control" name="category" id="selectcategory">
											<option disabled="disabled" selected="selected">카테고리를 선택해주세요</option>
											<option id="1">식사 레시피</option>
											<option id="2">간식 레시피</option>
											<option id="3">홈카페 레시피</option>
										</select>
									</div>


							</div>
							
							

							<!--채식 스타일-->
							<div class="row">
								<label class="col-md-4" for="selectlevel">채식 스타일</label>
								<div class="form-group col-md-8">
									<select class="form-control" name="vg_level" id="selectlevel">
										<option disabled="disabled" selected="selected">채식스타일을 선택해주세요</option>
										<option>비건</option>
										<option id="milk_ck">락토</option>
										<option id="egg_ck">오보</option>
										<option id="both_ck">락토-오보</option>
										<option id="fish_ck">페스코</option>
										<option id="bird_ck">폴로</option>
										<option id="beef_ck">채식주의자가 아니에요</option>
									</select>
								</div>
							</div>
							

							<!--난이도-->
							<div class="row">
								<label class="col-md-4" for="difficulty">난이도</label>
								<div class="form-group col-md-8">
									<select class="form-control" name="difficulty" id="selectdifficulty">
										<option disabled="disabled" selected="selected">조리난이도를 지정해주세요</option>
										<option>초간단</option>
										<option>초보</option>
										<option>중간</option>
										<option>높음</option>
									</select>
								</div>
							</div>

							<!--조리 시간-->
							<div class="row">
								<label class="col-md-4" for="cooktime">조리 시간</label>
								<div class="form-group col-md-8">
									약&nbsp;&nbsp;&nbsp;&nbsp;<div style="display: inline-block;">
										<select class="form-control" id="cooktime" name="cooktime">
											<option>5</option>
											<option>10</option>
											<option>15</option>
											<option>30</option>
											<option>60</option>
											<option>90</option>
											<option>120분 이상</option>
										</select>
									</div>
									분
								</div>
							</div>
						</div>

						<!--대표 이미지 등록-->
						<div class="col-md-6">
							<div class="form-group">
								<!-- 첨부 버튼 -->
								<div id="attach">
									<div id="preview" class="dragAndDropDiv">
										<img class="default_preview" src="<c:url value="/resources/assets/images/레시피대표이미지.jpg"/>" alt="대표이미지">
										<div class="darkness"></div>
									</div>
									
									<input id="uploadInputBox" type="file" style="display: none;"name="upload" />
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
			<!--레시피 기본 정보 끝-->


			<!--레시피 준비하기-->
			<div class="card">
				<div class="card-body">
					<div class="col-md-12">
						<!--레시피 재료-->
						<div class="row">
							<label class="col-md-2" for="ingredients">재료</label>
							<div class="form-group col-md-10">
								<textarea class="form-control" rows="3" id="ingredients"
									name="ingredients"
									placeholder="예) 슈레드치즈 50g, 아보카도 1개, 플레인요거트 1개, 방울토마토 5개, 사워크림 2T, 꿀 1t, 소금 1꼬집"
									required></textarea>
							</div>
						</div>

						<!--필요한 도구-->
						<div class="row">
							<label class="col-md-2" for="tools">필요한 도구</label>
							<div class="form-group col-md-10">
								<textarea class="form-control" rows="3" id="tools"
									name="tools" placeholder="예) 믹싱볼, 식칼, 실리콘주걱" required></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!--요리 순서-->
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<!--요리 순서-->
							<div class="row">
								<label class="col-md-2" for="uname">요리 순서</label>
							</div>

							<!--추가되는 항목 -->
							<!--기본 폼-->
							<div id="addedFormDiv">
								<div id="step01">
									<!---->
									<div class="row">
										<label class="offset-1 col-md-2 step" for="st1">STEP
											01</label>
										<div class="form-group col-md-5">
											<textarea class="form-control" rows="5" name="st1"
												placeholder="예) 슈레드 치즈를 20분간 해동시켜주세요." required></textarea>
										</div>

										<div class="form-group col-md-2">
											<div
												style="background-color: pink; width: 118px; height: 118px;">test</div>
										</div>

										<input type="Button" value="삭제" onclick="delForm()">
									</div>
									<!---->
								</div>
								<!--여기에 추가됨요!-->
							</div>
							<!--추가되는 항목 끝-->

							<input type="Button" value="추가" onclick="addForm()">

						</div>
					</div>
				</div>
			</div>
			<!--요리 순서 끝-->


			<!-- 등록버튼 -->
			<div class="form-group">
				<div class="col-md-4 offset-4 roomy-end m-top-40">
					<button type="submit" class="btn btn-sign">레시피 등록</button>
				</div>
			</div>
			<!-- 등록버튼 끝-->
		</form>








	</div>
</section>




<script>
	//임의의 file object영역
	var files = {};
	var previewIndex = 0;

	// image preview 기능 구현
	// input = file object[]
	function addPreview(input) {
		if (input[0].files) {
			//파일 선택이 여러개였을 시의 대응
			for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
				var file = input[0].files[fileIndex];

				if (validation(file.name))
					continue;

				var reader = new FileReader();
				reader.onload = function(img) {
					//div id="preview" 내에 동적코드추가.
					//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
					var imgNum = previewIndex++;
					$("#preview *").remove();
					$("#preview").append("<img class=\'thumbnail\' src=\'" + img.target.result + "\'\ />");
					files[imgNum] = file;
				};
				reader.readAsDataURL(file);
			}
		} else
			alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	}

	//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	function deletePreview(obj) {
		var imgNum = obj.attributes['value'].value;
		delete files[imgNum];
		$("#preview .preview-box[value=" + imgNum + "]").remove();
		$("#uploadInputBox").val("");
		resizeHeight();

	}

	/*파일 확장자 유효성검사*/
	function validation(fileName) {
		fileName = fileName + "";
		var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
		var fileNameExtension = fileName.toLowerCase().substring(
				fileNameExtensionIndex, fileName.length);
		if (!((fileNameExtension === 'jpg') || (fileNameExtension === 'gif') || (fileNameExtension === 'png') || (fileNameExtension === 'jpeg') || (fileNameExtension === 'bmp'))) {
			alert('사진 파일만 업로드할 수 있습니다.');
			return true;
		} else {
			return false;
		}
	}

	
	
	/*채식스타일 & 파일첨부 여부 유효성검사*/
	$(document).ready(function() {
		$('form').on('submit', function() {

			if ($(this).get(0).uploadInputBox.value == "") {
				alert("대표이미지를 등록해주세요.");
				$("#uploadInputBox").focus();
				return false;
			}
			if ($(this).get(0).selectlevel.value == "채식스타일을 선택해주세요") {
				alert("채식스타일을 선택해주세요.");
				$("#selectlevel").focus();
				return false;
			}
			if ($(this).get(0).selectcategory.value == "카테고리를 선택해주세요") {
				alert("카테고리를 선택해주세요.");
				$("#selectcategory").focus();
				return false;
			}
			if ($(this).get(0).selectdifficulty.value == "조리난이도를 지정해주세요") {
				alert("조리난이도를 지정해주세요.");
				$("#selectdifficulty").focus();
				return false;
			}
		});

		//submit 등록. 실제로 submit type은 아니다.
		$('.submit a').on('click', function() {
			var form = $('#uploadForm')[0];
			var formData = new FormData(form);

			for (var index = 0; index < Object.keys(files).length; index++) {
				//formData 공간에 files라는 이름으로 파일을 추가한다.
				//동일명으로 계속 추가할 수 있다.
				formData.append('files', files[index]);
			}

			//ajax 통신으로 multipart form을 전송한다.
			$.ajax({
				type : 'POST',
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				cache : false,
				timeout : 600000,
				url : '/imageupload',
				dataType : 'JSON',
				data : formData,
				success : function(result) {
					//이 부분을 수정해서 다양한 행동을 할 수 있으며,
					//여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
					//-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
					if (result === -1) {
						alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
						// 이후 동작 ...
					} else if (result === -2) {
						alert('파일이 10MB를 초과하였습니다.');
						// 이후 동작 ...
					} else {
						alert('이미지 업로드 성공');
						// 이후 동작 ...
					}
				}
			//전송실패에대한 핸들링은 고려하지 않음
			});
		});
		
		// <input type=file> 태그 기능 구현
		$('#attach input[type=file]').change(function() {
			addPreview($(this)); //preview form 추가하기
		});
	});

	
	
	
	
	
	
	
	/* 요리순서 추가&삭제 */
	var count = 2;
	function addForm() {
		var addedFormDiv = document.getElementById("addedFormDiv");
		var str = "";
		str += '<div class="row">'
				+ '<label class="offset-1 col-md-2 step" for="st'+count+'">STEP 0'
				+ count
				+ '</label>'
				+ '<div class="form-group col-md-5">'
				+ '<textarea class="form-control" rows="5" name="st'
				+ count
				+ '" placeholder="예) 슈레드 치즈를 20분간 해동시켜주세요." required></textarea>'
				+ '</div>'
				+ '<div class="form-group col-md-2">'
				+ '<div style="background-color:pink; width:118px; height: 118px;">test</div>'
				+ '</div>'
				+ '<input type="Button" value="삭제" onclick="delForm()">'
				+ '</div>';

		"step0" + count + "<input type='text' name='st"+count+"'>"
				+ "<input type='Button' value='삭제' onclick='delForm()'>";

		// 추가할 폼(에 들어갈 HTML)
		var addedDiv = document.createElement("div"); // 폼 생성
		addedDiv.id = "step0" + count; // 폼 Div에 ID 부여 (삭제를 위해)
		addedDiv.innerHTML = str; // 폼 Div안에 HTML삽입
		addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입
		count++;
	}

	function delForm() {
		var addedFormDiv = document.getElementById("addedFormDiv");
		if (count > 1) { // 현재 폼이 두개 이상이면
			var addedDiv = document.getElementById("step0" + (--count));
			// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
			addedFormDiv.removeChild(addedDiv); // 폼 삭제 
		} else { // 마지막 폼만 남아있다면
			document.baseForm.reset(); // 폼 내용 삭제
		}
	}
</script>