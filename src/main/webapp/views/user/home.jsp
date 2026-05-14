<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<html>

<head>

    <title>Home</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<!-- NAVBAR -->

<jsp:include page="/views/layouts/navbar.jsp"/>

<!-- HEADER -->

<jsp:include page="/views/layouts/header.jsp"/>

<!-- HERO BANNER -->

<!-- BANNER -->
<section class="hero-section">

    <div class="hero-overlay">

        <h1>

            WEB TRUYỆN ONLINE

        </h1>

        <p>

            Đọc truyện miễn phí cập nhật nhanh nhất

        </p>

    </div>

</section>

<!-- MAIN -->

<div class="main-container">

    <!-- WELCOME -->

    <h1 class="welcome-title">

        Welcome

        <c:if test="${user != null}">

            ${user.username}

        </c:if>

    </h1>

    <!-- TITLE -->

    <h2 class="section-title">

          Truyện Hot

    </h2>

    <!-- STORY GRID -->

    <div class="story-grid">

        <c:forEach
                var="story"
                items="${storyList}">

            <div class="story-card">

                <!-- IMAGE -->

                <div class="story-image">

                    <img
                            src="${story.coverImage}"
                            alt="story">

                </div>

                <!-- CONTENT -->

                <div class="story-info">

                    <h3>

                        <a href="${pageContext.request.contextPath}/story?id=${story.id}">

                                ${story.title}

                        </a>

                    </h3>

                    <p class="genre">

                            ${story.genre}

                    </p>

                    <p class="chapter">

                        Chapter ${story.chapterCount}

                    </p>

                    <a class="read-btn"
                       href="${pageContext.request.contextPath}/story?id=${story.id}">

                        Đọc ngay

                    </a>

                </div>

            </div>

        </c:forEach>

    </div>

    <!-- LOGOUT -->

    <c:if test="${user != null}">

        <div class="logout-box">

            <a href="${pageContext.request.contextPath}/logout"
               class="logout-btn">

                Đăng xuất

            </a>

        </div>

    </c:if>

</div>

<!-- FOOTER -->

<jsp:include page="/views/layouts/footer.jsp"/>

</body>

</html>