package controller.admin;

import dao.StoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Story;

import java.io.IOException;

@WebServlet("/admin/add-story")
public class AddStoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/add-story.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String genre = req.getParameter("genre");
        String description = req.getParameter("description");
        String coverImage = req.getParameter("coverImage");
        Story story = new Story();
        story.setTitle(title);
        story.setAuthor(author);
        story.setGenre(genre);
        story.setDescription(description);
        story.setCoverImage(coverImage);
        story.setChapterCount(0);
        StoryDAO storyDAO = new StoryDAO();
        boolean success = storyDAO.addStory(story);
        if (success) {
            resp.sendRedirect(req.getContextPath() + "/admin/stories");
        } else {
            req.setAttribute("error", "Thêm truyện thất bại");
            req.getRequestDispatcher("/views/admin/add-story.jsp").forward(req, resp);
        }
    }
}

