<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 로그아웃 시작 -->
<script>
	function logout(){
		$('#logoutForm').submit();
	}
</script>
<form id="logoutForm" method="post"
	action="<c:url value="/Member/Auth/Logout.do"/>">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
<!-- 로그아웃 끝 -->

<!-- 모달  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- 모달 -->

<!-- 구글 차트용 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 날짜 구하는 포멧 moment() method-->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
	var m = moment();//날짜 구하기
	var dateList = [m.format('YYYY/MM')];
	for (var i=0; i<5;i++){
		dateList.push(m.subtract(1,'month').format('YYYY/MM'))
	}
</script>

<!-- 막대 그래프-->
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {

		
		var data = google.visualization.arrayToDataTable([
				[ '신고달', '피드', '레시피', '총 신고수' ],
				[ dateList[4], ${month1}, 0, ${month1} ],
				[ dateList[3], ${month2}, 0, ${month2} ],
				[ dateList[2], ${month3}, 0, ${month3} ],
				[ dateList[1], ${month4}, 0, ${month4} ],
				[ dateList[0], ${month5}, 0, ${month5} ] ]);
		
		var options = {
			title : '',
			vAxis : { title : '신고수' },
			seriesType : 'bars',
			series : { 
				0 : {color: '#F3D55A'},
				1 : {color: '#7CFC00'},
				2 : { type : 'line', color: '#FF0000', lineWidth: 2, pointSize: 3} 
			}, 
			legend: {position:'bottom'}
		};
		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div1'));
		chart.draw(data, options);
		window.addEventListener('resize', drawVisualization, false);//사이즈 동적으로 변화
	}
</script>


<!--신고내용 CSS 모달창 -->
<link href="/veve/resources/assets_admin/css/ReportedPostList.css" rel="stylesheet" />




<nav class="navbar navbar-default navbar-fixed">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navigation-example-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Reported Post</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-left"></ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:logout()">
						<p>Log out</p>
				</a></li>
				<li class="separator hidden-lg hidden-md"></li>
			</ul>
		</div>
	</div>
</nav>

<div class="content">
	<div class="container-fluid">
		<div class="row">

			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">신고 추이</h4>
						<p class="category"></p>
					</div>
					<div class="content">
						<!-- 막대 그래프 -->
						
						<div id="chart_div1"></div>
						<div class="footer">
							<hr>
							<div class="stats">
								<i class="fa fa-check"></i> 달별 게시판의 신고수를 나타냅니다.
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">신고된 게시물</h4>
						<p class="category">제목을 클릭하여 게시글을 확인하세요.</p>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover table-striped">
							<thead>
								<th>게시글 제목</th>
								<th>글쓴이</th>
								<th>신고자</th>
								<th>신고일자</th>
								<th>신고 내용</th>
							</thead>
							<tbody>
							<!-- 각 게시판에 DEC table 참조 -->
							<!-- 신고 내용 누르면 모달창 띄워서 여러가지 내용 보이게 하기 -->
								<c:forEach var="item" items="${list}" varStatus="index">
									<tr>
										<td>${item.board_title }</td>
										<td>${item.board_writer}</td>
										<td>${item.board_reporter}</td>
										<td>${item.board_date}</td>
										<td>${item.board_content}</td>
									</tr>
								</c:forEach>
								<!-- 임시
								<tr>
								
									<td>임시값1</td>
									<td>임시값</td>
									<td>임시값</td>
									<td>임시값</td>
									<td><a href="#open">임시값</a></td>
									<div class="white_content" id="open">
								        <div>
								            <p align="right">
								            	<a href="#close" >CLOSE</a>
								        	</p>
								        	<iframe src="<c:url value="/Admin/ReportedPostList.do"/>"
								        	 style="width:100%; height:90%;"></iframe>
								        </div>
								    </div>
								</tr>
								 -->

							</tbody>
						</table>

					</div>
				</div>
			</div>
		

		</div>
	</div>
</div>