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
                    foreach ($langs as $lang): ?>
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
                        <input type="text" name="login" placeholder="Введите логин или email" id="loginUsername"
                            required>
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
            btn.addEventListener('click', function () {
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
            changeBtn.addEventListener('click', function () {
                step2.classList.add('hidden');
                step1.classList.remove('hidden');
                currentLang = '';
                hiddenLang.value = '';
                if (hiddenLangLogin) hiddenLangLogin.value = '';
            });
        }

        // Переключение на форму авторизации
        if (switchToLogin) {
            switchToLogin.addEventListener('click', function (e) {
                e.preventDefault();
                registerBlock.classList.add('hidden');
                loginBlock.classList.remove('hidden');
                // обновляем скрытое поле в форме авторизации
                if (hiddenLangLogin) hiddenLangLogin.value = idLang;
            });
        }

        // Переключение на форму регистрации
        if (switchToReg) {
            switchToReg.addEventListener('click', function (e) {
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
            regForm.addEventListener('submit', function (e) {
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
                }
            });
        }

        // Валидация формы авторизации
        const loginForm = document.getElementById('loginForm');
        if (loginForm) {
            loginForm.addEventListener('submit', function (e) {
                const username = document.getElementById('loginUsername').value.trim();
                const pass = document.getElementById('loginPassword').value;

                if (!username || !pass) {
                    e.preventDefault();
                    alert('Заполните все поля');
                }
            });
        }

        // Активная валидация в реальном времени
        (function () {
            // Функция валидации логина
            function validateLogin(login) {
                const value = login.value.trim();
                if (!value) {
                    showError(login, 'Введите логин');
                    return false;
                } else if (value.length < 3) {
                    showError(login, 'Логин должен быть минимум 3 символа');
                    return false;
                } else if (value.length > 20) {
                    showError(login, 'Логин не должен превышать 20 символов');
                    return false;
                } else if (!/^[a-zA-Z0-9_-]+$/.test(value)) {
                    showError(login, 'Логин может содержать только буквы, цифры, _ и -');
                    return false;
                }
                showSuccess(login, 'Отлично!');
                return true;
            }

            // Функция валидации email
            function validateEmail(email) {
                const value = email.value.trim();
                if (!value) {
                    showError(email, 'Введите email');
                    return false;
                } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
                    showError(email, 'Введите корректный email (example@domain.com)');
                    return false;
                }
                showSuccess(email, 'Email корректен');
                return true;
            }

            // Функция валидации пароля
            function validatePassword(password) {
                const value = password.value;
                if (!value) {
                    showError(password, 'Введите пароль');
                    return false;
                } else if (value.length < 4) {
                    showError(password, 'Пароль должен быть минимум 4 символа');
                    return false;
                } else if (value.length > 30) {
                    showError(password, 'Пароль не должен превышать 30 символов');
                    return false;
                }

                // Проверка сложности пароля
                let strength = '';
                if (value.length >= 8 && /[a-z]/.test(value) && /[A-Z]/.test(value) && /[0-9]/.test(value)) {
                    strength = ' (сильный)';
                } else if (value.length >= 6 && (/[a-z]/.test(value) || /[A-Z]/.test(value)) && /[0-9]/.test(value)) {
                    strength = ' (средний)';
                } else {
                    strength = ' (слабый)';
                }

                showSuccess(password, 'Пароль принят' + strength);
                return true;
            }

            // Функция валидации логина/email для авторизации
            function validateLoginOrEmail(field) {
                const value = field.value.trim();
                if (!value) {
                    showError(field, 'Введите логин или email');
                    return false;
                } else if (value.length < 3) {
                    showError(field, 'Минимум 3 символа');
                    return false;
                }
                showSuccess(field, 'OK');
                return true;
            }

            // Функция показа ошибки
            function showError(input, message) {
                input.classList.add('error');
                input.classList.remove('valid');

                const formGroup = input.closest('.form-group');
                if (formGroup) {
                    const errorDiv = formGroup.querySelector('.error-message');
                    if (errorDiv) {
                        errorDiv.textContent = message;
                        errorDiv.classList.add('show');
                    }

                    const successDiv = formGroup.querySelector('.success-message');
                    if (successDiv) {
                        successDiv.classList.remove('show');
                    }
                }
            }

            // Функция показа успеха
            function showSuccess(input, message) {
                input.classList.remove('error');
                input.classList.add('valid');

                const formGroup = input.closest('.form-group');
                if (formGroup) {
                    const errorDiv = formGroup.querySelector('.error-message');
                    if (errorDiv) {
                        errorDiv.classList.remove('show');
                    }

                    const successDiv = formGroup.querySelector('.success-message');
                    if (successDiv) {
                        successDiv.textContent = message;
                        successDiv.classList.add('show');
                    }
                }
            }

            // Добавляем сообщения об ошибках и успехе, если их нет
            function addValidationMessages() {
                const formGroups = document.querySelectorAll('.form-group');
                formGroups.forEach(group => {
                    if (!group.querySelector('.error-message')) {
                        const errorDiv = document.createElement('div');
                        errorDiv.className = 'error-message';
                        group.appendChild(errorDiv);
                    }
                    if (!group.querySelector('.success-message')) {
                        const successDiv = document.createElement('div');
                        successDiv.className = 'success-message';
                        group.appendChild(successDiv);
                    }
                });
            }

            // Добавляем стили для валидации
            function addValidationStyles() {
                const style = document.createElement('style');
                style.textContent = `
            .form-group input.error {
                border-color: #dc3545 !important;
                background-color: #fff8f8 !important;
            }
            .form-group input.valid {
                border-color: #28a745 !important;
                background-color: #f8fff8 !important;
            }
            .error-message {
                color: #dc3545;
                font-size: 12px;
                margin-top: 5px;
                display: none;
            }
            .error-message.show {
                display: block;
            }
            .success-message {
                color: #28a745;
                font-size: 12px;
                margin-top: 5px;
                display: none;
            }
            .success-message.show {
                display: block;
            }
        `;
                document.head.appendChild(style);
            }

            // Активация валидации для формы регистрации
            function initRegistrationValidation() {
                const regLogin = document.getElementById('regLogin');
                const regEmail = document.getElementById('regEmail');
                const regPassword = document.getElementById('regPassword');

                if (regLogin) {
                    regLogin.addEventListener('input', function () { validateLogin(this); });
                    regLogin.addEventListener('blur', function () { validateLogin(this); });
                }

                if (regEmail) {
                    regEmail.addEventListener('input', function () { validateEmail(this); });
                    regEmail.addEventListener('blur', function () { validateEmail(this); });
                }

                if (regPassword) {
                    regPassword.addEventListener('input', function () { validatePassword(this); });
                    regPassword.addEventListener('blur', function () { validatePassword(this); });
                }
            }

            // Активация валидации для формы авторизации
            function initLoginValidation() {
                const loginUsername = document.getElementById('loginUsername');
                const loginPassword = document.getElementById('loginPassword');

                if (loginUsername) {
                    loginUsername.addEventListener('input', function () { validateLoginOrEmail(this); });
                    loginUsername.addEventListener('blur', function () { validateLoginOrEmail(this); });
                }

                if (loginPassword) {
                    loginPassword.addEventListener('input', function () {
                        if (!this.value) {
                            showError(this, 'Введите пароль');
                        } else {
                            showSuccess(this, 'OK');
                        }
                    });
                    loginPassword.addEventListener('blur', function () {
                        if (!this.value) {
                            showError(this, 'Введите пароль');
                        } else {
                            showSuccess(this, 'OK');
                        }
                    });
                }
            }

            // Переопределяем submit формы регистрации с активной валидацией
            function enhanceRegistrationForm() {
                const regForm = document.getElementById('registerForm');
                if (regForm) {
                    const originalSubmit = regForm.onsubmit;
                    regForm.addEventListener('submit', function (e) {
                        const login = document.getElementById('regLogin');
                        const email = document.getElementById('regEmail');
                        const password = document.getElementById('regPassword');
                        const currentLang = window.currentLang || '';

                        let isValid = true;

                        if (!validateLogin(login)) isValid = false;
                        if (!validateEmail(email)) isValid = false;
                        if (!validatePassword(password)) isValid = false;

                        if (!isValid) {
                            e.preventDefault();
                            alert('Исправьте ошибки в форме!');
                        }
                    });
                }
            }

            // Переопределяем submit формы авторизации с активной валидацией
            function enhanceLoginForm() {
                const loginForm = document.getElementById('loginForm');
                if (loginForm) {
                    loginForm.addEventListener('submit', function (e) {
                        const username = document.getElementById('loginUsername');
                        const password = document.getElementById('loginPassword');
                        const currentLang = window.currentLang || '';

                        let isValid = true;

                        if (!validateLoginOrEmail(username)) isValid = false;
                        if (!password.value.trim()) {
                            showError(password, 'Введите пароль');
                            isValid = false;
                        } else {
                            showSuccess(password, 'OK');
                        }

                        if (!isValid) {
                            e.preventDefault();
                            alert('Исправьте ошибки в форме!');
                        }
                    });
                }
            }

            // Следим за переключением между формами
            function watchFormSwitching() {
                const switchToLogin = document.getElementById('switchToLoginBtn');
                const switchToReg = document.getElementById('switchToRegBtn');

                if (switchToLogin) {
                    switchToLogin.addEventListener('click', function () {
                        setTimeout(initLoginValidation, 100);
                    });
                }

                if (switchToReg) {
                    switchToReg.addEventListener('click', function () {
                        setTimeout(initRegistrationValidation, 100);
                    });
                }
            }

            // Инициализация при загрузке
            addValidationStyles();
            addValidationMessages();
            initRegistrationValidation();
            initLoginValidation();
            enhanceRegistrationForm();
            enhanceLoginForm();
            watchFormSwitching();
        })();
    </script>
</body>

</html>