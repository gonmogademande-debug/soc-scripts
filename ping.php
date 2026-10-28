<?php
// Faille Command Injection : l'entrée utilisateur est passée directement à system()
if (isset($_GET['ip'])) {
    $ip = $_GET['ip'];
    echo "<h2>Résultat du ping :</h2>";
    echo "<pre>";
    system("ping -c 1 " . $ip);
    echo "</pre>";
} else {
    echo "Utilisez ?ip= pour pinguer une adresse.";
}
?>
