<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<style>
#preview img {
	width: 100px;
	height: 100px;
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
</style>

<script>
	var sel_file;

	$('#file').on("change", handleImgFileSelect);

	function handleImgFileSelect(e) {

		//$('.upload-btn').attr('disabled', false);

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

	/* $('.photo_find_btn').click(function(e) {
	   $("input:file").click();
	}); */
</script>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" method="post"
				action="<c:url value='/RecipeBBS/edit.do'/>"
				enctype="multipart/form-data">
				<!-- 씨큐리티 적용:csrf취약점 방어용 -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="title"
							placeholder="제목을 입력하세요?" value="${recipe.title}">
					</div>
				</div>

				<div class="form-group" style="color: black">
					<label for="id" class="col-sm-2 control-label">Level</label>
					<div class="col-sm-4">
						<select name="vg_level" id="selectlevel">
							<option disabled="disabled" selected="selected">${recipe.vg_level }</option>
							<option>Vegan</option>
							<option id="milk_ck">Lacto</option>
							<option id="egg_ck">Ovo</option>
							<option id="both_ck">Lacto-Ovo</option>
							<option id="fish_ck">Pesco</option>
							<option id="bird_ck">Pollo</option>
							<option id="beef_ck">Flexi</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label" for="uploadInputBox">사진첨부</label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-4">
								<!-- 첨부 버튼 -->
								<div id="attach">
									<input id="uploadInputBox" type="file" name="upload" value=""
										multiple />
									<c:forEach var="file" items="${recipeFile}" varStatus="var">
										<c:if test="${recipe.rec_no == file.rec_no}">
											<img src="<c:url value='/upload/${file.f_name}'/>" />
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>



				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<!-- 중첩 컬럼 사용 -->
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
								<textarea class="form-control" name="content" rows="5"
									placeholder="내용 입력하세요">${recipe.content}</textarea>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">수정</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
                        $("#preview")
                                .append(
                                        "<div class=\"preview-box\" value=\"" + imgNum +"\">"
                                                + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                                                + "<p>"
                                                + "</p>"
                                                + "<a href=\"#\" value=\""
                                                + imgNum
                                                + "\" onclick=\"deletePreview(this)\">"
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
            if (!((fileNameExtension === 'jpg')
                    || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
                alert('jpg, gif, png 확장자만 업로드 가능합니다.');
                return true;
            } else {
                return false;
            }
        }
        
        $(document).ready(function() {
       $('form').on('submit',function(){
               
               if($(this).get(0).title.value==""){
                  alert("제목을 입력하세요.");
                  $("#title").focus();
                  return false;               
               }
               if($(this).get(0).content.value==""){
                  alert("내용을 입력하세요.");
                  $("#content").focus();
                  return false;               
               }
               if($(this).get(0).uploadInputBox.value==""){
                  alert("파일을 첨부하세요.");
                  $("#uploadInputBox").focus();
                  return false;               
               }
               if($(this).get(0).selectlevel.value=="Level"){
                   alert("레벨을 입력하세요.");
                   $("#selectlevel").focus();
                   return false;               
                }
            });

            //submit 등록. 실제로 submit type은 아니다.
            $('.submit a').on('click',function() {                        
                var form = $('#uploadForm')[0];
                var formData = new FormData(form);
    
                for (var index = 0; index < Object.keys(files).length; index++) {
                    //formData 공간에 files라는 이름으로 파일을 추가한다.
                    //동일명으로 계속 추가할 수 있다.
                    formData.append('files',files[index]);
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