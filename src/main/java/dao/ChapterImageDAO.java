package dao;
import model.ChapterImage;
import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ChapterImageDAO {
    public boolean addImage(ChapterImage image) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO chapter_images(chapter_id,image_path,image_order) VALUES(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, image.getChapterId());
            ps.setString(2, image.getImagePath());
            ps.setString(3, image.getImageOrder());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<ChapterImage> getImagesByChapterId(int chapterId) {
        List<ChapterImage> imageList = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM chapter_images " + "WHERE chapter_id=? " + "ORDER BY image_order ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, chapterId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChapterImage image = new ChapterImage();
                image.setId(rs.getInt("id"));
                image.setChapterId(rs.getInt("chapter_id"));
                image.setImagePath(rs.getString("image_path"));
                image.setImageOrder(rs.getString("image_order"));
                imageList.add(image);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imageList;
    }
}

