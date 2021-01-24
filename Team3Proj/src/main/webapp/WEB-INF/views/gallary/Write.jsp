<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<form method="post" action='<c:url value="/Gallary/GallaryWrite.do"/>'
	enctype="multipart/form-data">
	<label class="col-sm-2 control-label">제목</label>
	<div class="col-sm-4">
		<input type="text" class="form-control" name="title"
			placeholder="제목을 입력하세요?">
	</div>
	<label class="col-sm-2 control-label">내용</label>
	<div class="col-sm-4">
		<input type="text" class="form-control" name="content"
			placeholder="내용 입력하세요?">
	</div>
	<label class="col-sm-2 control-label">파일</label>
	<div class="col-sm-4">
		<input type="file" class="form-control" name="upload" multiple="multiple">
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary">등록</button>
		</div>
	</div>

</form>