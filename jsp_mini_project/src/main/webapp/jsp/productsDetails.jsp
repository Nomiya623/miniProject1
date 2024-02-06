<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 정보</title>
<style>
.container {
	display: flex;
	width: 100%;
}

.image-block {
	width: 40%;
}

.details-block {
	width: 60%;
	padding-left: 20px;
}

img {
	width: 100%;
	height: auto;
}

.product-details {
	margin: 20px;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
}

.product-details h2, .product-details p {
	margin: 10px 0;
}

</style>
</head>
<body>
	<div class="container">
		<div class="image-block">
			<img src="../images/products/product.png" alt="Product Image">
		</div>
		<div class="details-block">
			<div class="product-details">
				<%
				String itemid = request.getParameter("itemid");
				if (itemid != null && !itemid.trim().isEmpty()) {

					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try {

						String query = "SELECT * FROM ALLY_PRODUCTS WHERE ITEMID = ?";
						pstmt = conn.prepareStatement(query);
						pstmt.setInt(1, Integer.parseInt(itemid));
						rs = pstmt.executeQuery();

						if (rs.next()) {
				%>
				<h2>
					제품명:
					<%=rs.getString("PRODUCT_TYPE")%></h2>
				<p>
					상세 설명:
					<%=rs.getString("FEATURES")%></p>
				<p>
					가격:
					<%=rs.getDouble("PRICE")%>원
				</p>

				<button onclick="addToCart()" class="addToCart">장바구니에 추가하기</button>
				<button onclick="checkout()" class="checkout">바로구매</button>


				<%
				} else {
				out.println("<p>해당 제품 정보를 찾을 수 없습니다.</p>");
				}
				} catch (SQLException e) {
				out.println("<p>데이터베이스 오류: " + e.getMessage() + "</p>");
				} finally {
				if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
				if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
				if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}
				}
				} else {
				out.println("<p>유효하지 않은 제품 ID입니다.</p>");
				}
				%>
			</div>
</body>
</html>
