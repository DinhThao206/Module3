package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/db-test")
public class DBTestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                System.out.println("Connected");
                resp.getWriter().println("Database Connected");
            } else {
                resp.getWriter().println("Connection Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}