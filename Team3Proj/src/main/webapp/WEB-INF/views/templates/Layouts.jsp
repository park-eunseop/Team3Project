<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Made Three</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/slick.css"/>"> 
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/slick-theme.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/animate.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/iconfont.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/font-awesome.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/bootstrap.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/magnific-popup.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/bootsnav.css"/>">
    <!--For Plugins external css-->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/plugins.css"/>"/>
  <!--Theme custom css -->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/style.css"/>"/>
  <!--Theme Responsive css-->
  <link rel="stylesheet" href="<c:url value="/resources/assets/css/responsive.css"/>"/>
  <script src="<c:url value="/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"/>"></script>
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="100">
	 <div class="culmn">
	<!--top부분 시작-->
	<tiles:insertAttribute name="top"/>
	<!--top부분 끝 -->
	<!--body부분 시작-->
	<tiles:insertAttribute name="body"/>
	<!--body부분 끝 -->
	<!--footer부분 시작-->
	<tiles:insertAttribute name="footer"/>
	<!--footer부분 끝 -->
	</div>
</body>
</html>
