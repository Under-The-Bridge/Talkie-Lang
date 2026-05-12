<header>
    <div class="nav-bar">
        <div>
            <div>
                <a href="/en">Talkie Lang</a>
                <a href="/league">Лига</a>
                <a href="/langs">Языки</a>
                <a href="/en/letters">Алфавит</a>
                <a href="/dictionary">Словарь</a>
            </div>
            <div>
                <?php if (!isset($_SESSION["id"])): ?>
                    <a href="/auth/">Вход</a>
                    <a href="/register/">Регистрация</a>
                <?php else: ?>
                    <p class="xp"><?=$user["user_weekly_xp"]?> XP</p>
                    <a href="/profile/">Профиль</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</header>