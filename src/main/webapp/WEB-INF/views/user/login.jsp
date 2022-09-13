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
    <script src="<c:url value='/js/user/login.js'/>"></script>
    <title>arTchive / 로그인</title>
</head>
<body>

<!-- top으로 이동 -->
<c:import url="/WEB-INF/views/layout/top.jsp" />
<div id="loginPage">
<section class="login-form">
    <h1 class="loginTitle">Artchive</h1>
    <form action="">
        <div class="int-area">
            <input type="text" name="id" id="id" autocomplete="off" required>
            <label for="id">USER NAME</label>
        </div>
        <div class="int-area">
            <input type="password" name="password" id="pw" autocomplete="off" required>
            <label for="pw">PASSWORD</label>
        </div>
        <div class="btn-area">
            <input id="btn" type="button" value="LOGIN">
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
