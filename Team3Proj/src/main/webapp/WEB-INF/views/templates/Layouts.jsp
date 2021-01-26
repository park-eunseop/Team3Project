<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>VEVE</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  

  <!-- 부트스트랩 4.5.2 --> <!--부트스트랩4 튜토리얼 : https://www.w3schools.com/bootstrap4/default.asp-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  
  
  <!--아이콘(폰트어썸)-->
  <script src="https://kit.fontawesome.com/01f3b3b8bd.js" crossorigin="anonymous"></script>
  <!-- owl 캐러셀 -->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/owl.carousel.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/owl.theme.default.min.css"/>">
  <!-- summernote -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  
  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/style.css"/>"><!-- 템플릿 베이직 CSS -->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/nav.css"/>"><!-- 네비게이션바 CSS-->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/owl.css"/>"><!-- owl캐러셀 CSS-->
  

   
   <!-- 전체 jquery 필수 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	

	
  <!-- datepicker
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"> -->
  <!-- datepicker js -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
    
  


  

</head>
<body>
	 
	<!--top부분 시작-->
	<tiles:insertAttribute name="top"/>
	<!--top부분 끝 -->
	<!--body부분 시작-->
	<tiles:insertAttribute name="body"/>
	<!--body부분 끝 -->
	<!--footer부분 시작-->
	<tiles:insertAttribute name="footer"/>
	<!--footer부분 끝 -->



</body>
</html>
