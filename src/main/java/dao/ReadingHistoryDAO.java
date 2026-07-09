package dao;

import model.ReadingHistory;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReadingHistoryDAO {
    public void saveHistory(int userId, int storyId, int chapterId) {
        try {
            Connection conn = DBConnection.getConnection();
            String deleteSql = "DELETE FROM reading_history " + "WHERE user_id=? AND story_id=?";
            PreparedStatement deletePs = conn.prepareStatement(deleteSql);
            deletePs.setInt(1, userId);
            deletePs.setInt(2, storyId);
            deletePs.executeUpdate();
            // Thêm lịch sử mới
            String insertSql = "INSERT INTO reading_history(user_id, story_id, chapter_id) " + "VALUES(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(insertSql);
            ps.setInt(1, userId);
            ps.setInt(2, storyId);
            ps.setInt(3, chapterId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ReadingHistory> getHistoryByUser(int userId) {
        List<ReadingHistory> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT rh.*, "
                    + "s.title AS story_title, "
                    + "s.cover_image, "
                    + "c.chapter_number, "
                    + "c.title AS chapter_title "
                    + "FROM reading_history rh "
                    + "JOIN stories s ON rh.story_id = s.id "
                    + "JOIN chapters c ON rh.chapter_id = c.id "
                    + "WHERE rh.user_id=? "
                    + "ORDER BY rh.read_at DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ReadingHistory history = new ReadingHistory();
                history.setId(rs.getInt("id"));
                history.setUserId(rs.getInt("user_id"));
                history.setStoryId(rs.getInt("story_id"));
                history.setChapterId(rs.getInt("chapter_id"));
                history.setReadAt(rs.getTimestamp("read_at"));
                history.setStoryTitle(rs.getString("story_title"));
                history.setCoverImage(rs.getString("cover_image"));
                history.setChapterNumber(rs.getInt("chapter_number"));
                history.setChapterTitle(rs.getString("chapter_title"));
                list.add(history);
            }
        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }
}

