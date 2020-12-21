<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

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

<section id="home" class="home bg-black fix" style="height: 200px">
	<div class="container">
		<div class="row">
			<div class="main_home text-center">
				<div class="col-md-12">
					<div class="hello">
						<div class="slid_item">
							<div class="home_text ">
								<h1 class="text-yellow">My Page</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<h2>Vertical Tabs</h2>
<p>Click on the buttons inside the tabbed menu:</p>

<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">London</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button>
</div>

<div id="London" class="tabcontent">
  <h3>London</h3>
  <p>London is the capital city of England.</p>
</div>

<div id="Paris" class="tabcontent">
  <h3>Paris</h3>
  <p>Paris is the capital of France.</p> 
</div>

<div id="Tokyo" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
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
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

<section>

	<div class="row" style="padding-top: 50px">

		<div class="col-sm-12">
			<form class="form-horizontal" id="form" method="post"
				action="<c:url value="/Member/UserEdit.do"/>"
				enctype="multipart/form-data">

				<div class="form-group" style="color: black">
					<label for="pwd" class="col-sm-3  control-label">기존 비밀번호</label>
					<div class="col-sm-4">
						<input id="inputpwd" type="password" class="form-control"
							name="password" placeholder="기존 비밀번호를 입력하세요"> <span
							id="spanpwd" style="color: red"></span>
					</div>
				</div>
				<div class="form-group" style="color: black">
					<label for="pwd" class="col-sm-3  control-label">변경할 비밀번호</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="inputpwdcheck"
							name="passwordcheck" placeholder="변경할 비밀번호를 입력하세요"> <span
							id="spanpwdcheck" style="color: red"></span>
					</div>
				</div>
				<div class="form-group" style="color: black">
					<label for="pwd" class="col-sm-3  control-label">변경할 비밀번호
						확인</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="inputpwdcheck"
							name="passwordcheck" placeholder="비밀번호를 다시 입력하세요"> <span
							id="spanpwdcheck" style="color: red"></span>
					</div>
				</div>
				<div class="form-group" style="color: black">
					<label for="id" class="col-sm-3  control-label">이름</label>
					<div class="col-sm-4">
						<input id="inputname" type="text" class="form-control" name="name"
							placeholder="이름를 입력하세요" value="${userdto.name}"> <span
							id="spanname" style="color: red"></span>
					</div>
				</div>
				<div class="form-group" style="color: black">
					<label for="id" class="col-sm-3  control-label">닉네임</label>
					<div class="col-sm-4">
						<input id="inputnickname" type="text" class="form-control"
							name="nickname" placeholder="닉네임를 입력하세요"
							value="${userdto.nickname}"> <span id="spannickname"
							style="color: red"></span>
					</div>
				</div>
				<div class="form-group" style="color: black">
					<label for="id" class="col-sm-3  control-label">나이</label>
					<div class="col-sm-4">
						<input id="inputage" type="text" class="form-control" name="age"
							placeholder="나이를 입력하세요" value="${userdto.age}"> <span
							id="spanage" style="color: red"></span>
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
						</select> <span id="spangender" style="color: red"></span>
					</div>
				</div>

				<div class="form-group" style="color: black">
					<label for="id" class="col-sm-3  control-label">Level</label>
					<div class="col-sm-4">
						<select name="vg_level" id="selectlevel">
							<option disabled="disabled" selected="selected">Vegan</option>
							<option>Lacto</option>
							<option>Ovo</option>
							<option>Lacto-Ovo</option>
							<option>Pesco</option>
							<option>Pollo</option>
							<option>Flexi</option>
						</select> <span id="spanlevel" style="color: red"></span> <img
							style="width: 30px; height: 30px;"
							src="<c:url value="/resources/vg_level/vg_on.png"/>" /> <img
							id="milk" style="width: 30px; height: 30px;"
							src="<c:url value="/resources/vg_level/milk_off.png"/>" /> <img
							id="egg" style="width: 30px; height: 30px;"
							src="<c:url value="/resources/vg_level/egg_off.png"/>" /> <img
							id="fish" style="width: 30px; height: 30px;"
							src="<c:url value="/resources/vg_level/fish_off.png"/>" /> <img
							id="bird" style="width: 30px; height: 30px;"
							src="<c:url value="/resources/vg_level/bird_off.png"/>" /> <img
							id="beef" style="width: 30px; height: 30px;"
							src="<c:url value="/resources/vg_level/beef_off.png"/>" />


					</div>
				</div>

				<div class="form-group" style="color: black">
					<label for="id" class="col-sm-3  control-label">주소</label>
					<div class="col-sm-4">
						<input id="inputaddr" type="text" class="form-control" name="addr"
							placeholder="주소를 입력하세요"> <span id="spanaddr"
							style="color: red"></span>
					</div>
				</div>

				<div class="form-group" style="color: black">
					<label for="id" class="col-sm-3  control-label">자기소개</label>
					<div class="col-sm-4">
						<textarea id="textself" cols="30" rows="10" class="input--style-2"
							placeholder="let me know you!" name="selfintro"></textarea>
						<span id="spanself" style="color: red"></span>
					</div>
				</div>

				<div class="form-group" style="color: black">
					<label for="id" class="col-sm-3  control-label">변경할 사진</label>
					<div class="col-sm-4">
						<input id="inputfile" class="input--style-2" type="file"
							name="upload"> <span id="spanfile" style="color: red"></span>
						<div class="select_img">
							<img src="" />
						</div>
					</div>

				</div>



				<div class="form-group">
					<div class="col-sm-offset-6 col-sm-10">
						<button type="button" class="btn btn--radius btn--green"
							onclick="javascript:DoEdit()">Edit</button>
					</div>
				</div>
			</form>

		</div>
	</div>

</section>
