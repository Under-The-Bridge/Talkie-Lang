<header>
    <div class="nav-bar">
        <div>
            <div>
                <a class="header-btns" href="/en">Talkie Lang</a>
                <a class="header-btns" href="/league">Лига</a>
                <div class="dropdown">
                    <button class="header-btns" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        Языки
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item header-btns" href="/en/">Английский</a></li>
                        <li><a class="dropdown-item header-btns" href="/jp/">Японский</a></li>
                    </ul>
                </div>
                <a class="header-btns" href="/en/letters">Алфавит</a>
                <a class="header-btns" href="/dictionary">Словарь</a>
            </div>
            <div>
                <?php if (!isset($_SESSION["id"])): ?>
                    <a class="header-btns" href="/auth/">Вход</a>
                    <a class="header-btns" href="/register/">Регистрация</a>
                <?php else: ?>
                    <p class="xp"><?= $user["user_weekly_xp"] ?> XP</p>
                    <a class="header-btns" href="/profile/">Профиль</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</header>