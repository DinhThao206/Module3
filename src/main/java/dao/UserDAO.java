package dao;

import model.User;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // ================= CHECK EMAIL EXISTS =================

    public boolean isEmailExists(String email) {

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM users " +
                            "WHERE LOWER(email)=LOWER(?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(
                    1,
                    email.trim()
            );

            ResultSet rs =
                    ps.executeQuery();

            return rs.next();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // ================= REGISTER =================

    public boolean register(User user) {

        // Check email exists
        if (isEmailExists(user.getEmail())) {

            return false;
        }

        String sql =
                "INSERT INTO users(username,email,password,role) " +
                        "VALUES(?,?,?,?)";

        try {

            Connection conn =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            // USERNAME
            ps.setString(
                    1,
                    user.getUsername()
            );

            // EMAIL
            ps.setString(
                    2,
                    user.getEmail()
                            .trim()
                            .toLowerCase()
            );

            // PASSWORD THƯỜNG
            ps.setString(
                    3,
                    user.getPassword().trim()
            );

            // ROLE
            String role =
                    (user.getRole() == null
                            || user.getRole().isEmpty())
                            ? "user"
                            : user.getRole()
                              .toLowerCase();

            ps.setString(
                    4,
                    role
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // ================= LOGIN =================

    public User login(
            String email,
            String password
    ) {

        User user = null;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM users " +
                            "WHERE LOWER(email)=LOWER(?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(
                    1,
                    email.trim()
            );

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                String storedPassword =
                        rs.getString("password");

                // SO SÁNH PASSWORD THƯỜNG
                if (password.trim()
                        .equals(storedPassword)) {

                    System.out.println(
                            "LOGIN SUCCESS"
                    );

                    user = new User();

                    user.setId(
                            rs.getInt("id")
                    );

                    user.setUsername(
                            rs.getString("username")
                    );

                    user.setEmail(
                            rs.getString("email")
                    );

                    user.setPassword(
                            rs.getString("password")
                    );

                    user.setRole(
                            rs.getString("role")
                                    .toLowerCase()
                    );

                } else {

                    System.out.println(
                            "LOGIN FAILED: Wrong password"
                    );
                }

            } else {

                System.out.println(
                        "LOGIN FAILED: User not found"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return user;
    }
}