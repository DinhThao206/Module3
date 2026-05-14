# 🎯 DEPLOYMENT CHECKLIST

## Chuẩn Bị Trước Khi Chạy

### 1. Database Setup
- [ ] Cài đặt MySQL hoặc MariaDB
- [ ] Tạo database mới (ví dụ: `truyen_online`)
- [ ] Chạy SQL scripts để tạo bảng:
  ```sql
  -- users, stories, chapters tables
  ```
- [ ] Cập nhật `DBConnection.java` với:
  - `Database URL`
  - `Username`
  - `Password`

### 2. Java Environment
- [ ] Cài đặt Java JDK 17+
- [ ] Cài đặt Gradle
- [ ] Đặt biến môi trường JAVA_HOME

### 3. Tomcat Setup
- [ ] Cài đặt Apache Tomcat 10+
- [ ] Đặt biến môi trường CATALINA_HOME
- [ ] Copy `CATALINA_LIBS` từ folder conf

### 4. Project Build
- [ ] Build project: `gradlew build`
- [ ] Kiểm tra file WAR được tạo: `build/libs/Tomcat-test-1.0-SNAPSHOT.war`

### 5. Deploy
- [ ] Copy file WAR từ build/libs/ vào `CATALINA_HOME/webapps/`
- [ ] Khởi động Tomcat
- [ ] Kiểm tra logs: `CATALINA_HOME/logs/catalina.out`

### 6. Verify
- [ ] Truy cập: `http://localhost:8080/Tomcat-test/`
- [ ] Seeded demo data (optional):
  ```sql
  -- Insert test users
  INSERT INTO users (username, email, password, role) 
  VALUES ('admin', 'admin@test.com', SHA2('admin123', 256), 'admin');
  
  INSERT INTO users (username, email, password, role) 
  VALUES ('user123', 'user@test.com', SHA2('user123', 256), 'user');
  
  -- Insert sample stories
  INSERT INTO stories (title, author, genre, description, cover_image, chapter_count)
  VALUES ('Tây Du Ký', 'Ngô Thừa Ân', 'Phiêu Lưu', 'Truyện kinh điển...', 'story1.jpg', 100);
  ```

---

## File Structure Để Check

```
Tomcat-test/
├── src/main/
│   ├── java/ ✅ (Đầy đủ servlet, DAO, Model, Filter)
│   └── webapp/ ✅ (Đầy đủ JSP, CSS)
├── build.gradle ✅ (Dependencies)
├── README.md ✅ (Documentation)
└── COMPLETION_SUMMARY.md ✅ (Tóm tắt)
```

---

## Troubleshooting

### Build fails: "No tools.jar"
- Đảm bảo JAVA_HOME trỏ đến JDK (không phải JRE)
- `echo %JAVA_HOME%` (kiểm tra)

### Database connection fails
- Kiểm tra MySQL service chạy
- Đúng URL, username, password trong DBConnection.java
- Database & tables tồn tại

### Page not found (404)
- Kiểm tra Context path: `/Tomcat-test`
- Kiểm tra servlet URL mappings
- Check web.xml config

### ClassNotFoundException
- Kiểm tra JSTL libraries trong build.gradle
- Rebuild: `gradlew clean build`

---

## 🔐 Security Notes

### Default Admin Access
```
Email: admin@test.com
Password: admin123 (SHA-256 encrypted)
```

### Đổi Password
- Edit SQL script trước khi insert
- Hoặc thêm feature "Change Password" sau

### HTTPS
- Configure Tomcat SSL/TLS (production)
- Update web.xml với security constraints

---

## 📊 File Count Summary

- **Java Files**: 14+ Servlets/Classes ✅
- **JSP Pages**: 15+ Views ✅
- **CSS Files**: 2 (style.css, admin.css) ✅
- **SQL Tables**: 3 (users, stories, chapters) ✅

---

## ✅ Final Verification Steps

After deployment, verify:

1. **Home Page** - `http://localhost:8080/Tomcat-test/home`
2. **Login** - `http://localhost:8080/Tomcat-test/login`
3. **Register** - `http://localhost:8080/Tomcat-test/register`
4. **Search** - Search bar functional
5. **Admin Panel** - `http://localhost:8080/Tomcat-test/admin` (after login as admin)

---

## 📞 Support Checklist

- [ ] Database properly configured
- [ ] Tomcat running on port 8080
- [ ] Application deployed successfully
- [ ] All pages loading without errors
- [ ] Admin login working
- [ ] User registration working
- [ ] Search functionality working
- [ ] Admin CRUD operations working

**Ready for production after all checks passed!** ✅
