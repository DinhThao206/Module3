package controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = null;
        if (session != null) {
            user = (User) session.getAttribute("user");
        }
        String role = null;
        if (user != null) {
            role = user.getRole();
        }
        if (session != null) {
            session.invalidate();
        }
        request.setAttribute("success", "Đăng xuất thành công!");
        if (role != null && role.equalsIgnoreCase("admin")) {
            request.getRequestDispatcher("/views/auth/logout.jsp"
            ).forward(request, response);
        } else {
            response.sendRedirect(
                    request.getContextPath() + "/home?logout=success"
            );
        }
    }
}