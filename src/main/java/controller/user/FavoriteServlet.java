package controller.user;

import dao.FavoriteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/favorite")
public class FavoriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int storyId = Integer.parseInt(req.getParameter("storyId"));
        String action = req.getParameter("action");
        FavoriteDAO dao = new FavoriteDAO();
        if ("add".equals(action)) {
            dao.addFavorite(user.getId(), storyId);
        } else if ("remove".equals(action)) {
            dao.removeFavorite(user.getId(), storyId);
        }
        resp.sendRedirect(req.getContextPath() + "/story?id=" + storyId);
    }
}