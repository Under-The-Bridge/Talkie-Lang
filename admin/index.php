<?php
require "../connection-db.php";
if($user["user_role"] != "admin") header("Location: /profile");
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head-admin.php"; ?>

<body>
    <?php include "../components/header-admin.php"; ?>
    <main class="container">
        
    </main>
</body>

</html>