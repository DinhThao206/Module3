<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>
        Edit Chapter
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="admin-container">
    <h1>
        Edit Chapter
    </h1>
    <form action="${pageContext.request.contextPath}/admin/edit-chapter" method="post">
        <input type="hidden" name="id" value="${chapter.id}">
        <div class="form-group">
            <label>
                Chapter Number
            </label>
            <input type="number" name="chapterNumber" value="${chapter.chapterNumber}">
        </div>
        <div class="form-group">
            <label>
                Title
            </label>
            <input type="text" name="title" value="${chapter.title}">
        </div>
        <div class="form-group">
            <label>
                Content
            </label>
            <textarea name="content" rows="10">${chapter.content}</textarea>
        </div>
        <button type="submit" class="add-btn">
            Save
        </button>
    </form>
</div>
</body>
</html>

