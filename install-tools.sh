#!/bin/bash

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│                    INSTALL TOOLS MENU                       │"
echo "├─────────────────────────────────────────────────────────────┤"
echo "│                                                             │"
echo "│  [1] NMAP - Network scanner                                 │"
echo "│  [2] HYDRA - Password cracker                               │"
echo "│  [3] SQLMAP - SQL injection tool                            │"
echo "│  [4] JOHN - Hash cracker                                    │"
echo "│  [5] AIRCRACK-NG - WiFi security tool                       │"
echo "│  [6] METASPLOIT - Exploitation framework (BESAR! ~400MB)    │"
echo "│  [7] NIKTO - Web vulnerability scanner                      │"
echo "│  [8] GOBUSTER - Directory busting tool                      │
echo "│                                                             │"
echo "│  [A] Install semua tools                                    │
echo "│  [B] Kembali                                                │"
echo "└─────────────────────────────────────────────────────────────┘"
read -p "Pilih: " pilih

case $pilih in
    1) proot-distro login ubuntu -- bash -c "apt update && apt install -y nmap" ;;
    2) proot-distro login ubuntu -- bash -c "apt update && apt install -y hydra" ;;
    3) proot-distro login ubuntu -- bash -c "apt update && apt install -y sqlmap" ;;
    4) proot-distro login ubuntu -- bash -c "apt update && apt install -y john" ;;
    5) proot-distro login ubuntu -- bash -c "apt update && apt install -y aircrack-ng" ;;
    6) proot-distro login ubuntu -- bash -c "apt update && apt install -y metasploit-framework" ;;
    7) proot-distro login ubuntu -- bash -c "apt update && apt install -y nikto" ;;
    8) proot-distro login ubuntu -- bash -c "apt update && apt install -y gobuster" ;;
    A|a) 
        for i in 1 2 3 4 5 7 8; do
            proot-distro login ubuntu -- bash -c "apt update && apt install -y nmap hydra sqlmap john aircrack-ng nikto gobuster"
        done
        ;;
    B|b) bash ~/anonymous-menu ;;
esac
