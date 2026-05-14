<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<html>

<head>

    <title>Login</title>

    <style>

        body {

            font-family: Arial, sans-serif;

            background: #f5f5f5;

            text-align: center;

            margin-top: 100px;
        }

        .login-box {

            width: 320px;

            margin: auto;

            background: white;

            padding: 30px;

            border-radius: 12px;

            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {

            margin-bottom: 25px;
        }

        input {

            width: 100%;

            padding: 12px;

            margin: 10px 0;

            border: 1px solid #ddd;

            border-radius: 8px;

            box-sizing: border-box;
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
        }

        button:hover {

            background: #ff1f1f;
        }

        .error {

            color: red;

            margin-bottom: 15px;
        }

        .success {

            color: green;

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
        }

        .auth-link a:hover {

            color: #2980b9;

            text-decoration: underline;
        }

    </style>

</head>

<body>

<div class="login-box">

    <h1>Login</h1>

    <c:if test="${error != null}">

        <p class="error">

                ${error}

        </p>

    </c:if>

    <c:if test="${success != null}">

        <p class="success">

                ${success}

        </p>

    </c:if>

    <form action="${pageContext.request.contextPath}/login"
          method="post">

        <input type="email"
               name="email"
               placeholder="Email"
               required>

        <input type="password"
               name="password"
               placeholder="Password"
               required>

        <button type="submit">

            Login

        </button>

    </form>


    <p class="register-link">

        Bạn chưa có tài khoản?

        <a href="${pageContext.request.contextPath}/register">

            Đăng ký tại đây

        </a>

    </p>


</div>

</body>

</html>