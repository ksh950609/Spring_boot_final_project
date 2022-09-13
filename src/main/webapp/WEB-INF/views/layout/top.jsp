<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>arTchive</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/header2.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/search2.css'/>">
		<script src="<c:url value='/js/header.js'/>"></script>
		<script src="<c:url value='/js/search.js'/>"></script>
		<script src="<c:url value='/js/module/dropdown.js'/>"></script>
		<!-- icon kit -->
		<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>
		<script type="text/javascript"></script>
	</head>
	<body>
		<header>
		<div id="mainMenuBox">
			<div id="mainMenu">
    
       		<div id="logoBox"><a href="<c:url value='/'/>">Artchive</a></div><!-- ✚ -->
        	
        	<div id="headerBox">
        		<nav>
					<ul>
						<li class="dropdown"><a class="color" href="<c:url value='/exhbn/list'/>">Search<i class="fa-solid fa-angle-down"></i></a>
							<ul class="dropdownMenu">
								<li><a href="/exhbn/list">현재전시</a></li>
								<li><a href="#">지난전시</a></li>
								<li><a href="#">예정전시</a></li>
							</ul>
						</li>
						<li class="dropdown"><a class="color" href="<c:url value="/note/list"/> ">Board<i class="fa-solid fa-angle-down"></i></a>
							<ul class="dropdownMenu">
								<li><a href="<c:url value='/note/list?category=notice&page=1&sort=new&keyword='/>">공지사항</a></li>
								<li><a href="<c:url value='/note/list?category=free&page=1&sort=new&keyword='/>">자유게시판</a></li>
								<li><a href="<c:url value='/note/list?category=event&page=1&sort=new&keyword='/>">이벤트</a></li>
							</ul>
						</li>
						<li class="dropdown"><a class="color" href="<c:url value='/course'/>">Courses<i class="fa-solid fa-angle-down"></i></a>
							<ul class="dropdownMenu">
								<li><a href="<c:url value='/course'/>">코스짜기</a></li>
								<li><a href="<c:url value='/course/list'/>">코스</a></li>
								<li><a href="<c:url value='/review/reviewNoteList'/>">리뷰</a></li>
							</ul>
						</li>
						<%-- <li class="dropdown"><a class="color" href="<c:url value='/course'/>">Courses</a></li> --%>
					</ul>
        		</nav>
        	</div> <!-- headerBox -->
        	
        	<div id="loginBox">

				<c:if test="${empty sessionScope.sid }">
					<ul id="beforeLogin">
						<li class="mainSearch"><a href="#"><img src="<c:url value='/image/searchBlack.png'/>" id="searchImg"></a></li>
						<li><a class="color" href="<c:url value="/join"/>">JOIN</a></li>
						<li class="loginLogout"><a class="color" href="<c:url value="/login"/>">LOGIN</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty sessionScope.sid }">
					<ul id="afterLogin">
						<li class="mainSearch"><a href="#"><img src="<c:url value='/image/searchBlack.png'/>" id="searchImg"></a></li>
						<li class="userName"><a class="color">${sessionScope.username}</a></li>
						<li class="mypage"><a href="<c:url value='/myPage/home'/>">MYPAGE</a></li>
						<li><a class="color" href="<c:url value="/logout2"/>">LOGOUT</a></li>
					</ul>
				</c:if>
        	</div> <!-- loginBox -->
        		
        	
        	</div> <!-- mainMenu -->
        	
        		<div id="searchBox">
					<div>
						<input type="text" id="searchMessage" name="searchMessage" size="120"  placeholder="검색어를 입력하세요."/>
						<input type="button" id="searchBtn" value="검색">
						<img src="<c:url value='/image/X.png'/>">
					</div>
				</div><!-- searchBox -->
        	
        	</div><!-- mainMenuBox -->
        	
            </header>
	</body>
</html>