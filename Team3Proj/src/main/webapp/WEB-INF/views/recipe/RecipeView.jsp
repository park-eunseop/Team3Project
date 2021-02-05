<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<style>
.mainPic {
	width: 100%;
	height: 570px;
	overflow: hidden;
	justify-content: center;
	align-items: center;
	display: flex;
}

.recipe_content_title h6 {
	color: #F3D55A;
	font-family: "basic-EB";
	font-size: 16px;
}

.recipe_content_title h2 {
	font-size: 35px;
	line-height: 1.2;
}

.recipe_content_summary .card {
	background-color: #F9F8EF;
	border: none;
}

.dropdown-toggle::after {
	content: none;
}

.dropdown {
	display: inline-block;
}

.recipe_content_profile td {
	font-family: "basic-B";
	color: #797979;
	font-size: 14px;
}

.recipe_content_profile #nick {
	font-family: "basic-EB";
	color: #222222;
	font-size: 18px;
	padding-top: 10px;
	padding-bottom: 0;
}

.commentform {
	border-right: none;
}

.scrap {
	margin-left: 20px;
}

.like, .scrap {
	display: inline-block;
	float: right;
}

.like h2, .scrap h2 {
	color: #797979;
	margin: 0;
	line-height: 1;
}

.like h5, .scrap h5 {
	color: #797979;
	font-family: "basic-EB";
}



</style>

<!-- 네비게이션바 거리유지 -->
    <section class="pad">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    d
                </div>
            </div>
        </div>
    </section>
    <!--네비게이션바 거리유지 끝-->

    
 <!-- 메인사진 -->
<div class="container-fluid">
	<div class="row">
		<div class="mainPic">
			<c:forEach var="file" items="${recipeFile}" varStatus="var">
				<c:if test="${recipe.rec_no == file.rec_no}">
					<img src="<c:url value='/upload/${file.f_name}'/>" style="width: 100%; height: auto;"/>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>
<!-- 메인사진 끝-->




    <!-- 레시피 제목부분 -->
    <section class="recipe_content_title bg-white m-top-50">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-2">
                    <h6>${recipe.category}</h6>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 offset-2">
                    <h2>${recipe.title}</h2>
                </div>
                <div class="col-sm-2 text-center">
                    <div class="scrap">
                        <h2><i class="far fa-bookmark"></i></h2><h5>스크랩</h5>
                    </div>
                    <div class="like">
                        <h2><i class="far fa-heart"></i></h2><h5>좋아요</h5>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- 레시피 제목부분 끝-->





    <!--작성자 정보-->
    
    <section class="recipe_content_profile bg-white roomy-40">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-2">
                    <table class="table table-borderless table-sm">
                        <tbody>
                          <tr>
                            <td rowspan="2" width="80px"><img src="<c:url value='/upload/${file.f_name}'/>" class="rounded-circle" alt="프로필사진" width="65px" height="65px"> 
                            </td>
                            <td id="nick">${member.nickname}</td>
                            
                            <td rowspan="2" style="text-align: right; vertical-align: middle;" >
                                <div class="buttons">
                                    <button><a href="#" class="btn btn-follow">팔로우</a></button>
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-more dropdown-toggle" data-toggle="dropdown">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">신고하기</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                          </tr>
                          <tr>
                            <td id="resipe_postdate">${recipe.postDate}</td>
                          </tr>
                        </tbody>
                      </table>
                </div>
            </div>
        </div>
    </section>
    <!--작성자 정보 끝-->


    <!-- 레시피 정보 -->
    <section class="recipe_content_summary bg-white roomy-40">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-2">
                    <div class="card">
                        <div class="card-body">
                            <h2>${recipe.vg_level} ${recipe.category} ${recipe.difficulty} ${recipe.cooktime}</h2>
                            <hr>
                            <p>재료${recipe.ingredients}</p>
                            <p>도구${recipe.tools}</p>
                        </div>                           
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 레시피 정보 끝-->


    <!-- 레시피 완성샷 & 레시피 설명 -->
    <section class="recipe_content_complete bg-white roomy-20">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-2">
                    <div id="demo" class="carousel slide" data-ride="carousel">

                        <!-- Indicators -->
                        <ul class="carousel-indicators">
                          <li data-target="#demo" data-slide-to="0" class="active"></li>
                          <li data-target="#demo" data-slide-to="1"></li>
                          <li data-target="#demo" data-slide-to="2"></li>
                        </ul>
                        
                        <!-- The slideshow -->
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img src="<c:url value="/resources/assets/images/코칭1.jpg"/>" alt="Los Angeles" width="100%" height="500">
                          </div>
                          <div class="carousel-item">
                            <img src="<c:url value="/resources/assets/images/코칭1.jpg"/>" alt="Chicago" width="100%" height="500">
                          </div>
                          <div class="carousel-item">
                            <img src="<c:url value="/resources/assets/images/코칭1.jpg"/>" alt="New York" width="100%" height="500">
                          </div>
                        </div>
                        
                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                          <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                          <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                    
                    <div class="">
                        <p>${recipe.content}</p>
                    </div>
            </div>
        </div>
    </section>
    <!-- 레시피 완성샷 & 레시피 설명 끝-->



    <!-- 레시피 단계 -->
    <section class="recipe_content_title bg-white">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-2">
                    <p>단계단계 </p>
                </div>
            </div>
        </div>
        
        
        			<!-- 수정, 삭제, 목록 버튼 -->
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
					<ul id="pillMenu" class="nav nav-pills center-block"
						style="width: 200px; margin-bottom: 10px">
						<c:if test="${sessionScope.UserID == recipe.userID }">
							<li><a
								href="<c:url value='/RecipeBBS/edit.do?rec_no=${recipe.rec_no}'/>"
								class="btn btn-success">수정</a></li>
							<li><a href="javascript:isDelete();" class="btn btn-success">삭제</a></li>
						</c:if>
						<li><a href="<c:url value='/recipe.do'/>"
							class="btn btn-success">목록</a></li>

					</ul>
				</div>
			</div>
		<!-- 수정, 삭제, 목록 버튼 -->
		
    </section>
    <!-- 레시피 단계 끝-->



    
   <!-- 댓글 -->
    <section class="recipe_content_title bg-white">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-2">
                    <hr>
                    
                    <div class="m-top-40">
                    	<h4>댓글</h4>
                    </div>
                    
                    <form class="form m-top-15" id="frm" method="post">
						<!-- 씨큐리티 적용:csrf취약점 방어용 -->
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="hidden" name="rec_no"
							value="${recipe.rec_no}" />
						<!-- 수정 및 삭제용 파라미터 -->
						<div class="input-group">
						<input type="hidden" name="rec_com_no" /> 
							<input type="text" name="content" id="title" class="form-control commentform" placeholder="댓글을 입력해주세요.">
							<div class="input-group-append">
								<input class="btn btn-outline-light" id="submit" type="button" value="등록" />
							</div>
						</div>
					</form>
				

  
                </div>
            </div>
            
            <div class="row">
                <div id="comments" class="col-sm-8 offset-2">
                
                </div>
                
                <div id="comments" class="col-sm-8 offset-2">
                <table class="table table-sm">
                        <tbody>
                          <tr>
                            <td rowspan="2" width="55px"><img src="<c:url value="/resources/assets/images/코칭1.jpg"/>" class="rounded-circle" alt="프로필사진" width="35px" height="35px"> 
                            </td>
                            <td id="nick">닉네임 내용내용</td>
                            
                            <td rowspan="2" style="text-align: right; vertical-align: middle;" >
                                <div class="like">
                                    <a href="#" class="like"><i class="far fa-heart" style="color: #797979;"></i></a>
                                </div>
                            </td>
                          </tr>
                          
                          <tr>
                            <td id="resipe_postdate">2021년 02월 02일</td>
                          </tr>
                        </tbody>
                      </table>
                </div>
                	
                    

                </div>
            </div>
                
            
        </div>
    </section>
    <!-- 댓글 끝-->   
        
    
    
    

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-center">
						<div class="row">
							<!-- 한줄 코멘트 목록-->
							<!-- ajax로 아래에 코멘트 목록 뿌리기 -->
							<div id="comments" class="col-md-offset-3 col-md-6"></div>
						</div>
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
				action = "<c:url value='/RecipeBBS/Comment/write.do'/>";			
			else
				action = "<c:url value='/RecipeBBS/Comment/edit.do'/>";		
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
				url:"<c:url value='/RecipeBBS/Comment/list.do'/>",
				data:{"rec_no":"${recipe.rec_no}","_csrf":"${_csrf.token}"},
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
			comments+="<table class='table table-sm'><tbody>";
			if(data.length == 0){
				comments+="<tr><td colspan='4'>등록된 한줄 댓글이 없어요</td></tr>";
			}
			
			$.each(data,function(index,element){
				comments+="<tr><td>"+element['USERID']+'</td>';
				if("${sessionScope.UserID}" == element['USERID'])//씨큐리티 미 사용시
					comments+="<td class='text-left'><span class='commentEdit' title='"+element['REC_COM_NO']+"' style='cursor:pointer'>"+element['CONTENT']+'</span></td>';
				else 
					comments+="<td class='text-left'>"+element['CONTENT']+"</td>""";
				
					
				comments+="<td>"+element['POSTDATE']+"</td>";
				comments+="<td>";
				if("${sessionScope.UserID}" == element['USERID'])
					comments+="<span class='commentDelete' title='"+element['REC_COM_NO']+"' style='cursor:pointer'>삭제</span></td>";
				else
					comments+="<span style='color:gray;font-size:.7em'>삭제불가</span>";
				comments+="</td></tr>";
			});
			
			comments+="</tbody></table>";
			
			$('#comments').html(comments);
			
			//반드시 showComments_() 함수 안에
			//코멘트 제목 클릭시 코멘트 수정처리를 위한 UI변경부분]	
			$(".commentEdit").click(function(){
				console.log('클릭한 댓글의 키값(REC_COM_NO):',$(this).attr('title'));
				//클릭한 제목으로 텍스트박스 값 설정
				$('#title').val($(this).html());
				//버튼은 등록에서 수정으로
				$('#submit').val('수정');
				//form의 hidden속성중 name="cno"값 설정
				$('input[name=rec_com_no]').val($(this).attr('title'));
			});
			
			//코멘트 삭제 처리]
			$(".commentDelete").click(function(){
				$.ajax({
					url:"<c:url value='/RecipeBBS/Comment/delete.do'/>",
					data:{"rec_com_no":$(this).attr('title'),"_csrf":"${_csrf.token}"},
					dataType:'text',
					type:'post',
					success:function(){showComments();}
					
				});
				
			});
			
			
			
		}////////////////////	
		function isDelete(){
			if(confirm("정말로 삭제 하시겠습니까?")){
				location.replace("<c:url value='/RecipeBBS/delete.do?rec_no=${recipe.rec_no}'/>");
			}
		}////////////isDelete	
	</script>
