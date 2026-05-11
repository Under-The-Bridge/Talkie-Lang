<header>
    <div class="nav-bar">
        <div>
            <div>
                <?php if (!isset($_SESSION["lang"])): ?>
                    <a href="/">Talkie Lang</a>
                <?php else: ?>
                    <a href="/<?=$_SESSION["lang"]?>">Talkie Lang</a>
                <?php endif; ?>
                <a href="/league">Лига</a>
                <a href="/langs">Языки</a>
                <a href="">Обучение</a>
                <a href="">О нас</a>
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