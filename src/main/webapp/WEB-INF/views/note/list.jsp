<%--
  Created by IntelliJ IDEA.
  User: yeoub
  Date: 2022-08-17
  Time: 오후 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/note/list.css'/>">
    <script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/js/note/list.js'/>"></script>
    <script src="<c:url value='/js/note/search.js'/>"></script>
    <script src="https://kit.fontawesome.com/8ab5776cfb.js" crossorigin="anonymous"></script><!-- 아이콘 -->
    <title>arTchive / 게시판</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>

<article id="slideShow">
    <!-- 슬라이드 쇼  -->
    <div id="slideShowBox">
        <div id="slidePanel">
            <img src="https://img.freepik.com/free-vector/modern-bright-yellow-halftone-design-dark-banner-template-vector_1055-12746.jpg?t=st=1660718656~exp=1660719256~hmac=749a4a0b807a4ee1fb1a5a8dfc09d3af4f0533f4a854563d8766716fd3530260"
                 class="slideImage">
            <img src="https://img.freepik.com/free-vector/abstract-decorative-modern-banner-design_1055-8551.jpg?w=1380&t=st=1660718847~exp=1660719447~hmac=35c330d09b062f731a127622cc0141ecd971cbc772a362ea9e8725dbe652ed2a"
                 class="slideImage">
            <img src="https://img.freepik.com/free-vector/abstract-decorative-modern-banner_1055-9889.jpg?w=1380&t=st=1660718839~exp=1660719439~hmac=8da679bd2017e63c807a09c244c2a135a6f321b072a73746a93267a1ff5e6150"
                 class="slideImage">
            <img src="https://img.freepik.com/free-vector/abstract-modern-gray-color-geometric-trendy-banner-design_1055-14659.jpg?w=1380&t=st=1660718856~exp=1660719456~hmac=a83a1a99aa96341a2cf57a7d7377e4b1a56f968810d4547a30f025ece7f6c524"
                 class="slideImage">
            <img src="https://img.freepik.com/free-vector/abstract-stylish-blue-wavy-design-banner-template-vector_1055-12566.jpg?w=1380&t=st=1660718867~exp=1660719467~hmac=88748af804c3ba4d6234be6c0f2ea6beb8ecc584ef224bdd1ab587606d733293"
                 class="slideImage">
        </div>
    </div>
</article>

<div class="wrapper">
    <!-- <article id="slideShow">
        슬라이드 쇼 
        <div id="slideShowBox">
            <div id="slidePanel">
                <img src="https://img.freepik.com/free-vector/modern-bright-yellow-halftone-design-dark-banner-template-vector_1055-12746.jpg?t=st=1660718656~exp=1660719256~hmac=749a4a0b807a4ee1fb1a5a8dfc09d3af4f0533f4a854563d8766716fd3530260"
                     class="slideImage">
                <img src="https://img.freepik.com/free-vector/abstract-decorative-modern-banner-design_1055-8551.jpg?w=1380&t=st=1660718847~exp=1660719447~hmac=35c330d09b062f731a127622cc0141ecd971cbc772a362ea9e8725dbe652ed2a"
                     class="slideImage">
                <img src="https://img.freepik.com/free-vector/abstract-decorative-modern-banner_1055-9889.jpg?w=1380&t=st=1660718839~exp=1660719439~hmac=8da679bd2017e63c807a09c244c2a135a6f321b072a73746a93267a1ff5e6150"
                     class="slideImage">
                <img src="https://img.freepik.com/free-vector/abstract-modern-gray-color-geometric-trendy-banner-design_1055-14659.jpg?w=1380&t=st=1660718856~exp=1660719456~hmac=a83a1a99aa96341a2cf57a7d7377e4b1a56f968810d4547a30f025ece7f6c524"
                     class="slideImage">
                <img src="https://img.freepik.com/free-vector/abstract-stylish-blue-wavy-design-banner-template-vector_1055-12566.jpg?w=1380&t=st=1660718867~exp=1660719467~hmac=88748af804c3ba4d6234be6c0f2ea6beb8ecc584ef224bdd1ab587606d733293"
                     class="slideImage">
            </div>
        </div>
    </article> -->
    <section>
        <input type="hidden" id="maxDataNum" value="${maxDataNum}">
        <!--  <input class="search_bar" id="search" type="search">
         <i class="fa-solid fa-magnifying-glass search_btn"></i> -->
        <div id="searchMainBox">
            <input type="text" id="searchTEXT" name="searchMessage" size="120" placeholder="검색어를 입력하세요."/>
            <input type="button" class="black-btn" id="searchBtn2" value="검색"/>
        </div>
        <div class="filter_box">
            <ul id="filter_innerbox">
            </ul>
            <div class="write_box">
                <c:if test="${not empty sessionScope.sid}">
                    <input id="write_btn" class="white-btn" type="button" value="작성">
                </c:if>
                <c:if test="${empty sessionScope.sid}">
                    <input id="write_btn" class="white-btn" type="button" value="작성" disabled>
                </c:if>
            </div>
        </div>
        <div class="list_box">
            <c:forEach var="note" items="${list}">
                <div class="content">
                    <div class="scrap">
                        <c:if test="${note.noteLikeCheck}">
                            <div class="like"><i class="fa-solid fa-heart" style="color:red;"></i>${note.noteLike}</div>
                        </c:if>
                        <c:if test="${not note.noteLikeCheck}">
                            <div class="like"><i class="fa-solid fa-heart" style="color:black;"></i>${note.noteLike}
                            </div>
                        </c:if>
                        <div><i class="fa-solid fa-message"></i>${note.noteCommentNum}</div>
                    </div>
                    <div class="summary">
                        <div class="title">
                            <a href="<c:url value="/note/detail/${note.noteId}"/>">${note.noteTitle}</a>
                        </div>
                        <div class="preview">
                                ${note.note}
                        </div>
                        <div class="info">
                            <br><div class="userName">${note.userNickname}</div>&nbsp;&nbsp;<div
                                class="createdAt"><fmt:formatDate pattern="MM-dd" value="${note.noteCreatedDate }"/>
                        </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="nav" id="page-box">
        </div>
    </section>
</div>
<c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
</body>
</html>
