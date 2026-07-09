package dao;

import model.Story;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FavoriteDAO {
    public boolean addFavorite(int userId, int storyId) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO favorites(user_id, story_id) VALUES(?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, storyId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeFavorite(int userId, int storyId) {

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "DELETE FROM favorites WHERE user_id=? AND story_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, storyId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean isFavorite(int userId, int storyId) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM favorites WHERE user_id=? AND story_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, storyId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Story> getFavoritesByUser(int userId) {
        List<Story> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT s.* " + "FROM favorites f " + "JOIN stories s ON f.story_id = s.id " + "WHERE f.user_id=?";
            PreparedStatement ps =                    conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Story story = new Story();
                story.setId(rs.getInt("id"));
                story.setTitle(rs.getString("title"));
                story.setAuthor(rs.getString("author"));
                story.setGenre(rs.getString("genre"));
                story.setDescription(rs.getString("description"));
                story.setCoverImage(rs.getString("cover_image"));
                story.setChapterCount(rs.getInt("chapter_count"));
                list.add(story);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}

