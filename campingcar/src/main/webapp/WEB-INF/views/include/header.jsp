<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
.dropmenu{
	background-color: transparent;
	border-color: transparent;
	width: 250px;	
}
.one{
	display: inline-block;
}
</style>

<div id="header_over">
</div>

<div id="header_outer">
<div id="header">

	<div id="gnb">
	<ul>
		<li><a href="${contextPath }/user/join">회원가입</a>　
	<c:if test="${user.car_uid == null}">
		<a class="one" href="${contextPath }/user/login">로그인</a>
	</c:if>
	<c:if test="${user.car_uid != null}">
		<a class="nav-link one" href="${contextPath }/logout">로그아웃</a>
	</c:if>
	<c:if test="${user.car_uid == 'admin'}">
		<a class="one" style="margin-left: 10px" href="${contextPath }/admin/" target="_blank">관리자</a>
	</c:if>
	</ul>
	</div>
	
	<div id="topmenu_outer" class="clearfix">
		<h1><a href="${contextPath }/"><img src="${contextPath }/resources/img/header/logo_off.png" alt="자바 캠핑카" /></a></h1>
		<div id="topmenu">
			<ul class="clearfix">
				<li>
					<a href="#">회사 소개</a>
					<ul>
						<li><a href="#">회사소개</a></li>
						<li><a href="#">포트폴리오</a></li>
						<li><a href="#">오시는 길</a></li>
					</ul>					
				</li>
				<li>
					<a href="${contextPath }/car/list">보유 차량</a>
				</li>
				<li><a href="${contextPath }/rent/list">실시간 예약</a></li>
				<li><a href="${contextPath }/rent/read">예약 확인</a></li>
				<li>
					<a href="#">커뮤니티</a>
					<ul>
						<li><a href="${contextPath }/garage/list">정비소 검색</a></li>
					</ul>
				</li>
				<li>
					<a href="#">고객센터</a>
					<ul>
						<li><a href="#">이용 문의</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">자주하는 질문</a></li>
						<li><a href="${contextPath }/garage/register">정비소 등록신청</a></li>
						<c:if test="${user.car_uid == 'admin'}">
							<li><a href="${contextPath }/admin/garage/register">정비소 등록신청 현황</a></li>
							<li><a href="${contextPath }/admin/garage/list?keyword=">정비소 정보 수정 및 삭제</a></li>
						</c:if>							
						<li><a href="${contextPath }/company/list">대여회사 등록신청</a></li>
					</ul>					
				</li>
			</ul>
		</div><!-- // #topmenu end -->
	</div><!-- // #topmenu_outer end -->

	
</div><!-- // #header end -->
</div><!-- // #header_outer end -->

<script>
$(document).ready(function(){
	$("#header_outer").mouseenter(function(){
		$(this).stop().animate({"height":"370px"}, 500, "easeOutQuint");
		$(this).addClass("over");
		$("#header_over").stop().animate({"height":"370px"}, 500, "easeOutQuint");
		var logo = $(this).find("h1 img");
		logo.attr("src", logo.attr("src").replace("off", "on"));
		$(this).find("#topmenu li > a").stop().animate({"width":"150px"},150, "easeOutCubic");
	});
	$("#header_outer").mouseleave(function(){
		$(this).stop().animate({"height":"140px"}, 500, "easeOutQuint");
		$(this).removeClass("over");
		$("#header_over").stop().animate({"height":"1px"}, 500, "easeOutQuint");
		var logo = $(this).find("h1 img");
		logo.attr("src", logo.attr("src").replace("on", "off"));
		$(this).find("#topmenu li > a").stop().animate({"width":"120px"},150, "easeOutCubic");
	});	
});
</script>