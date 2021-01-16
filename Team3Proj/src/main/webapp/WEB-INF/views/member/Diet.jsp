<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<section id="home" class="home bg-black fix" style="height: 200px">
	<div class="container">
		<div class="row">
			<div class="main_home text-center">
				<div class="col-md-12">
					<div class="hello">
						<div class="slid_item">
							<div class="home_text ">
								<h1 class="text-yellow">Diet!</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 식단분석 Modal -->
<div id="id04" class="w3-modal">
	<div class="w3-modal-content" style="width: 1000px; height: 700px">
		<span onclick="document.getElementById('id04').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
				<iframe src="https://tmtest1224.netlify.app"
					style="padding: 10px; margin: 10px; width: 980px; height: 680px"></iframe>

			
		
	</div>

</div>
<!-- 식단분석 Modal -->


<a href="javascript:view()">식단분석</a>

<script>
		function view() {
			console.log('view!');
			//모달창 띄울거야 id= id04인 div 창에
			document.getElementById('id04').style.display='block';
			
			
		}
	</script>


