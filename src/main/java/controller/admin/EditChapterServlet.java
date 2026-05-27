package controller.admin;

import dao.ChapterDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Chapter;

import java.io.IOException;

@WebServlet("/admin/edit-chapter")
public class EditChapterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ChapterDao dao = new ChapterDao();
        Chapter chapter = dao.getChapterById(id);
        req.setAttribute("chapter", chapter);
        req.getRequestDispatcher("/views/admin/edit-chapter.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int chapterNumber = Integer.parseInt(req.getParameter("chapterNumber"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        Chapter chapter = new Chapter();
        chapter.setId(id);
        chapter.setChapterNumber(chapterNumber);
        chapter.setTitle(title);
        chapter.setContent(content);
        ChapterDao dao = new ChapterDao();
        dao.updateChapter(chapter);
        resp.sendRedirect(req.getContextPath() + "/admin/chapters");
    }
}

