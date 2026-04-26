<header>
    <div class="nav-bar">
        <div>
            <div>
                <a href="/">Talkie Lang</a>
                <a href="">Обучение</a>
                <a href="">Алфавит</a>
                <a href="">Языки</a>
            </div>
            <div>
                <?php if (!isset($_SESSION["id"])): ?>
                    <a href="/auth/">Вход</a>
                    <a href="/register/">Регистрация</a>
                <?php else: ?>
                    <a href="/profile/">Профиль</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</header>