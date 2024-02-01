<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="profile-container">
        <h1>My Profile</h1>
        <div class="user-info">
            <h2>회원정보</h2>
            <p><strong>UserID:</strong> <span id="userId">1</span></p>
            <p><strong>Email:</strong> <span id="email">user1@example.com</span></p>
            <p><strong>FullName:</strong> <span id="fullName">User1 Name</span></p>
            <p><strong>Age:</strong> <span id="age">23</span></p>
            <p><strong>Gender:</strong> <span id="gender">남성</span></p>
            <p><strong>SkinType:</strong> <span id="skinType">트러블성</span></p>
            <button onclick="location.href='ally_user_update.jsp'">회원정보 변경</button>
        </div>

        <div class="purchase-history">
            <h2>Purchase History</h2>
            <table>
                <thead>
                    <tr>
                        <th>Purchase Date</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2023-07-14</td>
                        <td>137912</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>