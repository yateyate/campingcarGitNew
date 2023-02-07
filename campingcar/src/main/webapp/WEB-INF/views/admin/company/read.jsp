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
			<form role="form" method="post" action="stsmodify">
			<div class="table-responsive">
				  <div class="table-responsive">
				  <div class="container text-center">
				  <h4><b>대여 회사 상세 보기</b></h4>
				  </div>
				  <br>
				  <table width="100%" border="1" class="table table-bordered text-center" >
				<colgroup>
				</colgroup>
				   <thead class="table-dark theadmm">
				  <tr>
				  	<br>
				  	<td><h5><b>회사번호</b></h5></td>
				  	<td><h5><b>회사명</b></h5></td>
				  	<td><h5><b>주소</b></h5></td>
				  	<td><h5><b>전화번호</b></h5></td>
				  	<td><h5><b>담당자</b></h5></td>
				  	<td><h5><b>담당자 이메일</b></h5></td>
				  	<td><h5><b>신청 상태</b></h5></td>
				  </tr>
				 	</thead>
				 	<tr>
				 	<td><h5><b>${company.comp_id}</b></h5></td>
				 	<td><h5><b>${company.comp_name}</b></h5></td>
				 	<td><h5><b>${company.comp_addr}</b></h5></td>
				 	<td><h5><b>${company.comp_phone}</b></h5></td>
				 	<td><h5><b>${company.comp_pic}</b></h5></td>
				 	<td><h5><b>${company.comp_pic_email}</b></h5></td>
				 	<td><h5><b>${company.comp_status}</b></h5></td>
				 	<br>
				 	</tr>
				  </table>
				  </div>
				  </div>
				  </section>
				  
				  <input type="hidden" name="comp_id" value="${company.comp_id}">
				  <input type="hidden" name="comp_status" value="${company.comp_status}">
				 	<div class="form-group"  >
				 	<table width="100%" border="1" class="table table-bordered text-center">
				 	<tr>
				 	 <div class="container text-right">
				 		<h5><b>신청 상태 변경</b></h5><br>
				 		</div>
				 <div class="container text-right">
				  <select id="company_status" name="count" size="1" style="border-radius: 5px; border:1px solid #ccc; width: 16%">
				  		<option value=""><b>신청 상태를 선택하세요</b></option>
				  		<option  value="1"><b>승인</b></option>
						<option  value="-1"><b>거절</b></option>
				  </select>
				 </div>
				 	</tr>
				 	<br>
				 <div class="container text-right">	
				  <button type="button" class="btn btn-outline-dark" onclick="location.href='listForm'"><b>이전으로</b></button>
				  <button type="submit" class="btn btn-outline-dark"><b>변경하기</b></button>
				  </div>
				 	</table>
				 	</div>
				 	</div>
				  <br>
				  <br>
				  <br>
			</div>
			</form>		  
				  <br><br><br><br><br><br>
				 
				
				 	

	
			
</body>
</html>