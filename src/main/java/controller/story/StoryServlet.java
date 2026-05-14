package controller.story;

import dao.ChapterDao;
import dao.StoryDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Chapter;
import model.Story;

import java.io.IOException;
import java.util.List;

@WebServlet("/story")
public class StoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, jakarta.servlet.ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        StoryDAO storyDAO = new StoryDAO();
        Story story = storyDAO.getStoryById(id);
        ChapterDao chapterDAO = new ChapterDao();
        List<Chapter> chapterList = chapterDAO.getChaptersByStoryId(id);
        req.setAttribute("story", story);
        req.setAttribute("chapterList", chapterList);
        req.getRequestDispatcher("/views/user/detail.jsp").forward(req, resp);
    }
}