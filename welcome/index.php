<?php
require "../connection-db.php";
$langs = mysqli_fetch_all(mysqli_query($conn, "select * from langs"));
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Выберите язык</title>
    <link rel="stylesheet" href="../css/welcome.css">
</head>
<body>
<div class="box">
    <!-- Блок выбора языка -->
    <div id="step1">
        <h1>Какой язык учим?</h1>
        <div class="desc">Выберите язык, чтобы начать</div>
        <div class="lang-list" id="langList">
            <?php
            // Если $langs из БД не загружен, показываем примеры
            if (!isset($langs) || empty($langs)) {
                $simpleLangs = ['🇪🇸 Испанский', '🇫🇷 Французский', '🇩🇪 Немецкий', '🇯🇵 Японский', '🇮🇹 Итальянский', '🇬🇧 Английский'];
                foreach ($simpleLangs as $lang) {
                    $cleanName = preg_replace('/^[🇪🇸🇫🇷🇩🇪🇯🇵🇮🇹🇬🇧]\s*/', '', $lang);
                    echo '<button class="lang-btn" data-lang="' . htmlspecialchars($cleanName) . '">' . htmlspecialchars($lang) . '</button>';
                }
            } else {
                foreach ($langs as $lang):?>
                    <button class="lang-btn" value="<?= $lang[1] ?>" data="<?= $lang[0] ?>"><?= $lang[1] ?></button>
                <?php endforeach;
            }
            ?>
        </div>
    </div>

    <!-- Блок с формами (сначала скрыт) -->
    <div id="step2" class="hidden">
        <div class="selected-info">
            Вы выбрали: <span id="selectedLang"></span>
            <span class="change-link" id="changeLangBtn">изменить</span>
        </div>

        <!-- Форма регистрации -->
        <div id="registerFormBlock">
            <div class="form-title">Создать аккаунт</div>
            <form method="post" action="../server/reg-db.php" id="registerForm">
                <div class="form-group">
                    <label>Логин</label>
                    <input type="text" name="login" placeholder="Логин" id="regLogin" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" placeholder="your@email.com" id="regEmail" required>
                </div>
                <div class="form-group">
                    <label>Пароль</label>
                    <input type="password" name="password" placeholder="Пароль" id="regPassword" required>
                </div>
                <input type="hidden" name="lang" id="hiddenLang">
                <button type="submit" class="btn-submit">Зарегистрироваться</button>
                <div class="form-footer">
                    Уже есть аккаунт? <a id="switchToLoginBtn">Войти</a>
                </div>
            </form>
        </div>

        <!-- Форма авторизации (скрыта по умолчанию) -->
        <div id="loginFormBlock" class="hidden">
            <div class="form-title">Вход в аккаунт</div>
            <form method="post" action="../server/auth-db.php" id="loginForm">
                <div class="form-group">
                    <label>Логин или Email</label>
                    <input type="text" name="login" placeholder="Введите логин или email" id="loginUsername" required>
                </div>
                <div class="form-group">
                    <label>Пароль</label>
                    <input type="password" name="password" placeholder="Введите пароль" id="loginPassword" required>
                </div>
                <input type="hidden" name="lang" id="hiddenLangLogin">
                <button type="submit" class="btn-submit">Войти</button>
                <div class="form-footer">
                    Нет аккаунта? <a id="switchToRegBtn">Зарегистрироваться</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // Получаем элементы
    const step1 = document.getElementById('step1');
    const step2 = document.getElementById('step2');
    const langBtns = document.querySelectorAll('.lang-btn');
    const selectedLangSpan = document.getElementById('selectedLang');
    const hiddenLang = document.getElementById('hiddenLang');
    const hiddenLangLogin = document.getElementById('hiddenLangLogin');
    const changeBtn = document.getElementById('changeLangBtn');

    const registerBlock = document.getElementById('registerFormBlock');
    const loginBlock = document.getElementById('loginFormBlock');
    const switchToLogin = document.getElementById('switchToLoginBtn');
    const switchToReg = document.getElementById('switchToRegBtn');

    let currentLang = '';

    // Выбор языка
    langBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            currentLang = this.getAttribute('value');
            idLang = this.getAttribute('data');
            if (!currentLang) return;
            
            selectedLangSpan.textContent = currentLang;
            hiddenLang.value = idLang;
            if (hiddenLangLogin) hiddenLangLogin.value = idLang;
            
            step1.classList.add('hidden');
            step2.classList.remove('hidden');
            
            // Показываем форму регистрации, авторизацию скрываем
            registerBlock.classList.remove('hidden');
            loginBlock.classList.add('hidden');
        });
    });

    // Кнопка "изменить язык"
    if (changeBtn) {
        changeBtn.addEventListener('click', function() {
            step2.classList.add('hidden');
            step1.classList.remove('hidden');
            currentLang = '';
            hiddenLang.value = '';
            if (hiddenLangLogin) hiddenLangLogin.value = '';
        });
    }

    // Переключение на форму авторизации
    if (switchToLogin) {
        switchToLogin.addEventListener('click', function(e) {
            e.preventDefault();
            registerBlock.classList.add('hidden');
            loginBlock.classList.remove('hidden');
            // обновляем скрытое поле в форме авторизации
            if (hiddenLangLogin) hiddenLangLogin.value = idLang;
        });
    }

    // Переключение на форму регистрации
    if (switchToReg) {
        switchToReg.addEventListener('click', function(e) {
            e.preventDefault();
            loginBlock.classList.add('hidden');
            registerBlock.classList.remove('hidden');
            // обновляем скрытое поле в форме регистрации
            if (hiddenLang) hiddenLang.value = idLang;
        });
    }

    // Валидация формы регистрации
    const regForm = document.getElementById('registerForm');
    if (regForm) {
        regForm.addEventListener('submit', function(e) {
            const login = document.getElementById('regLogin').value.trim();
            const email = document.getElementById('regEmail').value.trim();
            const pass = document.getElementById('regPassword').value;
            
            if (!login || !email || !pass) {
                e.preventDefault();
                alert('Заполните все поля');
            } else if (pass.length < 4) {
                e.preventDefault();
                alert('Пароль должен быть минимум 4 символа');
            } else if (!email.includes('@')) {
                e.preventDefault();
                alert('Введите корректный email');
            } else if (!currentLang) {
                e.preventDefault();
                alert('Выберите язык');
            }
        });
    }

    // Валидация формы авторизации
    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            const username = document.getElementById('loginUsername').value.trim();
            const pass = document.getElementById('loginPassword').value;
            
            if (!username || !pass) {
                e.preventDefault();
                alert('Заполните все поля');
            } else if (!currentLang) {
                e.preventDefault();
                alert('Выберите язык');
            }
        });
    }
</script>
</body>
</html>