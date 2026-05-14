<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Truyện</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="admin-wrapper">

    <!-- ================= SIDEBAR ================= -->
    <aside class="admin-sidebar">
        <div class="sidebar-logo">
            <div class="sidebar-logo-icon">
                <i class="fa-solid fa-book-open"></i>
            </div>
            <div>
                <div class="sidebar-logo-text">Manga Admin</div>
                <div class="sidebar-logo-sub">CONTROL PANEL</div>
            </div>
        </div>
        <nav class="sidebar-nav">
            <div class="sidebar-nav-label">Main Menu</div>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-nav-item">
                <i class="fa-solid fa-chart-line nav-icon"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/admin/stories" class="sidebar-nav-item active">
                <i class="fa-solid fa-book nav-icon"></i> Quản lý truyện
            </a>
            <a href="${pageContext.request.contextPath}/admin/upload-chapter" class="sidebar-nav-item">
                <i class="fa-solid fa-upload nav-icon"></i> Tải chương
            </a>
            <a href="${pageContext.request.contextPath}/home" class="sidebar-nav-item">
                <i class="fa-solid fa-house nav-icon"></i> Về trang chủ
            </a>
        </nav>
        <div class="sidebar-footer">
            <a href="${pageContext.request.contextPath}/logout" class="sidebar-user">
                <div class="sidebar-avatar">A</div>
                <div>
                    <div class="sidebar-user-name">Admin</div>
                    <div class="sidebar-user-role">System Manager</div>
                </div>
            </a>
        </div>
    </aside>

    <!-- ================= MAIN CONTENT ================= -->
    <main class="admin-main">
        <div class="admin-topbar">
            <div class="topbar-title">Chỉnh sửa truyện</div>
        </div>
        <div class="admin-container">
            <h1 class="page-title">Chỉnh Sửa Truyện</h1>
            <p class="welcome-text">Cập nhật thông tin truyện trong hệ thống.</p>

            <c:if test="${not empty error}">
                <div class="error-message">
                    <i class="fa-solid fa-circle-exclamation"></i> ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/admin/edit-story" method="post" class="admin-form">
                <input type="hidden" name="id" value="${story.id}">
                <div class="form-group">
                    <label for="title">Tên truyện</label>
                    <input type="text" id="title" name="title" value="${story.title}" required>
                </div>
                <div class="form-group">
                    <label for="author">Tác giả</label>
                    <input type="text" id="author" name="author" value="${story.author}" required>
                </div>
                <div class="form-group">
                    <label for="genre">Thể loại</label>
                    <input type="text" id="genre" name="genre" value="${story.genre}" required>
                </div>
                <div class="form-group">
                    <label for="description">Mô tả truyện</label>
                    <textarea id="description" name="description" rows="5" required>${story.description}</textarea>
                </div>
                <div class="form-group">
                    <label for="coverImage">Ảnh bìa (URL)</label>
                    <input type="text" id="coverImage" name="coverImage" value="${story.coverImage}" required>
                </div>
                <div class="form-actions">
                    <button type="submit" class="edit-btn">
                        <i class="fa-solid fa-floppy-disk"></i> &nbsp;Cập Nhật
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/stories" class="delete-btn">
                        <i class="fa-solid fa-arrow-left"></i> &nbsp;Quay lại
                    </a>
                </div>
            </form>
        </div>
    </main>

</div>
</body>
</html>