package controller.story;
import dao.StoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/genres")
public class GenresServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StoryDAO storyDAO = new StoryDAO();
        List<String> genreList = storyDAO.getAllGenres();
        req.setAttribute("genreList", genreList);
        req.getRequestDispatcher("/views/user/genres.jsp").forward(req, resp);
    }
}