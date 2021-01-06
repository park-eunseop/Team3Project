<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script>
$(function(){
	$("#age").datepicker({
		
		dateFormat: "yy-mm-dd",
	       changeMonth: true,
	       changeYear: true,
	       maxDate: "-16Y",
	       minDate: "-100Y",
	       yearRange: "-100:-16"
	});	
	$("#inputfile").change(function(){
			 if(this.files && this.files[0]) {
			 var reader = new FileReader;
		reader.onload = function(data) {
		 $(".select_img img").attr("src", data.target.result).width(300).height(300);        
			  }
			reader.readAsDataURL(this.files[0]);
		  }
	});//첨부파일 사진
	
	$('#id').blur(function(){
		console.log('아이디');
		var id = $('#id').val();
		if(id.length==0){		
			$('#spanid').attr('style','color:#ff0000').html('필수사항입니다.');
		}
		else if(id.length<5){			
			$('#spanid').attr('style','color:#ff0000').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다..');
		}
		else{
			$('#spanid').html('');
			var data = $('#id').val();
			console.log(data);
			$.ajax({
				type:"post",
				url:"<c:url value='/Member/sign/idCheck.do'/>",
				dataType: 'json',
				data: "userID="+data,
				success:function(data){
					console.log('서버로 부터 받은 데이타 : ',data["flag"]);
					if(data["flag"]=='1')
						$('#spanid').attr('style','color:#00ff00').html(data["msg"]);
					else
						$('#spanid').attr('style','color:#ff0000').html(data["msg"]);
				}				
			});						
		}		
	});//아이디
	
	$('#pwd').blur(function(){
		var pwd = $('#pwd').val();
		if(pwd.length==0){			
			$('#spanpwd').attr('style','color:#ff0000').html('필수사항입니다.');
		}
		else if(pwd.length<8){			
			$('#spanpwd').attr('style','color:#ff0000').html('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
		}
		else{
			$('#spanpwd').html('');							
		}		
	});//비밀번호
	$('#pwdcheck').blur(function(){
		var pwdck = $('#pwdcheck').val();
		if(pwdck.length==0){			
			$('#spanpwdcheck').attr('style','color:#ff0000').html('필수사항입니다.');
		}
		else if(pwdck != $('#pwd').val()){			
			$('#spanpwdcheck').attr('style','color:#ff0000').html('비밀번호가 일치하지 않습니다.');
		}
		else{
			$('#spanpwdcheck').html('');							
		}		
	});//비밀번호 확인
	
	//비건레벨 선택
	
	$("#sel1").change(function(){
		
		var option_level = $(this).val();
		console.log(option_level);
		//비건레벨선택시
		if(option_level=="rac"){
			$('#main_vg_image').attr("src","<c:url value='/resources/assets/images/level2.png'/>");
			$('#food1').attr("src","<c:url value='/resources/assets/images/on1.png'/>");
			$('#food2').attr("src","<c:url value='/resources/assets/images/on2.png'/>");
			$('#food3').attr("src","<c:url value='/resources/assets/images/off3.png'/>");
			$('#food4').attr("src","<c:url value='/resources/assets/images/off4.png'/>");
			$('#food5').attr("src","<c:url value='/resources/assets/images/off5.png'/>");
			$('#food6').attr("src","<c:url value='/resources/assets/images/off6.png'/>");
		}
		else if(option_level=="ov"){
			$('#main_vg_image').attr("src","<c:url value='/resources/assets/images/level3.png'/>");
			$('#food1').attr("src","<c:url value='/resources/assets/images/on1.png'/>");
			$('#food2').attr("src","<c:url value='/resources/assets/images/off2.png'/>");
			$('#food3').attr("src","<c:url value='/resources/assets/images/on3.png'/>");
			$('#food4').attr("src","<c:url value='/resources/assets/images/off4.png'/>");
			$('#food5').attr("src","<c:url value='/resources/assets/images/off5.png'/>");
			$('#food6').attr("src","<c:url value='/resources/assets/images/off6.png'/>");	
		}
		else if(option_level=="racov"){
			$('#main_vg_image').attr("src","<c:url value='/resources/assets/images/level4.png'/>");
			$('#food1').attr("src","<c:url value='/resources/assets/images/on1.png'/>");
			$('#food2').attr("src","<c:url value='/resources/assets/images/on2.png'/>");
			$('#food3').attr("src","<c:url value='/resources/assets/images/on3.png'/>");
			$('#food4').attr("src","<c:url value='/resources/assets/images/off4.png'/>");
			$('#food5').attr("src","<c:url value='/resources/assets/images/off5.png'/>");
			$('#food6').attr("src","<c:url value='/resources/assets/images/off6.png'/>");
		}
		else if(option_level=="pesco"){
			$('#main_vg_image').attr("src","<c:url value='/resources/assets/images/level5.png'/>");
			$('#food1').attr("src","<c:url value='/resources/assets/images/on1.png'/>");
			$('#food2').attr("src","<c:url value='/resources/assets/images/on2.png'/>");
			$('#food3').attr("src","<c:url value='/resources/assets/images/on3.png'/>");
			$('#food4').attr("src","<c:url value='/resources/assets/images/on4.png'/>");
			$('#food5').attr("src","<c:url value='/resources/assets/images/off5.png'/>");
			$('#food6').attr("src","<c:url value='/resources/assets/images/off6.png'/>");
		}
		else if(option_level=="polo"){
			$('#main_vg_image').attr("src","<c:url value='/resources/assets/images/level6.png'/>");
			$('#food1').attr("src","<c:url value='/resources/assets/images/on1.png'/>");
			$('#food2').attr("src","<c:url value='/resources/assets/images/on2.png'/>");
			$('#food3').attr("src","<c:url value='/resources/assets/images/on3.png'/>");
			$('#food4').attr("src","<c:url value='/resources/assets/images/on4.png'/>");
			$('#food5').attr("src","<c:url value='/resources/assets/images/on5.png'/>");
			$('#food6').attr("src","<c:url value='/resources/assets/images/off6.png'/>");
		}
		else if(option_level=="none"){
			$('#main_vg_image').attr("src","<c:url value='/resources/assets/images/level7.png'/>");
			$('#food1').attr("src","<c:url value='/resources/assets/images/on1.png'/>");
			$('#food2').attr("src","<c:url value='/resources/assets/images/on2.png'/>");
			$('#food3').attr("src","<c:url value='/resources/assets/images/on3.png'/>");
			$('#food4').attr("src","<c:url value='/resources/assets/images/on4.png'/>");
			$('#food5').attr("src","<c:url value='/resources/assets/images/on5.png'/>");
			$('#food6').attr("src","<c:url value='/resources/assets/images/on6.png'/>");
		}
		else if(option_level=="vegan"){
			$('#main_vg_image').attr("src","<c:url value='/resources/assets/images/level1.png'/>");
			$('#food1').attr("src","<c:url value='/resources/assets/images/on1.png'/>");
			$('#food2').attr("src","<c:url value='/resources/assets/images/off2.png'/>");
			$('#food3').attr("src","<c:url value='/resources/assets/images/off3.png'/>");
			$('#food4').attr("src","<c:url value='/resources/assets/images/off4.png'/>");
			$('#food5').attr("src","<c:url value='/resources/assets/images/off5.png'/>");
			$('#food6').attr("src","<c:url value='/resources/assets/images/off6.png'/>");
		}
		
		
	});
	
	
	
	//약관선택
	$(':checkbox').click(function(){
		if($(this).val()=='all'){//전체선택 클릭
			console.log('all check');
			if($(this).prop('checked')){//체크한 경우
				$(':checkbox:gt(0)').each(function(){
					$(this).prop('checked',true);
				});
			}
			else{//해제한 경우
				$(':checkbox:gt(0)').each(function(){
					$(this).prop('checked',false);
				});
			}
		}
		else{//전체 선택이 아닌 체크박스 클릭
			if($(this).prop('checked')){//체크한 경우
				//체크된 모든 체크박스의 수와 전체선택을 제외한 체크박스의 수가 같다면 
				//즉 모두 선택되었다면 
				if($(':checkbox:gt(0)').length==$(':checkbox:checked').length)
					$(':checkbox:first').prop('checked',true);
			}
			else{//해제한 경우
				$(':checkbox:first').prop('checked',false);
			}
		}
	});

});

function Dosignup(){
	console.log('here');
	
	var id = $('#id').val();
	var pwd = $('#pwd').val();
	var pwdck = $('#pwdcheck').val();
	var nickname = $('#nickname').val();
	var age = $('#age').val();
	var male = $('#customRadio').is(":checked");
	var female = $('#customRadio2').is(":checked");
	var level = $("#sel1 option:selected").val();
	var file = $('#inputfile').val();
	//var self = $('#summernote').val();
	
	var returnFalse = 1;
	
	console.log('id: ',id);
	console.log('pwd: ',pwd);
	console.log('nickname: ',nickname);
	console.log('age: ',age);
	//console.log('gender: ',gender);
	console.log('level: ',level);
	console.log('file: ',file);
	//console.log('self: ',self);
	
	
	//아이디
	if(id.length==0){		
		$('#spanid').attr('style','color:#ff0000').html('필수사항입니다.');
	}
	else if(id.length<5){			
		$('#spanid').attr('style','color:#ff0000').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다..');
	}
	else{
		var data = $('#id').val();
		console.log(data);
		$.ajax({
			type:"post",
			url:"<c:url value='/Member/sign/idCheck.do'/>",
			dataType: 'json',
			data: "userID="+data,
			success:function(data){
				console.log('서버로 부터 받은 데이타 : ',data["flag"]);
				if(data["flag"]=='0'){
					$('#spanid').attr('style','color:#ff0000').html(data["msg"]);
				}
			}				
		});	
	}
	//비밀번호
	if(pwd.length==0){			
		$('#spanpwd').attr('style','color:#ff0000').html('필수사항입니다.');
	}
	else if(pwd.length<8){			
		$('#spanpwd').attr('style','color:#ff0000').html('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
	}
	//비밀번호 확인
	if(pwdck.length==0){			
		$('#spanpwdcheck').attr('style','color:#ff0000').html('필수사항입니다.');
	}
	else if(pwdck != $('#pwd').val()){			
		$('#spanpwdcheck').attr('style','color:#ff0000').html('비밀번호가 일치하지 않습니다.');

	}
	//파일 확인
	if(file.length==0){		
		$('#spanfile').attr('style','color:#ff0000').html('필수사항입니다.');		
	}
	else if(file.length!=0){		
		$('#spanfile').html('');		
	}
	//닉네임 확인
	if(nickname.length==0){		
		$('#spannickname').attr('style','color:#ff0000').html('필수사항입니다.');

	}
	else if(nickname.length!=0){		
		$('#spannickname').html('');		
	}
	//생년월일 확인
	if(age.length==0){		
		$('#spanage').attr('style','color:#ff0000').html('필수사항입니다.');
	}
	else if(age.length!=0){		
		$('#spanage').html('');
		
	}

	/*
	if(gender =='Gender'){		
		$('#spangender').attr('style','color:#ff0000').html('필수사항입니다.');
		$("#selectgender").focus();
		return false;
	}
	else if(gender !='Gender'){		
		$('#spangender').html('');
		
	}
	
	if(level =='Level'){		
		$('#spanlevel').attr('style','color:#ff0000').html('필수사항입니다.');
		$("#selectlevel").focus();
		return false;
	}
	else if(level !='Level'){		
		$('#spanlevel').html('');
		
	}
	*/
	/* 주소랑 자기소개는 추후 입력?
	if(addr.length==0){		
		$('#spanaddr').attr('style','color:#ff0000').html('필수사항입니다.');
		$('#inputaddr').focus();
		return false;
	}
	else if(addr.length!=0){		
		$('#spanaddr').html('');
		
	}
	if(self.length==0){		
		$('#spanself').attr('style','color:#ff0000').html('필수사항입니다.');
		$('#summernote').summernote('focus');
		return false;
	}
	else if(self.length!=0){		
		$('#spanself').html('');
		
	}
	*/
	var option1 = $('#customCheck1').is(":checked");
	var option2 = $('#customCheck2').is(":checked");
	var option3 = $('#customCheck3').is(":checked");
	console.log(option1);

	if($('#spanid').html().length!=0 && $('#spanid').html() != '멋진 아이디네요!' ){
		console.log('여기로 들어오는건가');
		$('#id').focus();		
		return false;
	}//아이디에서 오류가 있을 시
	else if($('#spanpwd').html().length!=0){
		$('#pwd').focus();
		return false;
	}//비밀번호에서 오류가 있을 시
	else if($('#spanpwdcheck').html().length!=0){
		$('#pwdcheck').focus();
		return false;
	}//비밀번호확인에서 오류가 있을 시
	else if($('#spanfile').html().length!=0){
		$('#inputfile').focus();
		return false;
	}//파일 미 입력시
	else if($('#spannickname').html().length!=0){
		$('#nickname').focus();
		return false;
	}//닉네임 미입력시
	else if($('#spanage').html().length!=0){
		$('#age').focus();
		return false;
	}//생년월일 미 입력시
	else if(!option1){
		alert('필수 약관동의를 체크해주세요');
		return false;
	}
	else if(!option2){
		alert('필수 약관동의를 체크해주세요');
		return false;
	}
	else if(!option3){
		alert('필수 약관동의를 체크해주세요');
		return false;
	}
		
	

	//alert('회원가입 되셨습니다.');
	console.log('yes');
	$('#form').submit();

	
	
}


</script>

<style>
    /*현재 페이지는 네비게이션바와 footer를 없앤 페이지입니다.*/
    .navbar{
        display: none;
    }
    .footer{
        display: none;
    }
</style>

    <!-- 회원가입 화면 -->
    <div class="container">
        <div class="row">
            <div class="col-sm-12 m-top-45">
                <a href="<c:url value="/"/>"><img src="<c:url value="/resources/assets/images/로고.png"/>" alt=""></a> <!--여기는 홈페이지 이동으로 연결해주세요-->
            </div>
        </div>     
    </div>

    
    <div class="sign-form">
        <div class="container">
            <div class="sign-title m-bottom-70">
                <h3 ><strong>베리베지 회원가입</strong></h3>
                <p>VERY VEGGI.와 건강한 채식 라이프를 즐길 준비가 되었나요?<br/>기본 정보와 프로필을 작성해주세요 :)</p>
            </div>

            <form action="<c:url value="/Member/UserSignUp.do"/>"  id="form" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="id">아이디</label>
                    <input type="text" class="form-control" placeholder="아이디" id="id" name="userID">
                    <span id="spanid" style="color:red"></span>
                </div>
                <div class="form-group">
                    <label for="pwd">비밀번호</label>
                    <p>8자 이상 입력해주세요.</p>
                    <input type="password" class="form-control" placeholder="비밀번호" id="pwd" name="password">
                    <span id="spanpwd" style="color:red"></span>
                </div>

                <div class="form-group">
                    <label for="pwd">비밀번호 확인</label>
                    <input type="password" class="form-control" placeholder="비밀번호 확인" id="pwdcheck" name="password">
                    <span id="spanpwdcheck" style="color:red"></span>
                </div>

                <div class="separator3"></div>

                <div class="form-group">
                    <label for="usr">프로필 사진</label>
                    <input id="inputfile" class="form-control-file" type="file"
							 name="upload">
					<span id="spanfile" style="color:red"></span>
					<input type="hidden" id ="filehidden"/>
                    <div class="select_img"><img src="" /></div>
                </div>
            
                <div class="form-group">
                    <label for="usr">별명</label>
                    <p>다른 유저와 중복되지 않는 별명을 입력해주세요. (2~15자)</p>
                    <input type="text" class="form-control" placeholder="별명 (2~15자)" id="nickname" name="nickname">
                	<span id="spannickname" style="color:red"></span>
                </div>

                <div class="form-group">
                    <label for="usr">성별</label>
                    
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" class="custom-control-input" id="customRadio" name="gender" value="Male" checked="checked">
                        <label class="custom-control-label" for="customRadio">남자</label>
                    </div>

                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" class="custom-control-input" id="customRadio2" name="gender" value="Female">
                        <label class="custom-control-label" for="customRadio2">여자</label>
                    </div>
                   	<span id="spangender" style="color:red"></span>
                </div>
                
               

                <div class="form-group">
                    <label for="usr">생년월일</label>
                    <input type="text" class="form-control" placeholder="yyyy-MM-dd" id="age" name="age">
                	<span id="spanage" style="color:red"></span>
                </div>

                <div class="form-group">
                    <label for="usr">채식 스타일</label>
                    <p>나의 채식스타일, 잘 모르겠다면?</p> <!--여기에 버튼-->
                    <div class="mylevel text-center" style="padding-bottom: 15px">
                        <img id="main_vg_image" src="<c:url value='/resources/assets/images/level1.png'/>" alt="채식레벨"/>
                        <p style="padding-top: 15px" id="level">채식레벨 입력</p>
                        <div class="food">
                            <img id=food1 src="<c:url value='/resources/assets/images/on1.png'/>" alt="1"/>
                            <img id=food2 src="<c:url value='/resources/assets/images/off2.png'/>" alt="2"/>
                            <img id=food3 src="<c:url value='/resources/assets/images/off3.png'/>" alt="3"/>
                            <img id=food4 src="<c:url value='/resources/assets/images/off4.png'/>" alt="4"/>
                            <img id=food5 src="<c:url value='/resources/assets/images/off5.png'/>" alt="5"/>
                            <img id=food6 src="<c:url value='/resources/assets/images/off6.png'/>" alt="6"/>
                        </div>
                    </div>
                    <select class="form-control" id="sel1" name="vg_level">
                        <option value="vegan">비건</option>
                        <option value="rac">락토</option>
                        <option value="ov">오보</option>
                        <option value="racov">락토-오보</option>
                        <option value="pesco">페스코</option>
                        <option value="polo">폴로</option>
                        <option value="none">채식주의자가 아니에요</option>
                      </select>
                    <p style="padding-top: 15px">채식 스타일은 '마이페이지'에서 수정하실 수 있습니다.</p>
                </div>
                
                <div class="form-group">
                    <label for="usr">약관 동의</label>
                    <div class="terms">
                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck0" name="example1" value="all">
                            <label class="custom-control-label" for="customCheck0" id='all'>전체동의</label>
                        </div>

                        <div class="separator4"></div>

                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck1" name="example1">
                            <label class="custom-control-label" for="customCheck1">만 14세 이상입니다.&nbsp;&nbsp;<span style="color: #EAC31B; font-size: 10px;">(필수)</span></label>
                        </div>
                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck2" name="example2">
                            <label class="custom-control-label" for="customCheck2"><a href="https://ohou.se/usepolicy">이용약관</a>&nbsp;&nbsp;<span style="color: #EAC31B; font-size: 10px;">(필수)</span></label>
                        </div>
                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck3" name="example3">
                            <label class="custom-control-label" for="customCheck3"><a href="https://ohou.se/privacy">개인정보 처리방침</a>&nbsp;&nbsp;<span style="color: #EAC31B; font-size: 10px;">(필수)</span></label>
                        </div>
                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck4" name="example1">
                            <label class="custom-control-label" for="customCheck4">이벤트, 프로모션 알림 메일 및 SMS 수신&nbsp;&nbsp;<span style="color: #CCCCCC; font-size: 10px;">(선택)</span></label>
                        </div>
                    </div>
                </div>


                


                

                <button type="button" class="btn btn-sign m-bottom-20"  onclick="javascript:Dosignup()">회원가입 완료</button>

                <div class="text-center m-bottom-50">
                <p>이미 아이디가 있으신가요?&nbsp;&nbsp;<strong><a href="<c:url value="/Member/Auth/Login.do"/>">로그인</a></strong></p>
                </div>
            </form>
        </div>
    </div>
    <!-- 회원가입 화면 끝 -->





<script>
$(document).ready(function() {
    $('#summernote').summernote({
      placeholder: '자기소개를 입력하세요',
   	  toolbar: [
   		    // [groupName, [list of button]]
   		    ['style', ['bold', 'italic']],
   		    ['fontsize', ['fontsize']],
   		    ['color', ['color']],
   		    ['para', ['paragraph']]
 		  ]
	});	
});
</script>