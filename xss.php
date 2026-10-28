<?php
// Faille XSS : le paramètre "name" est affiché sans être nettoyé
if (isset($_GET['name'])) {
    echo "Bonjour, " . $_GET['name'] . " !";
} else {
    echo "Utilisez ?name= pour vous présenter.";
}
?>
