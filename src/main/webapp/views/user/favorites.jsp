<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> Truyện Yêu Thích </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/favorites.css">
</head>
<body>

<jsp:include page="/views/layouts/navbar.jsp"/>
<div
        class="favorites-container">
    <h1 class="favorites-title">

        </i> Truyện Yêu Thích </h1>
    <div
            class="favorites-grid">
        <c:forEach var="story" items="${favoriteList}">
            <div
                    class="favorite-card">
                <div class="favorite-image">
                    <img src="${story.coverImage}" alt="story">
                </div>
                <div
                        class="favorite-content">
                    <h2> ${story.title} </h2>
                    <div class="favorite-genre"> Thể loại:
                            ${story.genre}
                    </div>
                    <div
                            class="favorite-chapter">
                        <i class="fa-solid fa-book"></i>
                            ${story.chapterCount} Chapters
                    </div>

                    <div
                            class="favorite-actions">
                        <a href="${pageContext.request.contextPath}/story?id=${story.id}" class="read-btn">
                            Đọc ngay
                        </a>
                        <a href="${pageContext.request.contextPath}/favorite?action=remove&storyId=${story.id}"
                           class="remove-btn">
                            <i class="fa-solid fa-trash"></i>
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="/views/layouts/footer.jsp"/>
</body>
</html>