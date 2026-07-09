<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title> Lịch sử đọc </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/history.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>
<body>
<jsp:include page="/views/layouts/navbar.jsp"/>
<div
        class="main-container">
    <h1 class="welcome-title"> Lịch sử đọc truyện </h1>
    <div
            class="history-list"><c:forEach var="history" items="${historyList}">
        <div
                class="history-card">
            <div
                    class="history-image">
                <img src="${history.coverImage}" alt="story">
            </div>
            <div
                    class="history-content">
                <h2> ${history.storyTitle} </h2>
                <div class="history-progress">
                    <i class="fa-solid fa-book"></i> Đang đọc: Chapter ${history.chapterNumber} </div>
                <div
                        class="history-date">
                    <i class="fa-regular fa-alarm-clock"></i> Gần nhất: <fmt:formatDate value="${history.readAt}"
                                                                            pattern="dd/MM/yyyy"/>
                </div>
                <a href="${pageContext.request.contextPath}/chapter?id=${history.chapterId}"
                   class="continue-btn"> Đọc tiếp </a>
            </div>
        </div>

    </c:forEach></div>
</div>
<jsp:include page="/views/layouts/footer.jsp"/>
</body>
</html>