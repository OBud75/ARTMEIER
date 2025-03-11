#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Ce script doit être exécuté en tant qu'admin (root)."
    exit 1
fi

echo "Ajout de la variable d'environnement personnalisée..."
echo 'export TP_105="/home/teo/Linux_B2_2025/TP_105"' | tee -a /etc/skel/.bashrc /etc/skel/.profile

echo "Ajout de l'alias personnalisé..."
echo 'alias ll="ls -lah --color=auto"' | tee -a /etc/skel/.bashrc

echo "Mise à jour des fichiers ~/.bashrc et ~/.profile pour les nouveaux utilisateurs."

echo "Souhaitez-vous appliquer ces modifications immédiatement pour l'utilisateur actuel ? (o/n)"
read -r reponse
if [[ "$reponse" =~ ^[oO]$ ]]; then
    echo 'export MON_REPERTOIRE="/home/$USER/mon_dossier"' >> ~/.bashrc
    echo 'alias ll="ls -lah --color=auto"' >> ~/.bashrc
    source ~/.bashrc
    echo "Modifications appliquées au shell actuel."
fi

echo "Script terminé."
