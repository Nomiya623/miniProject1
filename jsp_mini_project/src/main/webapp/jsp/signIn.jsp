<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/form.css">
    <title>Sign-in</title>
</head>

<body>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="#">
                <h1>Create Account</h1>
                <div class="social-container">

                    <a href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount%2Finfo"
                        class="social" target="_blank"><i class="fab fa-kakaotalk-k"></i>
                        <img src="../images/logos/kakao-talk.png" alt="KakaoTalk" /></a>
                    <a href="https://accounts.google.com/InteractiveLogin/signinchooser?continue=https%3A%2F%2Fwww.google.co.kr%2F&ec=GAZAmgQ&hl=en&passive=true&ifkv=ASKXGp2n18aClqcGZVRBexYnRMcdWDUxLsejX1bmpjAkyifeKZmDMY6_qwsTFbAXF5fqJg1jhboO&theme=glif&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
                        class="social" target="_blank"><i class="fab fa-google-g"></i>
                        <img src="../images/logos/search.png" alt="Google" /></a>
                    <a href="https://nid.naver.com/nidlogin.login" class="social" target="_blank"><i
                            class="fab fa-naver-n"></i>
                        <img src="../images/logos/naver.png" alt="Naver" /></a>
                </div>
                <span>or use your email for registration</span>
                <input type="text" placeholder="User ID" />
                <input type="email" placeholder="Email" />
                <input type="password" placeholder="Password (1-9, A-Z)" pattern="[A-Za-z0-9]{1,}"
                    title="Password should contain numbers and letters only." />
                <input type="text" placeholder="Full Name" />
                <input type="number" placeholder="Age" min="1" max="100" />
                <select name="gender" id="gender">
                    <option value="">Select Gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
                <select name="skinType" id="skinType">
                    <option value="">Select Skin Type</option>
                    <option value="dry">Dry</option>
                    <option value="oily">Oily</option>
                    <option value="combination">Combination</option>
                    <option value="normal">Normal</option>
                    <option value="sensitive">Sensitive</option>
                    <option value="dry">Dry</option>
                    <option value="troubled">Troubled</option>
                </select>
                <button>Sign Up</button>
            </form>
        </div>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <form action="main.html" method="post">
                    <h1>Sign in</h1>
                    <div class="social-container">
                    <a href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount%2Finfo"
                        class="social" target="_blank"><i class="fab fa-kakaotalk-k"></i>
                        <img src="../images/logos/kakao-talk.png" alt="KakaoTalk" /></a>
                    <a href="https://accounts.google.com/InteractiveLogin/signinchooser?continue=https%3A%2F%2Fwww.google.co.kr%2F&ec=GAZAmgQ&hl=en&passive=true&ifkv=ASKXGp2n18aClqcGZVRBexYnRMcdWDUxLsejX1bmpjAkyifeKZmDMY6_qwsTFbAXF5fqJg1jhboO&theme=glif&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
                        class="social" target="_blank"><i class="fab fa-google-g"></i>
                        <img src="../images/logos/search.png" alt="Google" /></a>
                    <a href="https://nid.naver.com/nidlogin.login" class="social" target="_blank"><i
                            class="fab fa-naver-n"></i>
                        <img src="../images/logos/naver.png" alt="Naver" /></a>
                </div>
                <span>or use your account</span>
                <input type="userId" placeholder="ID" required />
                <input type="password" placeholder="Password" required />
                <a href="#">Forgot your password?</a>
                <button type="submit">Sign In</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
<script>
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