<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Story Manager</title>
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
            <div class="topbar-title">Quản lý truyện</div>
        </div>
        <div class="admin-container">
            <h1 class="page-title">Quản Lý Truyện</h1>
            <p class="welcome-text">Danh sách toàn bộ truyện trong hệ thống.</p>

            <a class="add-btn" href="${pageContext.request.contextPath}/admin/add-story">
                <i class="fa-solid fa-plus"></i> &nbsp;Thêm Truyện
            </a>

            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Ảnh</th>
                    <th>Tên</th>
                    <th>Tác giả</th>
                    <th>Thể loại</th>
                    <th>Chapter</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="story" items="${storyList}">
                    <tr>
                        <td>${story.id}</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/uploads/covers/${story.coverImage}" width="80">
                        </td>
                        <td>${story.title}</td>
                        <td>${story.author}</td>
                        <td>${story.genre}</td>
                        <td>${story.chapterCount}</td>
                        <td>
                            <a class="edit-btn"
                               href="${pageContext.request.contextPath}/admin/edit-story?id=${story.id}">
                                <i class="fa-solid fa-pen"></i> Edit
                            </a>
                            <a class="delete-btn"
                               href="${pageContext.request.contextPath}/admin/delete-story?id=${story.id}"
                               onclick="return confirm('Bạn có chắc muốn xóa truyện này?')">
                                <i class="fa-solid fa-trash"></i> Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </main>

</div>
</body>
</html>