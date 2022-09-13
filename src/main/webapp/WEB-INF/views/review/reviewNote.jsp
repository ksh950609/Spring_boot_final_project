<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>arTchive / ${reviewNote.reviewNoteTitle}</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/review/reviewNote.css'/>">
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<!-- top으로 이동 -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<!-- headerTextBox -->
		<%-- <c:forEach var="reviewNote" items="${reviewNoteList}"> --%>
			<section id="courseHeader" class="courseHeaderImg">
				<div class="headerTextBox" style="background-image : url('${reviewNote.exhbnImgUrl}');">
					<div id="header-exhbnTitle" class="headerText">
						<%-- <ul><li>${course.exhbnTitle}</li></ul> --%>
						<ul><li>${reviewNote.userNickname}</li></ul>
					</div>
					<div id="header-postTitle" class="headerText">
						<%-- <h1>${course.courseTitle}</h1> --%>
						<h1>${reviewNote.reviewNoteTitle}</h1>
						<input type="text" value="${reviewNote.reviewNoteId}" hidden>
					</div>
					<div id="header-postDate" class="headerText">
						<ul><li><fmt:formatDate value="${reviewNote.reviewNoteCreatedDate}" pattern="yyyy. MM. dd. E"></fmt:formatDate></li></ul>
					</div>
           		</div><!-- .headerTextBox -->
			</section><!-- .courseHeader -->
		
		<div class="reviewWrap">
		
		<!-- courseMain -->
		<div>
		<section id="courseMenu">
			<div class="back goleft" onclick="goBack();">
				<i id="back" class="fa-solid fa-arrow-left fa-2xl"></i>
			</div>
          		<div id="courseMainBtn-Box">
				<input type="button" id="editCourseBtn"  class="white-btn" value="코스 수정" onclick="location.href='<c:url value="/course/${reviewNote.courseId}/edit"/>'">
				<input type="button" id="like-btn"  class="white-btn" value="게시글 수정" onclick="location.href='<c:url value="/review/reviewNoteEdit/${reviewNote.reviewNoteId}"/>'">
				<input type="button" id="scrap-btn"  class="black-btn" value="삭제">
          		</div><!-- courseMainText -->
		</section><!-- courseMenu -->
		</div>
		
		<div>
		<section class="tag-box-view">
			<h3>관련 태그</h3>
			<ul id="tagList">
				<%-- <c:forTokens var="taglist" items="${course.courseTag}" delims=";;">
					<li><c:out value="${taglist}"/></li>
				</c:forTokens> --%>
				<li>#태그</li>
				<li>#태그</li>
				<li>#태그</li>
			</ul>
		</section> <!-- editCourseBtn -->
		</div>
		
		 <div class="container">
	        <ul class="progressbar">
	            <li id="start">start</li>
	            
	            <c:forEach var="site" items="${siteName}" varStatus="status">
	            <li class="courseBox">${site}</li>
	            
	         	</c:forEach>
	         	
		        <li id="end">end</li>
	        </ul>
	   	</div> 
	   	
	   	
	   	
	   	<div class="reviewNoteBox">
	    <section>
	        <input type="hidden" id="noteId" value="${reviewNote.reviewNoteId}">
	        <%-- <div class="filter_box">
	            <div class="back">
	                <!-- <i id="back" class="fa-solid fa-arrow-left fa-2xl"></i> -->
	            </div>
	            <div class="write_box">
	                <c:if test="${sessionScope.sid == note.userId}">
	                    <input id="write_btn" class="write_btn" type="button" value="수정">
	                </c:if>
	                <c:if test="${sessionScope.sid != note.userId}">
	                    <input id="write_btn" class="write_btn" type="button" value="수정" disabled>
	                </c:if>
	            </div>
	        </div> --%>
	        <div class="content">
	            <div class="scrap">
	                <div class="like">
	                    <c:if test="${not empty sessionScope.sid}">
	                        <c:if test="${note.noteLikeCheck}">
	                            <i id="like" class="fa-solid fa-heart" style="color:Red;"></i>
	                        </c:if>
	                        <c:if test="${not note.noteLikeCheck}">
	                            <i id="like" class="fa-solid fa-heart" style="color:Black;"></i>
	                        </c:if>
	                    </c:if>
	                    <c:if test="${empty sessionScope.sid}">
	                        <i class="fa-solid fa-heart" style="color:Black;"></i>
	                    </c:if>
	                    <span id="likeNum">${note.noteLike}</span>
	                </div>
	                <div><i class="fa-solid fa-message" style="margin-right: 4px;"></i><span id="commentNumMain">${note.noteCommentNum}</span></div>
	            </div>
	            <div class="summary">
	                <div class="title">
	                    ${reviewNote.reviewNoteTitle}
	                </div>
	                <div class="info">
	                    <br><div class="username"> ${reviewNote.userId}</div>&nbsp;&nbsp;<div class="createdAt">
	                    <fmt:formatDate pattern="yyyy-MM-dd" value="${reviewNote.reviewNoteCreatedDate }"/></div>
	                </div>
	                <div class="content-all">
	                <div class="content-body">
	                    <article class="content-text" itemprop="articleBody">
	                        ${reviewNote.reviewNote}
	                    </article>
	                </div>
	              
	                <c:if test="${not empty sessionScope.sid}">
	                    <div class="comment-write">
	                        <textarea id="comment" name="story"
	                                  rows="5" cols="33" placeholder="Leave a Comment..."></textarea>
	                        <input id="commentPost" class="post" type="button" value="Post">
	                    </div>
	                </c:if>
	                <div class="comment-box" id="comment-box">
	                    <div class="comment-num">${commentList.size()} comments</div>
	                    <div class="comment-list">
	                        <c:forEach var="comment" items="${commentList}">
	                            <div class="comment">
	                                <input type="hidden" id="commentId${comment.commentId}" value="${commentId}">
	                                <div class="comment-scrap">
	                                    <div class="like">
	                                        <c:if test="${not empty sessionScope.sid}">
	                                            <c:if test="${comment.commentLikeCheck}">
	                                                <i id="commentLike${comment.commentId}" class="fa-solid fa-heart"
	                                                   onclick="commentLikeClick(${comment.commentId})" style="color:red;"></i>
	                                            </c:if>
	                                            <c:if test="${not comment.commentLikeCheck}">
	                                                <i id="commentLike${comment.commentId}" class="fa-solid fa-heart"
	                                                   onclick="commentLikeClick(${comment.commentId})" style="color:black;"></i>
	                                            </c:if>
	                                            <span id="commentNum${comment.commentId}">${comment.commentLike}</span>
	                                        </c:if>
	                                        <c:if test="${empty sessionScope.sid}">
	                                            <i class="fa-solid fa-heart"
	                                               style="color:black"></i>
	                                            <span>${comment.commentLike}</span>
	                                        </c:if>
	                                    </div>
	                                </div>
	                                <div class="comment-summary">
	                                
	                                    <div class="infoBox">
	                                    	<div class="info">
	                                        	<div class="username">${comment.userNickname}</div>&nbsp;&nbsp;
	                                        	<div class="createdAt"><fmt:formatDate pattern="MM-dd"
	                                                                               value="${comment.commentCreatedDate }"/></div>
	                                        </div>
	
	                                        <div class="deleteComment">
	                                            <c:if test="${sessionScope.sid == comment.userId}">
	                                                <input type="button" class="deleteBtn black-btn"
	                                                       onclick="deleteComment(${comment.commentId})"
	                                                       value="삭제">
	                                            </c:if>
	                                        </div>
	                                    </div>
	                                    <div class="comment-body" style="white-space: pre-line;"><c:out
	                                            value="${comment.comment}" escapeXml="false"></c:out></div>
	                                </div>
	                            </div>
	                        </c:forEach>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	     <%-- </c:forEach> --%>
		</div>
		
		<!-- bottom 이동 -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp" />
        </div>
	</body>
</html>