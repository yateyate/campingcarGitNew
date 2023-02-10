<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
	<title>상세보기 페이지 입니다</title>
		<%@ include file="../../include/plugin.jsp" %>
			<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
			<c:set var="title" value="대여 회사 승인 / 거절" />
</head>
<style>
select{
	 text-align: center;
	}
	
	
	
</style>
<body>
	<div id="container">
		<!-- #sidebar start -->
		<%@ include file="../include/sidebar.jsp" %>
		<!-- // #sidebar end -->
		
		<!-- #topmenu start -->
		<%@ include file="../include/topmenu.jsp" %>
		<!-- // #topmenu end -->
		<div id="wrap">	
	<section class="content container-fluid">
		<div class="table-responsive">

			<div class="container text-center">
				<h4><b>대여 회사 상세 보기</b></h4>
			</div>
			<br>
				<table width="100%" class="table table-bordered center table-hover">
					<colgroup>
					</colgroup>
 
					<tr class="table-secondary">
					<br>
						<th>회사번호</th>	
						<th>회사명</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>담당자</th>
						<th>담당자 이메일</th>
						<th>신청 상태</th>
					</tr>

					<tr>
						<th>${company.comp_id}</th>
						<td>${company.comp_name}</td>
						<td>${company.comp_addr}</td>
						<td>${company.comp_phone}</td>
						<td>${company.comp_pic}</td>
						<td>${company.comp_pic_email}</td>
						<th>대기</th>
					<br>
					</tr>
				</table>
		</div>
		<table>
		</table>
		<br>
 				
		<form role="form" method="post" action="stsmodify" style="display:inline;">
			<input type="hidden" name="comp_id" value="${company.comp_id}">
			<input type="hidden" name="comp_status" value="${company.comp_status}">
 				<h4 style="text-align:center;"><b>　　　신청 상태 변경　</b></h4>
			<table width="100%">
			<colgroup>
				<col width="33%" />
				<col width="34%" />
				<col width="33%" />
			</colgroup>
 				<td></td>
 				<td style="text-align:center;">
					<button  type="submit" class="btn btn-primary"><b>　　　　승인　　　　</b></button>
					</form>
					<form role="form" method="GET" action="stsmodify2" style="display:inline;">
					<input type="hidden" name="comp_id" value="${company.comp_id}">
					<input type="hidden" name="comp_status" value="${company.comp_status}">
					<button type="submit" class="btn btn-danger"><b>　　　　거절　　　　</b></button>
				</td>
　		</form>
				<td style="text-align:right;"><button type="button" class="btn btn-secondary" onclick="location.href='listForm'"><b>　　　이전으로　　　</b></button></td>
				
 			</table>
	</section>
		</div><br>
	</div>
	<br>
		<br>
			<br>
				<br>
					<br>
				<br>
			<br>
		<br>
	<br>		
</body>
</html>