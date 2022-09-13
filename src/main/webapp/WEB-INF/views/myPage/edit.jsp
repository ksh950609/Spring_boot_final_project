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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage/edit.css'/>"/>
		<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/myPage/edit.js'/>"></script>
		
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
				
				<form method="post" id="editFrm" class="editFrm" name="editFrm">
					<div class="tableBox">
						<div class="centerBox">
							<h2 class="h2"><a class="logo" href="<c:url value='/'/>">Artchive</a></h2>
						</div>
							
						<div class="infoBox">
							<div class="itemsBox"><span>아이디</span></div>
							<input type="text" id="userId" name="userId" class="idInput" value="${user.userId}" readonly>
							
							
						</div> <!-- infoBox -->
						
						<!-- 이름 -->
						<div class="infoBox">
							<div class="itemsBox"><span>이름</span></div>
							<div class="inputBox">${user.userName}</div>	
							<input type="button" id="nameBtn" class="nameBtn white-btn edit" value="수정">
						</div> <!-- infoBox -->
						
						<div class="nameBox">
							<div class="explain">개명하신 경우 본인인증하시면 이름이 변경됩니다.</div>
							<input type="text" id="userName" name="userName" class="nameInput" placeholder="이름 입력" value="${user.userName}">
							<div class="explain">
							<i class="fa-solid fa-circle-info"></i> 이동통신사 및 신용평가기관 모두 변경된 이름으로 등록되어 있는지 확인 후 진행해주세요.</div>
						</div>
						
						<%--  <!-- 휴대폰 번호 -->
						<div class="infoBox">
							<div class="itemsBox"><span>휴대폰 번호</span></div>
							<div class="inputBox">${user.userNum}</div>	
							<input type="button" id="nameBtn" class="numberBtn white-btn edit" value="수정">
						</div> <!-- infoBox -->
						
						
						<!-- toggle -->
						<div class="numberBox">
							<div class="explain">휴대폰번호 변경을 위해 인증이 필요합니다.</div>
							<input type="text" class="numberInput" id="userNum" name="userNum" placeholder="변경 휴대폰 번호(-없이 입력)" value="${user.userNum}">
							<div class="warning">휴대폰번호를 입력해주세요. (-없이 입력)</div>
						</div>  --%>
						
						<!-- 닉네임  -->
						<div class="infoBox">
							<div class="itemsBox"><span>닉네임</span></div>
							<div class="inputBox">${user.userNickname}</div>	
							<input type="button" id="nicknameBtn" class="nicknameBtn white-btn edit" value="수정">
						</div> <!-- infoBox -->
						
						<div class="nicknameBox">
							<div class="explain">한글 1~10자, 영문 대소문자 2~20자, 숫자를 사용할 수 있습니다.(혼용가능)</div>
							<input type="text" id="userNickname" name="userNickname" class="nicknameInput" placeholder="닉네임 입력" value="${user.userNickname}">
							<div class="warning">중복되지 않은 별명으로 변경해주세요.</div>
						</div>
						
						<!-- 이메일 -->
						<div class="infoBox">
							<div class="itemsBox"><span>이메일</span></div>
							<div class="inputBox">${user.userEmail}</div>
							<input type="button" id="emailBtn" class="emailBtn white-btn edit" value="수정">
						</div> <!-- infoBox -->
						
						<div class="emailBox">
							<div class="explain">이메일 변경을 위해 인증이 필요합니다.</div>
							<input type="text" id="userEmail1" name="userEmail1" value="${email1}" class="emailInput" placeholder="변경 이메일">
							<select class="emailAddress" id="userEmail2" name="userEmail2">
								<option value="naver.com" <c:if test="${email2 eq 'naver.com'}">selected</c:if>>@naver.com</option>
								<option value="daum.net" <c:if test="${email2 eq 'daum.net'}">selected</c:if>>@daum.net</option>
								<option value="nate.com" <c:if test="${email2 eq 'nate.com'}">selected</c:if>>@nate.com</option>
								<option value="kakao.com" <c:if test="${email2 eq 'kakao.com'}">selected</c:if>>@kakao.com</option>
								<option value="gmail.com" <c:if test="${email2 eq 'gmail.com'}">selected</c:if>>@gmail.com</option>
							</select>
							<div class="warning">이메일을 입력해주세요.</div>
						</div>
						
						<div class="emailNumBox">
							<div class="explain">인증번호 6자리</div>
							<input type="text" id="userEmailNum" name="userEmailNum" class="emailNumInput" placeholder="인증번호 입력">
						</div>
						
						<div class="infoBox">
							<div class="itemsBox"><span>생년월일</span></div>
							<div class="inputBox"><fmt:formatDate value="${user.userBirth}" pattern="yyyy-MM-dd"/></div>	
						</div> <!-- infoBox -->
						
						<div class="infoBox">
							<div class="itemsBox"><span>성별</span></div>
							<div class="inputBox">
								<div class="radioStyle">
									<input type="radio" name="userGender" value="M" class="men" <c:if test="${user.userGender eq 'M'}">checked</c:if> disabled>
									<label for="men">남</label>
									
								</div> <!-- radioStyle -->
								
								<div class="woman">
									<input type="radio" name="userGender" value="F" class="women"  <c:if test="${user.userGender eq 'F'}">checked</c:if> disabled>
									<label for="women">여</label>
								</div>
								
							</div>	
						</div> <!-- infoBox -->
						
						<div class="buttonBox"> 
							<input type="submit" id="editBtn" class="editBtn black-btn" value="확인">
							<input type="reset" class="resetBtn white-btn" value="취소">
						</div> <!--buttonBox-->
						
					</div> <!-- tableBox -->
						
					</form>
			</div> <!-- myPageBox -->
            </div>
        </main>
        
		</section>
		 </div> <!-- wrapper -->
		 <c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>