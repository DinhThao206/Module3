package controller.admin;

import dao.StoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Story;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/stories")
public class AdminStoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StoryDAO storyDAO = new StoryDAO();
        List<Story> storyList = storyDAO.getAllStories();
        req.setAttribute("storyList", storyList);
        req.getRequestDispatcher("/views/admin/story-manager.jsp").forward(req, resp);
    }
}

