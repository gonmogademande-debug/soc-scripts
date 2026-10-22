#!/bin/bash
echo "===== DÉTECTION DE FORCE BRUTE ====="
echo "Fichier : $1"
echo ""
echo "--- IP avec le plus d'échecs ---"
grep "Failed password" $1 | awk '{print $11}' | sort | uniq -c | sort -nr
echo ""
echo "--- Utilisateurs ciblés ---"
grep "Failed password" $1 | awk '{print $9}' | sort | uniq -c
echo ""
echo "--- Connexions réussies ---"
grep "Accepted password" $1
