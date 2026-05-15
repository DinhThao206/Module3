package controller.admin;

import dao.ChapterDao;
import dao.StoryDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Chapter;
import model.Story;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/upload-chapter")
public class UploadChapterServlet extends HttpServlet {

    // ================= GET =================

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp
    ) throws ServletException, IOException {

        StoryDAO storyDAO =
                new StoryDAO();

        List<Story> storyList =
                storyDAO.getAllStories();

        req.setAttribute(
                "storyList",
                storyList
        );

        req.getRequestDispatcher(
                "/views/admin/upload-chapter.jsp"
        ).forward(req, resp);
    }

    // ================= POST =================

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp
    ) throws ServletException, IOException {

        try {

            int storyId =
                    Integer.parseInt(
                            req.getParameter("storyId")
                    );

            int chapterNumber =
                    Integer.parseInt(
                            req.getParameter("chapterNumber")
                    );

            String chapterTitle =
                    req.getParameter("chapterTitle");

            String content =
                    req.getParameter("content");

            // ================= CREATE CHAPTER =================

            Chapter chapter =
                    new Chapter();

            chapter.setStoryId(storyId);

            chapter.setChapterNumber(chapterNumber);

            chapter.setTitle(chapterTitle);

            chapter.setContent(content);

            // ================= SAVE =================

            ChapterDao chapterDao =
                    new ChapterDao();

            boolean success =
                    chapterDao.addChapter(chapter);

            // ================= LOAD STORY LIST AGAIN =================

            StoryDAO storyDAO =
                    new StoryDAO();

            List<Story> storyList =
                    storyDAO.getAllStories();

            req.setAttribute(
                    "storyList",
                    storyList
            );

            // ================= RESULT =================

            if (success) {

                req.setAttribute(
                        "success",
                        "Tải chapter thành công"
                );

            } else {

                req.setAttribute(
                        "error",
                        "Tải chapter thất bại"
                );
            }

            req.getRequestDispatcher(
                    "/views/admin/upload-chapter.jsp"
            ).forward(req, resp);

        } catch (Exception e) {

            e.printStackTrace();

            StoryDAO storyDAO =
                    new StoryDAO();

            List<Story> storyList =
                    storyDAO.getAllStories();

            req.setAttribute(
                    "storyList",
                    storyList
            );

            req.setAttribute(
                    "error",
                    "Lỗi: " + e.getMessage()
            );

            req.getRequestDispatcher(
                    "/views/admin/upload-chapter.jsp"
            ).forward(req, resp);
        }
    }
}
