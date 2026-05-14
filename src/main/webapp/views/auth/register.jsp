<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>

<head>

    <title>Đăng Ký</title>

    <style>

        body {

            font-family: Arial, sans-serif;

            background: #f5f5f5;

            text-align: center;

            margin-top: 50px;
        }

        .register-box {

            width: 350px;

            margin: auto;

            background: white;

            padding: 30px;

            border-radius: 12px;

            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {

            margin-bottom: 25px;

            color: #333;
        }

        input {

            width: 100%;

            padding: 12px;

            margin: 10px 0;

            border: 1px solid #ddd;

            border-radius: 8px;

            box-sizing: border-box;

            font-size: 14px;
        }

        input:focus {

            outline: none;

            border-color: #ff3b3b;

            box-shadow: 0 0 5px rgba(255, 59, 59, 0.3);
        }

        button {

            width: 100%;

            padding: 12px;

            background: #ff3b3b;

            color: white;

            border: none;

            border-radius: 8px;

            cursor: pointer;

            font-weight: bold;

            transition: 0.3s;

            font-size: 16px;
        }

        button:hover {

            background: #ff1f1f;

            transform: translateY(-2px);

            box-shadow: 0 4px 12px rgba(255, 59, 59, 0.3);
        }

        .error {

            color: #e74c3c;

            margin-bottom: 15px;

            padding: 10px;

            background: #fadbd8;

            border-radius: 6px;
        }

        .success {

            color: #27ae60;

            margin-bottom: 15px;

            padding: 10px;

            background: #d5f4e6;

            border-radius: 6px;
        }

        .auth-link {

            margin-top: 15px;

            text-align: center;
        }

        .auth-link a {

            color: #3498db;

            text-decoration: none;

            transition: 0.3s;
        }

        .auth-link a:hover {

            color: #2980b9;

            text-decoration: underline;
        }

    </style>

</head>

<body>

<div class="register-box">

    <h1>Đăng Ký</h1>

    <c:if test="${error != null}">

        <p class="error">${error}</p>

    </c:if>

    <c:if test="${success != null}">

        <p class="success">${success}</p>

    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">

        <input type="text" name="username" placeholder="Tên người dùng" required>

        <input type="email" name="email" placeholder="Email" required>

        <input type="password" name="password" placeholder="Mật khẩu" required>

        <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>

        <button type="submit">Đăng Ký</button>

    </form>

    <div class="auth-link">

        Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập ngay</a>

    </div>

</div>

</body>

</html>