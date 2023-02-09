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
<title></title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
</head>
<style>

</style>
<body>
					  <div id="container">

		
			<section class="content container-fluid">
				<div class="table-responsive">
				  <div class="container text-center">
				  </div>
				 <div class="container text-center table-hover">
			<table class="table table-bordered">
			<colgroup>
				</colgroup>
			  <h4><b>현재 승인되어 있는 업체</b></h4><br>
			  
				
			  <tr class="table-secondary">
				  	<th>회사번호</th>
				  	<th>회사명</th>
				  	<th>주소</th>
				  	<th>전화번호</th>
				  	<th>담당자</th>
				  	<th>담당자 이메일</th>
				  	<th>신청 상태</th>
			  </tr>
			 
			<c:forEach var="company" items="${list3}">
			 	<tr>
				 	<th>${company.comp_id}</th>
				 	<td>${company.comp_name}</td>
				 	<td>${company.comp_addr}</td>
				 	<td>${company.comp_phone}</td>
				 	<td>${company.comp_pic}</td>
				 	<td>${company.comp_pic_email}</td>
				 	<th>승인</th> 
			 	</tr>
			</c:forEach>
			  </table>
			  

      
            
				</div>
				</div>
				</section>
				
				</div>
			  <br>
			  <br>
			  <br>
			  <br>
			  <br>
			  
			  
		


</body>
</html>