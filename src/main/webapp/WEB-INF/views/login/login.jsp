<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

    :root {
        /* Default Theme: Customer (White) */
        --primary-color: #6c757d; /* Medium Gray */
        --secondary-color: #adb5bd; /* Light Gray */
        --primary-shadow-color: rgba(108, 117, 125, 0.4);
        --info-panel-overlay: rgba(108, 117, 125, 0.7);

        --background-color: #f8f9fa;
        --text-color: #333;
        --light-text-color: #777;
        --white-color: #fff;
        --border-color: #e0e0e0;
        --shadow-color: rgba(0, 0, 0, 0.1);
        
        --theme-transition-duration: 0.7s;
    }

    /* Seller Theme */
    body.seller-theme {
        --primary-color: #343a40; /* Dark Gray */
        --secondary-color: #495057; /* Lighter Dark Gray */
        --primary-shadow-color: rgba(52, 58, 64, 0.4);
        --info-panel-overlay: rgba(52, 58, 64, 0.7);
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', 'Noto Sans KR', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        position: relative;
        background: linear-gradient(135deg, #f8f9fa, #e9ecef); /* Default White/Light Gray Gradient */
        overflow: hidden;
        z-index: 0;
    }

    /* Gradient transition overlay for Seller theme */
    body::after {
        content: '';
        position: absolute;
        top: 0; right: 0; bottom: 0; left: 0;
        background: linear-gradient(135deg, #6c757d, #343a40); /* Seller Gray Gradient */
        opacity: 0;
        transition: opacity var(--theme-transition-duration) ease-in-out;
        z-index: -1;
    }

    body.seller-theme::after {
        opacity: 1;
    }

    .login-wrapper {
        display: flex;
        width: 900px;
        height: 620px;
        background-color: var(--white-color);
        border-radius: 20px;
        box-shadow: 0 15px 40px var(--shadow-color);
        overflow: hidden;
        animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.95); }
        to { opacity: 1; transform: scale(1); }
    }

    .info-panel {
        flex: 1;
        padding: 50px;
        color: var(--white-color);
        background: url('https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?q=80&w=1912&auto=format&fit=crop') no-repeat center center;
        background-size: cover;
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: center;
        position: relative;
    }
    
    .info-panel::before {
        content: '';
        position: absolute;
        top: 0; left: 0; right: 0; bottom: 0;
        background: var(--info-panel-overlay);
        transition: background var(--theme-transition-duration) ease-in-out;
    }

    .info-panel * {
        position: relative;
        z-index: 1;
    }

    .info-panel h1 {
        font-size: 36px;
        font-weight: 700;
        margin-bottom: 15px;
    }

    .info-panel p {
        font-size: 16px;
        font-weight: 300;
    }

    .login-panel {
        flex: 1;
        padding: 40px 50px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .login-panel h2 {
        font-size: 32px;
        font-weight: 600;
        color: var(--text-color);
        margin-bottom: 10px;
        text-align: center;
    }

    .login-panel p {
        color: var(--light-text-color);
        text-align: center;
        margin-bottom: 30px;
    }

    .user-type-switch {
        position: relative;
        display: grid;
        grid-template-columns: 1fr 1fr;
        width: 100%;
        margin-bottom: 30px;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        background-color: var(--background-color);
    }

    .user-type-switch input[type="radio"] {
        display: none;
    }

    .user-type-switch label {
        padding: 12px;
        font-size: 15px;
        font-weight: 500;
        color: var(--light-text-color);
        cursor: pointer;
        z-index: 2;
        transition: color 0.4s ease;
        text-align: center;
    }

    .switch-handle {
        position: absolute;
        top: 0;
        left: 0;
        width: 50%;
        height: 100%;
        background-color: var(--primary-color);
        border-radius: 7px;
        z-index: 1;
        transition: transform 0.3s cubic-bezier(0.65, 0, 0.35, 1), background-color var(--theme-transition-duration) ease-in-out;
    }

    .user-type-switch input[type="radio"]:checked + label {
        color: var(--white-color);
    }

    .user-type-switch #seller:checked ~ .switch-handle {
        transform: translateX(100%);
    }

    .input-group {
        position: relative;
        margin-bottom: 20px;
    }

    .input-group i {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--light-text-color);
        transition: color 0.3s;
    }

    .input-field {
        width: 100%;
        padding: 14px 15px 14px 45px;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        font-size: 16px;
        transition: all 0.3s;
    }

    .input-field:focus {
        outline: none;
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px var(--primary-shadow-color);
        transition: border-color var(--theme-transition-duration) ease-in-out, box-shadow var(--theme-transition-duration) ease-in-out;
    }

    .input-field:focus + i {
        color: var(--primary-color);
        transition: color var(--theme-transition-duration) ease-in-out;
    }

    .options-group {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
        font-size: 14px;
    }

    .remember-me {
        display: flex;
        align-items: center;
        color: var(--light-text-color);
        cursor: pointer;
    }
    
    .remember-me input {
        margin-right: 8px;
    }

    .find-link {
        color: var(--light-text-color);
        text-decoration: none;
        transition: color 0.3s;
    }

    .find-link:hover {
        color: var(--primary-color);
        text-decoration: underline;
    }

    .btn {
        width: 100%;
        padding: 14px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        transition: all 0.3s, background-color var(--theme-transition-duration) ease-in-out;
        letter-spacing: 0.5px;
    }

    .btn-login {
        background-color: var(--primary-color);
        color: var(--white-color);
        margin-bottom: 15px;
        box-shadow: 0 5px 15px var(--primary-shadow-color);
    }

    .btn-login:hover {
        background-color: var(--secondary-color);
        transform: translateY(-2px);
        box-shadow: 0 8px 20px var(--primary-shadow-color);
    }

    .btn-signup {
        background-color: var(--background-color);
        color: var(--text-color);
        border: 1px solid var(--border-color);
    }

    .btn-signup:hover {
        background-color: #e9ecef;
    }

</style>
</head>
<body>

    <div class="login-wrapper">
        <div class="info-panel">
            <h1>Product Sales Platform</h1>
            <p>온라인 의류 판매 플랫폼</p>
        </div>
        <div class="login-panel">
            <h2>로그인</h2>
            <p>계속하려면 로그인하세요.</p>
            
            <form id="loginForm" action="login_yn" method="post">
                <div class="user-type-switch">
                    <input type="radio" id="customer" name="userType" value="customer" checked>
                    <label for="customer">구매자</label>
                    <input type="radio" id="seller" name="userType" value="seller">
                    <label for="seller">판매자</label>
                    <div class="switch-handle"></div>
                </div>

                <div class="input-group">
                    <input type="text" id="loginId" name="memberId" class="input-field" placeholder="아이디" required>
                    <i class="fas fa-user"></i>
                </div>
                <div class="input-group">
                    <input type="password" id="loginPw" name="memberPw" class="input-field" placeholder="비밀번호" required>
                    <i class="fas fa-lock"></i>
                </div>
                
                <div class="options-group">
                    <label class="remember-me">
                        <input type="checkbox" name="remember"> 자동 로그인
                    </label>
                    <a href='#' onclick="location.href='findOption'">아이디/비밀번호 찾기</a>
                </div>
                
                <button type="submit" class="btn btn-login">로그인</button>
                <button type="button" class="btn btn-signup" onclick="location.href='register'">회원가입</button>
            </form>
        </div>
    </div>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const userTypeRadios = document.querySelectorAll('input[name="userType"]');
        const body = document.body;
        const loginForm = document.getElementById('loginForm');
        const loginIdField = document.getElementById('loginId');
        const loginPwField = document.getElementById('loginPw');

        // ⭐️ 로그인 URL 설정
        const customerAction = 'login_yn'; // 일반 유저 로그인 처리 URL
        const sellerAction = 'seller/loginCheck'; // 판매자 로그인 처리 URL (SellerController 매핑)
        
        // ⭐️ 입력 필드 NAME 속성 설정 (구매자 DTO vs 판매자 DTO)
        const customerNames = { id: 'memberId', pw: 'memberPw' }; // MemDTO 필드명
        const sellerNames = { id: 'selId', pw: 'selPw' };       // SellerDTO 필드명

        // 라디오 버튼 변경 이벤트 리스너
        userTypeRadios.forEach(radio => {
            radio.addEventListener('change', (event) => {
                const isSeller = event.target.value === 'seller';
                
                // 1. 테마 변경
                if (isSeller) {
                    body.classList.add('seller-theme');
                } else {
                    body.classList.remove('seller-theme');
                }

                // 2. Form Action URL 변경
                loginForm.action = isSeller ? sellerAction : customerAction;

                // 3. Input Name 속성 변경
                if (isSeller) {
                    loginIdField.name = sellerNames.id; // memberId -> selId
                    loginPwField.name = sellerNames.pw; // memberPw -> selPw
                } else {
                    loginIdField.name = customerNames.id; // selId -> memberId
                    loginPwField.name = customerNames.pw; // selPw -> memberPw
                }
            });
        });
        
        // 페이지 로드 시 초기값 설정: 
        // HTML에서 기본적으로 customer가 checked이고 name이 memberId/memberPw로 설정되어 있으므로,
        // 이 로직은 기본 설정 확인용으로만 남겨두거나 생략해도 무방합니다.
    });
</script>

</body>
</html>