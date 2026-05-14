package dao;
import model.Chapter;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class ChapterDao {
    public List<Chapter> getChaptersByStoryId(int storyId) {
        List<Chapter> chapterList = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM chapters WHERE story_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, storyId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setId(rs.getInt("id"));
                chapter.setStoryId(rs.getInt("story_id"));
                chapter.setChapterNumber(rs.getInt("chapter_number"));
                chapter.setTitle(rs.getString("title"));
                chapter.setContent(rs.getString("content"));
                chapterList.add(chapter);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chapterList;
    }
    public Chapter getChapterById(int id) {
        Chapter chapter = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM chapters WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                chapter = new Chapter();
                chapter.setId(rs.getInt("id"));
                chapter.setTitle(rs.getString("title"));
                chapter.setFolderName(rs.getString("folder_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chapter;
    }
    //    lùi trang
    public Chapter getPreviousChapter(int currentId) {
        Chapter chapter = null;
        try {
            Connection conn = DBConnection.getConnection();
            // Lấy story_id của chapter hiện tại
            String getStoryIdSql = "SELECT story_id FROM chapters WHERE id=?";
            PreparedStatement getStoryIdPs = conn.prepareStatement(getStoryIdSql);
            getStoryIdPs.setInt(1, currentId);
            ResultSet storyIdRs = getStoryIdPs.executeQuery();
            if (storyIdRs.next()) {
                int storyId = storyIdRs.getInt("story_id");
                String sql = "SELECT * FROM chapters " + "WHERE story_id = ? AND id < ? " + "ORDER BY id DESC LIMIT 1";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, storyId);
                ps.setInt(2, currentId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    chapter = new Chapter();
                    chapter.setId(rs.getInt("id"));
                    chapter.setTitle(rs.getString("title"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chapter;
    }
    //sang trang
    public Chapter getNextChapter(int currentId) {
        Chapter chapter = null;
        try {
            Connection conn = DBConnection.getConnection();
            // Lấy story_id của chapter hiện tại
            String getStoryIdSql = "SELECT story_id FROM chapters WHERE id=?";
            PreparedStatement getStoryIdPs = conn.prepareStatement(getStoryIdSql);
            getStoryIdPs.setInt(1, currentId);
            ResultSet storyIdRs = getStoryIdPs.executeQuery();
            if (storyIdRs.next()) {
                int storyId = storyIdRs.getInt("story_id");
                String sql = "SELECT * FROM chapters " + "WHERE story_id = ? AND id > ? " + "ORDER BY id ASC LIMIT 1";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, storyId);
                ps.setInt(2, currentId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    chapter = new Chapter();
                    chapter.setId(rs.getInt("id"));
                    chapter.setTitle(rs.getString("title"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chapter;
    }
        public boolean addChapter(Chapter chapter) {
        try {
            Connection conn = DBConnection.getConnection();
           String sql = "INSERT INTO chapters(story_id, chapter_number, title, content) VALUES(?, ?, ?, ?)";
           PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, chapter.getStoryId());
            ps.setInt(2, chapter.getChapterNumber());
            ps.setString(3, chapter.getTitle());
            ps.setString(4, chapter.getContent());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean updateChapter(Chapter chapter) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "UPDATE chapters SET title=?, content=?, chapter_number=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, chapter.getTitle());
            ps.setString(2, chapter.getContent());
            ps.setInt(3, chapter.getChapterNumber());
            ps.setInt(4, chapter.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean deleteChapter(int id) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "DELETE FROM chapters WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}