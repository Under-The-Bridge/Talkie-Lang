<?php
require "../../connection-db.php";

$langs = mysqli_fetch_all(mysqli_query($conn, "select * from langs"), MYSQLI_ASSOC);


?>
<!DOCTYPE html>
<html lang="en">


<?php include "../../components/head.php"; ?>

<body>
    <?php include "../../components/header-admin.php"; ?>
    <main class="container">
        <form method="post" action="addLang.php">
            <div class="mb-3">
                <label for="name" class="form-label">Название языка</label>
                <input type="text" class="form-control" id="name" aria-describedby="name" name="name">
            </div>
            <button type="submit" class="btn">Добавить</button>
        </form>
        <table class="table table-striped-columns mt-5">
            <?php foreach ($langs as $lang): ?>
                <tr>
                    <td>Язык: <?= $lang["lang_name"] ?></td>
                    <!-- <td><a href="del.php?id=<?= $lang["lang_id"] ?>">Удалить</a></td> -->
                </tr>
            <?php endforeach; ?>
        </table>
    </main>
</body>

</html>