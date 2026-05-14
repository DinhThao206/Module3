package controller.admin;

import dao.StoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/delete-story")
public class DeleteStoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        StoryDAO storyDAO = new StoryDAO();
        boolean success = storyDAO.deleteStory(id);
        if (success) {
            resp.sendRedirect(req.getContextPath() + "/admin/stories");
        } else {
            req.setAttribute("error", "Xóa truyện thất bại");
            req.getRequestDispatcher("/views/admin/story-manager.jsp").forward(req, resp);
        }
    }
}
