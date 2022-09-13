<%--
  Created by IntelliJ IDEA.
  User: yeoub
  Date: 2022-08-17
  Time: 오후 5:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/note/update.css'/>">
    <script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/js/note/update.js'/>"></script>
    <script src="<c:url value='/js/note/delete.js'/>"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="https://kit.fontawesome.com/8ab5776cfb.js" crossorigin="anonymous"></script>
    <title>arTchive /${note.noteTitle}</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/top.jsp"></c:import>
<div class="wrapper">
    <input type="hidden" id="noteId" value="${note.noteId}">
    <div class="filter_box">
        <div class="back">
            <i id="back" class="fa-solid fa-arrow-left fa-2xl"></i>
        </div>
    </div>
    <div class="title">
        <h1>글 수정</h1>
    </div>
    <div class="write-box">
        <div class="title">
            <input type="text" id="title" value="${note.noteTitle}" placeholder="제목 입력">
        </div>
        <div class="category">
            <select name="category" id="category">
                <option value="FREE">잡담</option>
                <option value="REVIEW">후기</option>
            </select>
        </div>
        <div class="summernote-box">
            <div id="summernote">${note.note}</div>
        </div>
        <div class="btn-area">
            <input type="button" id="update" value="수정">
        </div>
        <div class="btn-area">
            <input type="button" id="delete" value="삭제">
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/layout/bottom.jsp"></c:import>
</body>
</html>
