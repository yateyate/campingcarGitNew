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
<title>전체조회목록</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<c:set var="title" value="FAQ" />
<script>


   function search(){//검색기능
         var $keyword = $('#keyword');
         $('#searchBtn').on('click',function(){
            var keywordVal = $keyword.val();
            var url = "list?page=1"
               + "&perPageNum=" + "${pageMaker.cri.perPageNum}"         
               + "&keyword=" + encodeURIComponent(keywordVal);
            window.location.href = url;         
         })   
   }
</script>
</head>
<body>

 <div id="container">
				  <!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->

	<!-- #topmenu start -->
	<%@ include file="../include/topmenu.jsp" %>
	<!-- // #topmenu end -->
	<div id="wrap">

			<div class="panel-heading">
				질문목록
				<button id='regBtn' type="button" class="btn btn-xs pull-right" onclick="location.href= 'registerForm' "> 새로운 글 작성 </button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							
						</tr>
					</thead>


					<c:forEach items="${list }" var="board">
						<tr>
						  <td >
						  ${board.bno}
						  </td>
						   <td> <a href = "read?bno=${board.bno }">
						  ${board.title}</a>
						  </td>
						   <td>
						  ${board.writer}
						  </td>
						   <td>
						  ${board.regdate}
						  </td>								
						</tr>
					</c:forEach>
				</table>

				<div class='row'>
				
				<div class="container text-center">
    
			      <ul>
			         <c:if test="${pageMaker.prev }">
			            <a class="btn btn-outline-secondary" href = "listAll${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>
			            
			         </c:if>      
			            
			         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">            
			            <c:choose>
			            
			            <c:when test="${cri.page != idx }">
			            <a class="<c:if test="${cri.page != idx }">btn btn-outline-secondary</c:if>" href = "listAll${pageMaker.makeSearch(idx)}"  >${idx }</a>
			            </c:when>
			            
			            <c:otherwise>
			            <a style="color: white;" class="<c:if test="${cri.page == idx }">btn btn-secondary</c:if>" href = "listAll${pageMaker.makeSearch(idx)}"  >${idx }</a>
			            </c:otherwise>
			            
			            </c:choose>   
			         </c:forEach>         
			         
			         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			            <a class="btn btn-outline-secondary " href = "listAll${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
			         </c:if>
			      </ul>
			            
			</div>
			  
		<form name="search_garage" autocomplete="on">
   <div class="container text-center" style="padding-top: 15px"> 
   
   

    <span>
    <input class="basic-slide" id="keyword" name="keyword" type="search" value="${pageMaker.cri.keyword}" 
    placeholder="정비소를 검색하세요" />
    
   <button style="margin-left: -3px; height: 44px; margin-bottom:2px; border-radius: 0px 3px 3px 0px; border:0;" 
   id="searchBtn" class="btn btn-secondary btn-sm">검색</button>
   
   </span>      
   </div>
</form>
</div>
</div>


</body>
</html>