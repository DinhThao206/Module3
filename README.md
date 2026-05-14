# Website Quản Lý Truyện Online

## 📋 Giới Thiệu
Website quản lý truyện online là một ứng dụng web cho phép người dùng đọc, tìm kiếm truyện và quản trị viên quản lý nội dung.

## 🎯 Tính Năng

### Cho Người Dùng
- ✅ Đăng ký / Đăng nhập
- ✅ Xem trang chủ với danh sách truyện
- ✅ Xem chi tiết truyện
- ✅ Đọc chương truyện
- ✅ Tìm kiếm truyện (theo tên, tác giả, thể loại)
- ✅ Xem lịch sử chương đã đọc (chuyển trang)
- ✅ Đăng xuất

### Cho Quản Trị Viên
- ✅ Dashboard admin
- ✅ Quản lý truyện (xem, thêm, sửa, xóa)
- ✅ Tải lên chương truyện mới
- ✅ Quản lý người dùng (cơ bản)

## 🗂️ Cấu Trúc Thư Mục

```
src/main/
├── java/
│   ├── controller/
│   │   ├── HomeServlet.java
│   │   ├── auth/
│   │   │   ├── LoginServlet.java
│   │   │   ├── RegisterServlet.java
│   │   │   └── LogoutServlet.java
│   │   ├── story/
│   │   │   ├── StoryServlet.java
│   │   │   ├── ChapterServlet.java
│   │   │   └── SearchServlet.java
│   │   └── admin/
│   │       ├── DashboardServlet.java
│   │       ├── AdminStoryServlet.java (Xem danh sách truyện)
│   │       ├── AddStoryServlet.java (Thêm truyện mới)
│   │       ├── EditStoryServlet.java (Sửa truyện)
│   │       ├── DeleteStoryServlet.java (Xóa truyện)
│   │       └── UploadChapterServlet.java (Tải chương)
│   ├── dao/
│   │   ├── UserDAO.java
│   │   ├── StoryDAO.java
│   │   └── ChapterDao.java
│   ├── model/
│   │   ├── User.java
│   │   ├── Story.java
│   │   └── Chapter.java
│   ├── filter/
│   │   ├── AuthFilter.java (Kiểm tra đăng nhập)
│   │   └── AdminFilter.java (Kiểm tra quyền admin)
│   └── util/
│       ├── DBConnection.java
│       ├── PasswordUtil.java (Mã hóa mật khẩu)
│       └── SessionUtil.java (Quản lý session)
│
└── webapp/
    ├── assets/
    │   ├── css/
    │   │   ├── style.css
    │   │   └── admin.css
    │   ├── js/
    │   └── images/
    ├── views/
    │   ├── auth/
    │   │   ├── login.jsp
    │   │   ├── register.jsp
    │   │   └── logout.jsp
    │   ├── admin/
    │   │   ├── dashboard.jsp
    │   │   ├── story-manager.jsp
    │   │   ├── add-story.jsp
    │   │   ├── edit-story.jsp
    │   │   └── upload-chapter.jsp
    │   ├── user/
    │   │   ├── home.jsp
    │   │   ├── detail.jsp
    │   │   ├── read.jsp
    │   │   └── search.jsp
    │   ├── layouts/
    │   │   ├── navbar.jsp
    │   │   ├── footer.jsp
    │   │   ├── header.jsp
    │   │   └── admin-sidebar.jsp
    │   └── error/
    │       ├── 403.jsp
    │       ├── 404.jsp
    │       └── 500.jsp
    └── WEB-INF/
        └── web.xml
```

## 🔐 Xác Thực & Phân Quyền

### Bảo Mật
- **Mật khẩu**: Được mã hóa SHA-256
- **Session**: Quản lý bằng HttpSession
- **Filter**: 
  - AuthFilter: Kiểm tra đăng nhập cho các chức năng yêu cầu
  - AdminFilter: Kiểm tra quyền admin cho các trang quản trị

### Phân Quyền
- **User**: Có thể đọc truyện, tìm kiếm
- **Admin**: Có thể quản lý truyện, upload chương

## 📝 Các Endpoint Chính

### Xác Thực
- `GET/POST /login` - Trang đăng nhập
- `GET/POST /register` - Trang đăng ký
- `GET /logout` - Đăng xuất

### Người Dùng
- `GET /home` - Trang chủ
- `GET /story?id={id}` - Chi tiết truyện
- `GET /chapter?id={id}` - Đọc chương
- `GET /search` - Tìm kiếm

### Quản Trị Viên
- `GET /admin` - Dashboard
- `GET /admin/stories` - Quản lý truyện
- `GET/POST /admin/add-story` - Thêm truyện
- `GET/POST /admin/edit-story?id={id}` - Sửa truyện
- `GET /admin/delete-story?id={id}` - Xóa truyện
- `GET/POST /admin/upload-chapter` - Tải chương

## 🎨 Tính Năng Giao Diện

### Frontend
- **Responsive Design**: Hỗ trợ desktop, tablet, mobile
- **Gradient Colors**: Sử dụng gradient chuyên nghiệp
- **Smooth Animations**: Hiệu ứng hover và transition
- **Card Layout**: Hiển thị truyện dạng card
- **Search Bar**: Tìm kiếm nhanh trong navbar

### Admin Panel
- **Modern Design**: Giao diện hiện đại với gradient
- **Dashboard Menu**: Thực đơn chính với icon
- **CRUD Operations**: Quản lý truyện dễ dàng
- **Form Validation**: Kiểm tra dữ liệu đầu vào
- **Message Alerts**: Thông báo lỗi/thành công

## 🗄️ Database Schema (Prequisite)

### Bảng Users
```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Bảng Stories
```sql
CREATE TABLE stories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    description TEXT,
    cover_image VARCHAR(255),
    chapter_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Bảng Chapters
```sql
CREATE TABLE chapters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    story_id INT NOT NULL,
    chapter_number INT,
    title VARCHAR(255),
    content LONGTEXT,
    folder_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (story_id) REFERENCES stories(id) ON DELETE CASCADE
);
```

## 🚀 Cài Đặt & Chạy

### Yêu Cầu
- Java JDK 17+
- Gradle
- MySQL/MariaDB
- Tomcat Server

### Các Bước
1. Clone repository
2. Cấu hình database trong `DBConnection.java`
3. Chạy script SQL để tạo bảng
4. Build: `gradlew build`
5. Deploy file WAR lên Tomcat
6. Truy cập: `http://localhost:8080/Tomcat-test`

## 📚 Công Nghệ Sử Dụng
- **Backend**: Java Servlet, JSP
- **Database**: MySQL/MariaDB
- **Frontend**: HTML, CSS, JavaScript
- **Build Tool**: Gradle
- **Server**: Apache Tomcat

## ✨ Tính Năng Mở Rộng (Future)
- Hệ thống xếp hạng truyện
- Bình luận và đánh giá
- Trang yêu thích
- Lịch sử đọc
- Thông báo mới
- Tích hợp thanh toán
- API RESTful
- Mobile App

## 📞 Hỗ Trợ
Liên hệ admin để báo cáo lỗi hoặc yêu cầu tính năng mới.
