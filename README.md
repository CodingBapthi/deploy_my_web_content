# Folder Transfer and Unpacking Bash Script

## Overview
This repository contains a Bash script designed to automate the process of compressing a local folder, transferring it to a remote server, and subsequently unpacking it in a specified directory on that server. It's ideal for users who frequently transfer files between local and remote systems and want to save time and manual effort.

## Functionality
The script performs the following tasks:
1. **Compression:** Compresses a local folder into a `.tar.gz` archive.
2. **Transfer:** Securely transfers the archive using `scp` to a target server.
3. **Unpacking:** Unpacks the archive on the remote server into a specified folder.
4. **Cleanup:** Moves the contents of the unpacked folder into a specified HTML folder and deletes temporary files.

## Features
- **User-friendly prompts:** The script prompts the user for all required information (paths, server details, etc.).
- **Default values:** Default values are set for each prompt to speed up and simplify usage.
- **Error handling:** Basic checks ensure that each step is successfully completed.

## Prerequisites
- Bash shell environment
- `tar` installed for compression
- `scp` installed for secure file transfer
- SSH access to the target server

## Usage
Clone the repository and execute the script in your Bash shell. Follow the prompts to specify the local folder, target server details, and paths.

## Customization
The script can be easily customized to fit specific requirements. Users can change default values in the script files according to their needs.

## Contributions
Improvements and suggestions are always welcome! Feel free to open issues or create pull requests.

