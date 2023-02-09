<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<style>
#alliance_outer {background:#3b516e url("${contextPath }/resources/img/inc/alliance_bg.jpg") no-repeat center top;}
#alliance {width:1200px; margin:0px auto; min-height:300px;}
#alliance h3 {font-family: 'GmarketSansMedium'; font-size:42px; color:#ffffff; text-align:center; padding:60px 0px 0px 0px;}
<<<<<<< HEAD
#alliance a {color:#ffffff; border-color:rgba(255, 255, 255, 0.4);}
#alliance a:hover {color:#1a1a1a;}
=======
#alliance a {color:#ffffff;}
>>>>>>> 2eb897599583fd37549b4363ee843b317be9ecd9
#alliance .desc {color:rgba(255, 255, 255, 0.6); text-align:center; padding:0px 0px 60px 0px;}
#footer_outer {background:#0b131c; width:100%;}
#footer {min-height:200px; width:1200px; margin:0px auto; color:#ffffff; padding:60px 0px 0px 0px;}
</style>

<div id="alliance_outer">
<div id="alliance">
	<h3>제휴 문의</h3>
	<p class="desc">최고의 비즈니스 파트너 자바 캠핑카와 함께 하세요</p>
	<a href="#" class="btn btn-outline-light">캠핑카 대여 회사 등록 신청</a>
	<a href="#" class="btn btn-outline-light">정비소 등록 신청</a>
	<a href="#" class="btn btn-outline-light">정비소 등록신청 현황</a>
	<a href="#" class="btn btn-outline-light">정비소 정보 수정 및 삭제</a>
</div>
</div>

<div id="footer_outer">
<div id="footer">
	푸터 테스트
</div>
</div>