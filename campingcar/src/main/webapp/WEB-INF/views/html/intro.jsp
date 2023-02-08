<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ include file="../admin/rent/category.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${sessionScope.user }" />
<c:set var="ismember" value="1" />
<c:if test="${member.car_uid eq '' or member.car_uid eq null }">
	<c:set var="ismember" value="0" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브 메뉴 템플릿 페이지</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
<style>

</style>
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
   <div id="body_head">
      <h2>회사 소개</h2>
      <div class="location">
         HOME　<i class="fa-solid fa-circle-chevron-right"></i>　회사 소개　<i class="fa-solid fa-circle-chevron-right"></i>　<span>회사 소개</span>
      </div>
   </div>
	
	<div id="wrap">
      <div id="submenu">
         <ul>
            <li class="on"><a href="${contextPath }/rent/read">회사 소개</a></li>
         </ul>
      </div>
		
		<div id="body_contents">
<!-- ================================================== -->

회사소개 내용

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<div id="footer">
	</div>
</div><!-- // #container end -->

</body>
</html>