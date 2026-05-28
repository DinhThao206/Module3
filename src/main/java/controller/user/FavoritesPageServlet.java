package controller.user;

import dao.FavoriteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Story;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/favorites")
public class FavoritesPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        FavoriteDAO dao = new FavoriteDAO();
        List<Story> favoriteList = dao.getFavoritesByUser(user.getId());
        req.setAttribute("favoriteList", favoriteList);
        req.getRequestDispatcher("/views/user/favorites.jsp").forward(req, resp);
    }
}