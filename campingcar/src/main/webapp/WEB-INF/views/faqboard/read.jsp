<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js"></script>
</head>
<body>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">FAQ</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">자주하는 질문입니다.</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
 
          <div class="form-group">
          <label>Bno</label> <input class="form-control" name='번호'
            value='<c:out value="${board.bno }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Title</label> <input class="form-control" name='제목'
            value='<c:out value="${board.title }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Text area</label>
          <textarea class="form-control" rows="3" name='내용'
            readonly="readonly"><c:out value="${board.content}" /></textarea>
        </div>

        <div class="form-group">
          <label>Writer</label> <input class="form-control" name='작성자'
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



<button data-oper='list' class="btn btn-info">목록</button>

<%-- <form id='operForm' action="/board/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
</form> --%>


<form id='operForm' action="/board/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form>
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