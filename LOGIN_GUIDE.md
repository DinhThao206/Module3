# Hướng dẫn sửa lỗi đăng nhập

## Vấn đề
Mật khẩu được lưu trong database dưới dạng plain text, nhưng code mới sử dụng SHA-256 hash để xác minh.

## Giải pháp

### Cách 1: Sử dụng SQL Script (Khuyến khích)
1. Mở MySQL client hoặc phpMyAdmin
2. Chạy lệnh trong file `insert_test_users.sql`:

```sql
DELETE FROM users;

INSERT INTO users (username, email, password, role) VALUES 
('testuser', 'testuser@example.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'user'),
('admin', 'admin@example.com', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'admin');
```

### Cách 2: Sử dụng Java Servlet (Tự động)
1. Truy cập: `http://localhost:8080/Tomcat-test/test/create-user`
2. Servlet sẽ tự động tạo user test với mật khẩu hash

## Thông tin đăng nhập test

### User thường
- **Email**: testuser@example.com
- **Password**: 123456
- **Role**: user

### Admin
- **Email**: admin@example.com
- **Password**: admin123
- **Role**: admin

## Mở rộng - Tạo user mới

Khi người dùng đăng ký tài khoản qua `/register`, mật khẩu sẽ được hash tự động trước khi lưu.

## Cải thiện Navbar

✅ **Dropdown menu hiện đã được tích hợp:**
- Click vào icon user để mở/đóng menu
- Menu tự động đóng khi click ngoài
- Smooth animation khi hiển thị
- Icons Font Awesome đi kèm
- Responsive trên mobile

### CSS Thêm
- Animation slideDown cho dropdown
- Padding tăng khi hover
- Background color cho phần user info

