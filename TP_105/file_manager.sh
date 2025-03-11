#!/bin/bash

afficher_menu() {
    echo "\nMenu :"
    echo "1. Créer un répertoire"
    echo "2. Créer un fichier dans un répertoire"
    echo "3. Écrire du contenu dans un fichier"
    echo "4. Afficher le contenu du fichier"
    echo "5. Supprimer le fichier et le répertoire"
    echo "6. Quitter"
    echo -n "Choisissez une option : "
}

creer_repertoire() {
    echo -n "Entrez le nom du répertoire : "
    read nom_repertoire
    mkdir -p "$nom_repertoire" && echo "Répertoire créé avec succès."
}

creer_fichier() {
    echo -n "Entrez le nom du répertoire existant : "
    read nom_repertoire
    if [ -d "$nom_repertoire" ]; then
        echo -n "Entrez le nom du fichier : "
        read nom_fichier
        touch "$nom_repertoire/$nom_fichier" && echo "Fichier créé avec succès."
    else
        echo "Le répertoire n'existe pas."
    fi
}

ecrire_fichier() {
    echo -n "Entrez le chemin du fichier : "
    read chemin_fichier
    if [ -f "$chemin_fichier" ]; then
        echo -n "Entrez le contenu à écrire : "
        read contenu
        echo "$contenu" > "$chemin_fichier" && echo "Contenu écrit avec succès."
    else
        echo "Le fichier n'existe pas."
    fi
}

afficher_fichier() {
    echo -n "Entrez le chemin du fichier : "
    read chemin_fichier
    if [ -f "$chemin_fichier" ]; then
        cat "$chemin_fichier"
    else
        echo "Le fichier n'existe pas."
    fi
}

supprimer_fichier_repertoire() {
    echo -n "Entrez le chemin du fichier à supprimer : "
    read chemin_fichier
    if [ -f "$chemin_fichier" ]; then
        rm "$chemin_fichier" && echo "Fichier supprimé."
    else
        echo "Le fichier n'existe pas."
    fi
    echo -n "Entrez le nom du répertoire à supprimer : "
    read nom_repertoire
    if [ -d "$nom_repertoire" ]; then
        rmdir "$nom_repertoire" 2>/dev/null || rm -r "$nom_repertoire"
        echo "Répertoire supprimé."
    else
        echo "Le répertoire n'existe pas."
    fi
}

while true; do
    afficher_menu
    read choix
    case $choix in
        1) creer_repertoire ;;
        2) creer_fichier ;;
        3) ecrire_fichier ;;
        4) afficher_fichier ;;
        5) supprimer_fichier_repertoire ;;
        6) echo "Au revoir !"; exit 0 ;;
        *) echo "Option invalide, veuillez réessayer." ;;
    esac
    echo ""
done
