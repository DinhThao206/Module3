<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<%@ page import="model.User" %>

<%
    User user =
            (User) session.getAttribute("user");
%>

<!DOCTYPE html>

<html>

<head>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

    <script>
        // Dropdown menu toggle
        function toggleUserMenu() {
            const dropdown = document.querySelector('.dropdown-menu');
            if (dropdown) {
                dropdown.style.display = dropdown.style.display === 'none' || dropdown.style.display === ''
                    ? 'block'
                    : 'none';
            }
        }

        // Close dropdown when clicking outside
        document.addEventListener('click', function(event) {
            const userMenu = document.querySelector('.user-menu');
            const dropdown = document.querySelector('.dropdown-menu');

            if (userMenu && dropdown && !userMenu.contains(event.target)) {
                dropdown.style.display = 'none';
            }
        });
    </script>

</head>

<body>

<div class="navbar">

    <!-- LOGO -->

    <div class="logo">

        <a href="${pageContext.request.contextPath}/home">

            WEB TRUYỆN

        </a>

    </div>

    <!-- MENU -->

    <div class="menu">

        <a href="${pageContext.request.contextPath}/home">
            Trang Chủ
        </a>

        <a href="#">
            Thể Loại
        </a>

        <a href="#">
            Truyện Hot
        </a>

        <a href="#">
            Lịch Sử
        </a>

        <a href="#">
            Yêu Thích
        </a>

    </div>

    <!-- RIGHT ACTION -->

    <div class="navbar-right">

        <!-- SEARCH -->

        <div class="search-box">

            <form action="${pageContext.request.contextPath}/search"
                  method="get">

                <input type="text"
                       name="keyword"
                       placeholder="Tìm truyện...">

                <button type="submit">

                    <i class="fa-solid fa-magnifying-glass"></i>

                </button>

            </form>

        </div>

        <!-- USER -->

        <div class="user-menu">

            <button class="user-btn" onclick="toggleUserMenu()" type="button">

                <i class="fa-solid fa-user"></i>

            </button>

            <div class="dropdown-menu" style="display: none;">

                <% if(user == null){ %>

                <a href="${pageContext.request.contextPath}/login">

                    <i class="fa-solid fa-right-to-bracket"></i>

                    Đăng nhập

                </a>

                <a href="${pageContext.request.contextPath}/register">

                    <i class="fa-solid fa-user-plus"></i>

                    Đăng ký

                </a>

                <% } else { %>

                <div class="dropdown-user">

                    Xin chào,
                    <strong><%= user.getUsername() %></strong>

                </div>

                <% if("ADMIN".equalsIgnoreCase(user.getRole())){ %>

                <a href="${pageContext.request.contextPath}/admin">

                    <i class="fa-solid fa-gauge"></i>

                    Dashboard

                </a>

                <% } %>

                <a href="${pageContext.request.contextPath}/logout">

                    <i class="fa-solid fa-right-from-bracket"></i>

                    Đăng xuất

                </a>

                <% } %>

            </div>

        </div>

    </div>

</div>

</body>

</html>