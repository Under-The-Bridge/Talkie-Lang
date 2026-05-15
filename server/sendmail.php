<?php
$to = $_POST["email"];
$subject = "Talkie Lang";

$message = '
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <title>Восстановление пароля</title>
</head>

<body style="margin: 0;padding: 0;background: #f5f5f5;font-family: Arial, sans-serif;color: #222222;">
    <main style="width: 100%;background: #f5f5f5;padding: 40px 0;display: flex;justify-content: center;">
        <div style="width: 600px;background: #ffffff;border: 1px solid #eeeeee;">
            <header style="background: #e0834d;padding: 24px;text-align: center;">
                <div style="font-size: 28px;font-weight: bold;color: #ffffff;">
                    Talkie Lang
                </div>
            </header>
            <div style="padding: 40px 45px;">
                <h1 style="font-size: 24px;color: #222222;margin: 0 0 20px 0;">Восстановление пароля</h1>
                <p style="font-size: 15px;line-height: 1.6;margin: 0 0 15px 0;">Привет! Мы получили запрос на восстановление пароля для вашего аккаунта на Talkie Lang.</p>
                <p style="font-size: 15px;line-height: 1.6;margin: 0 0 15px 0;">Ваш код для восстановления пароля:</p>
                <div style="text-align: center;margin: 30px 0;">
                    <p style="display: inline-block;background: #e0834d;color: #ffffff;text-decoration: none;padding: 16px 42px;font-size: 28px;font-weight: bold;border-radius: 8px;letter-spacing: 4px;">wwewewe</p>
                </div>
                <p style="font-size: 15px;line-height: 1.6;margin: 0 0 15px 0;">Если вы не запрашивали восстановление пароля, просто проигнорируйте это письмо.</p>
                <p style="font-size: 13px;line-height: 1.6;margin: 20px 0 0 0;color: #888888;">Код действует 30 минут.</p>
            </div>
            <footer style="background: #e0834d;padding: 22px;text-align: center;color: #ffffff;font-size: 12px;">© Talkie Lang. Все права защищены.</footer>
        </div>
    </main>
</body>

</html>
';
$headers = "Content-type: text/html; charset=UTF-8\r\n";

mail($to, $subject, $message, $headers);
echo "    <script>
        alert('Письмо отправлено');
        location.href = '/welcome/';
    </script>";
?>