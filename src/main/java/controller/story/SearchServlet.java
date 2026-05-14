package controller.story;

import dao.StoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Story;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Story> searchResults = new ArrayList<>();

        if (keyword != null && !keyword.isEmpty()) {
            StoryDAO storyDAO = new StoryDAO();
            searchResults = storyDAO.searchStories(keyword);
            req.setAttribute("keyword", keyword);
        }

        req.setAttribute("searchResults", searchResults);
        req.getRequestDispatcher("/views/user/search.jsp").forward(req, resp);
    }
}
