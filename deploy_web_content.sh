#!/bin/bash

# Standardwerte setzen
default_local_folder="./your_folder"
default_host_alias="your_host"
default_remote_folder="your_remote_folder"
# Your Folder for deploy in this case a html folder
default_html_folder="./your_remote_html_folder"
default_archive_name="your_archiv.tar.gz"
default_unpack_folder="./your_unpack_folder"

# Fragen nach dem lokalen Ordner, der komprimiert werden soll
read -p "Geben Sie den Pfad zum lokalen Ordner an [$default_local_folder]: " local_folder
local_folder=${local_folder:-$default_local_folder}

# Fragen nach dem Host-Alias aus der SSH-Konfiguration
read -p "Geben Sie den Host-Alias für den Zielserver an [$default_host_alias]: " host_alias
host_alias=${host_alias:-$default_host_alias}

# Fragen nach dem Zielordner auf dem Zielserver
read -p "Geben Sie den Pfad zum Zielordner auf dem Server an [$default_remote_folder]: " remote_folder
remote_folder=${remote_folder:-$default_remote_folder}

# Fragen nach dem Pfad zum HTML-Ordner auf dem Zielserver
read -p "Geben Sie den Pfad zum HTML-Ordner auf dem Server an [$default_html_folder]: " html_folder
html_folder=${html_folder:-$default_html_folder}

# Fragen nach dem Namen des Archivs
read -p "Geben Sie einen Namen für das Archiv ein (z.B. mein_archiv.tar.gz) [$default_archive_name]: " archive_name
archive_name=${archive_name:-$default_archive_name}

# Fragen nach dem Namen des Entpack-Ordners auf dem Server
read -p "Geben Sie den Namen des Ordners an, in den auf dem Server entpackt werden soll [$default_unpack_folder]: " unpack_folder
unpack_folder=${unpack_folder:-$default_unpack_folder}

# Komprimieren des Ordners
tar -zcvf "$archive_name" -C "$local_folder" .

# Kopieren des Archivs zum Zielserver
scp "$archive_name" "$host_alias:$remote_folder"

# Entpacken des Archivs auf dem Server in den angegebenen Ordner, Verschieben des Inhalts in den HTML-Ordner
ssh "$host_alias" "
    mkdir -p '$remote_folder/$unpack_folder' &&
    tar -zxvf '$remote_folder/$archive_name' -C '$remote_folder/$unpack_folder' &&
    mv '$remote_folder/$unpack_folder'/* '$html_folder/' &&
    rm -rf '$remote_folder/$unpack_folder' &&
    rm '$remote_folder/$archive_name'"
