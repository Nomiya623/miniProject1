<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 추가</title>
    <style>
        :root {
            --main-color: #6B8E23; /* Olive Green */
            --body-bg: #FAF9F6; /* Off White */
            --second-bg: #FFF; /* White for a clean look */
            --card-bg: #EFEDEA; /* A softer, lighter shade for card backgrounds */
            --text-color: #3C3C3B; /* Almost Black */
            --text-white: #ffffff; /* White */
            --text-gray: #A9A9A9; /* Gray */
            --main-hover: #556B2F; /* Dark Olive Green */
            --border-color: #DDD; /* Light border for subtle definition */
        }

        body {
            background-color: var(--body-bg);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background-color: var(--second-bg);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: var(--main-color);
            margin-bottom: 20px;
        }

        form {
            background: var(--card-bg);
            padding: 15px;
            border-radius: 5px;
            border: 1px solid var(--border-color);
        }

        label {
            font-weight: bold;
            color: var(--text-color);
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid var(--border-color);
            box-sizing: border-box; /* Ensures the padding does not affect the total width */
        }

        input[type="submit"] {
            background-color: var(--main-color);
            color: var(--text-white);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: var(--main-hover);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>제품 추가</h1>
        <form action="products_add_process.jsp" method="post">
            <label for="productType">제품명:</label>
            <input type="text" id="productType" name="productType" required><br><br>
            <label for="features">상세 설명:</label>
            <textarea id="features" name="features" required></textarea><br><br>
            <label for="price">가격:</label>
            <input type="number" id="price" name="price" step="0.01" required><br><br>
            <label for="quantity">수량:</label>
            <input type="number" id="quantity" name="quantity" required><br><br>
            <input type="submit" value="제품 추가">
        </form>
    </div>
</body>
</html>
