<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<style>
#first_container {
	padding-top: 200px;
	padding-bottom: 70px;
	/* 132px이 딱 맞는 크기*/
}
.card-header {
	color: #f0c828;
	font-weight: bold;
	padding: 20px;
}
.card-body{
	font-weight: 600;
}
.card-text{
	font-size: 1.3em;
	paddig-top: 20px;
}
.card-body div{
	padding-bottom: 20px;
	font-weight: 600;
	font-size: 1.1em;
}
.card-body img {
	float: left;
	margin-right: 20px;
}
.vegan_style_name {
	color: #f0c828;
	font-weight: 900;
	font-size: 1.2em;
}
.card-body div div{
	margin: 10px;
}

</style>

<div class="container" id="first_container">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<h2 class="card-header">&nbsp;비건 스타일</h2>
				<div class="card-body">
					<p class="card-text">
						비건 스타일은 어떤 음식을 먹지 않느냐에 따라서 크게 7가지로 나뉘고 있습니다. <br/>
						가장 제한적인  비건부터 시작해, 여러가지 채식주의자의 유형은 아래와 같습니다.
					</p>
					<!-- 글 내용이 부족한 곳에 <br/> 로 칸을 주었다. -->
					<div class="Vegan">
						<img src="<c:url value='/resources/assets/images/level1.png'/>" alt="비건"/>
						<span class="vegan_style_name">비건(Vegan)</span><br/>
						<div>
							비건은 모든 동물성 제품이나 부산물을 소비하지 않습니다. 따라서 육류와 생선, 가금류를 섭취하지 않습니다. 
							또한 계란과 유제품 그 외에도 젤라틴이나 기타 동물성 부산물을 섭취하지 않습니다.
						</div>
						
					</div>
					<div class="Lacto">
						<img src="<c:url value='/resources/assets/images/level2.png'/>" alt="락토"/>
						<span class="vegan_style_name">락토(Lacto)</span><br/>
						<div>
							락토 채식은 육류와 생선, 가금류와 달걀을 먹지 않습니다. 그렇지만 젖소의 치즈, 우유, 요구르트와 같은
							유제품은 섭취합니다.
							<br/><br/>
						</div>
					</div>
					<div class="Ovo">
						<img src="<c:url value='/resources/assets/images/level3.png'/>" alt="오보"/>
						<span class="vegan_style_name">오보(Ovo)</span><br/>
						<div>
							오보 채식은 육류와 생선, 가금류와 유제품을 먹지 않습니다. 그렇지만 계란 제품은 소비합니다. 
							<br/><br/>
						</div>
					</div>
					<div class="Lacto-Ovo">
						<img src="<c:url value='/resources/assets/images/level4.png'/>" alt="락토오보"/>
						<span class="vegan_style_name">락토오보(Lacto-Ovo)</span><br/>
						<div>
							락토-오보 채식은 육류와 생선, 가금류를 먹지 않습니다. 그러나 유제품과 계란을 섭취합니다.
							가장 일반적인 유형의 채식입니다.
						</div>
					</div>
					<div class="Pesco">
						<img src="<c:url value='/resources/assets/images/level5.png'/>" alt="페스코"/>
						<span class="vegan_style_name">페스코(Pesco)</span><br/>
						<div>
							페스코 채식은 육류와 가금류를 섭취하지 않습니다. 고기의 소비를 생선과 해산물로 제한합니다.
							유연 채식주의로 분류됩니다.
							<br/><br/>
						</div>
					</div>
					<div class="Pollo">
						<img src="<c:url value='/resources/assets/images/level6.png'/>" alt="폴로"/>
						<span class="vegan_style_name">폴로(Pollo)</span><br/>
						<div>
							폴로 채식은 페스코와 마찬가지로 유연 채식주의이며  육류와 해산물을 섭취하지 않습니다.
							고기의 소비를 가금류로 제한합니다. 
						</div>
					</div>
					<div class="Flexi">
						<img src="<c:url value='/resources/assets/images/level7.png'/>" alt="플렉시"/>
						<span class="vegan_style_name">플렉시(Flexi)</span><br/>
						<div>
							플렉시 채식은 가능한 한 고기 섭취를 줄이기 위한 채식 스타일 입니다. 
							<br/><br/>
						</div>
					</div>
				</div><!-- card-body -->
				<div class="card-footer">
					출처: <a href="https://vegetarian-nation.com">Vegetarian Nation</a>
				</div>
				
			</div><!-- card -->
			
			
		</div><!-- col-md-12 -->
	</div><!-- row -->
</div><!-- container -->

