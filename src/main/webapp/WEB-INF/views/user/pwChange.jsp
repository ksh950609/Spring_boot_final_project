<%--
  Created by IntelliJ IDEA.
  User: yeoub
  Date: 2022-08-17
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/login.css'/>">
    <script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/js/user/pwChange.js'/>"></script>
    <title>arTchive / 임시비밀번호 변경</title>
</head>
<body>

<!-- top으로 이동 -->
<c:import url="/WEB-INF/views/layout/top.jsp" />
<div id="loginPage">
<section class="login-form">
    <h1 class="loginTitle">Artchive</h1>
    <form action="">
        <input type="hidden" id="id" value="${id}">
        <div class="int-area">
            <input type="password" name="password" id="pwTemp" autocomplete="off" required>
            <label for="pwTemp">임시 비밀번호</label>
            <div class="show"><i id="pwTemp_eye" class="fa-solid fa-eye"></i><i id="pwTemp_eye_slash" class="fa-solid fa-eye-slash"></i></div>
        </div>
        <div class="int-area">
            <input type="password" name="password" id="pw" autocomplete="off" required>
            <label for="pw">비밀번호 입력 (영문자, 숫자, 특수문자 모두포함 8~20자)</label>
            <div class="show"><i id="pw_eye" class="fa-solid fa-eye"></i><i id="pw_eye_slash" class="fa-solid fa-eye-slash"></i></div>
        </div>
        <div class="btn-area">
            <input id="btn" type="button" value="비밀번호 변경">
        </div>
    </form>
    <div class="caption">
        <span><a href="/find">ID/PW 찾기</a></span><span> | </span>
        <span><a href="/join">회원가입</a></span>
    </div>
    <br>
    <hr>
    <div class="sns">
		<ul>
			<li><img src="<c:url value='/image/facebook.png'/>"></li>
			<li><img src="<c:url value='/image/instagram.png'/>"></li>
			<li><img src="<c:url value='/image/twitter.png'/>"></li>
			<%-- <li><img src="<c:url value='/image/github.png'/>"></li> --%>
		</ul>
	</div>
</section>
</div>

 		 <!-- bottom 이동 -->
         <c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>
