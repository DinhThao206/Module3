package controller.admin;

import dao.ChapterDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Chapter;

import java.io.IOException;

@WebServlet("/admin/upload-chapter")
public class UploadChapterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/upload-chapter.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int storyId = Integer.parseInt(req.getParameter("storyId"));
            int chapterNumber = Integer.parseInt(req.getParameter("chapterNumber"));
            String chapterTitle = req.getParameter("chapterTitle");
            String content = req.getParameter("content");
            Chapter chapter = new Chapter();
            chapter.setStoryId(storyId);
            chapter.setChapterNumber(chapterNumber);
            chapter.setTitle(chapterTitle);
            chapter.setContent(content);
            ChapterDao chapterDao = new ChapterDao();
            boolean success = chapterDao.addChapter(chapter);
            if (success) {
                req.setAttribute("success", "Tải chương thành công");
                req.getRequestDispatcher("/views/admin/upload-chapter.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "Tải chương thất bại");
                req.getRequestDispatcher("/views/admin/upload-chapter.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("error", "Lỗi: " + e.getMessage());
            e.printStackTrace();
            req.getRequestDispatcher("/views/admin/upload-chapter.jsp").forward(req, resp);
        }
    }
}

