#!/bin/bash

# Chemin vers le fichier de log
LOG_FILE="$HOME/soc-scripts/server.log"

# Vérification de l'existence du fichier
if [ ! -f "$LOG_FILE" ]; then
    echo "Erreur : le fichier $LOG_FILE n'existe pas."
    exit 1
fi

echo "=========================================="
echo "  RAPPORT D'ANALYSE DU SERVEUR WEB"
echo "  Fichier : $LOG_FILE"
echo "  Date : $(date)"
echo "=========================================="

echo ""
echo "[1] NOMBRE TOTAL DE REQUÊTES"
wc -l < "$LOG_FILE"

echo ""
echo "[2] TOP 5 DES IP (Qui a fait le plus de requêtes ?)"
# On extrait l'IP (ex: 127.0.0.1:32924 -> 127.0.0.1)
awk '{print $5}' "$LOG_FILE" | cut -d':' -f1 | sort | uniq -c | sort -nr | head -5

echo ""
echo "[3] DÉTECTION D'ATTAQUES IDOR"
grep -i "idor.php" "$LOG_FILE" || echo "Aucune attaque IDOR détectée."

echo ""
echo "[4] DÉTECTION D'ATTAQUES XSS"
grep -i "script" "$LOG_FILE" || echo "Aucune attaque XSS détectée."

echo ""
echo "[5] DÉTECTION D'ERREURS 4xx (Requêtes suspectes)"
grep -E "\[4[0-9]{2}\]" "$LOG_FILE" || echo "Aucune erreur 4xx détectée."

echo ""
echo "=========================================="
echo "  FIN DU RAPPORT"
echo "=========================================="
