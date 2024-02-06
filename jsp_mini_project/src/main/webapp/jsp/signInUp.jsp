<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/form.css">
<title>Sign-in and sign-up</title>
</head>
<body>
	<%@ include file="../db/dbconn.jsp"%>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form name="join" action="signUp_save.jsp" method="POST">
				<h1>계정 생성</h1>
				<div class="social-container">

					<a
						href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount%2Finfo"
						class="social" target="_blank"><i class="fab fa-kakaotalk-k"></i>
						<img src="../images/logos/kakao-talk.png" alt="KakaoTalk" /></a> <a
						href="https://accounts.google.com/InteractiveLogin/signinchooser?continue=https%3A%2F%2Fwww.google.co.kr%2F&ec=GAZAmgQ&hl=en&passive=true&ifkv=ASKXGp2n18aClqcGZVRBexYnRMcdWDUxLsejX1bmpjAkyifeKZmDMY6_qwsTFbAXF5fqJg1jhboO&theme=glif&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
						class="social" target="_blank"><i class="fab fa-google-g"></i>
						<img src="../images/logos/search.png" alt="Google" /></a> <a
						href="https://nid.naver.com/nidlogin.login" class="social"
						target="_blank"><i class="fab fa-naver-n"></i> <img
						src="../images/logos/naver.png" alt="Naver" /></a>
				</div>
				<span>또는 이메일 계정을 사용하세요</span>
				<div style="display: flex; align-items: center;">
					<input type="text" name="userId" placeholder="사용자 ID"
						style="flex-grow: 1; margin-right: 10px;">
					<button type="button" onclick="idCheck()"
						style="flex-shrink: 0; background-color: white; color: black; border: 1px solid #000;">중복
						확인</button>
				</div>

				<input type="email" placeholder="이메일" name="email" required /> <input
					type="password" placeholder="비밀번호 (1-9, A-Z)"
					pattern="[A-Za-z0-9]{1,}"
					title="Password should contain numbers and letters only."
					name="password" required /> <input type="text" placeholder="이름"
					name="fullName" required /> <input type="number" placeholder="나이"
					min="1" max="100" name="age" required /> <select name="gender"
					id="gender" required>
					<option value="">성별 선택</option>
					<option value="남성">남성</option>
					<option value="여성">여성</option>
					<option value="기타">기타</option>
				</select> <select name="skinType" id="skinType">
					<option value="">피부 타입 선택</option>
					<option value="dry">건성</option>
					<option value="oily">지성</option>
					<option value="combination">복합성</option>
					<option value="normal">정상</option>
					<option value="sensitive">민감성</option>
					<option value="troubled">트러블성</option>
				</select>
				<button>가입하기</button>
			</form>
		</div>
		<div class="container" id="container">
			<div class="form-container sign-in-container">

				<form name="join" action="signIn_process.jsp" method="POST">
					<h1>로그인</h1>
					<div class="social-container">
						<a
							href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount%2Finfo"
							class="social" target="_blank"><i class="fab fa-kakaotalk-k"></i>
							<img src="../images/logos/kakao-talk.png" alt="KakaoTalk" /></a> <a
							href="https://accounts.google.com/InteractiveLogin/signinchooser?continue=https%3A%2F%2Fwww.google.co.kr%2F&ec=GAZAmgQ&hl=en&passive=true&ifkv=ASKXGp2n18aClqcGZVRBexYnRMcdWDUxLsejX1bmpjAkyifeKZmDMY6_qwsTFbAXF5fqJg1jhboO&theme=glif&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
							class="social" target="_blank"><i class="fab fa-google-g"></i>
							<img src="../images/logos/search.png" alt="Google" /></a> <a
							href="https://nid.naver.com/nidlogin.login" class="social"
							target="_blank"><i class="fab fa-naver-n"></i> <img
							src="../images/logos/naver.png" alt="Naver" /></a>
					</div>
					<span>또는 계정을 사용하세요</span> <input type="text" name="userId"
						placeholder="ID" required /> <input type="password" name="pwd"
						placeholder="비밀번호" required /> <a href="findPassword.jsp">비밀번호를
						잊으셨나요?</a>
					<%
					String loginError = request.getParameter("loginError");
					if (loginError != null && !loginError.isEmpty()) {
					%>
					<div style="color: red; font-size: 12px"><%=loginError%></div>
					<%
					}
					%>
					<button type="submit">로그인</button>
				</form>
			</div>
			<div class="overlay-container">
				<div class="overlay">
					<div class="overlay-panel overlay-left">
						<h1>다시 오신 것을 환영합니다!</h1>
						<p>저희와 연결되어 있으려면 개인 정보로 로그인하세요</p>
						<button class="ghost" id="">로그인</button>
					</div>
					<div class="overlay-panel overlay-right">
						<h1>안녕하세요!</h1>
						<p>개인 정보를 입력하고 저희와 함께 여정을 시작하세요</p>
						<button class="ghost" id="signUp">회원가입</button>
					</div>
				</div>
			</div>
		</div>
</body>


</html>
<script>

function idCheck() {
    var userId = document.forms["join"]["userId"].value;
    if (userId) {
        var url = "userId_check.jsp?userId=" + encodeURIComponent(userId);
        window.open(url, "ID Check", "width=300,height=300");
    } else {
        alert("사용자 ID를 입력하세요.");
    }
}

    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

        
    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });

    document.addEventListener('keydown', function(event) {
        const signUpContainer = document.querySelector('.sign-up-container');

        if (event.key === 'PageDown') {
            signUpContainer.scrollIntoView({ behavior: 'smooth', block: 'end' });
        } else if (event.key === 'PageUp') {
            signUpContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    });
	
    
</script>