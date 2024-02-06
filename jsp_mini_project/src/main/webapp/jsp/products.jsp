
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품리스트</title>

<style>
:root {
	--text-color: #333;
	--bg-color: #f5f5f5;
	--table-border-color: #ddd;
	--table-header-bg: #6B8E23;
	--table-header-color: #495057;
	--hover-bg-color: #f2f2f2;
	--edit-button-bg: #2196F3; /* Blue */
	--delete-button-bg: #f44336; /* Red */
	--add-button-bg: #3C3C3B; /* Dark Gray */
	--edit-button-hover-bg: #1976D2; /* Darker Blue */
	--delete-button-hover-bg: #D32F2F; /* Darker Red */
	--add-button-hover-bg: #2C2C2C; /* Darker Gray */
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: var(--text-color);
	background-color: var(--bg-color);
	padding: 20px;
}

/* Table Styles */
table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}

th, td {
	border: 1px solid var(--table-border-color);
	padding: 12px 15px;
	text-align: left;
}

th {
	background-color: var(--table-header-bg);
	color: var(--table-header-color);
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: var(--hover-bg-color);
}

/* Button Styles */
button.editButton, form[action*="update"] button {
	background-color: var(--edit-button-bg);
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.2s;
}

button.editButton:hover, form[action*="update"] button:hover {
	background-color: var(--edit-button-hover-bg);
}

button.deleteButton, form[action*="delete"] button {
	background-color: var(--delete-button-bg);
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.2s;
}

button.deleteButton:hover, form[action*="delete"] button:hover {
	background-color: var(--delete-button-hover-bg);
}

.addButton {
	background-color: var(--add-button-bg);
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.addButton:hover {
	background-color: var(--add-button-hover-bg);
}
</style>


</head>
<body>
	<h1>제품 리스트</h1>
	<button onclick="window.location.href='products_add.jsp'"
		class="addButton">제품 추가</button>
	<table>
		<thead>
			<tr>
				<th>아이템ID</th>
				<th>제품명</th>
				<th>상세 설명</th>
				<th>수량</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
			String query = "SELECT ITEMID, PRODUCT_TYPE, FEATURES, PRICE, QUANTITY FROM ALLY_PRODUCTS ORDER BY ITEMID";
			try {
				PreparedStatement pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("ITEMID")%></td>
				<td><%=rs.getString("PRODUCT_TYPE")%></td>
				<td><%=rs.getString("FEATURES")%></td>
				<td><%=rs.getString("quantity")%></td>
				<td><%=rs.getDouble("PRICE")%></td>
				<td>
					<form action="products_update.jsp" method="GET">
						<input type="hidden" name="itemid"
							value="<%=rs.getInt("ITEMID")%>" />
						<button type="submit">수정</button>
					</form>
				</td>
				<td>
					<form action="products_delete.jsp" method="GET">
						<input type="hidden" name="itemid"
							value="<%=rs.getInt("ITEMID")%>" />
						<button type="submit">삭제</button>
					</form>
				</td>
			</tr>
			<%
			}

			} catch (SQLException e) {
			out.println("SQL Exception: " + e.getMessage());
			} finally {
			try {
			if (conn != null)
				conn.close();
			} catch (Exception e) {
			}
			}
			%>
		</tbody>
	</table>



</body>
</html>