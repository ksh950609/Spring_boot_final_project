<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fn" 	uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Artchive / ${exhbn.exhbnImgUrl}에 대한 코스</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<!-- icon-kit -->
		<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>

		<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/courseDetail.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/tagBox.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/module/toggle.css'/>">
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script src="<c:url value='/js/course/autocomplete.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/course/timelineEdit.js'/>"></script>
		<script src="<c:url value='/js/course/courseDelete.js'/>"></script>
		<script src="<c:url value='/js/course/popup.js'/>"></script>
		<!-- mapSearch 관련 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f62ace4deff6b141114cc8499d76cb47&libraries=services,clusterer,drawing"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/map.css'/>">
		<script type="text/javascript" src="<c:url value='/js/course/mapEdit.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/course/modal.js'/>"></script>


	</head>
	<body id="courseDetailEdit">
		<!-- top으로 이동 -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<main id="courseDetail-wrap">
			<!-- headerTextBox -->
			<section id="courseHeader" class="courseHeaderImg">
				<div class="headerTextBox" style="background-image : url('${exhbn.exhbnImgUrl}');">
					<div id="header-exhbnTitle" class="headerText">
						<input class="exhbn-title editInput" id="exhbnTitle" name="exhbnTitle" type="text" value="${exhbn.exhbnTitle}" readonly>
						<input class="exhbn-title editInput" id="exhbnId" name="exhbnId" type="text" value="${exhbn.exhbnId}" hidden>
						<a href="/exhbn/detail/${exhbn.exhbnId}" target="_blank" class="btn-example">
							<i class="fa-solid fa-magnifying-glass" style="color: #ffffff"></i>
						</a>
					</div>
					<div id="header-postTitle" class="headerText">
						<input id="courseTitle" name="courseTitle" class="post-title editInput h1" type="text" placeholder="제목을 입력하세요.">
					</div>
					<div id="header-postDate" class="headerText">
						<input id="updatedAt" name="updatedAt" hidden>
						<input id="courseId" name="courseId" hidden>
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
					<button id="writePostBtn"  class="black-btn">저장</button>
           		</div><!-- courseMainText -->
			</section><!-- courseMenu -->

			<!-- courseMain -->
			<article id="courseMain">
				<section class="tag-box-view">
					<h3>관련 태그</h3>
					<div class="tag-box-edit">
						<ul id="tagList">
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
								<div class="content explain">Start ...</div>
							</div>
						</div>
						<ul id="sortable" class="timeline-course-container">
							<li class="route-row courseItem">
								<div class="left-side">
									<div class="moveHandler">
										<i class="fa-solid fa-bars moveHandlerBtn"></i>
									</div>
									<div class="left-side">
										<div class="line"></div>
										<div class="left">
											<div class="subCourse-dot">1</div>
										</div>
										<div class="content">
											<div class="where">
												<span class="siteCategory">문화시설</span>&nbsp;
												<h3 id="firstExhbnTitle" class="siteName">${exhbn.exhbnTitle}</h3>
												<div id="firstExhbnAddr" class="siteAddress">${exhbn.exhbnPlaceAddr}</div>
												<div class="memo-box">
													<textarea id="memo_${i}" class="place-memo-input" placeholder="메모를 입력하세요.">${positions[i].place_memo}</textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="delete" id="deleteBtnBox">
									<i class="fa-solid fa-circle-minus fa-2xl deleteBtn" id="deleteBtn1" onclick="deleteCourse(this, '${i}')"></i>
								</div>
							</li>
							<!-- li 삽입 공간 -->
						</ul>
						<div class="route-row" id="endPoint">
							<div class="left-side">
								<div class="line up"></div>
								<div class="left">
									<div class="dot"></div>
								</div>
								<div class="content explain">End ...</div>
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

			<div id="modal" class="modal-overlay">
				<div class="modal-window">
					<div class="title">
						<h2>모달</h2>
					</div>
					<div class="close-area">X</div>
					<div class="content">
						<p>가나다라마바사 아자차카타파하</p>
						<p>가나다라마바사 아자차카타파하</p>
						<p>가나다라마바사 아자차카타파하</p>
						<p>가나다라마바사 아자차카타파하</p>

					</div>
				</div>
			</div>
		</main>

		 <!-- bottom 이동 -->
         <c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>