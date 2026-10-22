#!/bin/bash
echo "===== ANALYSE DE LOGS ====="
echo "Fichier : $1"
echo "Total lignes : $(wc -l < $1)"
echo ""
echo "--- Top 5 IP ---"
awk '{print $1}' $1 | sort | uniq -c | sort -nr | head -5
echo ""
echo "--- Erreurs 4xx ---"
grep -E " 4[0-9]{2} " $1 | wc -l
echo ""
echo "--- User-Agents suspects ---"
grep -iE "sqlmap|curl|python|nmap" $1
