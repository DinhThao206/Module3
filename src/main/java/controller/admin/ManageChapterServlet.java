package controller.admin;

import dao.ChapterDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Chapter;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/chapters")
public class ManageChapterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ChapterDao chapterDao = new ChapterDao();
        List<Chapter> chapterList = chapterDao.getAllChapters();
        req.setAttribute("chapterList", chapterList);
        req.getRequestDispatcher("/views/admin/chapters.jsp").forward(req, resp);
    }
}

