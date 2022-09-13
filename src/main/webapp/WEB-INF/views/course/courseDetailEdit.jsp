<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>arTchive / ${course.courseTitle}</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<!-- icon-kit -->
		<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>

		<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/courseDetail.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/tagBox.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/map.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/module/toggle.css'/>">
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f62ace4deff6b141114cc8499d76cb47&libraries=services,clusterer,drawing"></script>

		<script type="text/javascript" src="<c:url value='/js/course/autocomplete.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/course/courseEdit.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/course/courseDelete.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/course/mapEdit.js'/>"></script>
	</head>
	<body id="courseDetailEdit">
		<!-- top으로 이동 -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<main id="courseDetail-wrap">
			<!-- headerTextBox -->
			<section id="courseHeader" class="courseHeaderImg">
				<div class="headerTextBox" style="background-image : url('${course.exhbnImgUrl}');">
					<div id="header-exhbnTitle" class="headerText">
						<input class="exhbn-title editInput" id="exhbnTitle" name="exhbnTitle" type="text" value="${course.exhbnTitle}" readonly>
						<input class="exhbn-title editInput" id="exhbnId" name="exhbnId" type="text" value="${course.exhbnId}" hidden><i class="fa-solid fa-magnifying-glass"></i>
					</div>
					<div id="header-postTitle" class="headerText">
						<input id="courseTitle" name="courseTitle" class="post-title editInput h1" type="text" placeholder="제목을 입력하세요." value="${course.courseTitle}">
					</div>
					<div id="header-postDate" class="headerText">
						<input id="updatedAt" name="updatedAt" value="${course.updatedAt}" hidden>
						<input id="courseId" name="courseId" value="${course.courseId}" hidden>
					</div>
           		</div><!-- .headerTextBox -->
			</section><!-- .courseHeader -->

			<!-- courseMain -->
			<section id="courseMenu">
				<div id="courseToggle">
					<input type="checkbox" class="toggle" id="courseStatus" hidden checked>
					<label for="courseStatus" class="toggleSwitch">
						<span class="toggleButton"></span>
					</label>
						<span id="toggleText">공개</span>
				</div>
           		<div id="courseMainText">
					<button id="deleteBtn"  class="white-btn">삭제</button>
					<button id="saveBtn"  class="black-btn">저장</button>
           		</div><!-- courseMainText -->
			</section><!-- courseMenu -->

			<!-- courseMain -->
			<article id="courseMain">
				<section class="tag-box-view">
					<h3>관련 태그</h3>
					<div class="tag-box-edit">
						<ul id="tagList">
							<c:forTokens var="taglist" items="${course.courseTag}" delims=";;">
								<li class="li-item tagItem" value="${taglist}"> ${taglist} <i class="fa-solid fa-xmark closeBtn" onclick="remove(this, '${taglist}')"></i></li>
							</c:forTokens>
							<input class="inner-searchbar" id="inner-searchbar" type="text" placeholder="태그를 입력하세요.">
						</ul>
					</div>
				</section> <!-- editCourseBtn -->
				<section id="course">
					<section id="timeline-container">
						<div class="route-row" id="startPoint">
							<div class="left-side">
								<div class="line down"></div>
								<div class="left">
									<div class="dot"></div>
								</div>
								<div class="content explain"></div>
							</div>
						</div>
						<ul id="sortable" class="timeline-course-container">
							<!-- li 삽입 공간 -->
						</ul>
						<div class="route-row" id="endPoint">
							<div class="left-side">
								<div class="line up"></div>
								<div class="left">
									<div class="dot"></div>
								</div>
								<div class="content explain"></div>
							</div>
						</div>
					</section>
					<section id="courseMap" class="map_wrap">
						<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<input type="text" id="keyword" size="15">
									<button id="keyword_search">검색</button>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</section><!-- course map -->
				</section><!-- Course -->
			</article><!-- courseMain -->

			<section id="searchMap-container">
				<div id="searchCourse">
<%--					<ul>--%>
<%--						<li>Search.</li>--%>
<%--					</ul>--%>
<%--					<form onsubmit="searchPlaces(); return false;">--%>
<%--						<input type="text" id="courseSearch" name="courseSearch" size="120"  placeholder="검색어를 입력하세요."/>--%>
<%--						<input type="submit" id="CourseSearchBtn" value="검색">--%>
<%--					</form>--%>
				</div>
				
				<div id = "recommendCourse">
				 <div class="courseAdd">
				 	<div class="courseAddBtn">
				 		<input type="button" class="white-btn" id="courseAddBtn1" value="장소 추가">
				 	</div>
				 </div>
				 
				  <div class="courseAdd">
				 	<div class="courseAddBtn">
				 		<input type="button" class="white-btn" id="courseAddBtn1" value="장소 추가">
				 	</div>
				 </div>
				 
				  <div class="courseAdd">
				 	<div class="courseAddBtn">
				 		<input type="button" class="white-btn" id="courseAddBtn1" value="장소 추가">
				 	</div>
				 </div>
				 
				  <div class="courseAdd">
				 	<div class="courseAddBtn">
				 		<input type="button" class="white-btn" id="courseAddBtn1" value="장소 추가">
				 	</div>
				 </div>
				</div>
			</section>
		</main>

		 <!-- bottom 이동 -->
         <c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>