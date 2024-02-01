

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<title>로그인</title>
	<link rel="stylesheet" type="text/css" href="../css/app.css">
	<link rel="stylesheet" type="text/css" href="../css/grid.css">
	<!--[if lt IE 9]>
	<script type="text/javascript" src="/js/html5shiv.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
		document.msCapsLockWarningOff = true; 
	</script>
</head>

<body>

<!-- wrap -->
<div class="wrap">
	<div id="header">
		<h1 class="h_logo">

				<span class="logo_link"><span class="blind">엘라이</span></span>


		</h1>
	</div>
    <script type="text/javascript" src="/js/jquery-1.12.3.min.js"></script>
    <div class="content">
        <h2 id="welcomeMessage" class="h_tit h_tit4" style="display:none;"></h2>


        <h2 id="errorTitle" class="h_tit h_tit2 login_tit " style="display:none;"></h2>

        <p id="errorDescription" class="noti_txt " style="display:none;"></p>


        <form id="loginForm" name="loginForm" method="post">
			<fieldset>
            <input type="hidden" id="ticket" name="ticket" value="edc73b1eeb30c4e349ce9fdc2d6caf314">
            <input type="hidden" id="client_id" name="client_id" value="oxNYar2u8_FoAShNooH1">
            <input type="hidden" id="encryptKeyName" name="encryptKeyName" value="">
            <input type="hidden" id="encryptedPassword" name="encryptedPassword" value="">
            <input type="hidden" id="captchaKey" name="captchaKey" value="">
                <legend>로그인 정보 입력</legend>
                <div class="login_inp_area">

                            <span class="inp_bx">
                    <input type="text" id="id" name="id" class="inp" title="아이디" placeholder="아이디" value="" maxlength="16" autocomplete="off" style="ime-mode:disabled;">
                    <button type="button" class="btn_del is_disabled"><span class="sp_mobile ico_del">텍스트 지우기</span></button>
                </span>

                <span class="inp_bx">
					<input type="password" id="password" class="inp" title="비밀번호" placeholder="비밀번호" maxlength="20" style="ime-mode:disabled;">
					<button type="button" class="btn_del is_disabled"><span class="sp_mobile ico_del">텍스트 지우기</span></button>
					<span class="tooltip"><em>Caps Lock이 켜져 있습니다.</em></span>
				</span>
                </div>


                <div class="checkbox_area">
				<span class="inp_checkbox ">
					<input type="checkbox" id="saveIdYn" name="saveIdYn" class="inp_chk" value="N" >
					<label for="saveIdYn" class="com_label"><span class="ico_chk"></span>아이디 저장</label>
				</span>


                <span class="inp_checkbox ">
					<input type="checkbox" id="autoLoginYn" name="autoLoginYn" class="inp_chk" value="N" >
					<label for="autoLoginYn" class="com_label"><span class="ico_chk"></span>자동 로그인</label>
				</span>
                </div>
<div class="btn_area">
    <button id="loginBtn" type="submit" class="btn btn_full">로그인</button>
</div>
            </fieldset>
        </form>

<div class="menu_area">
    <ul class="menu_lst">
        <li class="menu_item"><a href="/find-id?callbackUrl=%2Foauth2%2Fauthorize%3Fredirect_uri%3Dhttps%253A%252F%252Fwww.naturerepublic.com%252F%252Fmember%252Fmember%252Floginprocess%252F%253Fmd%3Dpop%26loginExtraJson%3DeyJ2aWV3QXV0b0xvZ2luIjp0cnVlfQ%3D%3D%26messageLocale%3Dko_KR&appYn=N&logoYn=Y&titleYn=Y&mobileYn=N&messageLocale=ko_KR" class="menu_link">아이디 찾기</a></li>
        <li class="menu_item"><a href="/reset-password?callbackUrl=%2Foauth2%2Fauthorize%3Fredirect_uri%3Dhttps%253A%252F%252Fwww.naturerepublic.com%252F%252Fmember%252Fmember%252Floginprocess%252F%253Fmd%3Dpop%26loginExtraJson%3DeyJ2aWV3QXV0b0xvZ2luIjp0cnVlfQ%3D%3D%26messageLocale%3Dko_KR&appYn=N&logoYn=Y&titleYn=Y&mobileYn=N&messageLocale=ko_KR" class="menu_link">비밀번호 찾기</a></li>
        <li class="menu_item"><a href="/join?callbackUrl=%2Foauth2%2Fauthorize%3Fredirect_uri%3Dhttps%253A%252F%252Fwww.naturerepublic.com%252F%252Fmember%252Fmember%252Floginprocess%252F%253Fmd%3Dpop%26loginExtraJson%3DeyJ2aWV3QXV0b0xvZ2luIjp0cnVlfQ%3D%3D%26messageLocale%3Dko_KR&appYn=N&logoYn=Y&titleYn=Y&mobileYn=N&messageLocale=ko_KR" class="menu_link">회원 가입</a></li>
    </ul>
</div>


    </div>

</div>
<div class="dimmed" style="display:none;"></div>
<div id="alertLayer" class="ly_pop_wrap" style="display:none;">
    <div class="ly_pop">
        <div class="ly_header">
            <h2 class="ly_tit"></h2>
        </div>
        <div class="ly_cont">
            <p class="guide_txt"></p>
            <em class="point_txt"></em>
            <div class="btn_area mt_diff">
                <button type="button" class="btn">확인</button>
            </div>
        </div>
    </div>
</div>

<div id="confirmLayer" class="ly_pop_wrap" style="display:none;">
    <div class="ly_pop">
        <div class="ly_header">
            <h2 class="ly_tit"></h2>
        </div>
        <div class="ly_cont">
            <p class="guide_txt"></p>
            <em class="point_txt"></em>
            <div class="btn_area mt_diff">
                <button type="button" class="btn confirm">확인</button>
                <button type="button" class="btn cancel">취소</button>
            </div>
        </div>
    </div>
</div>

<div id="iframeLayer" class="ly_pop_wrap" style="display:none;">
	<div class="ly_pop ly_pop_terms">
		<h2 class="ly_tit"></h2>
		<div class="frame_wrap">
			<iframe src="" frameborder="0" ></iframe>
		</div>
		<div class="pop_close">
			<a href="#" class="btn_close">닫기</a>
		</div>
	</div>
</div>

</body><script type="text/javascript">
    var messageResource = window.messageResource || {};
    messageResource['aspid.message.ALL.js.extra.1'] = '잘못된 보안 키입니다.';
    messageResource['aspid.message.ALL.js.extra.2'] = '암호화가 정상적으로 이루어지지 않았습니다.';
    messageResource['aspid.message.ALL.js.extra.3'] = '개인 정보 수집과 이용에 동의해 주세요.';
</script>
    <script type="text/javascript" src="/js/tui-code-snippet.min.js?v=01231512"></script>
    <script type="text/javascript" src="/js/tui-placeholder-custom.js?v=01231512"></script>
    <script type="text/javascript" src="/js/common/ui.js?v=01231512"></script>
    <script>var initkeytype = "LOGIN";</script>
    <script type="text/javascript" src="/js/common/rsaKey.js?v=01231512"></script>
    <script type="text/javascript" src="/js/login/login.js?v=01231512"></script>




    <script type="text/javascript">
        requireIdOrEmailMessage = '아이디를 입력해 주세요.';
        requirePasswordMessage = '비밀번호를 입력해 주세요.';

        $(document).ready(function () {
            ui.init();
            tui.placeholder.generate();

            loginUtils.init('STRING');



        });


    </script>

</html>
