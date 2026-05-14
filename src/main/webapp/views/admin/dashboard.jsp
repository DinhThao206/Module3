<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <!-- FONT AWESOME -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <!-- ADMIN CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/admin.css">
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
                <div class="sidebar-logo-text">
                    WEB TRUYỆN
                </div>
                <div class="sidebar-logo-sub">
                    ADMIN PANEL
                </div>
            </div>
        </div>
        <nav class="sidebar-nav">
            <div class="sidebar-nav-label"> MENU</div>
            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="sidebar-nav-item active">
                <i class="fa-solid fa-chart-line nav-icon"></i>
                Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/admin/stories"
               class="sidebar-nav-item">
                <i class="fa-solid fa-book nav-icon"></i>
                Quản lý truyện
            </a>
            <a href="${pageContext.request.contextPath}/admin/upload-chapter"
               class="sidebar-nav-item">
                <i class="fa-solid fa-upload nav-icon"></i> Tải chương
            </a>
        </nav>
        <div class="sidebar-footer">
            <a href="${pageContext.request.contextPath}/logout"
               class="sidebar-user">
                <div class="sidebar-avatar"> AD</div>
                <div>
                    <div class="sidebar-user-name"> Administrator</div>
                    <div class="sidebar-user-role"> Super Admin</div>
                </div>
                <i class="fa-solid fa-right-from-bracket sidebar-logout-icon"></i>
            </a>
        </div>
    </aside>
    <!-- ================= MAIN ================= -->
    <main class="admin-main">
        <!-- TOPBAR -->
        <div class="admin-topbar">
            <div class="topbar-title"> ADMIN DASHBOARD</div>
        </div>
        <!-- CONTENT -->
        <div class="admin-container">
            <h1>Dashboard</h1>
            <p class="welcome-text"> Chào mừng bạn quay trở lại hệ thống quản trị website truyện tranh. </p>
            <!-- STATS -->
            <div class="stats-row">
                <div class="stat-card">
                    <div class="stat-label"> Tổng truyện</div>
                    <div class="stat-value"> 120</div>
                    <div class="stat-sub"> +12 truyện mới</div>
                </div>
                <div class="stat-card">
                    <div class="stat-label"> Tổng chapter</div>
                    <div class="stat-value"> 4.2K</div>
                    <div class="stat-sub"> cập nhật hôm nay</div>
                </div>
                <div class="stat-card">
                    <div class="stat-label"> Người dùng</div>
                    <div class="stat-value"> 890</div>
                    <div class="stat-sub"> đang hoạt động</div>
                </div>
            </div>
            <!-- DASHBOARD MENU -->
            <div class="dashboard-menu">
                <!-- STORY -->
                <a href="${pageContext.request.contextPath}/admin/stories"
                   class="menu-card">
                    <div class="menu-icon">
                        <i class="fa-solid fa-book"></i>
                    </div>
                    <div class="menu-title"> Quản Lý Truyện</div>

                    <div class="menu-desc"> Thêm, sửa, xóa truyện</div>
                </a>
                <!-- UPLOAD -->
                <a href="${pageContext.request.contextPath}/admin/upload-chapter" class="menu-card accent">
                    <div class="menu-icon">
                        <i class="fa-solid fa-upload"></i>
                    </div>
                    <div class="menu-title"> Tải Chương</div>
                    <div class="menu-desc"> Upload chapter mới</div>
                </a>
                <!-- HOME -->
                <a href="${pageContext.request.contextPath}/home" class="menu-card">
                    <div class="menu-icon">
                        <i class="fa-solid fa-house"></i>
                    </div>
                    <div class="menu-title"> Về Trang Chủ</div>
                    <div class="menu-desc"> Quay lại giao diện người dùng</div>
                </a>
                <!-- LOGOUT -->
                <a href="${pageContext.request.contextPath}/logout" class="menu-card">
                    <div class="menu-icon">
                        <i class="fa-solid fa-right-from-bracket"></i>
                    </div>
                    <div class="menu-title"> Đăng Xuất</div>
                    <div class="menu-desc"> Thoát khỏi hệ thống</div>
                </a>
            </div>
        </div>
    </main>
</div>
</body>
</html>

