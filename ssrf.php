<?php
// Faille SSRF : le serveur va chercher l'URL fournie par l'utilisateur
if (isset($_GET['url'])) {
    $url = $_GET['url'];
    echo "<h2>Récupération de l'URL : $url</h2>";
    
    // Le serveur exécute la requête (très dangereux !)
    $content = @file_get_contents($url);
    
    if ($content === false) {
        echo "Impossible de récupérer le contenu.";
    } else {
        echo "<textarea rows='10' cols='50'>" . htmlspecialchars($content) . "</textarea>";
    }
} else {
    echo "Utilisez ?url= pour récupérer une URL.";
}
?>
