<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tải Chương Truyện</title>
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
            <a href="${pageContext.request.contextPath}/admin/stories" class="sidebar-nav-item">
                <i class="fa-solid fa-book nav-icon"></i> Quản lý truyện
            </a>
            <a href="${pageContext.request.contextPath}/admin/upload-chapter" class="sidebar-nav-item active">
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
            <div class="topbar-title">Tải chương truyện</div>
        </div>
        <div class="admin-container">
            <h1 class="page-title">Tải Chương Truyện</h1>
            <p class="welcome-text">Điền đầy đủ thông tin để tải chương mới lên hệ thống.</p>

            <c:if test="${not empty error}">
                <div class="error-message">
                    <i class="fa-solid fa-circle-exclamation"></i> ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/admin/upload-chapter"
                  method="post" enctype="multipart/form-data" class="admin-form">

                <div class="form-group">

                    <label for="storyId"> Chọn Truyện </label>

                    <select id="storyId" name="storyId" required>

                        <option value=""> -- Chọn truyện --</option>

                        <c:forEach var="story" items="${storyList}">
                            <option value="${story.id}">

                                    ${story.title}

                            </option>

                        </c:forEach>

                    </select>

                </div>


                <div class="form-group">
                    <label for="chapterNumber">Số Chương</label>
                    <input type="number" id="chapterNumber" name="chapterNumber" required placeholder="Nhập số chương">
                </div>
                <div class="form-group">
                    <label for="chapterTitle">Tên Chương</label>
                    <input type="text" id="chapterTitle" name="chapterTitle" required placeholder="Nhập tên chương">
                </div>
                <div class="form-group">
                    <label for="content">Nội Dung</label>
                    <textarea id="content" name="content" rows="10" required
                              placeholder="Nhập nội dung chương..."></textarea>
                </div>
                <div class="form-group">
                    <label for="images">Hình Ảnh (có thể chọn nhiều)</label>
                    <input type="file" id="images" name="images" multiple accept="image/*">
                </div>
                <div class="form-actions">
                    <button type="submit" class="add-btn">
                        <i class="fa-solid fa-upload"></i> &nbsp;Tải Lên
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