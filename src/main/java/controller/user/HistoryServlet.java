package controller.user;

import dao.ReadingHistoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ReadingHistory;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        ReadingHistoryDAO dao = new ReadingHistoryDAO();
        List<ReadingHistory> historyList = dao.getHistoryByUser(user.getId());
        req.setAttribute("historyList", historyList);
        req.getRequestDispatcher("/views/user/history.jsp").forward(req, resp);
    }
}

