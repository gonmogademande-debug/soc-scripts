<?php
// Faille SQLi : la requête est construite sans protection
if (isset($_GET['username']) && isset($_GET['password'])) {
    $username = $_GET['username'];
    $password = $_GET['password'];
    
    $query = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
    
    echo "Requête exécutée : " . $query . "<br><br>";
    
    if ($username === "' OR '1'='1" || $password === "' OR '1'='1") {
        echo "Connexion réussie ! (injection SQL détectée)";
    } else {
        echo "Connexion échouée.";
    }
} else {
    echo "Utilisez ?username=...&password=...";
}
?>
