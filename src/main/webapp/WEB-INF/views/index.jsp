<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Artchive</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/header.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/banner.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/exhibition.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/recommended.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/chatbot.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>">
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/indexHeader.js'/>"></script>
		<script src="<c:url value='/js/chatbotShow.js'/>"></script>
		<script src="<c:url value='/js/chatbot2.js'/>"></script>
		<script src="<c:url value='/js/module/dropdown.js'/>"></script>
		<script src="<c:url value='/js/search.js'/>"></script>
		<!-- icon kit -->
		<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>
		<script type="text/javascript"></script>
	</head>
	<body>
		<div id="wrap">
	
		<header>
		<div id="mainMenuBox">
			<div id="mainMenu"> 
    
       		<div id="logoBox"><a class="color" href="<c:url value='/'/>">Artchive</a></div><!-- ✚ -->
        	
        	<div id="headerBox">
        		<nav>
					<ul>
						<li class="dropdown"><a class="color" href="<c:url value='/exhbn/list'/>">Search<i class="fa-solid fa-angle-down"></i></a>
							<ul class="dropdownMenu">
								<li><a href="#">현재전시</a></li>
								<li><a href="#">지난전시</a></li>
								<li><a href="#">예정전시</a></li>
							</ul>
						</li>
						<li class="dropdown"><a class="color" href="<c:url value="/note/list"/> ">Board<i class="fa-solid fa-angle-down"></i></a>
							<ul class="dropdownMenu">
								<li><a href="<c:url value='/note/list?category=notice&page=1&sort=new&keyword='/>">공지</a></li>
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
						<li class="mainSearch"><a href="#"><img src="<c:url value='/image/search.png'/>" id="searchImg"></a></li>
						<li><a class="color" href="<c:url value="/join"/>">JOIN</a></li>
						<li class="loginLogout"><a class="color" href="<c:url value="/login"/>">LOGIN</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty sessionScope.sid }">
					<ul id="afterLogin">
						<li class="mainSearch"><a href="#"><img src="<c:url value='/image/search.png'/>" id="searchImg"></a></li>
						<li class="userName"><a class="color">${sessionScope.username}</a></li>
						<li class="mypage"><a class="color" href="<c:url value='/myPage/home'/>">MYPAGE</a></li>
						<li><a class="color" href="<c:url value="/logout2"/>">LOGOUT</a></li>
					</ul>
				</c:if>
        	</div> <!-- loginBox -->
        	
        	</div> <!-- mainMenu -->
        	<div id="searchBox">
				<div>
					<input type="text" id="searchMessage" name="searchMessage" size="120"  placeholder="검색어를 입력하세요."/>
					<input type="button" id="searchBtn" value="검색">
					<img src="<c:url value='/image/whiteX.png'/>">
				</div>
			</div><!-- searchBox -->
        	</div><!-- mainMenuBox -->
        	
        		<div id="visual"><img src="<c:url value='https://ifh.cc/g/QzlnKA.png'/>"></div>
            </header>


           	<div id="banner">
           	
           		<div id="bannerText1" class="bannerText">
	           		<ul>
						<!-- <li>코스 짜러가기</li> -->
					</ul>
           		</div>
           		<div id="bannerText2" class="bannerText">
					<ul>
<%--						<li>코스 만들기</li>--%>
					</ul>
           		</div>
           		
				<div id=" ">
           		<div id="bannerText3" class="bannerText">
           			<ul>
						<li><a href="<c:url value='/course'/>">Make Your Course!</a></li>
					</ul>
           		</div>
				</div>
				
           	</div><!-- banner -->
           	
           	<div id="exhibitionAll">

           	<div id="exhibition">
           		<div class="exMaintext">
	           		<ul>
	           			<li class="MainText">지금 하고 있는 전시</li>
	           			<li class="exhibitionMore"><a href="<c:url value='/exhbn/list'/>">더보기 ></a></li>
	           		</ul>
				</div>

				
				<div class="exhbnBox">
				<c:forEach var="exhbn" items="${exhbnList}" varStatus="status" begin="1" end="4">
				<a href="/exhbn/detail/${exhbn.exhbnId}">
           		<div id="exhibitionBox1" class="exhibitionBox" style="cursor:pointer;">
           		<div id="exhibitionImg1" class="exhibitionImg">
           		 <ul>
           		 	<li>
           		 		<img src="${exhbn.exhbnImgUrl}">
           		 	</li>
           		 </ul>
           		 </div><!-- exhibitionImg -->
           		 <div class= "exhibitionText" > 
           		 	<ul>
	           			<li class="exName"><a href="#">${exhbn.exhbnTitle}</a></li>
	           			<li class="exPeriod">
	           			<a href="#">
	           			<fmt:formatDate value = "${exhbn.exhbnStartDate}" type ="date" pattern="yyyy.MM.dd"/> - <fmt:formatDate value = "${exhbn.exhbnEndDate}" type ="date" pattern="yyyy.MM.dd"/>
	           			</a></li>
           		 	</ul>
           		 </div><!-- exhibitionText -->
           		 </div> <!-- exhibitionBox -->
           		 </a>
				</c:forEach>
				</div>

           	</div><!-- exhibition -->
           	
           	<c:if test="${empty sessionScope.sid }">
					<div id="exhibition2">
           		<div class="exMaintext">
	           		<ul>
	           			<li class="MainText">추천하는 전시</li>
	           			<li class="exhibitionMore"><a href="#">더보기 ></a></li>
	           		</ul>
				</div>
				
           		<div class="exhbnBox">
				<c:forEach var="exhbn" items="${exhbnList}" varStatus="status" begin = "1" end = "10" step="2">
				<a href="/exhbn/detail/${exhbn.exhbnId}">
           		<div id="exhibitionBox1" class="exhibitionBox" style="cursor:pointer;">
           		<div id="exhibitionImg1" class="exhibitionImg">
           		 <ul>
           		 	<li>
           		 		<img src="${exhbn.exhbnImgUrl}">
           		 	</li>
           		 </ul>
           		 </div><!-- exhibitionImg -->
           		 <div class= "exhibitionText" > 
           		 	<ul>
	           			<li class="exName"><a href="#">${exhbn.exhbnTitle}</a></li>
	           			<li class="exPeriod">
	           			<a href="#">
	           			<fmt:formatDate value = "${exhbn.exhbnStartDate}" type ="date" pattern="yyyy.MM.dd"/> - <fmt:formatDate value = "${exhbn.exhbnEndDate}" type ="date" pattern="yyyy.MM.dd"/>
	           			</a></li>
           		 	</ul>
           		 </div><!-- exhibitionText -->
           		 </div> <!-- exhibitionBox -->
           		 </a>
				</c:forEach>
				</div>


           	</div><!-- exhibition2 -->	
			</c:if>
			
			<c:if test="${not empty sessionScope.sid }">
					<div id="exhibition2">
           		<div class="exMaintext">
	           		<ul>
	           			<li class="exUserName">${sessionScope.username}</li>
	           			<li class="MainText">님에게 추천하는 전시</li>
	           			<li class="exhibitionMore"><a href="#">더보기 ></a></li>
	           		</ul>
				</div>
				
           		<div class="exhbnBox">
				<c:forEach var="exhbn" items="${exhbnList}" varStatus="status" begin = "5" end = "9" step="1">
				<a href="/exhbn/detail/${exhbn.exhbnId}">
           		<div id="exhibitionBox1" class="exhibitionBox" style="cursor:pointer;">
           		<div id="exhibitionImg1" class="exhibitionImg">
           		 <ul>
           		 	<li>
           		 		<img src="${exhbn.exhbnImgUrl}">
           		 	</li>
           		 </ul>
           		 </div><!-- exhibitionImg -->
           		 <div class= "exhibitionText" > 
           		 	<ul>
	           			<li class="exName"><a href="#">${exhbn.exhbnTitle}</a></li>
	           			<li class="exPeriod">
	           			<a href="#">
	           			<fmt:formatDate value = "${exhbn.exhbnStartDate}" type ="date" pattern="yyyy.MM.dd"/> - <fmt:formatDate value = "${exhbn.exhbnEndDate}" type ="date" pattern="yyyy.MM.dd"/>
	           			</a></li>
           		 	</ul>
           		 </div><!-- exhibitionText -->
           		 </div> <!-- exhibitionBox -->
           		 </a>
				</c:forEach>
				</div>

           		<%-- <div id="exhibitionBox3" class="exhibitionBox">
           		<div id="exhibitionImg1" class="exhibitionImg">
           		 <ul>
           		 	<li>
           		 		<img src="<c:url value='/image/testImage.jpg'/>">
           		 	</li>
           		 </ul>
           		 </div><!-- exhibitionImg -->
           		 <div class= "exhibitionText">
           		 	<ul>
	           			<li class="exName"><a href="#">전시회명1</a></li>
	           			<li class="exPeriod"><a href="#">2022.00.00-2022.00.00</a></li>
           		 	</ul>
           		 </div><!-- exhibitionText -->
           		 </div> <!-- exhibitionBox -->

           		<div id="exhibitionBox" class="exhibitionBox">
           		<div id="exhibitionImg1" class="exhibitionImg">
           		 <ul>
           		 	<li>
           		 		<img src="<c:url value='/image/testImage.jpg'/>">
           		 	</li>
           		 </ul>
           		 </div><!-- exhibitionImg -->
           		 <div class= "exhibitionText">
           		 	<ul>
	           			<li class="exName"><a href="#">전시회명1</a></li>
	           			<li class="exPeriod"><a href="#">2022.00.00-2022.00.00</a></li>
           		 	</ul>
           		 </div><!-- exhibitionText -->
           		 </div> <!-- exhibitionBox --> --%>

           	</div><!-- exhibition2 -->
			</c:if>
           	
           	</div><!-- exhibitionAll -->

           	<div id="recommended">
           		<div id="recommended1" >
	           		<ul>
						<li>
						<img src="<c:url value='/image/recommended1.jpg'/>">
						</li>
	           		</ul>
	           		<div id="description1" class="description">
	           			<ul>
	           				<li><a>@userName</a></li>
	           				<li>간단한 설명</li>
	           				<li>에디터픽 추천 코스</li>
	           			</ul>
	           		</div>
           		</div>

           		<div id="recommended2">
	           		<ul>
						<li>
							<img src="<c:url value='/image/recommended2.jpg'/>">
						</li>
	           		</ul>
	           		<div id="description2" class="description">
	           			<ul>
	           				<li><a>@userName</a></li>
	           				<li>간단한 설명</li>
	           				<li>에디터픽 추천 코스</li>
	           			</ul>
	           		</div>
           		</div>

           		<div id="recommended3">
	           		<ul>
						<li>
						<img src="<c:url value='/image/recommended3.jpg'/>">
						</li>
	           		</ul>
	           		<div id="description3" class="description">
	           			<ul>
	           				<li><a>@userName</a></li>
	           				<li>간단한 설명</li>
	           				<li>에디터픽 추천 코스</li>
	           			</ul>
	           		</div>
           		</div>

           	</div><!-- Recommended-->
           	
           	<!-- 챗봇 -->
           	<div id=chatbotTest>
			<!-- Header -->
			<div id="chatHeader">
				<span>챗봇</span>
				<button id="btnClose">X</button>
			</div>
			
			 <!-- 채팅 내용 출력 영역  -->
			<div id="chatBox"></div>
			
			<div>
				<form id="chatForm" name="chatForm">
					<input type="text" id="message" name="message" size="30"  placeholder="질문을 입력하세요"/>
					<input type="image" src = "<c:url value='/image/send.png'/>" id="submitBtn" value="submit">
				</form>
			</div>
			</div><!-- 챗봇 끝 -->
			
			<div id="chatImage">
			<img src="<c:url value='/image/chatbot.png'/>">
			</div>
			
          <!-- bottom 이동 -->
          <c:import url="/WEB-INF/views/layout/bottom.jsp" />

       </div> <!-- wrap -->
	</body>
</html>