#!/usr/bin/bash

echo "Choisissez l'environnement (dev, prod, test):"
read choice

case "$choice" in
    "dev"|"prod"|"test")
        export ENVIRON="$choice"
        echo "Variable ENVIRON définie à $ENVIRON"
        ;;
    *)
        echo "Choix invalide. Veuillez choisir dev, prod ou test."
        ;;
esac
