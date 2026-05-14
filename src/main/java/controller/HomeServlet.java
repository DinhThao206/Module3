package controller;

import dao.BannerDAO;
import dao.StoryDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Banner;
import model.Story;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        StoryDAO storyDAO = new StoryDAO();
        List<Story> storyList = storyDAO.getAllStories();
        req.setAttribute("storyList", storyList);
//        // ================= BANNER =================
//        BannerDAO bannerDAO =
//                new BannerDAO();
//        List<Banner> bannerList =
//                bannerDAO.getAllBanners();
//        req.setAttribute(
//                "bannerList",
//                bannerList
//        );
        // ================= FORWARD =================
        req.getRequestDispatcher("/views/user/home.jsp").forward(req, resp);
    }
}