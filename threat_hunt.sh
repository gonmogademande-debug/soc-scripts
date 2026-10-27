#!/bin/bash
echo "=========================================="
echo "  THREAT HUNTING - CROISEMENT D'IOC"
echo "=========================================="
LOG="$HOME/soc-scripts/attack.log"
BLACKLIST="$HOME/soc-scripts/blacklist.txt"

echo "[1] Vérification des IP suspectes dans les logs..."
MATCHES=$(grep -F -f "$BLACKLIST" "$LOG")

if [ -z "$MATCHES" ]; then
    echo "✅ Aucune IP de la liste noire trouvée."
else
    echo "⚠️ ALERTE : IP malveillantes détectées !"
    echo "$MATCHES"
    
    echo ""
    echo "[2] Extraction des IP uniques compromises :"
    echo "$MATCHES" | awk '{print $1}' | sort | uniq -c | sort -nr
fi
echo "=========================================="
