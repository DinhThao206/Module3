-- Update database với hashed password

-- Xóa tất cả user cũ (nếu cần)
DELETE FROM users;

-- Insert user test với mật khẩu được hash (SHA-256)
-- Password: 123456
INSERT INTO users (username, email, password, role) VALUES
('testuser', 'testuser@example.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'user');

-- Password: admin123
INSERT INTO users (username, email, password, role) VALUES
('admin', 'admin@example.com', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'admin');

-- Hướng dẫn đăng nhập:
-- Email: testuser@example.com, Password: 123456 (Role: user)
-- Email: admin@example.com, Password: admin123 (Role: admin)

