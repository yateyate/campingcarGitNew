<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="2" />
<c:set var="sn" value="2" />



<!DOCTYPE html>

<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>

<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
   <div id="body_head">
      <h2>${menuMap[mn]['sub'][sn]['title'] }</h2>
      <div class="location">
         HOME　<i class="fa-solid fa-circle-chevron-right"></i>　${menuMap[mn]['title'] }　<i class="fa-solid fa-circle-chevron-right"></i>　<span>${menuMap[mn]['sub'][sn]['title'] }</span>
      </div>
   </div>
	
	<div id="wrap">
	
      <!-- #submenu start -->
      <%@ include file="../include/submenu.jsp" %>
      <!-- // #submenu end -->
		
		<div id="body_contents">
<!-- ================================================== -->
    	<section class="content container-fluid">
			<div class="table-responsive">
				  <table width="100%" border="1" class="table table-bordered text-center">
				  <colgroup> 
				</colgroup>
				<thead>
				</thead>
				<tbody>
				<div class="container text-center">
				  <h4 ><b>현재 등록되어 있는 대여 업체 입니다</b></h4>
				  </div>
				  <br>
				  <br>
				  <thead class="table-dark theadmm">
				  <tr >
				  
				  	<td><h5><b>회사번호</b></h5></td>
				  	<td><h5><b>회사명</b></h5></td>
				  	<td><h5><b>주소</b></h5></td>
				  	<td><h5><b>전화번호</b></h5></td>
				  	<td><h5><b>담당자</b></h5></td>
				  	<td><h5><b>담당자 이메일</b></h5></td>
				  	<td><h5><b>신청 상태</b></h5></td>
				  </tr>
				  </thead>
				  <div class="container text-center">
				<c:forEach var="company" items="${list}">
				<c:if test="${company.comp_status == 1 }">
				 	<tr>
				 	
				 	<td><h5><b>${company.comp_id}</b></h5></td>
				 	<td><h5><b>${company.comp_name}</b></h5></td>
				 	<td><h5><b>${company.comp_addr}</b></h5></td>
				 	<td><h5><b>${company.comp_phone}</b></h5></td>
				 	<td><h5><b>${company.comp_pic}</b></h5></td>
				 	<td><h5><b>${company.comp_pic_email}</b></h5></td>
				 	<td><h5 style="color:red"><b>승인</b></h5></td>
				</c:if>
				 	</tr>
				</c:forEach>
				</div>
				</tbody>
				  </table>
				  
 <c:if test="${pageMaker.cri.page!=null }">
   <div class="container text-center">
    
      <ul>
      <b>
         <c:if test="${pageMaker.prev }">         
            <a class="btn btn-outline-secondary "  href = "list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>            
         </c:if>      
         
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">            
            <c:choose>
            
            <c:when test="${cri.page != idx }">
            <a class="<c:if test="${cri.page != idx }">btn btn-outline-secondary</c:if>" href = "list${pageMaker.makeSearch(idx)}"  >${idx }</a>
            </c:when>
            
            <c:otherwise>
            <a style="color: white;" class="<c:if test="${cri.page == idx }">btn btn-secondary</c:if>" href = "list${pageMaker.makeSearch(idx)}"  >${idx }</a>
            </c:otherwise>
            
            </c:choose>   
         </c:forEach>
            
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <a class="btn btn-outline-secondary " href = "list${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
         </c:if>
      </b>
      </ul>

            
</div>
</c:if>
				  
				  
				  <br>
				  <br>
				  <br>
				  	<div class="box">
				<div class="container text-right">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='registerForm'"><b>파트너 제휴 신청하러 가기 ←</b></button>
				</div>
			</div>
				</div>
		    </section>
		    <br>
		    <br>
		    <br>
    </div>
    </div>
		   <!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
		    <!-- /.content -->
    </div>
</body>
</html>