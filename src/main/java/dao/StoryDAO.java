package dao;

import model.Story;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StoryDAO {

    public List<Story> getAllStories() {

        List<Story> storyList = new ArrayList<>();

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM stories";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Story story =
                        new Story();

                story.setId(
                        rs.getInt("id"));

                story.setTitle(
                        rs.getString("title"));

                story.setAuthor(
                        rs.getString("author"));

                story.setGenre(
                        rs.getString("genre"));

                story.setDescription(
                        rs.getString("description"));

                story.setCoverImage(
                        rs.getString("cover_image"));

                story.setChapterCount(
                        rs.getInt("chapter_count"));

                storyList.add(story);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return storyList;
    }


    public Story getStoryById(int id) {

        Story story = null;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM stories WHERE id=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                story = new Story();

                story.setId(
                        rs.getInt("id"));

                story.setTitle(
                        rs.getString("title"));

                story.setAuthor(
                        rs.getString("author"));

                story.setGenre(
                        rs.getString("genre"));

                story.setDescription(
                        rs.getString("description"));

                story.setCoverImage(
                        rs.getString("cover_image"));

                story.setChapterCount(
                        rs.getInt("chapter_count"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return story;
    }





    // ================= ADD STORY =================

    public boolean addStory(Story story) {

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "INSERT INTO stories(title,author,genre,description,cover_image,chapter_count) "
                            + "VALUES(?,?,?,?,?,?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1,
                    story.getTitle());

            ps.setString(2,
                    story.getAuthor());

            ps.setString(3,
                    story.getGenre());

            ps.setString(4,
                    story.getDescription());

            ps.setString(5,
                    story.getCoverImage());

            ps.setInt(6,
                    story.getChapterCount());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }



    // ================= UPDATE STORY =================

    public boolean updateStory(Story story) {

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "UPDATE stories SET "
                            + "title=?, "
                            + "author=?, "
                            + "genre=?, "
                            + "description=?, "
                            + "cover_image=?, "
                            + "chapter_count=? "
                            + "WHERE id=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1,
                    story.getTitle());

            ps.setString(2,
                    story.getAuthor());

            ps.setString(3,
                    story.getGenre());

            ps.setString(4,
                    story.getDescription());

            ps.setString(5,
                    story.getCoverImage());

            ps.setInt(6,
                    story.getChapterCount());

            ps.setInt(7,
                    story.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // ================= DELETE STORY =================

    public boolean deleteStory(int id) {

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "DELETE FROM stories WHERE id=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // ================= SEARCH STORIES =================

    public List<Story> searchStories(String keyword) {

        List<Story> storyList = new ArrayList<>();

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM stories WHERE title LIKE ? OR author LIKE ? OR description LIKE ? OR genre LIKE ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            String searchParam = "%" + keyword + "%";

            ps.setString(1, searchParam);
            ps.setString(2, searchParam);
            ps.setString(3, searchParam);
            ps.setString(4, searchParam);

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

                storyList.add(story);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return storyList;
    }
}
