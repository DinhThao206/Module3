package controller.story;

import dao.StoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Story;

import java.io.IOException;
import java.util.List;

@WebServlet("/genre")
public class GenreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String genre = req.getParameter("name");
        StoryDAO storyDAO = new StoryDAO();
        List<Story> storyList = storyDAO.searchStories(genre);
        req.setAttribute("storyList", storyList);
        req.setAttribute("genre", genre);
        req.getRequestDispatcher("/views/user/genre.jsp").forward(req, resp);
    }
}