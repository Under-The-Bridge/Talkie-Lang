<header>
    <div class="nav-bar">
        <div class="container header">
            <div>
                <a class="header-btns" href="/?lang=<?= $_SESSION["lang"] ?>">Talkie Lang</a>
                <a class="header-btns" href="/league">Лига</a>
                <?php if (!isset($_SESSION["lang"])): ?>
                    <a class="header-btns" href="/dictionary">Словарь</a>
                <?php endif; ?>
                <a class="header-btns" href="/letters">Алфавит</a>
                <a class="header-btns" href="/dictionary">Словарь</a>
                <div class="dropdown">
                    <button class="header-btns" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Языки
                    </button>
                    <ul class="dropdown-menu">
                        <?php
                        $langs = mysqli_fetch_all(mysqli_query($conn, "select DISTINCT lang_id, lang_name from langs join  lesson on langs.lang_id = lesson.lesson_language"));
                        foreach ($langs as $lang): ?>
                            <li><a class="dropdown-item header-btns" href="/?lang=<?= $lang[0] ?>">
                                    <?= $lang[1] ?>
                                </a></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            </div>
            <div>
                <?php if (!isset($_SESSION["id"])): ?>
                    <a class="header-btns" href="/welcome/">Вход</a>
                    <a class="header-btns" href="/register/">Регистрация</a>
                <?php else: ?>
                    <p class="xp"><?= $user["user_weekly_xp"] ?> XP</p>
                    <a class="header-btns" href="/profile/">Профиль</a>
                    <a class="header-btns" href="/logout.php">Выйти</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</header>