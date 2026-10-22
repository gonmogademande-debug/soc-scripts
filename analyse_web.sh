#!/bin/bash
echo "===== ANALYSE LOGS WEB ====="
echo "Fichier : $1"
echo ""
echo "--- Codes de réponse ---"
awk '{print $9}' $1 | sort | uniq -c | sort -nr
echo ""
echo "--- URLs les plus demandées ---"
awk '{print $7}' $1 | sort | uniq -c | sort -nr | head -10
echo ""
echo "--- Méthodes HTTP ---"
awk '{print $6}' $1 | sort | uniq -c
