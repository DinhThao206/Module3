package controller.story;

import dao.ChapterDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Chapter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
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
            resp.sendRedirect(req.getContextPath() + "/home"
            );
            return;
        }
        ChapterDao dao = new ChapterDao();
        Chapter chapter = dao.getChapterById(id);
        if (chapter == null) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }
        Chapter prevChapter = dao.getPreviousChapter(id);
        Chapter nextChapter = dao.getNextChapter(id);
        String folderPath = getServletContext().getRealPath("/uploads/chapters/" + chapter.getFolderName()
        );
        File folder = new File(folderPath);
        List<String> imageList = new ArrayList<>();
        if (folder.exists() && folder.isDirectory()) {
            File[] files = folder.listFiles();
            if (files != null && files.length > 0) {
                Arrays.sort(files, Comparator.comparing(File::getName));
                for (File file : files) {
                    if (file.isFile()) {
                        String imagePath = req.getContextPath() + "/uploads/chapters/" + chapter.getFolderName() + "/" + file.getName();
                        imageList.add(imagePath);
                    }
                }
            }
        }
        req.setAttribute("chapter", chapter);
        req.setAttribute("imageList", imageList);
        req.setAttribute("prevChapter", prevChapter);
        req.setAttribute("nextChapter", nextChapter);
        req.getRequestDispatcher("/views/user/read.jsp").forward(req, resp);
    }
}