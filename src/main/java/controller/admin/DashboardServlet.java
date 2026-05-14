package controller.admin;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/admin")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, jakarta.servlet.ServletException {
        HttpSession session = req.getSession(false);
        System.out.println("SESSION: " + session);
        if (session != null) {
            User user = (User) session.getAttribute("user");
            System.out.println("USER: " + user);
        }
        req.getRequestDispatcher("/views/admin/dashboard.jsp").forward(req, resp);
    }
}