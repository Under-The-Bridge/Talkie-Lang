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
                <?php if (!isset($_COOKIE["user"])): ?>
                    <a href="auth.php">Вход</a>
                    <a href="auth.php">Регистрация</a>
                <?php else: ?>
                    <a href="logout.php">logout</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</header>