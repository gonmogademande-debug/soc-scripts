#!/bin/bash

LOG=$1
if [ -z "$LOG" ]; then
    echo "Usage: ./detect_complex.sh <fichier.log>"
    exit 1
fi

echo "=========================================="
echo "  RAPPORT DE DÉTECTION AVANCÉE"
echo "  Fichier : $LOG"
echo "  Date : $(date)"
echo "=========================================="

echo ""
echo "[1] INJECTION SQL (sqlmap, UNION, OR 1=1)"
grep -iE "sqlmap|union.*select|or 1=1|%27" $LOG | wc -l
echo "   → Détails :"
grep -iE "sqlmap|union.*select|or 1=1|%27" $LOG | head -3

echo ""
echo "[2] XSS (script, alert, onerror)"
grep -iE "<script>|alert\(|onerror|%3Cscript" $LOG | wc -l
echo "   → Détails :"
grep -iE "<script>|alert\(|onerror|%3Cscript" $LOG | head -3

echo ""
echo "[3] INJECTION DE COMMANDES (;, |, &&)"
grep -iE ";.*(ls|cat|whoami|wget|nc)|&&|\|" $LOG | wc -l
echo "   → Détails :"
grep -iE ";.*(ls|cat|whoami|wget|nc)|&&|\|" $LOG | head -3

echo ""
echo "[4] SCAN DE PORTS (nikto, nmap, dirb)"
grep -iE "nikto|nmap|dirb|gobuster" $LOG | wc -l
echo "   → Détails :"
grep -iE "nikto|nmap|dirb|gobuster" $LOG | head -3

echo ""
echo "[5] FICHIERS SENSIBLES CIBLÉS"
grep -iE "passwd|shadow|\.env|wp-admin|config" $LOG | wc -l
echo "   → Détails :"
grep -iE "passwd|shadow|\.env|wp-admin|config" $LOG | head -3

echo ""
echo "[6] TOP 3 IP LES PLUS ACTIVES"
awk '{print $1}' $LOG | sort | uniq -c | sort -nr | head -3

echo ""
echo "=========================================="
echo "  FIN DU RAPPORT"
echo "=========================================="
