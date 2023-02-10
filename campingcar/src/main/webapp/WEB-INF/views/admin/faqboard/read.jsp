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
	
 <form role="form" method="get" action="modifyForm">
          <div class="form-group">
          <label>번호</label> <input class="form-control" name='번호'
            value='<c:out value="${board.bno }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>제목</label> <input class="form-control" name='제목'
            value='<c:out value="${board.title }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>내용</label>
          <textarea class="form-control" rows="3" name='내용'
            readonly="readonly"><c:out value="${board.content}" /></textarea>
        </div>

        <div class="form-group">
          <label>글쓴이</label> <input class="form-control" name='작성자'
            value='<c:out value="${board.writer }"/>' readonly="readonly">
        </div>
        
        <!--
        <form role="form" method="post" action="/board/read">
         <div class="table-responsive">
              <table class="table-secondary" >
              <br>
              <div id="cover">
              
              </div>
              <tr>
                 <br>
                 <td><h5>　글번호</h5></td>
                 <td><h5>　제목 </h5></td>
                 <td><h5>　　내용 </h5></td>
                 <td><h5>　　글쓴이 </h5></td>
                 
              </tr>
                <tr>
                <td><h5>　 　${board.bno}</h5></td>
                <td><h5>${board.title}</h5></td>
                <td><h5>　${board.content}</h5></td>
                <td><h5>　${board.writer}</h5></td>
               
                <br>
                </tr>
              </table>
        -->
        
        

<%-- 		<button data-oper='modify' class="btn btn-default">
        <a href="/board/modify?bno=<c:out value="${board.bno}"/>">Modify</a></button>
        <button data-oper='list' class="btn btn-info">
        <a href="/board/list">List</a></button> --%>


<button type="button" class="ajs ajsbutton4" 
			 onclick='location.href="${contextPath}/admin/faqboard/modifyForm?bno=${board.bno}"'>수정</button>
</form>
<button type="button" class="btn btn-outline-dark" onclick="location.href='listAll'">목록</button>

<%-- <form id='operForm' action="/board/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
</form> --%>

<!-- 
<form id='operForm' action="modifyForm" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form>
       -->
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


</body>
</html>