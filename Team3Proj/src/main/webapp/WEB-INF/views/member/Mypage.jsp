<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
* {
	box-sizing: border-box
}

#first_container {
	padding-top: 200px;
}

body {
	font-family: "Lato", sans-serif;
}

/* Style the tab */
.tab {
	float: left;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
	width: 30%;
	height: 300px;
}

/* Style the buttons inside the tab */
.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 16px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	float: left;
	padding: 0px 12px;
	border: 1px solid #ccc;
	width: 70%;
	border-left: none;
	height: 300px;
}
</style>
<script>



$(function(){
	//회원 탈퇴 버튼 눌렀을 경우
	$('#Withdrawalbtn').click(function(){
		console.log('withdrawalbtn!');
		var curPwd = $('#withcurpwd').val();
		var PwdCheck = $('#withpwdcheck').val();
		
		if(curPwd.length==0){
			alert('현재 비밀번호를 입력하세요');
			$('#withcurpwd').focus();
		}
		else{			
			if(curPwd==PwdCheck){
				console.log('same!')
				$.ajax({
					type:"post",
					url:"<c:url value='/Member/MemberRemove.do'/>",
					dataType: 'text',
					data: "curPwd="+curPwd,
					success: function(data){
						console.log(data);
						
						if(data=='Success'){
							alert('회원탈퇴 되셨습니다.');
							$('#islogin').get(0).click();
						
						}
						else
							alert('비밀번호가 일치하지 않습니다.');
					}
					
				});
				
				
				
			}
			else{
				alert('비밀번호를 다시 확인해주세요');
				$('#withpwdcheck').focus();
			}			
		}		
	});
	$('#editBtn').click(function(){
		var curPwd = $('#curPwd').val();
		var editPwd = $('#editPwd').val();
		var editPwdCheck = $('#editPwdcheck').val();
		if(curPwd.length==0){
			alert('현재 비밀번호를 입력하세요');
			$('#curPwd').focus();
		}
		else{			
			if(editPwd==editPwdCheck){
				console.log('same!')
				$.ajax({
					type:"post",
					url:"<c:url value='/Member/MemberEditPWD.do'/>",
					dataType: 'text',
					data: {"curPwd":curPwd,"editPwd":editPwd},
					success: function(data){
						console.log(data);
						
						if(data=='Success'){
							alert('비밀번호가 변경되셨습니다.');
							$('#curPwd').val('');
							$('#editPwd').val('');
							$('#editPwdcheck').val('');
							
						
						}
						else
							alert('비밀번호가 일치하지 않습니다.');
					}
					
				});
				
				
				
			}
			else{
				alert('비밀번호를 다시 확인해주세요');
				$('#editPwd').focus();
			}			
		}
		
		
	})
	
});



</script>
<div class="container" id="first_container">
</div>


<div class="w3-row  w3-border " >
  

	<h2>회원 정보 수정 페이지 입니다.</h2>

	<div class="tab" >
		<button class="tablinks" onclick="openCity(event, 'PasswordEdit')"
			id="defaultOpen">비밀번호 변경</button>
		<button class="tablinks" onclick="openCity(event, 'ProfileEdit')">프로필
			편집</button>
		<button class="tablinks" onclick="openCity(event, 'Withdrawal')">회원
			탈퇴</button>
	</div>

	<div id="PasswordEdit" class="tabcontent"
		style="background-color: white; height: 600px">
		<div class="row" style="padding-top: 50px;">
			<div class="col-sm-12">
				<form class="form-horizontal">
					<div class="form-group" style="color: black">
						<label for="pwd" class="col-sm-3  control-label">기존 비밀번호</label>
						<div class="col-sm-4">
							<input id="curPwd" type="password" class="form-control"
								name="curPwd" placeholder="기존 비밀번호를 입력하세요"> <span
								id="spanpwd" style="color: red"></span>
						</div>
					</div>
					<div class="form-group" style="color: black">
						<label for="pwd" class="col-sm-3  control-label">변경할 비밀번호</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" id="editPwd"
								name="editPwd" placeholder="변경할 비밀번호를 입력하세요"> <span
								id="spanpwdcheck" style="color: red"></span>
						</div>
					</div>
					<div class="form-group" style="color: black">
						<label for="pwd" class="col-sm-3  control-label">변경할 비밀번호
							확인</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" id="editPwdcheck"
								name="editPwdcheck" placeholder="비밀번호를 다시 입력하세요"> <span
								id="spanpwdcheck" style="color: red"></span>
						</div>
					</div>

					<div class="col-sm-offset-6 col-sm-10">
						<button id="editBtn" type="button" class="btn btn--radius btn--green">변경</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="ProfileEdit" class="tabcontent"
		style="background-color: white; height: 1000px">
		<div class="row" style="padding-top: 50px;">

			<div class="col-sm-12">
			

					

			</div>
		</div>
	</div>

	<div id="Withdrawal" class="tabcontent"
		style="background-color: white;height: 600px">
		<div class="row" style="padding-top: 50px;">
			<div class="col-sm-12">
				<form class="form-horizontal">
					<div class="form-group" style="color: black">
						<label for="pwd" class="col-sm-3  control-label">현재 비밀번호</label>
						<div class="col-sm-4">
							<input id="withcurpwd" type="password" class="form-control"
								name="withcurpwd" placeholder="현재 비밀번호를 입력하세요"> 
						</div>
					</div>
					<div class="form-group" style="color: black">
						<label for="pwd" class="col-sm-3  control-label">비밀번호 확인</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" id="withpwdcheck"
								name="withpwdcheck" placeholder="비밀번호를 다시한번 입력하세요">
						</div>
					</div>
					<div class="col-sm-offset-6 col-sm-10">
						<button type="button" class="btn btn--radius btn--green"
							id="Withdrawalbtn">탈퇴</button>
					</div>

				</form>
			</div>
		</div>
	</div>
 
</div>
<script>
	function openCity(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
</script>


