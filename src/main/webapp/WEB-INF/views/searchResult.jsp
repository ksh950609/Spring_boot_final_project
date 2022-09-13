<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리스트 페이지</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/courseBoard.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/course.css'/>"/>
	
	<!-- icon kit -->
	<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/list.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/detailSearch.css'/>"/>
		<script src="<c:url value='/tools/jquery-3.6.0.min.js' /> "></script>
	
	<script src="<c:url value='/js/list_Search.js' />"></script>

	<%-- <script src="<c:url value='/js/list.js' />"></script>
     --%></head>

  <link rel="stylesheet" href="/resources/demos/style.css">

<body>


<!-- 전시 리스트 -->
<div id="result">
<div class="list-con">
	<ul class="row">
		<c:forEach var="exhbn" items="${exhbnSearchList}" varStatus="status">
			<li class="cell">
				<div class="img-box">
					<a href="/exhbn/detail/${exhbn.exhbnId}"><img src="${exhbn.exhbnImgUrl}" alt=""></a>
				</div>
				<section id="ex-all">
					<div class="ex-place">${exhbn.exhbnPlace}</div>
					<div class="ex-title">${exhbn.exhbnTitle}</div>
					<div class="ex-period"><fmt:formatDate value = "${exhbn.exhbnStartDate}" type ="date" pattern="yyyy.MM.dd"/> ~ 
					
					<fmt:formatDate value = "${exhbn.exhbnEndDate}" type ="date" pattern="yyyy.MM.dd"/></div>
				</section>
			</li>
		</c:forEach>
	</ul>
</div>
</div>

</body>
</html>