<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        ${chapter.title}
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/read.css">
</head>
<body class="read-page">
<!-- NAVBAR -->
<jsp:include page="/views/layouts/navbar.jsp"/>
<!-- HEADER -->
<jsp:include page="/views/layouts/header.jsp"/>
<!-- TOP NAV -->
<div class="chapter-navbar">
    <c:if test="${prevChapter != null}">
        <a class="chapter-btn" href="${pageContext.request.contextPath}/chapter?id=${prevChapter.id}">
            ← Chap trước
        </a>
    </c:if>
    <a class="chapter-list-btn" href="${pageContext.request.contextPath}/story?id=${chapter.storyId}">
        Danh sách chapter
    </a>
    <c:if test="${nextChapter != null}">
        <a class="chapter-btn" href="${pageContext.request.contextPath}/chapter?id=${nextChapter.id}">
            Chap sau →
        </a>
    </c:if>
</div>
<!-- CONTENT -->
<div class="read-wrapper">
    <h1 class="chapter-name">
        ${chapter.title}
    </h1>
    <div class="chapter-images">
        <c:forEach var="image" items="${imageList}">
            <img src="${pageContext.request.contextPath}/${image.imagePath}" alt="chapter-image" loading="lazy">
        </c:forEach>
    </div>
</div>
<!-- BOTTOM NAV -->
<div class="chapter-navbar bottom-nav">
    <c:if test="${prevChapter != null}">
        <a class="chapter-btn" href="${pageContext.request.contextPath}/chapter?id=${prevChapter.id}">
            ← Chap trước
        </a>
    </c:if>
    <a class="chapter-list-btn" href="${pageContext.request.contextPath}/story?id=${chapter.storyId}">
        Danh sách chapter
    </a>
    <c:if test="${nextChapter != null}">
        <a class="chapter-btn" href="${pageContext.request.contextPath}/chapter?id=${nextChapter.id}">
            Chap sau →
        </a>
    </c:if>
</div>
<!-- FOOTER -->
<jsp:include page="/views/layouts/footer.jsp"/>
</body>
</html>

