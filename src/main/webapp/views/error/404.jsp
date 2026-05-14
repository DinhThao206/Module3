i<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>

<head>

    <title>Lỗi 404 - Không Tìm Thấy</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <style>

        .error-container {

            text-align: center;

            margin-top: 100px;

        }

        .error-code {

            font-size: 72px;

            color: #e74c3c;

            font-weight: bold;

        }

        .error-message {

            font-size: 24px;

            color: #333;

            margin: 20px 0;

        }

        .error-description {

            font-size: 16px;

            color: #666;

            margin-bottom: 30px;

        }

        .back-link {

            display: inline-block;

            padding: 12px 24px;

            background: #3498db;

            color: white;

            text-decoration: none;

            border-radius: 8px;

            transition: 0.3s;

        }

        .back-link:hover {

            background: #2980b9;

        }

    </style>

</head>

<body>

<div class="error-container">

    <div class="error-code">404</div>

    <div class="error-message">Không Tìm Thấy</div>

    <div class="error-description">Trang bạn tìm kiếm không tồn tại hoặc đã bị xóa.</div>

    <a href="${pageContext.request.contextPath}/home" class="back-link">Quay Lại Trang Chủ</a>

</div>

</body>

</html>
