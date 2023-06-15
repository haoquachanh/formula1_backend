Zimport express, { Request, Response } from 'express';
require('./connect_db')
import mysql from 'mysql2/promise';
import axios from 'axios';
require('dotenv').config()

// Tạo một ứng dụng Express
const app = express();
const Port= process.env.PORT || 5000


// Khai báo các endpoint cho REST API
app.get('/results', async (req: Request, res: Response) => {
  // Lấy thông tin từ trang web formula1.com bằng cách gửi yêu cầu HTTP sử dụng axios
  const response = await axios.get('https://www.formula1.com/results.html');

  // Xử lý dữ liệu từ response và lưu vào cơ sở dữ liệu

  // Trả về kết quả cho người dùng
  res.send('Results API');
});

// Khởi động server
app.listen(Port, () => {
  console.log(`Server is running on port ${Port}`);
});
