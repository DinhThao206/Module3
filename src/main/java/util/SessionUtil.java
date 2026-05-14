package util;

import jakarta.servlet.http.HttpSession;
import model.User;

public class SessionUtil {

    private static final String USER_SESSION_KEY = "user";
    private static final String ADMIN_SESSION_KEY = "isAdmin";

    /**
     * Set user in session
     */
    public static void setUserSession(HttpSession session, User user) {
        session.setAttribute(USER_SESSION_KEY, user);
    }

    /**
     * Get user from session
     */
    public static User getUserSession(HttpSession session) {
        return (User) session.getAttribute(USER_SESSION_KEY);
    }

    /**
     * Check if user is logged in
     */
    public static boolean isUserLoggedIn(HttpSession session) {
        return getUserSession(session) != null;
    }

    /**
     * Set admin status in session
     */
    public static void setAdminSession(HttpSession session, boolean isAdmin) {
        session.setAttribute(ADMIN_SESSION_KEY, isAdmin);
    }

    /**
     * Check if user is admin
     */
    public static boolean isAdmin(HttpSession session) {
        Boolean isAdmin = (Boolean) session.getAttribute(ADMIN_SESSION_KEY);
        return isAdmin != null && isAdmin;
    }

    /**
     * Remove user session (logout)
     */
    public static void removeUserSession(HttpSession session) {
        session.invalidate();
    }
}
