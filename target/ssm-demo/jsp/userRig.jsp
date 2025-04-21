<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Staem管家 - 用户注册</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
        :root {
            --primary-color: #66c0f4;
            --secondary-color: #1b2838;
            --background-color: #171a21;
            --input-bg-color: #2a475e;
            --button-color: #5c7e10;
            --button-hover: #6b8e23;
            --text-color: #c7d5e0;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--text-color);
            background-image: radial-gradient(circle at 20% 30%, rgba(102, 192, 244, 0.1) 0%, transparent 30%),
            radial-gradient(circle at 80% 70%, rgba(102, 192, 244, 0.1) 0%, transparent 30%);
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><rect width="100" height="100" fill="none"/><path d="M30,30 L70,30 L70,70 L30,70 Z" stroke="%232a475e" stroke-width="0.5" fill="none"/></svg>');
            opacity: 0.05;
            z-index: -1;
        }

        .logo-container {
            margin-bottom: 2.5rem;
            text-align: center;
            position: relative;
        }

        .logo {
            color: var(--primary-color);
            font-size: 3rem;
            font-weight: 700;
            text-shadow: 0 0 15px rgba(102, 192, 244, 0.3);
            letter-spacing: 1px;
            position: relative;
            display: inline-block;
        }

        .logo::after {
            content: "";
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--primary-color), transparent);
            opacity: 0.7;
        }

        .register-container {
            background-color: var(--secondary-color);
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            width: 380px;
            max-width: 95%;
            position: relative;
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .register-container:hover {
            transform: translateY(-5px);
        }

        .register-container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: linear-gradient(to bottom, var(--primary-color), transparent);
        }

        .register-title {
            text-align: center;
            margin-bottom: 1.5rem;
            color: var(--text-color);
            font-size: 1.25rem;
            position: relative;
        }

        .register-title::after {
            content: "";
            display: block;
            width: 60px;
            height: 2px;
            background: var(--primary-color);
            margin: 0.5rem auto 0;
            opacity: 0.5;
        }

        .form-row {
            display: flex;
            margin-bottom: 1.25rem;
            align-items: center;
        }

        .form-label {
            width: 100px;
            color: var(--primary-color);
            font-weight: 600;
            font-size: 0.9rem;
        }

        .form-input {
            flex: 1;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.8rem 1rem;
            background-color: var(--input-bg-color);
            border: 1px solid rgba(102, 192, 244, 0.2);
            border-radius: 6px;
            color: var(--text-color);
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(102, 192, 244, 0.2);
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: rgba(199, 213, 224, 0.5);
        }

        .button-row {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        input[type="button"] {
            flex: 1;
            padding: 0.9rem;
            background-color: var(--button-color);
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        input[type="button"]:hover {
            background-color: var(--button-hover);
        }

        input[type="button"]::after {
            content: "";
            position: absolute;
            top: -50%;
            left: -60%;
            width: 40px;
            height: 200%;
            background: rgba(255, 255, 255, 0.2);
            transform: rotate(30deg);
            transition: all 0.3s;
        }

        input[type="button"]:hover::after {
            left: 120%;
        }

        #returnLogin {
            background-color: #2a475e;
        }

        #returnLogin:hover {
            background-color: #3a576e;
        }

        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }


        @media (max-width: 480px) {
            .logo {
                font-size: 2.2rem;
            }

            .register-container {
                padding: 1.5rem;
            }

            .button-row {
                flex-direction: column;
                gap: 0.75rem;
            }
        }
    </style>
</head>
<body>
<div class="logo-container">
    <h1 class="logo">Staem管家</h1>
</div>

<div class="register-container">
    <div class="register-title">创建新账户</div>

    <form>
        <div class="form-row">
            <div class="form-label">身份码</div>
            <div class="form-input">
                <input id="userid" name="user_id" type="text">
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">用户名:</div>
            <div class="form-input">
                <input id="username" name="username" type="text">
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">密码:</div>
            <div class="form-input">
                <input id="password" name="password" type="password">
            </div>
        </div>

        <div class="button-row">
            <input type="button" value="注册" id="User_Register">
            <input type="button" value="返回" id="returnLogin">
        </div>

    </form>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#User_Register").click(function () {
            var userid = $("#userid").val();
            var username = $("#username").val();
            var password = $("#password").val();

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/addUser.do",
                data: {
                    "userid": userid,
                    "username": username,
                    "password": password
                },
                dataType: "json",
                success: function (data) {
                    var reg_data = JSON.stringify(data);
                    var pj = $.parseJSON(reg_data);
                    console.info(pj);
                },
                error: function () {
                    console.log("error");
                }
            });
        });

        $("#returnLogin").click(function(){
            window.history.go(-1);
        });
    });
</script>
</body>
</html>