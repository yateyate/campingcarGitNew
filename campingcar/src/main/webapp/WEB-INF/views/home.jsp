<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>자바 캠핑카</title>
<link href="${contextPath}/resources/css/main_all.css" rel="stylesheet" />
<%@ include file="include/plugin.jsp" %>
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="include/header.jsp" %>
	<!--// #header end -->
	
	<div id="wrap">
<!-- ================================================================================ -->

<style>
#mainvisual {}
.mainrow.para01 {background:url("${contextPath}/resources/img/main/dummy.jpg"); height:2120px;}

</style>

<div id="mainvisual">
</div>

<div class="mainrow para01">
	&nbsp;
</div>

<script>
$(document).ready(function(){
	var windowHeight = window.innerHeight;
	$("#mainvisual").css({"height":windowHeight+"px"});
});

</script>

<!-- ================================================================================ -->		
	</div>
</div>

</body>
</html>
