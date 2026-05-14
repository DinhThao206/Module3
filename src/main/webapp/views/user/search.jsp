<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

    <title>Tìm Kiếm Truyện</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<%@ include file="/views/layouts/navbar.jsp" %>

<div class="main-container">

    <h1 class="welcome-title">Kết Quả Tìm Kiếm</h1>

    <c:if test="${not empty keyword}">

        <p style="font-size: 1.1rem; color: #666; margin-bottom: 20px;">

            Tìm kiếm cho: <strong>${keyword}</strong>

        </p>

    </c:if>

    <c:choose>

        <c:when test="${empty searchResults}">

            <div style="text-align: center; padding: 40px; background: #f0f0f0; border-radius: 8px;">

                <p style="font-size: 1.2rem; color: #666;">Không tìm thấy kết quả nào</p>

                <p style="color: #999;">Hãy thử lại với từ khóa khác</p>

            </div>

        </c:when>

        <c:otherwise>

            <div class="story-grid">

                <c:forEach var="story" items="${searchResults}">

                    <div class="story-card">

                        <div class="story-image">

                            <img src="${pageContext.request.contextPath}/uploads/covers/${story.coverImage}" alt="${story.title}">

                        </div>

                        <div class="story-info">

                            <h3>

                                <a href="${pageContext.request.contextPath}/story?id=${story.id}">

                                    ${story.title}

                                </a>

                            </h3>

                            <p class="genre">${story.genre}</p>

                            <p class="chapter">Chương: ${story.chapterCount}</p>

                            <p style="color: #666; font-size: 0.95rem; margin-bottom: 15px;">

                                Tác giả: ${story.author}

                            </p>

                            <a href="${pageContext.request.contextPath}/story?id=${story.id}" class="read-btn">

                                Đọc Ngay

                            </a>

                        </div>

                    </div>

                </c:forEach>

            </div>

        </c:otherwise>

    </c:choose>

</div>

<%@ include file="/views/layouts/footer.jsp" %>

</body>

</html>
