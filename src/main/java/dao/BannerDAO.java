package dao;

import model.Banner;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class BannerDAO {
    public Banner getActiveBanner() {
        Banner banner = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM banners WHERE is_active = true LIMIT 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                banner = new Banner();
                banner.setId(rs.getInt("id"));
                banner.setTitle(rs.getString("title"));
                banner.setDescription(rs.getString("description"));
                banner.setImage(rs.getString("image"));
                banner.setButtonText(rs.getString("button_text"));
                banner.setButtonLink(rs.getString("button_link"));
                banner.setActive(rs.getBoolean("is_active"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return banner;
    }

}
