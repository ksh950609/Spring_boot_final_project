<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>arTchive / 마이페이지 - 회원 탈퇴</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage/withdraw.css'/>"/>
		<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/myPage/withdraw.js'/>"></script>
		
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
		
				<h2>회원 탈퇴</h2>
				<p class="line">
				
				<form>
					<div class="tableBox">
						<div class="centerBox">
							<h2 class="h2"><a class="logo" href="<c:url value='/'/>">Artchive</a></h2>
							<span>회원 탈퇴시 아래 내용을 먼저 확인해주세요.<br>
							* 회원 탈퇴는 신청하시는<span class="red"> 즉시 처리</span>됩니다.</span><br>
							<span class="caution">로그인이 필요한 서비스 이용은 더 이상 이용하실 수 없게 됩니다. <br>(예 : 이벤트 참여, 게시판 작성 등)</span>
						</div>
							
						<div class="infoBox">
							<div class="itemsBox"><span>아이디</span></div>
							<div class="inputBox">${sessionScope.sid}</div>	
						</div> <!-- infoBox -->
						
						<div class="infoBox">
							<div class="itemsBox"><span>이름</span></div>
							<div class="inputBox">${user.userName}</div>	
						</div> <!-- infoBox -->
						
						<div class="infoBox">
							<div class="itemsBox"><span>비밀번호 확인</span></div>
								<div class="inputBox"><input type="password" id="userPw" name="userPw" class="pwCfrmInput" required></div>
						</div> <!-- infoBox -->
						
						<div class="infoBox">
							<div class="itemsBox"><span>탈퇴 사유</span></div>
								<div class="inputBox">
									<select class="reasonSelect" required>
							   			<option value="1">ID변경</option>
										<option value="2">서비스 이용 불편</option>
										<option value="3">개인정보 누출 우려</option>
										<option value="4">시스템 장애</option>
										<option value="5">기타</option>
								  	</select>
								 </div>
						</div> <!-- infoBox -->
						
					</div> <!-- tableBox -->
					
						<div class="buttonBox"> 
							<input type="submit" id="quitUser" class="black-btn" value="확인">
							<input type="reset" class="white-btn" value="취소">
						</div> <!-- buttonBox -->
					
					</form>
			</div> <!-- myPageBox -->
            </div> <!-- course-box guide-box -->
        </main>
        
		</section>
		 </div> <!-- wrapper -->
		 <c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>