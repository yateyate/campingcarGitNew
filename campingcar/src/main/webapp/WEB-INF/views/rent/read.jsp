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
	</div>
	
	<div id="wrap">
      <div id="submenu">
         <ul>
            <li class="on"><a href="${contextPath }/rent/read">예약 확인</a></li>
         </ul>
      </div>
		
		<div id="body_contents">
<!-- ================================================== -->

<style>
.login {width:440px; margin:0px auto;}
.input-group-text {width:180px;}
</style>

<c:if test="${check != 1 and (sessionScope.user.car_uid eq '' or sessionScope.user.car_uid eq null ) }">
<form action="read" method="post">
<div class="login">
	<div class="input-group">
		<span class="input-group-text">고객명</span>
		<input type="text" class="form-control" name="rent_name" value="" required />
	</div>
	<div class="input-group">
		<span class="input-group-text">핸드폰 번호</span>
		<input type="text" class="form-control" name="rent_phone1" value="" required />
	</div>
	<div class="input-group">
		<span class="input-group-text">비밀번호</span>
		<input type="text" class="form-control" name="rent_password" value="" required />
	</div>	
	<button type="submit">예약 확인</button>
</div>
</form>
</c:if>

<c:if test="${(check==1 and not empty dtolist) or (ismember==1) }">
<table class="table table-bordered center">
<thead>
<tr class="table-secondary">
	<th>#</th>
	<th>고객명</th>
	<th>핸드폰 번호</th>
	<th>차량</th>
	<th>차량 예약일</th>
	<th>예약 등록일</th>
	<th>예약 상태</th>
</tr>
</thead>
<tbody>
	<c:forEach items="${dtolist }" var="dto">
	<fmt:formatNumber var="paystate" minIntegerDigits="2" value="${dto.rent_paystate}" type="number"/>
	<tr>
		<td>${dto.rent_id }</td>
		<td>${dto.rent_name }</td>
		<td>${dto.rent_phone1 }</td>
		<td>#${dto.car.car_regid } ${dto.car.car_modelname } ${dto.car.car_name }</td>
		<td>${dto.rent_startdate } ~ ${dto.rent_enddate }</td>
		<td>${dto.rent_datetime }</td>
		<td><p class="state type${paystate}">${cateArr[dto.rent_paystate] }</p></td>
	</tr>
	</c:forEach>
</tbody>
</table>
</c:if>

<c:if test="${check==1 and empty dtolist }">
<table class="table table-bordered center">
<thead>
<tr class="table-secondary">
	<th>#</th>
	<th>고객명</th>
	<th>핸드폰 번호</th>
	<th>차량</th>
	<th>차량 예약일</th>
	<th>예약 등록일</th>
	<th>예약 상태</th>
</tr>
</thead>
<tbody>
	<tr>
		<td colspan="7">일치하는 내용이 없습니다.</td>
	</tr>
</tbody>
</c:if>

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<div id="footer">
	</div>
</div><!-- // #container end -->

</body>
</html>