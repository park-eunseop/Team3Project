<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script>
$(function(){
	$("#inputage").datepicker({
		
		dateFormat: "yy-mm-dd",
	       changeMonth: true,
	       changeYear: true,
	       maxDate: "-16Y",
	       minDate: "-100Y",
	       yearRange: "-100:-16"
	});
	var milk_ck=0;
	var egg_ck=0;
	$('#milk').click(function(){
		console.log(milk_ck);
		if(milk_ck==0){
			$('#milk').attr("src","<c:url value="/resources/vg_level/milk_on.png"/>");
			milk_ck=1;
		}
		else{
			$('#milk').attr("src","<c:url value="/resources/vg_level/milk_off.png"/>");
			milk_ck=0;
		}
		if((milk_ck==1) && (egg_ck==0) && (fish_ck==0) && (bird_ck==0) && (beef_ck==0)){
			console.log('Lacto');
			$('#milk_ck').attr("selected","selected");			
			
		}
		
		
	});//milk
	$('#egg').click(function(){
		console.log(egg_ck);
		if(egg_ck==0){
			$('#egg').attr("src","<c:url value="/resources/vg_level/egg_on.png"/>");
			egg_ck=1;
		}
		else{
			$('#egg').attr("src","<c:url value="/resources/vg_level/egg_off.png"/>");
			egg_ck=0;
		}
		if((milk_ck==0) && (egg_ck==1) && (fish_ck==0) && (bird_ck==0) && (beef_ck==0)){
			console.log('Ovo');
			$('#egg_ck').attr("selected","selected");
		}
		else if((milk_ck==1) && (egg_ck==1) && (fish_ck==0) && (bird_ck==0) && (beef_ck==0)){
			console.log('Lacto_Ovo');
			$('#both_ck').attr("selected","selected");			
			
		}
	});//egg
	var fish_ck=0;
	$('#fish').click(function(){
		console.log(fish_ck);
		if(fish_ck==0){
			$('#fish').attr("src","<c:url value="/resources/vg_level/fish_on.png"/>");
			fish_ck=1;
		}
		else{
			$('#fish').attr("src","<c:url value="/resources/vg_level/fish_off.png"/>");
			fish_ck=0;
		}
		if((milk_ck==1) && (egg_ck==1) && (fish_ck==1) && (bird_ck==0) && (beef_ck==0)){
			console.log('pesco');
			$('#fish_ck').attr("selected","selected");			
			
		}
	});//fish
	var bird_ck=0;
	$('#bird').click(function(){
		console.log(bird_ck);
		if(bird_ck==0){
			$('#bird').attr("src","<c:url value="/resources/vg_level/bird_on.png"/>");
			bird_ck=1;
		}
		else{
			$('#bird').attr("src","<c:url value="/resources/vg_level/bird_off.png"/>");
			bird_ck=0;
		}
		if((milk_ck==1) && (egg_ck==1) && (fish_ck==1) && (bird_ck==1) && (beef_ck==0)){
			console.log('pollo');
			$('#bird_ck').attr("selected","selected");			
			
		}
	});//bird
	var beef_ck=0;
	$('#beef').click(function(){
		console.log(beef_ck);
		if(beef_ck==0){
			$('#beef').attr("src","<c:url value="/resources/vg_level/beef_on.png"/>");
			beef_ck=1;
		}
		else{
			$('#beef').attr("src","<c:url value="/resources/vg_level/beef_off.png"/>");
			beef_ck=0;
		}
		if((milk_ck==1) && (egg_ck==1) && (fish_ck==1) && (bird_ck==1) && (beef_ck==1)){
			console.log('Flexi');
			$('#beef_ck').attr("selected","selected");			
			
		}
	});//beef
	
	
	$("#inputfile").change(function(){
			 if(this.files && this.files[0]) {
			 var reader = new FileReader;
		reader.onload = function(data) {
		 $(".select_img img").attr("src", data.target.result).width(300).height(300);        
			  }
			reader.readAsDataURL(this.files[0]);
		  }
	});//첨부파일 사진
	
	$('#inputid').blur(function(){
		console.log('아이디');
		var id = $('#inputid').val();
		if(id.length==0){		
			$('#spanid').attr('style','color:#ff0000').html('필수사항입니다.');
		}
		else if(id.length<5){			
			$('#spanid').attr('style','color:#ff0000').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다..');
		}
		else{
			$('#spanid').html('');
			var data = $('#inputid').serializeArray();
			console.log(data);
			obj = {};//{userID:eunseop1224}
			$.each(data,function(index,element){
				obj[element.name]=element.value;				
			});//json
			console.log(obj);
			$.ajax({
				type:'post',
				url:"<c:url value='/json/sign/idCheck'/>",
				dataType:'json',
				data:JSON.stringify(obj),
				contentType:'application/json',
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
	
	$('#inputpwd').blur(function(){
		var pwd = $('#inputpwd').val();
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
	$('#inputpwdcheck').blur(function(){
		var pwdck = $('#inputpwdcheck').val();
		if(pwdck.length==0){			
			$('#spanpwdcheck').attr('style','color:#ff0000').html('필수사항입니다.');
		}
		else if(pwdck != $('#inputpwd').val()){			
			$('#spanpwdcheck').attr('style','color:#ff0000').html('비밀번호가 일치하지 않습니다.');
		}
		else{
			$('#spanpwdcheck').html('');							
		}		
	});//비밀번호 확인
	$('#inputname').blur(function(){
		var name = $('#inputname').val();
		if(name.length!=0){			
			$('#spanname').html('');			
		}
			
	});//이름

});



function Dosignup(){
	console.log('here');
	var id = $('#inputid').val();
	var pwd = $('#inputpwd').val();
	var pwdck = $('#inputpwdcheck').val();
	var name = $('#inputname').val();
	var nickname = $('#inputnickname').val();
	var age = $('#inputage').val();
	var gender = $("#selectgender option:selected").val();
	var level = $("#selectlevel option:selected").val();
	var file = $('#inputfile').val();
	var addr = $('#inputaddr').val();
	var self = $('#summernote').val();
	console.log('id: ',id);
	console.log('pwd: ',pwd);
	console.log('name: ',name);
	console.log('nickname: ',nickname);
	console.log('age: ',age);
	console.log('gender: ',gender);
	console.log('level: ',level);
	console.log('file: ',file);
	console.log('addr: ',addr);
	console.log('self: ',self);
	
	if(id.length==0){		
		$('#spanid').attr('style','color:#ff0000').html('필수사항입니다.');
		$('#inputid').focus();
		return false;
	}
	else if(id.length<5){			
		$('#spanid').attr('style','color:#ff0000').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다..');
		$('#inputid').focus();
		return false;
	}
	else{
		$('#spanid').html('');
		var data = $('#inputid').serializeArray();
		obj = {};
		$.each(data,function(index,element){
			obj[element.name]=element.value;				
		});
		$.ajax({
			type:'post',
			url:"<c:url value='/json/sign/idCheck'/>",
			dataType:'json',
			data:JSON.stringify(obj),
			contentType:'application/json',
			success:function(data){
				console.log('서버로 부터 받은 데이타 : ',data["flag"]);
				if(data["flag"]=='0'){
					$('#spanid').attr('style','color:#ff0000').html(data["msg"]);
					$('#inputid').focus();
					return false;
				}
			}				
		});				
	}
	if(pwd.length==0){			
		$('#spanpwd').attr('style','color:#ff0000').html('필수사항입니다.');
		$('#inputpwd').focus();
		return false;
	}
	else if(pwd.length<8){			
		$('#spanpwd').attr('style','color:#ff0000').html('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
		$('#inputpwd').focus();
		return false;
	}
	if(pwdck.length==0){			
		$('#spanpwdcheck').attr('style','color:#ff0000').html('필수사항입니다.');
		$('#inputpwdcheck').focus();
		return false;
	}
	else if(pwdck != $('#inputpwd').val()){			
		$('#spanpwdcheck').attr('style','color:#ff0000').html('비밀번호가 일치하지 않습니다.');
		$('#inputpwdcheck').focus();
		return false;
	}
	if(name.length==0){		
		$('#spanname').attr('style','color:#ff0000').html('필수사항입니다.');
		$('#inputname').focus();
		return false;
	}
	else if(name.length!=0){		
		$('#spanname').html('');
		
	}
	if(nickname.length==0){		
		$('#spannickname').attr('style','color:#ff0000').html('필수사항입니다.');
		$('#inputnickname').focus();
		return false;
	}
	else if(nickname.length!=0){		
		$('#spannickname').html('');
		
	}
	if(age.length==0){		
		$('#spanage').attr('style','color:#ff0000').html('필수사항입니다.');
		$('#inputage').focus();
		return false;
	}
	else if(age.length!=0){		
		$('#spanage').html('');
		
	}
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
	if(file.length==0){		
		$('#spanfile').attr('style','color:#ff0000').html('필수사항입니다.');
		return false;
	}
	else if(file.length!=0){		
		$('#spanfile').html('');
		
	}
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
	
	
	
	alert('회원가입 되셨습니다.');
	
	console.log('yes');
	$('#form').submit();
}


</script>
<style>
.bg-img {
  /* The image used */
  background-image: url('<c:url value="/resources/assets/images/homebg.jpg"/>');

  min-height:1000px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;  
  position: relative;
}
.wrapper {
  margin: 0 auto;
  
}

.wrapper--w960 {
  max-width: 960px;
}
.card {
  overflow: hidden;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  background: #fff;
}

.card-2 {
  -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  width: 100%;
  display: table;
}

.card-2 .card-heading {
  background: url('<c:url value="/resources/assets/images/bg-heading-02.jpg"/>') top left/cover no-repeat;
  width: 29.1%;
  display: table-cell;
}

.card-2 .card-body {
  display: table-cell;
  padding: 80px 90px;
  padding-bottom: 88px;
}

</style>







<div class="bg-img">
	<div class="wrapper wrapper--w960" style="padding-top: 200px;padding-bottom: 200px">
		<div class="card card-2">
			<div class="card-heading"></div>
		<div class="card-body">
		<h1>  Sign up</h1>
			<div class="col-sm-12">
				<form  class ="form-horizontal" id="form" method="post" action="<c:url value="/Member/UserSignUp.do"/>" enctype="multipart/form-data">
					<div class="form-group" style="color: black">
						<label for="id" class="col-sm-3  control-label">아이디</label>
						<div class="col-sm-4">
							<input id="inputid" type="text" class="form-control" name="userID" 
								placeholder="아이디를 입력하세요" style="width:200px">
							<span id="spanid" style="color:red"></span>
						</div>
					</div>
					<div class="form-group" style="color: black">
						<label for="pwd" class="col-sm-3  control-label">비밀번호</label>
						<div class="col-sm-4">
							<input id="inputpwd" type="password" class="form-control" 
								name="password" placeholder="비밀번호를 입력하세요" style="width:200px">
							<span id="spanpwd" style="color:red"></span>
						</div>
					</div>
					<div class="form-group" style="color: black">
						<label for="pwd" class="col-sm-3  control-label">비밀번호 확인</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" id="inputpwdcheck"
								name="passwordcheck" placeholder="비밀번호를 다시 입력하세요" style="width:200px">
							<span id="spanpwdcheck" style="color:red"></span>
						</div>
					</div>
					<div class="form-group" style="color: black">
						<label for="id" class="col-sm-3  control-label">이름</label>
						<div class="col-sm-4">
							<input id="inputname" type="text" class="form-control" name="name" 
								placeholder="이름를 입력하세요" style="width:200px">
							<span id="spanname" style="color:red"></span>
						</div>
					</div>
					<div class="form-group" style="color: black">
						<label for="id" class="col-sm-3  control-label">닉네임</label>
						<div class="col-sm-4">
							<input id="inputnickname" type="text" class="form-control" name="nickname" 
								placeholder="닉네임를 입력하세요" style="width:200px">
							<span id="spannickname" style="color:red"></span>
						</div>
					</div>
					<div class="form-group" style="color: black">
						<label for="id" class="col-sm-3  control-label">나이</label>
						<div class="col-sm-4">
							<input id="inputage" type="text" class="form-control" name="age" 
							placeholder="나이를 입력하세요" style="width:200px">
							<span id="spanage" style="color:red"></span>
						</div>
					</div>
					
					<div class="form-group" style="color: black">
						<label for="id" class="col-sm-3  control-label">성별</label>
						<div class="col-sm-4">
							<select name="gender" id="selectgender">
								<option disabled="disabled" selected="selected">Gender</option>
								<option>Male</option>
								<option>Female</option>
								<option>Other</option>
							</select>
							<span id="spangender" style="color:red"></span>
						</div>
					</div>
					
					<div class="form-group" style="color: black">
						<label for="id" class="col-sm-3  control-label">Level</label>
						<div class="col-sm-4">
							<select name="vg_level" id="selectlevel">
								<option disabled="disabled" selected="selected">Level</option>
								<option>Vegan</option>
								<option id="milk_ck">Lacto</option>
								<option id="egg_ck">Ovo</option>
								<option id="both_ck">Lacto-Ovo</option>
								<option id="fish_ck">Pesco</option>
								<option id="bird_ck">Pollo</option>
								<option id="beef_ck">Flexi</option>
							</select>
							<span id="spanlevel" style="color:red"></span>
							<div style="width: 500px">
							<img style="width: 30px; height: 30px;"
						src="<c:url value="/resources/vg_level/vg_on.png"/>"/>
							<img id="milk" style="width: 30px; height: 30px;"
						src="<c:url value="/resources/vg_level/milk_off.png"/>"/>
						<img id="egg" style="width: 30px; height: 30px;"
						src="<c:url value="/resources/vg_level/egg_off.png"/>"/>
						<img id="fish" style="width: 30px; height: 30px;"
						src="<c:url value="/resources/vg_level/fish_off.png"/>"/>
						<img id="bird" style="width: 30px; height: 30px;"
						src="<c:url value="/resources/vg_level/bird_off.png"/>"/>
						<img id="beef" style="width: 30px; height: 30px;"
						src="<c:url value="/resources/vg_level/beef_off.png"/>"/>
						</div>
						
						</div>
					</div>
					
					<div class="form-group" style="color: black">
						<label for="id" class="col-sm-3  control-label">주소</label>
						<div class="col-sm-4">
							<input id="inputaddr" type="text" class="form-control" name="addr" 
							placeholder="주소를 입력하세요" style="width:200px">
							<span id="spanaddr" style="color:red"></span>
						</div>
					</div>
					
					
					
					<div class="form-group" style="color: black">
						<label for="id" class="col-sm-3  control-label">자기소개</label>
						<div class="col-sm-7">
							<textarea id="summernote" name="editordata"></textarea>
							<span id="spanself" style="color:red"></span>
						</div>
					</div>



					<div class="form-group" style="color: black">
						<label for="id" class="col-sm-3  control-label">사진</label>
						<div class="col-sm-7">
							<input id="inputfile" class="input--style-2" type="file"
							 name="upload">
							<span id="spanfile" style="color:red"></span>
							<div class="select_img"><img src="" /></div> 														
						</div>
						
					</div>
			
					
					
					<div class="form-group">
						<div class="col-sm-offset-6 col-sm-10">
							<button type="button" class="btn btn--radius btn--green"  onclick="javascript:Dosignup()">Sign up</button>
						</div>
					</div>
				</form>
				</div>				
			</div>
		</div>
	</div>
</div>

<!-- summernote -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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