<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- footer -->
    <section class="footer bg-black roomy-40">
            
        <div class="main_footer fix bg-mega text-center p-bottom-30">
            <div class="col-md-12">
                <p class="wow fadeInRight" data-wow-duration="1s">
                    <a target="_blank" href="#">3조</a> 
                    2020. All Rights Reserved
                </p>
            </div>
        </div>
    </section>
    <!-- footer 끝 -->






<!-- 부트스트랩 4.5.2 플러그인들 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- summernote -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- owl 캐러셀 -->
<script src="<c:url value="/resources/assets/js/owl.carousel.min.js"/>"></script>

<!-- 커스텀 js -->
<script src="<c:url value="/resources/assets/js/nav.js"/>"></script><!--네비게이션 바-->
<script src="<c:url value="/resources/assets/js/day.js"/>"></script><!--메인화면 요일 표기-->
<script src="<c:url value="/resources/assets/js/rolling.js"/>"></script><!--메인화면 채식메뉴 롤링-->
<script src="<c:url value="/resources/assets/js/carousel.js"/>"></script><!--캐러셀 -->
<script>
		window.onresize = function() {
			$('#display_width').html(window.innerWidth);
		};
</script>