<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>arTchive / 마이페이지</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage/home.css'/>"/>
		<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		
	</head>
	<body>
		<div class="wrapper">
			 <c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<section>
			
		 <main id="course-container">
            <div class="course-box main-title-box">
                <h1 class="h1">MyPage</h1>
                <span>${sessionScope.sid}님 어서오세요.</span>
               
            </div>
            <div class="course-box guide-box">
                <h2 class="h2"><a class="logo" href="<c:url value='/'/>">Artchive</a></h2>
                <div class="guide-img-box">
                    <div class="guide-contents">
                        <a class="items" href="<c:url value='/myPage/check'/>"> 
	                        <img class="guide-img" alt="개인정보 수정" src="<c:url value='/image/setting.png'/>">
	                        <p class="h3">개인정보 수정</p>
	                        <span class="small-text">본인인증, 휴대폰 번호<br> 등 내 정보를 수정하세요.</span>
                        </a>
                    </div>
                    <div class="guide-contents">
                    	<a class="items" href="<c:url value='/myPage/check2/'/>"> 
                        	<img class="guide-img" alt="비밀번호 설정" src="<c:url value='/image/lock.png'/>">
                        	<p class="h3">비밀번호 설정</p>
                        	<span class="small-text">비밀번호를 설정하여<br>내 정보를 보호하세요.</span>
                        </a>
                    </div>
                    <div class="guide-contents">
						<a class="items" href="<c:url value='/myPage/scrap'/>"> 
							<img class="guide-img" alt="내 전시" src="<c:url value='/image/gallery.png'/>">                        
	                        <p class="h3">내 전시</p>
	                        <span class="small-text">내가 좋아요와 스크랩한 <br>전시를 한 번에 볼 수 있어요.</span>
	                    </a> 
                    </div>
                     <div class="guide-contents">
						<a class="items" href="<c:url value='/myPage/post'/>"> 	
							<img class="guide-img" alt="활동 내역" src="<c:url value='/image/post.png'/>">
	                        <p class="h3">활동 내역</p>
	                        <span class="small-text">내가 쓴 게시글과 댓글을 <br>확인할 수 있어요.</span>
	                     </a>  
                    </div>
                    <div class="guide-contents">
                        <a class="items" href="<c:url value='/myPage/recmd'/>"> 
	                        <img class="guide-img" alt="추천 콘텐츠" src="<c:url value='/image/recmd.png'/>">
	                        <p class="h3">추천 콘텐츠</p>
	                        <span class="small-text">맞춤 설정을 통해<br>전시를 추천 받아 보세요.</span>
	                    </a>   
                    </div>
                     <div class="guide-contents">
						<a class="items" href="<c:url value='/myPage/withdraw/'/>">                      
	                        <img class="guide-img" alt="회원 탈퇴" src="<c:url value='/image/logout.png'/>">
	                        <p class="h3">회원 탈퇴</p>
	                    </a>   
                    </div>
                </div>
            </div>
        </main>
        
		</section>
		 </div> <!-- wrapper -->
		 <c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>