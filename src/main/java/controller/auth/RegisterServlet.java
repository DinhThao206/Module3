package controller.auth;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(
            HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        // Validate inputs
        if (username == null || username.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập tên đăng nhập");
            req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
            return;
        }
        if (email == null || email.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập email");
            req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
            return;
        }
        if (password == null || password.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập mật khẩu");
            req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
            return;
        }
        if (!password.equals(confirmPassword)) {
            req.setAttribute("error", "Mật khẩu không trùng khớp");
            req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
            return;
        }
        User user = new User();
        user.setUsername(username.trim());
        user.setEmail(email.trim());
        user.setPassword(password.trim());
        user.setRole("USER");
        UserDAO userDAO = new UserDAO();
        boolean result = userDAO.register(user);
        if (result) {
            req.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập");
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("error", "Đăng ký thất bại! Email này đã được sử dụng");
            req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
        }
    }
}