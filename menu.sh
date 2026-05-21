#!/bin/bash

TOOL_CONFIG="$HOME/.terminal-anonymous/installed-tools"
mkdir -p "$HOME/.terminal-anonymous"

# Function to check installed tools
check_tools() {
    command -v nmap &>/dev/null && NMAP=1 || NMAP=0
    command -v hydra &>/dev/null && HYDRA=1 || HYDRA=0
    command -v sqlmap &>/dev/null && SQLMAP=1 || SQLMAP=0
    command -v john &>/dev/null && JOHN=1 || JOHN=0
    command -v aircrack-ng &>/dev/null && AIRCRACK=1 || AIRCRACK=0
    command -v msfconsole &>/dev/null && MSF=1 || MSF=0
    command -v nikto &>/dev/null && NIKTO=1 || NIKTO=0
    command -v gobuster &>/dev/null && GOBUSTER=1 || GOBUSTER=0
    
    cat > "$TOOL_CONFIG" << EOF
NMAP=$NMAP
HYDRA=$HYDRA
SQLMAP=$SQLMAP
JOHN=$JOHN
AIRCRACK=$AIRCRACK
MSF=$MSF
NIKTO=$NIKTO
GOBUSTER=$GOBUSTER
EOF
}

check_tools

# Main menu loop
while true; do
    clear
    echo "┌─────────────────────────────────────────────────────────────────┐"
    echo "│                                                                 │"
    echo "│   █████╗ ███╗   ██╗ ██████╗ ███╗   ██╗██╗   ██╗███╗   ███╗      │"
    echo "│  ██╔══██╗████╗  ██║██╔═══██╗████╗  ██║██║   ██║████╗  ████║      │"
    echo "│  ███████║██╔██╗ ██║██║   ██║██╔██╗ ██║██║   ██║██╔████╔██║      │"
    echo "│  ██╔══██║██║╚██╗██║██║   ██║██║╚██╗██║██║   ██║██║╚██╔╝██║      │"
    echo "│  ██║  ██║██║ ╚████║╚██████╔╝██║ ╚████║╚██████╔╝██║ ╚═╝ ██║      │"
    echo "│  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝      │"
    echo "│                                                                 │"
    echo "│                  TERMINAL ANONYMOUS v2.0                         │"
    echo "└─────────────────────────────────────────────────────────────────┘"
    echo ""
    echo "  ╔═══════════════════════════════════════════════════════════════╗"
    echo "  ║                        🔧 MAIN TOOLS                          ║"
    echo "  ╠═══════════════════════════════════════════════════════════════╣"
    
    [ $NMAP -eq 1 ] && echo "  ║  [1] 🔍 NMAP                      [✅ INSTALLED]             ║" || echo "  ║  [1] 🔍 NMAP                      [❌ NOT INSTALLED]          ║"
    [ $HYDRA -eq 1 ] && echo "  ║  [2] 🗝️  HYDRA                     [✅ INSTALLED]             ║" || echo "  ║  [2] 🗝️  HYDRA                     [❌ NOT INSTALLED]          ║"
    [ $SQLMAP -eq 1 ] && echo "  ║  [3] 💉 SQLMAP                    [✅ INSTALLED]             ║" || echo "  ║  [3] 💉 SQLMAP                    [❌ NOT INSTALLED]          ║"
    [ $JOHN -eq 1 ] && echo "  ║  [4] 🔓 JOHN THE RIPPER           [✅ INSTALLED]             ║" || echo "  ║  [4] 🔓 JOHN THE RIPPER           [❌ NOT INSTALLED]          ║"
    [ $AIRCRACK -eq 1 ] && echo "  ║  [5] 📡 AIRCRACK-NG               [✅ INSTALLED]             ║" || echo "  ║  [5] 📡 AIRCRACK-NG               [❌ NOT INSTALLED]          ║"
    [ $MSF -eq 1 ] && echo "  ║  [6] 💀 METASPLOIT               [✅ INSTALLED]             ║" || echo "  ║  [6] 💀 METASPLOIT               [❌ NOT INSTALLED]          ║"
    [ $NIKTO -eq 1 ] && echo "  ║  [7] 🌐 NIKTO                     [✅ INSTALLED]             ║" || echo "  ║  [7] 🌐 NIKTO                     [❌ NOT INSTALLED]          ║"
    [ $GOBUSTER -eq 1 ] && echo "  ║  [8] 🗂️  GOBUSTER                 [✅ INSTALLED]             ║" || echo "  ║  [8] 🗂️  GOBUSTER                 [❌ NOT INSTALLED]          ║"
    
    echo "  ╠═══════════════════════════════════════════════════════════════╣"
    echo "  ║                                                                 ║"
    echo "  ║  📦 INSTALL MENU                                                ║"
    echo "  ║  [I]  Install tools yang belum terinstall                       ║"
    echo "  ║  [U]  Masuk ke Ubuntu (Kali Environment)                        ║"
    echo "  ║  [R]  Refresh tool status                                       ║"
    echo "  ║  [0]  Exit                                                      ║"
    echo "  ║                                                                 ║"
    echo "  ╚═══════════════════════════════════════════════════════════════╝"
    echo ""
    read -p "  ╰─➤  Pilih menu : " menu
    
    case $menu in
        1) [ $NMAP -eq 1 ] && read -p "Target: " t && nmap -sV -sC $t || echo "Not installed!" ;;
        2) [ $HYDRA -eq 1 ] && read -p "Target: " t && read -p "Service: " s && hydra -l admin -P /data/data/com.termux/files/usr/share/wordlists/small.txt $t $s || echo "Not installed!" ;;
        3) [ $SQLMAP -eq 1 ] && read -p "URL: " t && sqlmap -u $t --batch || echo "Not installed!" ;;
        4) [ $JOHN -eq 1 ] && read -p "Hash file: " f && john $f || echo "Not installed!" ;;
        5) [ $AIRCRACK -eq 1 ] && aircrack-ng --help || echo "Not installed!" ;;
        6) [ $MSF -eq 1 ] && msfconsole || echo "Not installed!" ;;
        7) [ $NIKTO -eq 1 ] && read -p "URL: " t && nikto -h $t || echo "Not installed!" ;;
        8) [ $GOBUSTER -eq 1 ] && read -p "URL: " t && gobuster dir -u $t -w /usr/share/wordlists/dirb/common.txt || echo "Not installed!" ;;
        I|i) bash ~/install-tools ;;
        U|u) proot-distro login ubuntu ;;
        R|r) check_tools ;;
        0) exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    
    [ "$menu" != "0" ] && read -p "Tekan Enter..." 
done
