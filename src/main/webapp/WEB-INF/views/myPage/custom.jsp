<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>arTchive / 마이페이지 - 맞춤정보 수정</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage/custom.css'/>"/>
		<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/myPage/custom.js'/>"></script>
		
	</head>
	<body>
		<div class="wrapper">
			 <c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<section>
			
		 <main id="course-container">
            <div class="course-box main-title-box">
                <h1 class="h1">MyPage</h1>
               
            </div>
            <div class="course-box guide-box">
                <nav>
					<ul class="tabMenu">
						<li><a href="<c:url value='/myPage/home'/>"><i class="fa-solid fa-house"></i> 홈</a></li>
						<li><a href="<c:url value='/myPage/check'/>"><i class="fa-solid fa-gears"></i> 개인정보 수정</a></li>
						<li><a href="<c:url value='/myPage/check2'/>"><i class="fa-solid fa-unlock-keyhole"></i> 비밀번호 설정</a></li>
						<li><a href="<c:url value='/myPage/scrap'/>">	<i class="fa-solid fa-photo-film"></i> 내 전시</a></li>
						<li><a href="<c:url value='/myPage/post'/>"><i class="fa-solid fa-pen"></i> 활동 내역</a></li>
						<li><a href="<c:url value='/myPage/recmd'/>"><i class="fa-solid fa-star"></i> 추천 콘텐츠</a></li>
						<li><a href="<c:url value='/myPage/withdraw'/>"><i class="fa-solid fa-right-from-bracket"></i> 회원 탈퇴</a></li>
					</ul>
				</nav>
			
			<div class="myPageBox">
		
				<h2>개인정보 수정</h2>
					<p class="line">
				<div class="titleBox">
					<a href="<c:url value='/myPage/edit'/>">기본 정보</a>
					<a href="<c:url value='/myPage/custom'/>">맞춤 정보</a>
				</div><!-- titleBox -->
					<div class="tableBox">
						<a class="interestMent">평소에 관심이 있던 분야를 선택해주세요.</a>
				
		<form id="msform">
		
		 <!-- 진척도 -->
				  <ul id="progressbar">
				    <li class="active"></li>
				    <li></li>
				    <li></li>
				  </ul>  <!-- 진척도 -->	
				
		  <fieldset> <!-- 맞춤 정보 1 -->
		   	<div class="intetestBox">
				<input id="checkboxidSeoul" type="checkbox" class="css-checkbox">
				<label for="checkboxidSeoul" class="css-label"><span>전시(서울)</span></label>
			
				<input id="checkboxKyungKi" type="checkbox" class="css-checkbox">
				<label for="checkboxKyungKi" class="css-label"><span>전시(경기)</span></label>
						
				<input id="checkboxDeoksugung" type="checkbox" class="css-checkbox">
				<label for="checkboxDeoksugung" class="css-label"><span>전시(덕수궁)</span></label>
			
				<input id="checkboxCheongju" type="checkbox" class="css-checkbox">
				<label for="checkboxCheongju" class="css-label"><span>전시(청주)</span></label>
						
				<input id="checkboxCmcArt" type="checkbox" class="css-checkbox">
				<label for="checkboxCmcArt" class="css-label"><span>상업예술</span></label>
				
			</div> <!-- intetestBox -->
					
				<div class="intetestBox">	
					<input id="checkboxChild" type="checkbox" class="css-checkbox">
					<label for="checkboxChild" class="css-label"><span>어린이교육</span></label>
					
					<input id="checkboxTeen" type="checkbox" class="css-checkbox">
					<label for="checkboxTeen" class="css-label"><span>청소년교육</span></label>
					
					<input id="checkboxAdult" type="checkbox" class="css-checkbox">
					<label for="checkboxAdult" class="css-label"><span>성인교육</span></label>
					
					<input id="checkboxChildArt" type="checkbox" class="css-checkbox">
					<label for="checkboxChildArt" class="css-label"><span>어린이미술관</span></label>
				</div> <!-- intetestBox -->
		    <input type="button" name="next" class="next action-button" value="Next" />
		  </fieldset> <!-- 맞춤 정보 1 -->
		  
		  <fieldset> <!-- 맞춤 정보 2 -->
		
			<div class="intetestBox">
				<input id="checkboxDesign" type="checkbox" class="css-checkbox">
				<label for="checkboxDesign" class="css-label"><span>디자인</span></label>
			
				<input id="checkboxKorea" type="checkbox" class="css-checkbox">
				<label for="checkboxKorea" class="css-label"><span>한국화</span></label>
				
				<input id="checkboxPiece" type="checkbox" class="css-checkbox">
				<label for="checkboxPiece" class="css-label"><span>조각</span></label>
			
				<input id="checkboxCraft" type="checkbox" class="css-checkbox">
				<label for="checkboxCraft" class="css-label"><span>공예</span></label>
						
				<input id="checkboxArcht" type="checkbox" class="css-checkbox">
				<label for="checkboxArcht" class="css-label"><span>건축</span></label>
			</div> <!-- intetestBox -->
			
			<div class="intetestBox">	
				<input id="checkboxConvers" type="checkbox" class="css-checkbox">
				<label for="checkboxConvers" class="css-label"><span>회화</span></label>
				
				<input id="checkboxDrawing" type="checkbox" class="css-checkbox">
				<label for="checkboxDrawing" class="css-label"><span>드로잉/판화</span></label>
				
				<input id="checkboxPhoto" type="checkbox" class="css-checkbox">
				<label for="checkboxPhoto" class="css-label"><span>사진전</span></label>
				
				<input id="checkboxCalli" type="checkbox" class="css-checkbox">
				<label for="checkboxCalli" class="css-label"><span>서예</span></label>
			</div> <!-- intetestBox -->
			
		    <input type="button" name="previous" class="previous action-button" value="Previous" />
		    <input type="button" name="next" class="next action-button" value="Next" />
		  </fieldset> <!-- 맞춤 정보 2 -->
		  
		  <fieldset> <!-- 맞춤 정보 3 -->
		    <div class="intetestBox">
					
					<input id="checkboxVR" type="checkbox" class="css-checkbox">
   					<label for="checkboxVR" class="css-label"><span>VR</span></label>
					
					<input id="checkboxPerform" type="checkbox" class="css-checkbox">
    				<label for="checkboxPerform" class="css-label"><span>공연</span></label>
    				
    				<input id="checkboxPerformance" type="checkbox" class="css-checkbox">
    				<label for="checkboxPerformance" class="css-label"><span>퍼포먼스</span></label>
					
					<input id="checkboxModenArt" type="checkbox" class="css-checkbox">
    				<label for="checkboxModenArt" class="css-label"><span>현대미술</span></label>
    				
    				<input id="checkboxVoice" type="checkbox" class="css-checkbox">
    				<label for="checkboxVoice" class="css-label"><span>음성해설</span></label>

    				
				</div> <!-- intetestBox -->
					
				<div class="intetestBox">	
					<input id="checkboxScience" type="checkbox" class="css-checkbox">
    				<label for="checkboxScience" class="css-label"><span>보존과학</span></label>
    				
    				<input id="checkboxColection" type="checkbox" class="css-checkbox">
    				<label for="checkboxColection" class="css-label"><span>소장품</span></label>
    				
    				<input id="checkboxDawon" type="checkbox" class="css-checkbox">
    				<label for="checkboxDawon" class="css-label"><span>다원예술</span></label>
    				
    				<input id="checkboxWatching" type="checkbox" class="css-checkbox">
    				<label for="checkboxWatching" class="css-label"><span>작품감상</span></label>
    				
				    <input id="checkboxMenu" type="checkbox" class="css-checkbox">
    				<label for="checkboxMenu" class="css-label"><span>항목</span></label>
    			</div> <!-- intetestBox -->
    			
    			
    			<div class="intetestBox">	
    				
    				<input id="checkboxMenu1" type="checkbox" class="css-checkbox">
    				<label for="checkboxMenu1" class="css-label"><span>항목1</span></label>
    				
    				<input id="checkboxMenu2" type="checkbox" class="css-checkbox">
    				<label for="checkboxMenu2" class="css-label"><span>항목2</span></label>
    				
    				<input id="checkboxMenu3" type="checkbox" class="css-checkbox">
    				<label for="checkboxMenu3" class="css-label"><span>항목3</span></label>
    				
    				<input id="checkboxMenu4" type="checkbox" class="css-checkbox">
    				<label for="checkboxMenu4" class="css-label"><span>항목4</span></label>
    				
    				<input id="checkboxMenu5" type="checkbox" class="css-checkbox">
    				<label for="checkboxMenu5" class="css-label"><span>항목5</span></label>
    			</div> <!-- intetestBox -->
		    
		    <input type="button" name="previous" class="previous action-button" value="Previous" />
		    <input type="submit" name="submit" class="submit action-button" value="Submit" />
		  </fieldset> <!-- 맞춤 정보 3 -->
  
				</form>
			</div> <!-- myPageBox -->
            </div>
        </main>
        
		</section>
		 </div> <!-- wrapper -->
		 <c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>