<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />

<style>
.mmsize{
width: 1150px;
}
.tablemm{
width: 450px;
padding-left: 5px;
}
.thmm{
width:120px;
}

</style>



</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
	<div id="body_head">
		<h2>일반 게시판</h2>
		<div class="location">
			HOME　<i class="fa-solid fa-circle-chevron-right"></i>　
			<span>일반 게시판</span>
		</div>
	</div>
	
	<div id="wrap">
		<div id="submenu">
			<ul>
				<li class="on"><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
				<li><a href="#">서브 메뉴</a></li>
			</ul>
		</div>
		
		<div id="body_contents">
<!-- ================================================== -->

<style>
.table th {border:1px solid #c8c8c8; text-align:center;}
.carread div,
.carread table {float:left;}
.carread div {width:430px;}
.carread img {width:400px;}
.carread table {width:770px;}
</style>

<div class="carread clearfix">
	<div>
		<img src="${contextPath }/resources/data/car/${dto.car_file }" alt="" />
	</div>
	<table class="table table-bordered">
	<colgroupd>
		<col width="30%" />
		<col width="*" />
	</colgroupd>
	<tr>
		<th class="table-secondary">등록 번호</th><td>${dto.car_regid }</td>
	</tr>
	<tr>
		<th class="table-secondary">대여 회사</th><td>${dto.comp_id }</td>
	</tr>
	<tr>
		<th class="table-secondary">모델 명</th><td>${dto.car_modelname }</td>
	</tr>
	<tr>
		<th class="table-secondary">차량 이름</th><td>${dto.car_name }</td>
	</tr>
	<tr>
		<th class="table-secondary">차량 번호</th><td>${dto.car_number }</td>
	</tr>
	<tr>
		<th class="table-secondary">탑승 인원</th><td>${dto.car_capa }</td>
	</tr>
	<tr>
		<th class="table-secondary">내부 옵션</th><td>${fn:replace(dto.car_option, ',', ', ')}</td>
	</tr>
	<tr>
		<th class="table-secondary">세부 내용</th><td>${dto.car_detail }</td>
	</tr>
	<tr>
		<th class="table-secondary">대여 비용 (1일 기준)</th><td>${dto.car_rentprice }</td>
	</tr>
	<tr>
		<th class="table-secondary">등록 일</th><td>${dto.car_regdate }</td>
	</tr>
	<tr>
		<th class="table-secondary">자량 정비 내역</th>
		<td>
			<c:if test="${repair.repair_no == null }">
			<button  onclick="emptyrepair()" class="btn btn-outline-dark btn-sm">차량정비 내역보기</button>
			</c:if>
			<c:if test="${repair.repair_no !=null }">
			<button data-bs-toggle="modal" href="#exampleModalToggle" role="button" class="btn btn-outline-dark btn-sm">차량정비 내역보기</button>
			</c:if>	
		</td>
	</tr>
	</table>
</div>


<div style="text-align:center; padding:60px 0px 0px 0px; border-top:1px solid #dcdcdc; margin:50px 0px 0px 0px;">
<button onclick="location.href='list';" class="btn btn-primary" style="width:150px; height:40px;">목록</button>
</div>
<!-- 모달&모달테스트 -->
		
		

		<script>
		function emptyrepair() {
			
			alert('차량 정비내역이 없습니다.')
			
		}
		</script>
		
		
		<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5 " id="exampleModalLabel" >차량정비 정보</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		     	
		        <table class="table table-bordered text-center tablemm";>
		        	<tr>
		        		<th class="table-dark thmm">정비소명</th>
		        		<th  id="garage_name" name="garage_name" >${repair.garage_name } </th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">차량명</th>
		        		<th id="car_name" name="car_name">${dto.car_name } </th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">렌트회사</th>
		        		<th id="comp_name" name ="comp_name">${repair.comp_name} </th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비내역</th>
		        		<th id="repair_info" name="repair_info">${repair.repair_info} </th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비일자</th>
		        		<th id="repair_date" name="repair_date"><c:out value=" ${repair.repair_date}"></c:out></th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비가격(원)</th>
		        		<th id="repair_price" name="repair_price">${repair.repair_price}</th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">추가정비내역</th>
		        		<th id="repair_addinfo" name="repair_addinfo">${repair.repair_addinfo } </th>
		        	</tr>
		        	
		        </table>
		       
		     
		     
		     
		      </div>
		      <div class="modal-footer">		        		
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>		        		
		      </div>
		  </div>
		  </div>
		  </div>


<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<div id="footer">
	</div>
</div><!-- // #container end -->

</body>
</html>