Hướng dẫn cài đặt, chạy dự án:
    Lưu ý:
    * Dự án được thực hiện trên phiên bản: Node 16.16.0 Nếu gặp vấn đề liên quan đến thư viện bạn có thể thử đổi phiên bản thành 16.16.0. 
    * Các phần mềm yêu cầu để thực hiện HOÀN TOÀN theo hướng dẫn bên dưới: XAMPP, GitBash
    * Dự án sẽ chạy trên http://localhost:3001/ nên hãy tắt các ứng dụng gây xung đột PORT=3001 hoặc tự chỉnh sang PORT khác trong .env
Mở Terminal / Command Prompt ở thư mục chứa dự án và chạy lệnh: 
    1. chạy: git clone https://github.com/haoquachanh/formula1_backend
    2. chạy: npm install 
    3. Khởi tạo database:
        Chạy Apache và MySQL trong XAMPP.
        Đến đường dẫn http://localhost/phpmyadmin/ và tạo một bảng mới với tên "formula1"
        tiếp tục chạy trên termial:
            1. cd src
            2. npx sequelize-cli db:migrate
    4. chạy: npm start
* Nếu bạn không sử dụng XAMPP: Thiết lập các cấu hình database tương ứng và tạo sẵn một bảng rỗng với tên "formula1" hoặc chỉnh sửa cả tên bảng trong .env


Phần crawling data sử dụng JavaScript: 
    sau khi đã cài thư viện xong (chạy lệnh 2. npm install) bạn có thể test phần crawler theo các bước:
        1. cd crawler
        2. node <tên_file.js>
            // tên file thuộc [driver.js, result.js, schedule.js, team.js]
    sau khi dòng thông báo: "Đã ghi kết quả vào tệp JSON." nghĩa là kết quả đã được update vào các file.json tương ứng.
    Các file crawler/*.json sau khi clone về từ github là các file đã được chạy ở local từ thời điểm 14/06/2023.
    * Nếu bạn gặp phải lỗi: Error read ECONNRESET hãy cố gắng thử lại thêm 1-2 lần nữa. Đây là lỗi kết nối - có thể do mạng
    
