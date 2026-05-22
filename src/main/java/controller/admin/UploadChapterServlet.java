package controller.admin;

import dao.ChapterDao;
import dao.ChapterImageDAO;
import dao.StoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Chapter;
import model.ChapterImage;
import model.Story;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

@WebServlet("/admin/upload-chapter")
@MultipartConfig

public class UploadChapterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StoryDAO storyDAO = new StoryDAO();
        List<Story> storyList = storyDAO.getAllStories();
        req.setAttribute("storyList", storyList);
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

            int chapterId = chapterDao.addChapterReturnId(chapter);
            String uploadPath = getServletContext().getRealPath("") + "uploads/chapters/";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            Collection<Part> parts = req.getParts();
            ChapterImageDAO imageDAO = new ChapterImageDAO();
            int imageOrder = 1;
            for (Part part : parts) {
                if (part.getName().equals("images") && part.getSize() > 0) {
                    String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
                    part.write(uploadPath + fileName);
                    ChapterImage image = new ChapterImage();
                    image.setChapterId(chapterId);
                    image.setImagePath("uploads/chapters/" + fileName);
                    image.setImageOrder(String.valueOf(imageOrder++));
                    imageDAO.addImage(image);
                }
            }

            StoryDAO storyDAO = new StoryDAO();
            List<Story> storyList = storyDAO.getAllStories();
            req.setAttribute("storyList", storyList);
            if (chapterId > 0) {
                req.setAttribute("success", "Tải chapter thành công");
            } else {
                req.setAttribute("error", "Tải chapter thất bại");
            }

            req.getRequestDispatcher("/views/admin/upload-chapter.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            StoryDAO storyDAO = new StoryDAO();
            List<Story> storyList = storyDAO.getAllStories();
            req.setAttribute("storyList", storyList);
            req.setAttribute("error", "Lỗi: " + e.getMessage());

            req.getRequestDispatcher("/views/admin/upload-chapter.jsp").forward(req, resp);
        }
    }
}

