<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="mn" value="6" />
<c:set var="sn" value="1" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>이용 문의 - 자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />

<!-- 제목 위에 마우스 올릴 경우 이벤트 발생(빨강색으로 변경됨) -->
<style>
a:hover{
color: red;
}
</style>

<script>
function search(){//검색기능
	var $keyword = $('#keyword');
	$('#searchBtn').on('click',function(){
		var keywordVal = $keyword.val();
		var url = "qnalist?page=1"
			+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"			
			+ "&keyword=" + encodeURIComponent(keywordVal);
		window.location.href = url;			
	})	
}
</script>
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
	
	<h4 align="center">문의 사항 내용에 연락처 및 내용을 남겨주시면 담당자가 확인 후 연락드리겠습니다</h4>
	<br>
	
	<div class="panel-body">
	
	<table class="table table-bordered table-hover">
		<tr align="center" bgcolor="gray" class="a">
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>

		<c:forEach items="${list}" var="QnaVO">
			<tr align="center">
				<td>${QnaVO.qna_no}</td>
				<td><a href='read?qna_no=${QnaVO.qna_no}'>${QnaVO.qna_title}</a></td>
				<td>${QnaVO.qna_content}</td>
				<td>${QnaVO.qna_writer}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${QnaVO.qna_regdate}" /></td>
			</tr>
		</c:forEach>
	</table>

	<c:if test="${pageMaker.cri.page!=null }">
		
		<div class="container text-right" style="margin-left: 15px">
			<button type="button" class="btn btn-outline-dark" onclick="location.href='register'"><b>문의글 작성</b></button>
		</div>
		
		<form name="search_QnA" autocomplete="on">
	<div class="container text-center" style="padding-top: 15px"> 
	
    <span>
    <input class="basic-slide" id="keyword" name="keyword" type="search" value="${pageMaker.cri.keyword}" 
    placeholder="문의글 검색" />
    
	<button style="margin-left: -3px; height: 44px; margin-bottom:2px; border-radius: 0px 3px 3px 0px; border:0;" 
	id="searchBtn" class="btn btn-secondary btn-sm">검색</button>
	</span>		
	</div>
		</form>
   <div class="container text-center">
    
      <ul>
      <b>
         <c:if test="${pageMaker.prev }">         
            <a class="btn btn-outline-secondary "  href = "qnalist${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>            
         </c:if>      
         
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">            
            <c:choose>
            
            <c:when test="${cri.page != idx }">
            <a class="<c:if test="${cri.page != idx }">btn btn-outline-secondary</c:if>" href = "qnalist${pageMaker.makeSearch(idx)}"  >${idx }</a>
            </c:when>
            
            <c:otherwise>
            <a style="color: white;" class="<c:if test="${cri.page == idx }">btn btn-secondary</c:if>" href = "qnalist${pageMaker.makeSearch(idx)}"  >${idx }</a>
            </c:otherwise>
            
            </c:choose>   
         </c:forEach>
            
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <a class="btn btn-outline-secondary " href = "qnalist${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
         </c:if>
      </b>
      </ul>           
		</div>
	</c:if>

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}

		let moveForm =$("moveForm");
		
		$(".move").on("click", function(e){
			e.preventDefault();
			moveForm.append("<input type='hidden' name='qna_no' value='"+ $(this).attr("href")+"'>");
			moveForm.attr("action", "qna/read");
			moveForm.submit();
		});
		
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "qna/qnalist?keyword=");
			moveForm.submit();
		});
		
	</script>
	
			</div> <!-- panel-body end -->
		</div><!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
		<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
		<!-- //#footer end -->
	
	   <!-- /.content -->
	</div>
</body>
</html>