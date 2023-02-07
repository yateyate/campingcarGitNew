<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body>
			<section class="content container-fluid">
				<div class="table-responsive">
				 <div class="container text-center">
			<table width="100%" border="1" class="table table-bordered text-center">
			  <h4><b>현재 승인되어 있는 업체</b></h4><br>
			  
				<thead class="table-dark theadmm">
			  <tr>
				  	<td><b>회사번호</b></td>
				  	<td><b>회사명</b></td>
				  	<td><b>주소</b></td>
				  	<td><b>전화번호</b></td>
				  	<td><b>담당자</b></td>
				  	<td><b>담당자 이메일</b></td>
				  	<td><b>신청 상태</b></td>
			  </tr>
			  </thead>
			<c:forEach var="company" items="${list3}">
			 	<tr>
				 	<td><b>${company.comp_id}</b></td>
				 	<td><b>${company.comp_name}</b></td>
				 	<td><b>${company.comp_addr}</b></td>
				 	<td><b>${company.comp_phone}</b></td>
				 	<td><b>${company.comp_pic}</b></td>
				 	<td><b>${company.comp_pic_email}</b></td>
				 	<td><b>${company.comp_status}</b></td> 
			 	</tr>
			</c:forEach>
			  </table>
			  

      
            
				</div>
				</div>
				</section>
				
				
			  <br>
			  <br>
			  <br>
			  <br>
			  <br>
			  
			  
		


</body>
</html>