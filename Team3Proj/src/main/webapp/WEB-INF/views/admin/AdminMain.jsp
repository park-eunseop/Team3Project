<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- admin_main -->

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



<!-- 구글 차트용 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 날짜 구하는 포멧 moment() method-->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<!-- 회원 레벨
비건(Vegan)
락토(Lacto) :(우유, 유제품)
오보(Ovo) :달걀
락토오보(Lacto-Ovo) : (우유,유제품),달걀
페스코(Pesco):우유,달걀,어류
폴로(Pollo):우유,달걀,조류,어류
플렉시테리언(Flexi): 때에 따라 육류
 -->
<script>
	var m = moment();//날짜 구하기
	var dateList = [m.format('YYYY/MM')];
	for (var i=0; i<5;i++){
		dateList.push(m.subtract(1,'month').format('YYYY/MM'))
	}
</script>
 
<!-- 파이 차트 -->
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ '비건 등급', '등급별 분포' ], 
				[ '비건', 2 ], 
				[ '락토', 2 ], 
				[ '오보', 3 ], 
				[ '락토오보', 4 ], 
				[ '페스코', 6 ],
				[ '폴로', 5 ],
				[ '플렉시테리언', 4], ]);

		var options = { title : '' };
		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));
		chart.draw(data, options);
		window.addEventListener('resize', drawChart, false);//사이즈 동적으로 변화
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
				[ '가입달', '카카오톡 가입', '일반 가입', '총 가입자수' ],
				[ dateList[5], 165, 938, 165+938],
				[ dateList[4], 135, 1120, 135+1120 ],
				[ dateList[3], 157, 1167,  157+1167 ],
				[ dateList[2], 139, 1110, 139+1110 ],
				[ dateList[1], 139, 1110, 139+1110 ],
				[ dateList[0], 320, 1904, 320+1904 ] ]);
		
		var options = {
			title : '',
			vAxis : { title : '가입자수' },
			seriesType : 'bars',
			series : { 
				0 : {color: '#F7E600'},
				1 : {color: '#FF8C00'},
				2 : { type : 'line', color: '#3366CC', lineWidth: 2, pointSize: 3} 
			}, 
			legend: {position:'bottom'}
		};
		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div1'));
		chart.draw(data, options);
		window.addEventListener('resize', drawVisualization, false);//사이즈 동적으로 변화
	}
</script>

<!-- Area 그래프_방문자 & 게시글 -->
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart_Area);

	function drawChart_Area() {
		var data = google.visualization.arrayToDataTable([
				[ '날짜', '방문자', '피드', '레시피' ], 
				[ dateList[5], 1000, 400, 300 ],
				[ dateList[4], 1170, 460, 200 ], 
				[ dateList[3], 1000, 757, 300 ],
				[ dateList[2], 999, 568, 457 ],
				[ dateList[1], 1240, 1101, 557 ],
				[ dateList[0], 2000, 1111, 500 ] ]);

		var options = {
			legend: {position:'bottom'}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('chart_div3'));
		chart.draw(data, options);
		window.addEventListener('resize', drawChart_Area, false);
	}
</script>

<!-- 꺽은선 그래프  -->
<!-- Naver 검색어 트랜드 API 적용 -->
<script type="text/javascript">
	google.charts.load('current', {
		packages : [ 'corechart', 'line' ]
	});
	google.charts.setOnLoadCallback(drawCurveTypes);

	function drawCurveTypes() {
		var data = new google.visualization.DataTable();
		
		//controller에서 json 가져오기
		var vegan = ${vegan};//자스에서 EL로 받아오기
		var recipe = ${recipe};
		var health = ${health};
		//console.log("json객체 받는지 확인: "+typeof vegan['data'][0]['ratio']);
		//console.log("json객체 받는지 확인2: "+typeof vegan['title']);
		//console.log("JSONARRAY LENGTH: "+Object.keys(vegan['data']).length);//몇 개인지 확인
		
		var dataRows = [];
		for(var i=0;i<Object.keys(vegan['data']).length;i++){
			var dataRow = [];
			//console.log("여러개 찍히나 :"+vegan['data'][i]['ratio']);
			dataRow.push(vegan['data'][i]['period']);
			dataRow.push(vegan['data'][i]['ratio']);
			dataRow.push(recipe['data'][i]['ratio']);
			dataRow.push(health['data'][i]['ratio']);
			
			dataRows.push(dataRow);
		}
		//console.log(dataRows.toString());
		
		data.addColumn('string', 'X');
		data.addColumn('number', vegan['title']);
		data.addColumn('number', recipe['title']);
		data.addColumn('number', health['title']);
		

		data.addRows(dataRows);//데이터 전부 넣기

		
		var options = {
			hAxis : { title : '일단위 날짜' },
			vAxis : { title : '검색량 추이' },
			series : {
				1 : { curveType : 'function' }
			},
			legend: {position:'bottom'}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div2'));
		chart.draw(data, options);
		window.addEventListener('resize', drawCurveTypes, false);
	}
</script>




<nav class="navbar navbar-default navbar-fixed">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navigation-example-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Dashboard</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-left"> </ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:logout()">
						<p>Log out</p>
				</a></li>
				<li class="separator hidden-lg"></li>
			</ul>
		</div>
	</div>
</nav>


<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<div class="card">

					<div class="header">
						<h4 class="title">비건 등급</h4>
						<p class="category"></p>
					</div>
					<div class="content">
						<!-- 구글 차트로 대신함 -->
						<div id="piechart"></div>
						<div class="footer">
							<hr>
							<div class="stats">
								<i class="fa fa-check"></i> 회원들의 비건 등급 분포도를 나타냅니다.
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-8">
				<div class="card">
					
					<div class="header">
						<h4 class="title">가입자 추이</h4>
						<p class="category"></p>
					</div>
					<div class="content">
						<!-- 막대 그래프 -->
						<div id="chart_div1"></div>
						<div class="footer">
							<hr>
							<div class="stats">
								<i class="fa fa-check"></i> 달별 회원 가입자 증감 추이를 회원가입 종류별로 나타냅니다.
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-md-6">
				<div class="card ">
				
					<div class="header">
						<h4 class="title">방문자 & 게시글</h4>
						<p class="category"></p>
					</div>
					<div class="content">
						<!--Area chart -->
						<div id="chart_div3"></div>
						<div class="footer">
							<hr>
							<div class="stats">
								<i class="fa fa-check"></i> 달별 방문자수와 게시글 수를 나타냅니다.
							</div>
						</div>
					</div>
					
				</div>
			</div>


			<div class="row">
				<div class="col-md-6">
					<div class="card ">

						<div class="header">
							<h4 class="title">키워드 검색량</h4>
							<p class="category"></p>
						</div>
						<div class="content">
							<!-- 키워드 검색 -->
							<div id="chart_div2"></div>
							<div class="footer">
								<hr>
								<div class="stats">
									<i class="fa fa-check"></i> 최다 검색일을 100으로 설정하여 상대적인 변화를 나타냅니다.
									<br /> <i class="fa fa-check"></i>성별, 연령, 검색환경의 제한을 사용하지
									않았습니다.
								</div>
							</div>
						</div>

					</div>
				</div>

				<!-- 워드 클라우드 -->
				<script src="https://d3js.org/d3.v3.min.js"></script>
				<script
					src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"
					type="text/JavaScript"></script>

				<div class="col-md-6">
					<div class="card ">
						<div class="header">
							<h4 class="title">검색어 워드 클라우드</h4>
							<p class="category"></p>
						</div>
						<div class="content">
							<!-- Styles -->
							<style>
							#chartdiv {
								width: 100%;
								height: 480px;
							}
							</style>

							<!-- Resources -->
							<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
							<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
							<script src="https://cdn.amcharts.com/lib/4/plugins/wordCloud.js"></script>
							<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

							<!-- Chart code -->
							<script>
								am4core
										.ready(function() {

											// Themes begin
											am4core
													.useTheme(am4themes_animated);
											// Themes end

											var chart = am4core
													.create(
															"chartdiv",
															am4plugins_wordCloud.WordCloud);
											var series = chart.series
													.push(new am4plugins_wordCloud.WordCloudSeries());

											series.accuracy = 4;
											series.step = 15;
											series.rotationThreshold = 0.7;
											series.maxCount = 200;
											series.minWordLength = 2;
											series.labels.template.margin(4, 4,
													4, 4);
											series.maxFontSize = am4core
													.percent(30);

											series.text = "전 세계적으로 채식을 하는 사람들이 늘어나면서 ‘비건(vegan)’이 우리나라에서도 주목을 받고  ‘비건(vegan)’은 채식주의자의 약자로 전 세계의 인구 6%를 차지한다. 한국채식협회에 의하면 국내 채식인구는 약 150만 명이며 완전채식주의자(vegan)는 50만 명에 달한다. 이처럼 국내 비건 인구가 꾸준히 늚에 따라 국내 기업들도 앞 다퉈‘비건 시장’에 적극적으로 뛰어들고 이에 시사캐스트에서는 △비건 종류 △국내 비건 시장 현황 △채식인구 증가 원인 △비건 시장 전망에 대해서 알아본다.";

											series.colors = new am4core.ColorSet();
											series.colors.passOptions = {}; // makes it loop

											//series.labelsContainer.rotation = 45;
											series.angles = [ 0, -90 ];
											series.fontWeight = "700"
											/*
											 setInterval(function () {
											 series.dataItems.getIndex(Math.round(Math.random() * (series.dataItems.length - 1))).setValue("value", Math.round(Math.random() * 10));
											 }, 10000)
											 */
										}); // end am4core.ready()
							</script>

							<!-- HTML -->
							<div id="chartdiv"></div>




						</div>
					</div>
				</div>




				<div class="col-md-6">
					<div class="card ">
						<div class="header">
							<h4 class="title">Tasks</h4>
							<p class="category">Backend development</p>
						</div>
						<div class="content">
							<div class="table-full-width">
								<table class="table">
									<tbody>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox1" type="checkbox"> <label
														for="checkbox1"></label>
												</div>
											</td>
											<td>Sign contract for "What are conference organizers
												afraid of?"</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox2" type="checkbox" checked> <label
														for="checkbox2"></label>
												</div>
											</td>
											<td>Lines From Great Russian Literature? Or E-mails From
												My Boss?</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox3" type="checkbox"> <label
														for="checkbox3"></label>
												</div>
											</td>
											<td>Flooded: One year later, assessing what was lost and
												what was found when a ravaging rain swept through metro
												Detroit</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox4" type="checkbox" checked> <label
														for="checkbox4"></label>
												</div>
											</td>
											<td>Create 4 Invisible User Experiences you Never Knew
												About</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox5" type="checkbox"> <label
														for="checkbox5"></label>
												</div>
											</td>
											<td>Read "Following makes Medium better"</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox6" type="checkbox" checked> <label
														for="checkbox6"></label>
												</div>
											</td>
											<td>Unfollow 5 enemies from twitter</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="footer">
								<hr>
								<div class="stats">
									<i class="fa fa-history"></i> Updated 3 minutes ago
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>