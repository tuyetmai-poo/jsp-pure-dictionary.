<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    // Khởi tạo Map dữ liệu từ điển bằng JSP Scriptlet
    Map<String, String> dictionary = new HashMap<>();
    dictionary.put("hello", "Xin chào");
    dictionary.put("book", "Quyển sách");
    dictionary.put("computer", "Máy tính");
    dictionary.put("student", "Sinh viên");

    // Lấy từ khóa từ form POST
    String search = request.getParameter("search");
    String result = null;

    if (search != null) {
        String searchKey = search.trim().toLowerCase();
        result = dictionary.get(searchKey);
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tra cứu từ điển</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            color: #f8fafc;
        }

        .card {
            background: rgba(30, 41, 59, 0.7);
            backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 480px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4);
            text-align: center;
        }

        .header h1 {
            font-size: 26px;
            font-weight: 700;
            background: linear-gradient(135deg, #38bdf8, #818cf8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 24px;
        }

        .result-box {
            background: rgba(15, 23, 42, 0.6);
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 28px;
            border: 1px solid rgba(255, 255, 255, 0.08);
        }

        .word-display {
            font-size: 20px;
            color: #94a3b8;
            margin-bottom: 12px;
        }

        .word-display strong {
            color: #38bdf8;
        }

        .meaning-found {
            font-size: 24px;
            font-weight: 600;
            color: #4ade80;
        }

        .meaning-not-found {
            font-size: 18px;
            color: #f87171;
            font-weight: 500;
        }

        .back-btn {
            display: inline-block;
            width: 100%;
            padding: 14px;
            border-radius: 12px;
            background: linear-gradient(135deg, #0284c7 0%, #6366f1 100%);
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(99, 102, 241, 0.4);
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="header">
            <h1>Kết quả tra cứu</h1>
        </div>
        
        <div class="result-box">
            <div class="word-display">
                Từ đã nhập: <strong><%= (search != null ? search : "") %></strong>
            </div>

            <% if (result != null) { %>
                <div class="meaning-found">
                    Nghĩa tiếng Việt: <%= result %>
                </div>
            <% } else { %>
                <div class="meaning-not-found">
                    Không tìm thấy từ này trong từ điển!
                </div>
            <% } %>
        </div>

        <a href="index.jsp" class="back-btn">Tra cứu từ khác</a>
    </div>
</body>
</html>
