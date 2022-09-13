<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/mapView.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/toggle.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/note/detail.css'/>">
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f62ace4deff6b141114cc8499d76cb47&libraries=services"></script>
		
		<script src="<c:url value='/js/note/detail.js'/>"></script> <!-- 글 삭제 -->
		<script src="<c:url value='/js/course/courseDelete.js'/>"></script> <!-- 코스 아이템 삭제 -->
		<script src="<c:url value='/js/course/comment.js'/>"></script> <!-- 코멘트 ajax -->
		<script src="<c:url value='/js/course/mapView.js'/>"></script>


	</head>
	<body>
		<!-- top으로 이동 -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<main id="courseDetail-wrap">
			<!-- headerTextBox -->
			<section id="courseHeader" class="courseHeaderImg">
				<div class="headerTextBox" style="background-image : url('${course.exhbnImgUrl}');">
					<div id="header-exhbnTitle" class="headerText">
						<ul><li>${course.exhbnTitle}</li></ul>
					</div>
					<div id="header-postTitle" class="headerText">
						<h1>${course.courseTitle}</h1>
						<input type="text" id="courseId" name="courseId" value="${course.courseId}" hidden>
					</div>
					<div id="header-postDate" class="headerText">
						<ul><li>by. ${course.userNickname} / <fmt:formatDate value="${course.createdAt}" pattern="yyyy. MM. dd. E"></fmt:formatDate></li></ul>
					</div>
           		</div><!-- .headerTextBox -->
			</section><!-- .courseHeader -->

			<!-- courseMain -->
			<section id="courseMenu">
				<div class="back goleft" onclick="goBack();">
					<i id="back" class="fa-solid fa-arrow-left fa-2xl"></i>
				</div>
           		<div id="courseMainBtn-Box">
					<c:if test="${sessionScope.sid == course.userId}">
						<input type="button" id="editCourseBtn"  class="white-btn" value="수정" onclick="location.href='<c:url value="/course/${course.courseId}/edit"/>'">
						<button id="deleteBtn_view"  class="white-btn">삭제</button>
					</c:if>
					<button id="scrapCourse"  class="black-btn">스크랩</button>
					<input type="button" id="createReview" value="리뷰작성하기" onclick="location.href='<c:url value="/review/reviewNoteWrite/${course.courseId}"/>'" class="black-btn">
           		</div><!-- courseMainText -->
			</section><!-- courseMenu -->

			<!-- courseMain -->
			<article id="courseMain">
				<section class="tag-box-view">
					<h3>관련 태그</h3>
					<ul id="tagList">
						<c:forTokens var="taglist" items="${course.courseTag}" delims=";;">
							<li><c:out value="${taglist}"/></li>
						</c:forTokens>
					</ul>
				</section> <!-- editCourseBtn -->
				<section id="course">
					<section id="timeline-container">
						<div class="timeline-course-container">
							<div class="route-row" id="startPoint">
								<div class="left-side">
									<div class="line down"></div>
									<div class="left">
										<div class="dot"></div>
									</div>
<%--									<div class="content explain">Start ...</div>--%>
								</div>
							</div>
							<c:forEach var="site" items="${siteName}" varStatus="status">
<%--								<div class="route-row">--%>
<%--									<div class="left-side">--%>
<%--										<div class="line"></div>--%>
<%--										<div class="left">--%>
<%--											<div class="mainCourse-dot">${status.count}</div>--%>
<%--										</div>--%>
<%--										<div class="content">--%>
<%--											<div class="where">--%>
<%--												<h3 class="where-title">${site}</h3>--%>
<%--												<div class="address">${siteAddress[status.index]}</div>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</div>--%>
<%--									<div class="memo-box">--%>
<%--										<span class="small-text">${siteMemo[status.index]}</span>--%>
<%--									</div>--%>
<%--								</div>--%>
							<li class="route-row viewitem">
								<div class="left-side">
									<div class="left-side">
										<div class="line"></div>
										<div class="left">
											<div class="subCourse-dot">${status.count}</div>
										</div>
										<div class="content">
											<div class="where">
												<h3 class="where-title">${site}</h3>
												<div class="siteAddress">${siteAddress[status.index]}</div>
												<div class="memo-box">
													<span id="memo_${status.count}" class="small-text" placeholder="메모를 입력하세요.">${siteMemo[status.index]}</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							</c:forEach>
							<div class="route-row" id="endPoint">
								<div class="left-side">
									<div class="line up"></div>
									<div class="left">
										<div class="dot"></div>
									</div>
<%--									<div class="content explain">End ...</div>--%>
								</div>
							</div>
							<div class="memo-box">
								<span class="small-text">
									<fmt:formatDate value="${course.updatedAt}" pattern="yyyy. MM. dd. E"/>요일에 마지막으로 수정되었습니다.
								</span>
							</div>
						</div>
					</section>
					
					<section id="courseMapBox">
	   					<div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						    <div class="hAddr">
						        <span class="title">지도중심기준 행정동 주소정보</span>
						        <span id="centerAddr"></span>
						    </div>
						</div>	
	   						
	   						<button id="centerMove">지도 중심좌표 이동시키기</button>
  							<button id="show">마커 보이기</button>
  							<button id="hide">마커 감추기</button>
					</section><!-- courseMap -->
					 	
					</section><!-- Course -->
			
				
			</article><!-- courseMain -->
			<section class="share">
				<div class="post-react-box">
					<div class="post-like-box">
						<i class="fa-solid fa-heart fa-xl" style="color:black;"></i>
						<span>${course.courseLike}</span>
					</div>
					<div class="post-comment-box">
						<i class="fa-solid fa-message fa-xl" style="color:black;"></i>
						<span>${course.courseComment}</span>
					</div>
					<div class="post-view-box">
						<i class="fa-solid fa-eye fa-xl" style="color:black;"></i>
						<span>${course.courseView}</span>
					</div>
				</div>
				<div>
					<i class="fa-solid fa-envelope fa-xl"></i>
					<i class="fa-brands fa-twitter fa-xl"></i>
					<i class="fa-brands fa-facebook fa-xl"></i>
					<i class="fa-solid fa-share-nodes fa-xl"></i>
				</div>
			</section>

			<section id="comment">
				<c:if test="${not empty sessionScope.sid}">
					<div class="comment-write">
					  <textarea id="story" name="story" rows="5" cols="33" placeholder="Leave a Comment"></textarea>
						<button id="postCommentBtn" class="black-btn" type="button">Post</button>
					</div>
				</c:if>
				<div class="comment-num">${course.courseComment} comments</div>
				<div class="comment-list">
					<c:forEach var="c" items="${cComment}" varStatus="status">
						<div class="comment">
							<div class="comment-scrap">
								<div class="like"><i class="fa-solid fa-heart" style="color:Red"></i>${c.commentLike}</div>
							</div>
							<div class="comment-summary">
								<div class="info">
									<div class="username">${c.userNickname}</div>&nbsp;&middot;&nbsp;
									<div class="createdAt"><fmt:formatDate value="${c.commentCreatedDate}" pattern="MM/dd hh:mm"/> </div>
								</div>
								<div class="comment-body">
									${c.comment}
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
		</main>

		 <!-- bottom 이동 -->
         <c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>