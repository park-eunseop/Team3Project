<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!-- Notice Write -->
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

								var status = new createStatusbar(obj); //Using this we can set progress.
								status.setFileNameSize(files[i].name,
										files[i].size);
								sendFileToServer(fd, status);
							}
						}

						var rowCount = 0;
						function createStatusbar(obj) {
							rowCount++;
							var row = "odd";
							if (rowCount % 2 == 0)
								row = "even";
							this.statusbar = $("<div class='statusbar "+row+"'></div>");
							this.filename = $("<div class='filename'></div>")
									.appendTo(this.statusbar);
							this.size = $("<div class='filesize'></div>")
									.appendTo(this.statusbar);
							this.progressBar = $(
									"<div class='progressBar'><div></div></div>")
									.appendTo(this.statusbar);
							this.abort = $("<div class='abort'>중지</div>")
									.appendTo(this.statusbar);

							obj.after(this.statusbar);

							this.setFileNameSize = function(name, size) {
								var sizeStr = "";
								var sizeKB = size / 1024;
								if (parseInt(sizeKB) > 1024) {
									var sizeMB = sizeKB / 1024;
									sizeStr = sizeMB.toFixed(2) + " MB";
								} else {
									sizeStr = sizeKB.toFixed(2) + " KB";
								}

								this.filename.html(name);
								this.size.html(sizeStr);
							}

							this.setProgress = function(progress) {
								var progressBarWidth = progress
										* this.progressBar.width() / 100;
								this.progressBar.find('div').animate({
									width : progressBarWidth
								}, 10).html(progress + "% ");
								if (parseInt(progress) >= 100) {
									this.abort.hide();
								}
							}

							this.setAbort = function(jqxhr) {
								var sb = this.statusbar;
								this.abort.click(function() {
									jqxhr.abort();
									sb.hide();
								});
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
										/* contentType : false, */
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

<section>
	<div class="visible-lg" style="background: black; height: 5em;">
	</div>
	<div class="hidden-lg" style="height: 5em;"></div>
</section>
<section>
	<div style="height: 2em;"></div>
</section>
<div class="container">
	<!-- 점보트론(Jumbotron) -->
	<div class="jumbotron">
		<h1>
			Notice<small>공지사항</small>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" method="post"
				action="<c:url value='/Board/Notice/NoticeWrite.do'/>" enctype="multipart/form-data">
				<!-- 씨큐리티 적용:csrf취약점 방어용 -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="form-group">
					<label class="col-md-2 control-label">제목</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요?">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label" for="uploadInputBox">사진첨부</label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-4">
							<!-- 첨부 버튼 -->
							<div id="attach">
							<div style="background: gray;">
							<div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here or Browse Files</div>
                         	 <input id="uploadInputBox" type="file" style="display: none;"
											name="upload" multiple /></div>
							<div id="preview" class="content"></div>
	                        </div>
	                     </div>
	                  </div>
	               </div>
	            </div>
	            
				<div class="form-group">
					<label class="col-md-2 control-label">내용</label>
					<!-- 중첩 컬럼 사용 -->
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-8">
								<textarea class="form-control" name="content" rows="5"
									placeholder="내용 입력하세요"></textarea>
							</div>
						</div>
					</div>
				</div>

				<!-- 취소/등록버튼 -->
				<div class="form-group">
					<div class="hidden-md hidden-lg text-center">
						<div class="btn-group" role="group" aria-label="...">
							<a href="<c:url value="/Board/Notice/NoticeList.do"/>" class="btn btn-nav">취소</a>
							<button class="btn btn-nav" type="submit">등록</button>
						</div>
					</div>
				
				</div>
			</form>
		</div>
	</div>

</div>
<section>
	<div style="height: 2em;"></div>
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
				$("#preview").append(
								"<div class=\"preview-box\" value=\"" + imgNum +"\">"
									 + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
									 + "<p>" + "</p>"
									 + "<a href=\"#\" value=\"" + imgNum + "\" onclick=\"deletePreview(this)\">"
									 + "삭제" + "</a>" + "</div>");
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

	//client-side validation
	//always server-side validation required
	function validation(fileName) {
		fileName = fileName + "";
		var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
		var fileNameExtension = fileName.toLowerCase().substring(
				fileNameExtensionIndex, fileName.length);
		if (!((fileNameExtension === 'jpg') || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
			alert('jpg, gif, png 확장자만 업로드 가능합니다.');
			return true;
		} else {
			return false;
		}
	}

	$(document).ready(function() {
		$('form').on('submit', function() {

			if ($(this).get(0).title.value == "") {
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			}
			if ($(this).get(0).content.value == "") {
				alert("내용을 입력하세요.");
				$("#content").focus();
				return false;
			}
            if($(this).get(0).uploadInputBox.value==""){
                alert("파일을 첨부하세요.");
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
				/* contentType : false, */
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