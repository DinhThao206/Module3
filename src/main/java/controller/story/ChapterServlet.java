package controller.story;
import dao.ChapterDao;
import dao.ChapterImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Chapter;
import model.ChapterImage;

import java.io.IOException;
import java.util.List;

@WebServlet("/chapter")
public class ChapterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }
        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        ChapterDao chapterDao = new ChapterDao();
        ChapterImageDAO imageDAO = new ChapterImageDAO();

        Chapter chapter = chapterDao.getChapterById(id);
        if (chapter == null) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }
        Chapter prevChapter = chapterDao.getPreviousChapter(id);
        Chapter nextChapter = chapterDao.getNextChapter(id);
        List<ChapterImage> imageList = imageDAO.getImagesByChapterId(id);
        req.setAttribute("chapter", chapter);
        req.setAttribute("imageList", imageList);
        req.setAttribute("prevChapter", prevChapter);
        req.setAttribute("nextChapter", nextChapter);
        req.getRequestDispatcher("/views/user/read.jsp").forward(req, resp);
    }
}

