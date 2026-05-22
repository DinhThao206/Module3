<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách thể loại</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body> <!-- NAVBAR -->
<jsp:include page="/views/layouts/navbar.jsp"/> <!-- MAIN -->
<div class="main-container">
    <h1 class="section-title"> Danh Sách Thể Loại </h1>
    <div class="genre-grid">
        <c:forEach var="genre" items="${genreList}">
            <a class="genre-card" href="${pageContext.request.contextPath}/genre?name=${genre}"> ${genre} </a> </c:forEach>
    </div>
</div> <!-- FOOTER -->
<jsp:include page="/views/layouts/footer.jsp"/>
</body>
</html>