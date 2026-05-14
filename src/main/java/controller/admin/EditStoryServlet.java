package controller.admin;

import dao.StoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Story;

import java.io.IOException;

@WebServlet("/admin/edit-story")
public class EditStoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        StoryDAO storyDAO = new StoryDAO();
        Story story = storyDAO.getStoryById(id);
        req.setAttribute("story", story);
        req.getRequestDispatcher("/views/admin/edit-story.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String genre = req.getParameter("genre");
        String description = req.getParameter("description");
        String coverImage = req.getParameter("coverImage");
        Story story = new Story();
        story.setId(id);
        story.setTitle(title);
        story.setAuthor(author);
        story.setGenre(genre);
        story.setDescription(description);
        story.setCoverImage(coverImage);
        story.setChapterCount(0);
        StoryDAO storyDAO = new StoryDAO();
        boolean success = storyDAO.updateStory(story);
        if (success) {
            resp.sendRedirect(req.getContextPath() + "/admin/stories");
        } else {
            req.setAttribute("error", "Cập nhật truyện thất bại");
            req.setAttribute("story", story);
            req.getRequestDispatcher("/views/admin/edit-story.jsp").forward(req, resp);
        }
    }
}
