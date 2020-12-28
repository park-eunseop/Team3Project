<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Made Three</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<c:url value="/resources/assets/css/bootstrap.css"/>">

<style>

.post-container {
  padding: 137px 0 60px;
  background-color: #fafafa;
}
.post-container > .wrap {
  max-width: 600px;
  margin: 0 auto;
}

.post-container .post {
  margin-bottom: 60px;
  border: 1px solid #e6e6e6;
  border-radius: 3px;
  background-color: #ffffff;
}

.post > .post-header {
  height: 60px;
  padding: 16px 16px 16px 56px;
  border-bottom: 1px solid #efefef;
  font-size: 14px;
  font-weight: 600;
  line-height: 28px;
  color: #262626;
}
.post > .post-header > .profile {
  display: block;
  position: absolute;
  left: 16px;
  top: 16px;
  width: 28px;
  height: 28px;
  border-radius: 50%;
}
.post > .post-header > .profile > img {
  width: 100%;
  height: 100%;
}

.post > .thumbnail {
  font-size: 0;
  margin: 0 -1px 4px;
}
.post > .thumbnail > img {
  width: 100%;
}

.post > .post-footer {
  display: inline;
  padding: 0 16px;
}

.post > .post-footer > .btn-container {
  list-style: none;
  height: 40px;
  padding: 8px 0;
  font-size: 0;
}
.post > .post-footer > .btn-container > li {
  display: inline;
  width: 24px;
  height: 24px;
  margin-right: 16px;
  padding:0 8px; 	
}

.post > .post-footer > .like-container {
  height: 18px;
  margin-bottom: 8px;
  font-size: 14px;
  font-weight: 600;
  line-height: 18px;
  color: #262626;
}

.post > .post-footer > .text-container {
  font-size: 14px;
  line-height: 18px;
}
.post > .post-footer > .text-container > a {
  font-weight: 600;
}

.post > .post-footer > .time-container {
  height: 18px;
  margin-bottom: 8px;
  font-size: 10px;
  line-height: 18px;
  color: #999999;
}

.post > .post-footer > .comment-container {
  height: 56px;
  padding: 16px 28px 16px 0;
  border-top: 1px solid #efefef;
}
.post > .post-footer > .comment-container > textarea {
  width: 100%;
  height: 100%;
  border: none;
  font-size: 14px;
  color: #262626;
  resize: none;
}
.post > .post-footer > .comment-container > a {
  display: block;
  position: absolute;
  top: 20px;
  right: 6px;
  width: 16px;
  height: 16px;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>

	<%-- <div class="row">
		<div class="col-md-offset-4 col-md-4">
		<table class="table table-bordered">
			<tr style="background-color: white"><td style="border: none;">${item.userID}</td></tr>
			<c:if test="${item.notice_no == fitem.notice_no}">
			<tr><td><img src="<c:url value='/upload/sample.png'/>" style="width:100%; height:100%;"/></td></tr>
			</c:if>
			<tr style="border: none;"><td style="border: none;">${item.content}</td></tr>
		</table>
		</div>
	</div> --%>

	<div class="post-container">
		<div class="row">
			<div class="col-md-10 text-right">
				<a href="<c:url value="/Gallary/List.do"/>"
					class="btn btn-success">목록</a>
			</div>
		</div>
		<div class="wrap">
			<div class="post">
				<div class="post-headers">
					<a href="#" class="profile"><img src="<c:url value='/upload/sample.png'/>" alt="" style="width: 50px; height: 50px; padding: 10px"></a> 
					<!-- 
						<c:if test="${item.userID == filedto.userID }">
							<img src="<c:url value='/upload/${filedto.f_name}'/>" alt="" style="width: 50px; height: 50px; padding: 10px">
						</c:if> 
					-->
					<a href="<c:url value='/Member/MyHome.do'/>">${item.userID}</a>
					<c:if test="${sessionScope.UserID == item.userID }">
						<a class="dropdown-item" href="#" data-target="#moaModal"> 
							<img src="<c:url value='/resources/assets/images/more.png'/>" alt=''>
					</a>
					</c:if>
				</div>
				<div class="thumbnail">
					<c:forEach var="file" items="${fitem}" varStatus="var">
						<c:if test="${item.gallary_no == file.gallary_no}">
							<img src="<c:url value='/upload/${file.f_name}'/>" style="width: 500px; height: 500px" />
						</c:if>
					</c:forEach>
				</div>
				<div class="post-footers">
					<ul class="btn-container" style="list-style: none; padding-left:0px;">
						<li style="padding-left: 10px; padding-right:10px; float:left"><a id="heart1">
				           <img id="heart2" src="">
				       		</a></li>
						<li><a href="#"><img
								src="<c:url value='/resources/assets/images/speech-bubble.png'/>"
								alt=""></a></li>
					</ul>
					<div class="like-container" style="padding-left:10px">
						<a id="modal_show2" class="dropdown-item" href="#" data-toggle="modal" data-target="#likeModal">
							좋아요 ${item.visitCount } 개
						</a>
					</div>
					<!-- <div style="text-align: right;">
				       <a class="btn btn-outline-dark heart">
				           <img id="heart" src="">
				       </a>
				   </div> -->
					
					<div class="text-container" style="padding-left:10px">
						<a href="#">${item.userID}</a> ${item.content}
						<c:forEach items="${heart}" var="likeCount">
						<c:if test="${item.gallary_no == likeCount.gallary_no }">
							<li>${itemCount.userID }</li>
						</c:if>
					</c:forEach>
					</div>
					<div class="time-container" style="padding-left:10px">12분 전 
					</div>
					
					<div class="comment-container" style="padding-left:10px">
						<!-- <textarea name="comment" placeholder="댓글 달기..."></textarea> -->
						<form class="form-inline" id="frm" method="post">
			                     <!-- 씨큐리티 적용:csrf취약점 방어용 -->
			                     <input type="hidden" name="${_csrf.parameterName}"
			                        value="${_csrf.token}" /> 
			                        <input type="hidden" name="gallary_no"
			                        value="${item.gallary_no}" />
			
			                     <!-- 수정 및 삭제용 파라미터 -->
			                     <input type="hidden" name="gallary_com_no" /> 
			                     <input placeholder="댓글을 입력하세요" id="title" class="form-control"
			                        type="text" size="50" name="content" /> 
			                     <input class="btn btn-success" id="submit" type="button" value="등록" />
			
			                  </form>
			                  <div class="row">
			                     <!-- 한줄 코멘트 목록-->
			                     <!-- ajax로 아래에 코멘트 목록 뿌리기 -->
			                     <div id="comments" class="col-md-8"></div>
			                  </div>
						<%-- <a href="#"><img src="<c:url value='/upload/sample.png'/>"
							alt=""></a> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	<!-- 메뉴 Modal -->
    <div class="modal fade" id="moaModal" data-backdrop="static">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="btn btn-secondary"  onclick="location.href='<c:url value="/Gallary/GallaryEdit.do?gallary_no=${item.gallary_no}"/>'">수정하기</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/Gallary/GallaryDelete.do?gallary_no=${item.gallary_no}"/>'">삭제하기</button>
                    <button type="button" class="close" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

	<div class="modal fade" id="likeModal" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true"> 
		<div class="modal-dialog" role="document"> 
			<div class="modal-content"> 
				<div class="modal-body">
					<c:forEach items="${heart}" var="likeCount">
						<c:if test="${item.gallary_no == likeCount.gallary_no }">
							<li>${itemCount.userID }</li>
						</c:if>
					</c:forEach>
				</div> 
				<div class="modal-footer"> 
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div> 
			</div> 
		</div> 
	</div>

<script>
//페이지 로드시 코멘트 목록 뿌려주기]      
showComments();
//코멘트 입력 및 수정처리]
var action;
$("#submit").click(function(){
   
   if($(this).val() == "등록")
      action = "<c:url value='/Gallary/Comment/write.do'/>";         
   else
      action = "<c:url value='/Gallary/Comment/edit.do'/>";      
   //ajax로 요청]
   $.ajax({
      url:action,
      data:$('#frm').serialize(),
      dataType:'text',
      type:'post',
      success:function(data){
         console.log(data);
         //글 등록후 코멘트 목록 뿌려주는 함수 다시 호출
         showComments();
         //입력댓글 클리어 및 포커스 주기
         $('#title').val('');
         $('#title').focus();
         //글 수정후 등록버튼으로 다시 교체하기
         if($('#submit').val()=='수정') $('#submit').val('등록');
            
      }      
      
   });   
      
});/////////////////
//현재 글번호에 대한 모든 댓글을 요청하는 함수
function showComments(){
   $.ajax({
      url:"<c:url value='/Gallary/Comment/list.do'/>",
      data:{"gallary_no":"${item.gallary_no}","_csrf":"${_csrf.token}"},
      dataType:'json',
      type:'post',
      success:showComments_,
      error:function(e){console.log(e);}
      
   });
   
}//////////////showComments
//실제 댓글 목록을 뿌려주는 함수]
function showComments_(data){
   console.log('코멘트 목록:',data);
   var comments ="";
   comments+="<table class='table '>";
   //comments+="<tr><th class='text-center col-md-4'></th><th class='text-center'></th><th class='text-center col-md-2'></th><th class='text-center col-md-1'></th></tr>";
   /* if(data.length == 0){
      comments+="<tr><td colspan='4'>등록된 한줄 댓글이 없어요</td></tr>";
   } */
   $.each(data,function(index,element){
      comments+="<tr><td>"+element['USERID']+'</td>';
      if("${sessionScope.UserID}" == element['USERID'])//씨큐리티 미 사용시
         comments+="<td class='text-left'><span class='commentEdit' title='"+element['GALLARY_COM_NO']+"' style='cursor:pointer'>"+element['CONTENT']+'</span></td>';
      else 
         comments+="<td class='text-left'>"+element['CONTENT']+"</td>";
      
         
      comments+="<td>"+element['POSTDATE']+"</td>";
      comments+="<td>";
      if("${sessionScope.UserID}" == element['USERID'])
         comments+="<span class='commentDelete' title='"+element['GALLARY_COM_NO']+"' style='cursor:pointer'>삭제</span></td>";
      else
         comments+="<span style='color:gray;font-size:.7em'>삭제불가</span>";
      comments+="</td></tr>";
   });
   
   comments+="</table>";
   
   $('#comments').html(comments);
   
   //반드시 showComments_() 함수 안에
   //코멘트 제목 클릭시 코멘트 수정처리를 위한 UI변경부분]   
   $(".commentEdit").click(function(){
      console.log('클릭한 댓글의 키값(GALLARY_COM_NO):',$(this).attr('title'));
      //클릭한 제목으로 텍스트박스 값 설정
      $('#title').val($(this).html());
      //버튼은 등록에서 수정으로
      $('#submit').val('수정');
      //form의 hidden속성중 name="cno"값 설정
      $('input[name=gallary_com_no]').val($(this).attr('title'));
   });
   //코멘트 삭제 처리]
   $(".commentDelete").click(function(){
      $.ajax({
         url:"<c:url value='/Gallary/Comment/delete.do'/>",
         data:{"gallary_com_no":$(this).attr('title'),"_csrf":"${_csrf.token}"},
         dataType:'text',
         type:'post',
         success:function(){showComments();}
         
      });
      
   });
   
}////////////////////   
function isDelete(){
   if(confirm("정말로 삭제 하시겠습니까?")){
      location.replace("<c:url value='/Gallary/delete.do?gallary_no=${item.gallary_no}'/>");
   }
}////////////isDelete

	$(function(){
		
    var heartval = ${item.visitCount};
		if(${sessionScope.UserID != heart.userID }){
	        console.log(heartval);
	        $("#heart2").prop("src", "<c:url value='/resources/assets/images/heart.png'/>");
	        $("#heart1").prop('name',heartval)
		}
	    else{
	        console.log(heartval);
	        $("#heart2").prop("src", "<c:url value='/resources/assets/images/heart2.png'/>");
	        $("#heart1").prop('name',heartval)
		}

    $("#heart1").on("click", function () {

        var that = $("#heart1");

        var sendData = {'gallary_no' : '${item.gallary_no}','heart' : that.prop('name')};
        $.ajax({
            url :'<c:url value='/Gallary/Like/heart'/>',
            type :'POST',
            data : sendData,
            success : function(data){
                that.prop('name',data);
                if(data==1) {
                    $('#heart2').prop("src","<c:url value='/resources/assets/images/heart2.png'/>");
                }
                else{
                    $('#heart2').prop("src","<c:url value='/resources/assets/images/heart.png'/>");
                }

            }
        });
    });
});
</script>
</body>
</html>
