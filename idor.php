<?php
// Faille IDOR : aucune vérification des droits d'accès
$id = $_GET['id'] ?? 1;

if ($id == 1) {
    echo "<h1>Profil de l'utilisateur 1</h1>";
    echo "<p>Nom : John Doe (Utilisateur standard)</p>";
    echo "<p>Email : john@example.com</p>";
} elseif ($id == 2) {
    echo "<h1>Profil de l'utilisateur 2</h1>";
    echo "<p>Nom : Admin (Administrateur)</p>";
    echo "<p>Email : admin@example.com</p>";
    echo "<p>Clé API secrète : AKIAIOSFODNN7EXAMPLE</p>";
} else {
    echo "Utilisateur introuvable.";
}
?>
