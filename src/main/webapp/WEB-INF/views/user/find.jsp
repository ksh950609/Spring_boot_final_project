<%--
  Created by IntelliJ IDEA.
  User: yeoub
  Date: 2022-08-17
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user/find.css'/>">
    <script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/js/user/find.js'/>"></script>
    <title>arTchive / 로그인</title>
</head>
<body>

<!-- top으로 이동 -->
<c:import url="/WEB-INF/views/layout/top.jsp" />
<div id="loginPage">
<section class="login-form">
    <h1 class="loginTitle">ID/PW</h1>
    <form action="">
    	<div class="tabs">
        <div class="tab-2">
            <label for="tab2-1" class="tab_id">ID</label>
            <input id="tab2-1" class="tab_id" name="tabs-two" type="radio" checked="checked">
            <div>
                <br>
                <div class="int-area id">
                    <input type="text" name="id" id="id" autocomplete="off">
                    <label for="id">이메일 주소 입력</label>
                    <div class="check"><i id="id_check" class="fa-solid fa-circle-check" style="color:Red"></i></div>
                </div>
                <div class="int-area email_check1">
                    <input type="number" name="email_check1" id="email_check1" autocomplete="off">
                    <label for="email_check1">인증번호</label>
                    <div id="id_check2" class="check"><i class="fa-solid fa-circle-check" style="color:Red"></i></div>
                </div>
                <div class="complete1" style="text-align:center; width:400px;"></div>
            </div>
        </div>
        <div class="tab-2">
            <label for="tab2-2" class="tab_pw">PW</label>
            <input id="tab2-2" class="tab_pw" name="tabs-two" type="radio">
            <div>
                <br>
                <div class="int-area pw">
                    <input type="email" name="pw" id="pw" autocomplete="off">
                    <label for="id">이메일 주소 입력</label>
                    <div class="check"><i id="pw_check" class="fa-solid fa-circle-check" style="color:Red"></i></div>
                </div>
                <div class="int-area email_check2">
                    <input type="number" name="email_check2" id="email_check2" autocomplete="off">
                    <label for="email_check2">인증번호</label>
                    <div class="check"><i id="pw_check2" class="fa-solid fa-circle-check" style="color:Red"></i></div>
                </div>
                <div class="complete2" style="text-align:center; width:400px;"></div>
            </div>
        </div>
    </div>
        <div class="btn-area">
            <input id="btn_login" type="button" value="LOGIN" onclick="location.href='/login'">
        </div>
     
    </form>
    <div class="caption">
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
