package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/login"
            );
            return;
        }
        User user = (User) session.getAttribute("user");
        if (user == null) {

            resp.sendRedirect(req.getContextPath() + "/login"
            );
            return;
        }
        if (!"admin".equalsIgnoreCase(
                user.getRole())) {
            req.getRequestDispatcher("/views/error/403.jsp").forward(req, resp);
            return;
        }
        chain.doFilter(request, response);
    }
}