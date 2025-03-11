#!/bin/bash

afficher_variables() {
    echo "Utilisateur: $USER"
    echo "Répertoire de travail: $PWD"
    echo "PATH: $PATH"
    echo "MON_REPERTOIRE: $MON_REPERTOIRE"
}

creer_repertoire() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "Répertoire '$1' créé avec succès."
    else
        echo "Le répertoire '$1' existe déjà."
    fi
}

supprimer_repertoire() {
    if [ -d "$1" ]; then
        rm -r "$1"
        echo "Répertoire '$1' supprimé avec succès."
    else
        echo "Le répertoire '$1' n'existe pas."
    fi
}

ajouter_variable_bashrc() {
    echo "export $1=\"$2\"" >> ~/.bashrc
    echo "La variable $1 a été ajoutée à ~/.bashrc."
    source ~/.bashrc  # Recharge ~/.bashrc pour prendre en compte la modification
}

echo "Choisissez une option :
1) Afficher les variables d’environnement
2) Créer un répertoire
3) Supprimer un répertoire
4) Ajouter une variable à ~/.bashrc
5) Quitter"

read -p "Entrez votre choix : " choix

case $choix in
    1) afficher_variables ;;
    2) read -p "Nom du répertoire à créer : " rep; creer_repertoire "$rep" ;;
    3) read -p "Nom du répertoire à supprimer : " rep; supprimer_repertoire "$rep" ;;
    4) read -p "Nom de la variable : " var; read -p "Valeur de la variable : " val; ajouter_variable_bashrc "$var" "$val" ;;
    5) echo "Au revoir !"; exit 0 ;;
    *) echo "Option invalide." ;;
esac
