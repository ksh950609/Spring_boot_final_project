<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/review/reviewNote.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/review/reviewNoteEdit.css'/>">
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/review/reviewUpdate.js'/>"></script>
		<script src="<c:url value='/js/review/reviewDelete.js'/>"></script>
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	    <script src="https://kit.fontawesome.com/8ab5776cfb.js" crossorigin="anonymous"></script>
	</head>
	<body>
		
		<!-- top으로 이동 -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<!-- headerTextBox -->
		<%-- <c:forEach var="reviewNote" items="${reviewNoteList}"> --%>
			<section id="courseHeader" class="courseHeaderImg">
			<input type="hidden" id="userId" value="${reviewNote.userId}">
			<input type="hidden" id="reviewNoteId" value="${reviewNote.reviewNoteId}">
				<div class="headerTextBox" style="background-image : url('${reviewNote.exhbnImgUrl}');">
					<div id="header-exhbnTitle" class="headerText">
						<%-- <ul><li>${course.exhbnTitle}</li></ul> --%>
						<ul><li>${reviewNote.userNickname}</li></ul>
					</div>
					<div id="header-postTitle" class="headerText">
						<input type="text" id="reviewNoteTitle" value="${reviewNote.reviewNoteTitle}" placeholder="제목 입력">
						<%-- <h1>${reviewNote.reviewNoteTitle}</h1> --%>
						<%-- <input type="text" value="${reviewNote.reviewNoteId}" hidden> --%>
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
				<%-- <input type="button" id="editCourseBtn"  class="white-btn" value="코스 수정" onclick="location.href='<c:url value="/course/${reviewNote.courseId}/edit"/>'">
				<input type="button" id="editReviewNoteBtn" value="게시글 수정" onclick="location.href='<c:url value="/review/reviewNoteEdit/${reviewNote.reviewNoteId}"/>'" class="white-btn">
				<input type="button" id="scrap-btn"  class="black-btn" value="삭제"> --%>
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
	   	
	   	
	   	
	   	<div class="wrapper">
		   <input type="hidden" id="noteId" value="${note.noteId}">
		   <div class="filter_box">
		       <!-- <div class="back">
		           <i id="back" class="fa-solid fa-arrow-left fa-2xl"></i>
		       </div> -->
		   </div>
		   <div class="title">
		       <h1>글 수정</h1>
		   </div>
		   <div class="write-box">
		       <%-- <div class="title">
		           <input type="text" id="title" value="${note.noteTitle}" placeholder="제목 입력">
		       </div>
		       <div class="category">
		           <select name="category" id="category">
		               <option value="FREE">잡담</option>
		               <option value="REVIEW">후기</option>
		           </select>
		       </div> --%>
		       <div class="summernote-box">
		           <div id="summernote">${reviewNote.reviewNote}</div>
		        </div>
		        <div class="btn-area">
		            <input type="button" id="reviewUpdate" value="수정">
		        </div>
		        <div class="btn-area">
		            <input type="button" id="reviewDelete" value="삭제">
		        </div>
		    </div>
		</div>
		
		<!-- bottom 이동 -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp" />
        </div>
		
	</body>
</html>