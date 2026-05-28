<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        ${story.title}
    </title>
    <!-- GLOBAL CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/detail.css">
</head>
<body>
<!-- NAVBAR -->
<jsp:include page="/views/layouts/navbar.jsp"/>
<!-- HEADER -->
<jsp:include page="/views/layouts/header.jsp"/>
<div class="detail-container">
    <div class="story-detail">
        <!-- COVER -->
        <div class="story-cover">
            <img src="${story.coverImage}" alt="${story.title}">
        </div>
        <!-- CONTENT -->
        <div class="story-content">
            <h1>
                ${story.title}
            </h1>
            <p>
                <strong>Author:</strong>
                ${story.author}
            </p>
            <p>
                <strong>Genre:</strong>
                ${story.genre}
            </p>
            <p>
                <strong>Chapter:</strong>
                ${story.chapterCount}
            </p>
            <div class="description">
                ${story.description}
            </div>
        </div>
    </div>
    <h2 class="chapter-title">
        Danh sách chapter
    </h2>
    <div class="chapter-scroll">
        <c:forEach var="chapter" items="${chapterList}">
            <div class="chapter-item">
                <a href="${pageContext.request.contextPath}/chapter?id=${chapter.id}">
                    <div>
                        <strong>
                            Chapter ${chapter.chapterNumber}
                        </strong>
                        -
                            ${chapter.title}
                    </div>
                    <div class="read-btn">
                        Đọc →
                    </div>
                    <a class="favorite-btn"
                       href="${pageContext.request.contextPath}/favorite?action=add&storyId=${story.id}">
                        <i class="fa-regular fa-heart"></i> Yêu thích </a>
                </a>
            </div>
        </c:forEach>
    </div>
</div>
<!-- FOOTER -->
<jsp:include page="/views/layouts/footer.jsp"/>
</body>
</html>

