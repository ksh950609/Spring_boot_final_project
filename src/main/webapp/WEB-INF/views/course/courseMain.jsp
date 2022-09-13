<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
    <head>
        <title>arTchive / 전시 코스</title>
        <!-- jquery -->
        <script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
        <!-- jquery-ui -->
        <script src="http://code.jquery.com/ui/1.13.2/jquery-ui.js" ></script>
        <link href="http://code.jquery.com/ui/1.13.2/themes/smoothness/jquery-ui.css" rel="Stylesheet">
        <!-- icon-kit -->
        <script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>

        <script src="<c:url value='/js/course/course.js'/>"></script>
        <script src="<c:url value='/js/course/autocomplete.js'/>"></script>

        <link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/course/course.css'/>"/>
    </head>
<body>
    <div id="course-wrap">
        <!-- top으로 이동 -->
        <c:import url="/WEB-INF/views/layout/top.jsp" />

        <main id="course-container">
            <div class="course-box main-title-box">
                <h1 class="h1">Plan</h1>
                <span>오늘 더 멋지게 예술을 즐겨요!</span>
            </div>
            <div class="course-box guide-box">
                <h2 class="h2">당신을 위한 arTchive</h2>
                <div class="guide-img-box">
                    <div class="guide-contents">
                        <img class="guide-img" src="https://user-images.githubusercontent.com/103120173/185287401-877eef5d-cf11-459f-8b4b-c915c255cb49.png">
                        <h3 class="h3">전시 추천</h3>
                        <span class="small-text">날 위한 문화예술 전시를<br>쉽게 만날 수 있어요.</span>
                    </div>
                    <div class="guide-contents">
                        <img class="guide-img" src="https://user-images.githubusercontent.com/103120173/185287409-717065e3-7293-45af-bf27-17c48c820c9c.png">
                        <h3>핫플레이스 추천</h3>
                        <span class="small-text">더이상 어디갈지 헤매지 마세요.<br>전시의 여운을 줄길 수 있는 곳으로 추천합니다.</span>
                    </div>
                    <div class="guide-contents">
                        <img class="guide-img" src="https://user-images.githubusercontent.com/103120173/185287416-56815b55-2793-4d0f-8b5d-285dc40b919e.png">
                        <h3>나만의 전시 코스</h3>
                        <span class="small-text">나만의 전시코스를 짜고<br>쉽게 공유하세요.</span>
                    </div>
                    <div class="guide-contents">
                        <img class="guide-img" src="https://user-images.githubusercontent.com/103120173/185287421-dc103247-022f-4701-80fd-191b1f87f47d.png">
                        <h3>문화예술 커뮤니티</h3>
                        <span class="small-text">다른 사람의 전시 후기를<br>보고 공감할 수 있어요.</span>
                    </div>
                </div>
            </div>
            <div class="course-box recommand-exhb">
                <div class="title-box">
                    <div>
                        <h2 class="h2">전시부터 정하기</h2>
                        <span>가고싶은 전시의 이름을 눌러 선택하세요. 포스터를 누르면 상세 정보를 확인할 수 있습니다.</span>
                    </div>
                    <div class="viewmore-box">
                        <a href="<c:url value='/exhbn/list'/>"><span class="viewmore">더보기 ></span></a>
                    </div>
                </div>
                <section class="exhbnList-box">
                    <c:forEach items="${exhbnList}" var="exhbn" end="4">
                        <div class="exhbnEach-box">
                            <div class="exhbn-item">
                                <a href="<c:url value='/exhbn/detail/${exhbn.exhbnId}'/>"><img class="exhbn-poster" src="${exhbn.exhbnImgUrl}" alt="전시포스터"></a>
                            </div>
                            <div class="caption-box">
                                <input type="radio" class="courseSelect" id="courseExhbnSelect-${exhbn.exhbnId}" name="courseExhbnSelect" value="${exhbn.exhbnTitle}">
                                <label class="ex-title" for="courseExhbnSelect-${exhbn.exhbnId}">${exhbn.exhbnTitle}</label>
                            </div>
                        </div>
                    </c:forEach>
                </section>
                <div class="selected" id="selected">
                        <div>
                            <c:if test="${not empty sessionScope.sid}">
                                <span class="big-text"><strong>${sessionScope.username}</strong> 님이
                                </span>
                            </c:if>
                            <span class="big-text">선택한<strong id="selectedExhbn">{전시명}</strong>부터 &nbsp;</span></div>
                    <c:if test="${not empty sessionScope.sid}">
                        <div><a href="<c:url value='/course/newPost/217601'/>"><button type="submit" class="black-btn">코스짜러 가기</button></a></div>
                    </c:if>
                    <c:if test="${empty sessionScope.sid}">
                        <div><button type="submit" class="black-btn notLogin" onclick="alert('로그인이 필요한 기능입니다.');">코스짜러 가기</button></div>
                    </c:if>
                </div>
                <br>
            </div>
    <!-- 테마 코스 찾기 -->
            <section id="tagSearchCourse" class="course-box search-box">
                <div class="title-box">
                    <div>
                        <h2 class="h2">테마 코스 찾기</h2>
                        <span>누구랑 어떤 하루를 보내고 싶나요?</span>
                    </div>
                </div>
                <div class="searchbar-box">
                    <div class="searchbar-border tag-box" type="text">
                        <ul id="tagList">
                            <input class="inner-searchbar" id="inner-searchbar" type="text" placeholder="검색 태그를 입력하세요.">
                        </ul>
                    </div>
                    <input class="black-btn searchbar-btn" type="button" value="검색">
                </div>
                <div id="tag-caution" class="vibration">태그는 3개까지만 선택할 수 있습니다.</div>
            </section>
            <section id="famousCourse" class="course-box noborder">
                <div class="title-box">
                    <div>
                        <h2 class="h2">인기 코스</h2>
                        <span>최근 ArTchive 유저들이 좋아한 코스를 살펴보세요!</span>
                    </div>
                    <div class="viewmore-box">
                        <a href="<c:url value='/course/list'/>"><span class="viewmore">더보기 ></span></a>
                    </div>
                </div>
                <div class="courseList-box">
                    <c:forEach items="${courseList}" var="course" end="3">
                        <div class="course-item">
                            <a href="<c:url value='/course/${course.courseId}'/>">
                                <div>
                                    <img class="coursepost-thumb" src="${course.exhbnImgUrl}" alt="전시포스터">
                                </div>
                                <div class="coursepost-box">
                                    <span class="ex-title">${course.courseTitle}</span>
<%--                                    <span class="like-logo"><i class="fa-solid fa-thumbs-up"></i><br>${course.courseLike}</span>--%>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </main>

        <!-- bottom 이동 -->
        <c:import url="/WEB-INF/views/layout/bottom.jsp" />
    </div>
</body>
</html>
