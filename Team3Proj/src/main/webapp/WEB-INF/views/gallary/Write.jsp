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
			<div class="col-sm-12"></div>
		</div>
	</div>
</section>
<!--네비게이션바 거리유지 끝-->



<!--서비스 소개 시작-->
<section class="introduce">
	<div class="container">
		<div class="sign-title m-top-70">
			<h3>
				<strong>새 게시물 작성</strong>
			</h3>
		</div>
	</div>
</section>
<!--서비스 소개 끝-->


<!--레시피 입력 시작-->
<section class="recipe-form roomy-20">
	<div class="container">

		<form class="form-horizontal" method="post"
			action="<c:url value='/Gallary/GallaryWrite.do'/>"
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
								<label class="col-md-4" for="title">피드 제목</label>
								<div class="form-group col-md-8">
									<input type="text" class="form-control " id="title"
										placeholder="피드 제목을 입력하세요.  (최대 30자)" name="title" required>
								</div>
							</div>

							<!--레시피 소개-->
							<div class="row">
								<label class="col-md-4" for="content">피드 내용</label>
								<div class="form-group col-md-8">
									<textarea class="form-control" rows="17" id="content"
										name="content" placeholder="내용을 작성해주세요!" required></textarea>
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
									
									<input id="uploadInputBox" type="file" style="display: none;"name="upload" multiple/>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
			<!--레시피 기본 정보 끝-->




			<!-- 등록버튼 -->
			<div class="form-group">
				<div class="col-md-4 offset-4 roomy-end m-top-40">
					<button type="submit" class="btn btn-sign">피드 등록</button>
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

	
	
	
	
	
	
	
	
</script>