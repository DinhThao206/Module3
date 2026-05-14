<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside class="admin-sidebar">

    <nav>

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="${activePage == 'dashboard' ? 'active' : ''}">

            Dashboard

        </a>

        <a href="${pageContext.request.contextPath}/admin/stories"
           class="${activePage == 'stories' ? 'active' : ''}">

            Quản Lý Truyện

        </a>

        <a href="${pageContext.request.contextPath}/admin/add-story"
           class="${activePage == 'add-story' ? 'active' : ''}">

            Thêm Truyện

        </a>

        <a href="${pageContext.request.contextPath}/admin/upload-chapter"
           class="${activePage == 'upload' ? 'active' : ''}">

            Tải Chương

        </a>

        <a href="${pageContext.request.contextPath}/home">

            Về Trang Chủ

        </a>

        <a href="${pageContext.request.contextPath}/logout"
           class="logout-btn">

            Đăng Xuất

        </a>

    </nav>

</aside>