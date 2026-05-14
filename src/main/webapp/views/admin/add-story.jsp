<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title> Thêm Truyện Mới </title>
    <!-- GOOGLE FONT -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- FONT AWESOME -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="admin-wrapper">
    <!-- ================= SIDEBAR ================= -->
    <aside class="admin-sidebar">
        <!-- LOGO -->
        <div class="sidebar-logo">
            <div class="sidebar-logo-icon">
                <i class="fa-solid fa-book-open"></i>
            </div>
            <div>
                <div class="sidebar-logo-text"> Manga Admin</div>
                <div class="sidebar-logo-sub"> CONTROL PANEL</div>
            </div>
        </div>
        <!-- NAVIGATION -->
        <nav class="sidebar-nav">
            <div class="sidebar-nav-label"> Main Menu</div>
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
                <i class="fa-solid fa-house nav-icon"></i> Về trang chủ </a>
        </nav>
        <!-- FOOTER -->
        <div class="sidebar-footer">
            <a href="${pageContext.request.contextPath}/logout" class="sidebar-user">
                <div class="sidebar-avatar"> A</div>
                <div>
                    <div class="sidebar-user-name"> Admin</div>
                    <div class="sidebar-user-role"> System Manager</div>
                </div>
            </a>
        </div>
    </aside>
    <!-- ================= MAIN CONTENT ================= -->
    <main class="admin-main">
        <!-- TOPBAR -->
        <div class="admin-topbar">
            <div class="topbar-title"> Thêm truyện mới</div>
        </div>
        <!-- PAGE -->
        <div class="admin-container">
            <h1 class="page-title"> Thêm Truyện Mới </h1>
            <p class="welcome-text"> Điền đầy đủ thông tin để thêm truyện mới vào hệ thống. </p>
            <!-- ERROR MESSAGE -->
            <c:if test="${not empty error}">
                <div class="error-message">
                    <i class="fa-solid fa-circle-exclamation"></i> ${error}
                </div>
            </c:if>
            <!-- FORM -->
            <form action="${pageContext.request.contextPath}/admin/add-story" method="post"
                  enctype="multipart/form-data" class="admin-form">
                <!-- STORY TITLE -->
                <div class="form-group">
                    <label for="title"> Tên truyện </label>
                    <input type="text" id="title" name="title" required placeholder="">
                </div>
                <!-- AUTHOR -->
                <div class="form-group">
                    <label for="author"> Tác giả </label>
                    <input type="text" id="author" name="author" required placeholder="">
                </div>
                <!-- GENRE -->
                <div class="form-group">
                    <label for="genre">
                        Thể loại
                    </label>
                    <input type="text" id="genre" name="genre" required placeholder="">
                </div>
                <!-- DESCRIPTION -->
                <div class="form-group">

                    <label for="description"> Mô tả truyện </label>
                    <textarea id="description" name="description" required
                              placeholder="Nhập nội dung mô tả truyện..."></textarea>
                </div>
                <div class="form-group">

                    <label for="coverImage">
                        Ảnh bìa (URL)
                    </label>
                    <input type="text" id="coverImage" name="coverImage" required
                           placeholder="https://example.com/image.jpg">
                </div>
                <!-- ACTIONS -->
                <div class="form-actions">
                    <button type="submit" class="add-btn">
                        <i class="fa-solid fa-plus"></i> &nbsp;
                        Thêm Truyện
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/stories" class="delete-btn">
                        <i class="fa-solid fa-arrow-left"></i>
                        &nbsp;
                        Quay lại
                    </a>
                </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>