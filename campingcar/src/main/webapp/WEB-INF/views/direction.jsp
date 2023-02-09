<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>자바 캠핑카 - 오시는 길</title>
<%@ include file="include/plugin.jsp" %>
    <!-- AOS 라이브러리 불러오기-->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<script>
window.addEventListener('load',function(){
	window.scrollTo(0,1100);
}); //자동으로 스크롤내려주기
</script>

<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
<style>

.directionimg{
width: 150px;
height: 80px;

}


</style>


	
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="include/header.jsp" %>
	<!--// #header end -->
	
	<div id="body_head">
		<h2>오시는 길</h2>
		<div class="location">
			HOME　<i class="fa-solid fa-circle-chevron-right"></i>　
			<span>오시는 길</span>
		</div>
	</div>
	
	<div id="wrap">

		<div id="submenu">
			<ul>
				<li class="on"><a href="${contextPath }/direction">오시는 길</a></li>
			</ul>
		</div>
	
		
		<div id="body_contents" style="padding: 10px 0px 60px 0px"; >
<!-- ================================================== -->

<!-- kakao map api start -->
<table style="margin: 0 auto;">
	<tr>
		<td data-aos="zoom-out-right" data-aos-duration="1000" >
			<img class="directionimg" src="${contextPath }/resources/img/direction/direction2.png" alt="위치마커" />
		</td>
		<td data-aos="zoom-out-right" data-aos-duration="1000" style="color: gray; padding-left: 15px; padding-right: 65px;" >
			오시는길<br>
			수원역 지하상가 13번출구 1분거리<br>
			(CU편의점건물3층)
		</td>
		
		<td data-aos="zoom-out-left" data-aos-duration="1000" style="padding-left: 25px;">
			<img class="directionimg" src="${contextPath }/resources/img/direction/direction1.png" alt="핸드폰" />
		</td>
		<td data-aos="zoom-out-left" data-aos-duration="1000" style="color:gray;">
			고객센터<br>
			언제라도 문의 주세요.<br>
			031)253-5225
		</td>
	</tr>
</table>


<hr>
<div data-aos="zoom-out-up" data-aos-duration="1000">
<p class="fs-6 text-center"
style="padding: 0px 0px 15px 0px; color: gray">경기도 수원시 매산로1가 11-9,세진브론즈빌 3층</p>
<div class="container" id="map" style="width:1000px;height:400px;"></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08c7f5459534f8433e8a8e73d7707bc1&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.268070, 127.000157), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.268070, 127.000157); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">자바 캠핑카</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.268070, 127.000157); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

//===================================
	
function garage_search(a,b) {
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch(a, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content:'　'+b
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
}
</script>
<!-- kakao map api end -->


 

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<div id="footer">
	</div>
</div><!-- // #container end -->
        <script> 
            AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
        </script>
</body>
</html>