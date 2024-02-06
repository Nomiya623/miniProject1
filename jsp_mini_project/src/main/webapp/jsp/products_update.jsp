<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 수정</title>
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
	display: flex;
	flex-direction: column;
	gap: 10px;
}

input[type="text"], input[type="number"], textarea {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	border-radius: 4px;
	border: 1px solid var(--border-color);
	box-sizing: border-box;
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
    color: var(--text-gray);
}
</style>
</head>
<body>
	<h1>제품 수정</h1>
	<%
	String itemid = request.getParameter("itemid");
	if (itemid != null && !itemid.isEmpty()) {
		try {
			String query = "SELECT * FROM ALLY_PRODUCTS WHERE ITEMID = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(itemid));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
	%>
	<div class = "container">
	<form action="products_update_process.jsp" method="post">
		<input type="hidden" name="itemid" value="<%=rs.getInt("ITEMID")%>" />
		<p>
			제품명: <input type="text" name="product_type"
				value="<%=rs.getString("PRODUCT_TYPE")%>" />
		</p>
		<p>
			상세 설명:
			<textarea name="features"><%=rs.getString("FEATURES")%></textarea>
		</p>
		<p>
			수량: <input type="number" name="quantity"
				value="<%=rs.getInt("quantity")%>" />
		</p>
		<p>
			가격: <input type="text" name="price"
				value="<%=rs.getDouble("PRICE")%>" />
		</p>
		<button type="submit">수정하기</button>
	</form>
	</div>
	<%
	}
	} catch (SQLException e) {
	out.println("SQL Exception: " + e.getMessage());
	} finally {
	try {
	if (conn != null)
		conn.close();
	} catch (Exception e) {
	/* Ignored */ }
	}
	}
	%>
</body>
</html>
