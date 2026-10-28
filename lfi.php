<?php
// Faille LFI : le paramètre "page" est inclus sans validation
if (isset($_GET['page'])) {
    $page = $_GET['page'];
    echo "<h2>Contenu de la page :</h2>";
    include($page);
} else {
    echo "Utilisez ?page= pour afficher une page.";
}
?>
