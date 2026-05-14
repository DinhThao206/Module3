<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Xuất - WedTruyen</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@3.19.0/dist/tabler-icons.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #1a1a2e;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: -80px; right: -80px;
            width: 300px; height: 300px;
            background: #e84b80;
            opacity: 0.07;
            border-radius: 50%;
            pointer-events: none;
        }
        body::after {
            content: '';
            position: absolute;
            bottom: -100px; left: -60px;
            width: 340px; height: 340px;
            background: #e84b80;
            opacity: 0.05;
            border-radius: 50%;
            pointer-events: none;
        }

        .page-wrap {
            width: 100%;
            max-width: 420px;
            position: relative;
            z-index: 1;
        }

        /* Brand */
        .brand {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin-bottom: 36px;
        }
        .brand-icon {
            width: 40px; height: 40px;
            background: #ffffff;
            border-radius: 10px;
            display: flex; align-items: center; justify-content: center;
        }
        .brand-icon i { color: #101112; font-size: 20px; }
        .brand-name  { color: #fff; font-size: 17px; font-weight: 600; }
        .brand-sub   { color: rgba(255,255,255,0.32); font-size: 11px; letter-spacing: 0.08em; text-transform: uppercase; }

        /* Card */
        .logout-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 52px 48px;
            text-align: center;
            width: 100%;
        }

        .icon-wrap {
            width: 80px; height: 80px;
            border-radius: 50%;
            background: #ffffff;
            border: 4px solid #000000;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 22px;
        }
        .icon-wrap i { font-size: 50px; color: #000000; }

        .success-tag {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: #f0fdf4;
            border: 0.5px solid #86efac;
            color: #15803d;
            font-size: 11px;
            font-weight: 600;
            padding: 4px 14px;
            border-radius: 20px;
            margin-bottom: 18px;
        }
        .success-tag i { font-size: 13px; }

        .logout-card h1 {
            color: #1a1a1a;
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 10px;
            letter-spacing: -0.01em;
        }
        .logout-card p {
            color: #6b6b6b;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 32px;
        }

        .sep {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 20px;
        }
        .sep-line { flex: 1; height: 0.5px; background: #e8e8e8; }
        .sep-text  { font-size: 11px; color: #bbb; white-space: nowrap; }

        /* Buttons */
        .btn-login,
        .btn-home {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            width: 100%;
            padding: 13px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            transition: opacity 0.15s, transform 0.15s;
            margin-bottom: 10px;
        }
        .btn-login { background: #1a1a2e; color: #ffffff; }
        .btn-home  { background: #e41333; color: #ffffff; margin-bottom: 0; }
        .btn-login:hover,
        .btn-home:hover { opacity: 0.88; transform: translateY(-1px); }
        .btn-login i,
        .btn-home i { font-size: 16px; }

        .footer-note {
            margin-top: 24px;
            font-size: 12px;
            color: #bbb;
        }
        .footer-note span { color: #e30b2c; font-weight: 600; }

        @media (max-width: 480px) {
            .logout-card { padding: 36px 24px; }
        }
    </style>
</head>
<body>

<div class="page-wrap">

    <div class="brand">
        <div class="brand-icon"><i class="ti ti-book-2"></i></div>
        <div>
            <div class="brand-name">WedTruyen</div>
            <div class="brand-sub">Admin Panel</div>
        </div>
    </div>

    <div class="logout-card">

        <div class="icon-wrap">
            <i class="ti ti-logout"></i>
        </div>

        <div class="success-tag">
            <i class="ti ti-circle-check"></i>
            Thành công
        </div>

        <h1>Bạn đã đăng xuất</h1>
        <p>Phiên làm việc của bạn đã kết thúc an toàn.<br>Cảm ơn bạn đã sử dụng WedTruyen!</p>

        <div class="sep">
            <div class="sep-line"></div>
            <span class="sep-text">tiếp tục với</span>
            <div class="sep-line"></div>
        </div>

        <a href="${pageContext.request.contextPath}/login" class="btn-login">
            <i class="ti ti-lock"></i> Đăng nhập lại
        </a>
        <a href="${pageContext.request.contextPath}/home" class="btn-home">
            <i class="ti ti-home"></i> Về trang chủ
        </a>

        <div class="footer-note">
            Phiên kết thúc lúc
         <span>
                <%
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("HH:mm:ss");
                    out.print(sdf.format(new java.util.Date()));
                %>
            </span>
            · Hôm nay
        </div>

    </div>
</div>

</body>
</html>
