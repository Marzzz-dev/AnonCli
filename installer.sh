#!/bin/bash
# =============================================
# TERMINAL ANONYMOUS INSTALLER
# Author: @WhoIs_Marzz
# Usage: bash installer.sh
# =============================================

clear
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                                                                ║"
echo "║   █████╗ ███╗   ██╗ ██████╗ ███╗   ██╗██╗   ██╗███╗   ███╗     ║"
echo "║  ██╔══██╗████╗  ██║██╔═══██╗████╗  ██║██║   ██║████╗  ████║     ║"
echo "║  ███████║██╔██╗ ██║██║   ██║██╔██╗ ██║██║   ██║██╔████╔██║     ║"
echo "║  ██╔══██║██║╚██╗██║██║   ██║██║╚██╗██║██║   ██║██║╚██╔╝██║     ║"
echo "║  ██║  ██║██║ ╚████║╚██████╔╝██║ ╚████║╚██████╔╝██║ ╚═╝ ██║     ║"
echo "║  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝     ║"
echo "║                                                                ║"
echo "║                  TERMINAL ANONYMOUS INSTALLER                   ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Cek apakah di Termux
if [ -d "/data/data/com.termux" ]; then
    echo "[✓] Termux detected"
else
    echo "[✗] This script only works on Termux!"
    exit 1
fi

# Cek internet
echo -n "[*] Checking internet connection... "
if ping -c 1 google.com &>/dev/null; then
    echo "OK"
else
    echo "FAILED"
    echo "[✗] No internet connection. Please connect to WiFi."
    exit 1
fi

echo ""
echo "[*] Starting installation..."
echo ""

# Update Termux
echo "[1/5] Updating Termux packages..."
pkg update && pkg upgrade -y

# Install dependencies
echo "[2/5] Installing dependencies..."
pkg install -y proot-distro wget git nano curl python

# Install Ubuntu environment
echo "[3/5] Installing Ubuntu environment..."
proot-distro install ubuntu

# Setup Ubuntu base
echo "[4/5] Setting up Ubuntu..."
proot-distro login ubuntu -- bash -c "
    apt update && apt upgrade -y
    apt install -y wget curl git nano
"

# Copy menu script
echo "[5/5] Installing Terminal Anonymous scripts..."

cat > ~/anonymous-menu << 'EOFMENU'
#!/bin/bash

TOOL_CONFIG="$HOME/.terminal-anonymous/installed-tools"
mkdir -p "$HOME/.terminal-anonymous"

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

while true; do
    clear
    echo "┌─────────────────────────────────────────────────────────────────┐"
    echo "│   █████╗ ███╗   ██╗ ██████╗ ███╗   ██╗██╗   ██╗███╗   ███╗      │"
    echo "│  ██╔══██╗████╗  ██║██╔═══██╗████╗  ██║██║   ██║████╗  ████║      │"
    echo "│  ███████║██╔██╗ ██║██║   ██║██╔██╗ ██║██║   ██║██╔████╔██║      │"
    echo "│  ██╔══██║██║╚██╗██║██║   ██║██║╚██╗██║██║   ██║██║╚██╔╝██║      │"
    echo "│  ██║  ██║██║ ╚████║╚██████╔╝██║ ╚████║╚██████╔╝██║ ╚═╝ ██║      │"
    echo "│  ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝      │"
    echo "│                  TERMINAL ANONYMOUS v2.0                         │"
    echo "└─────────────────────────────────────────────────────────────────┘"
    echo ""
    echo "  ╔═══════════════════════════════════════════════════════════════╗"
    echo "  ║                        MAIN MENU                              ║"
    echo "  ╠═══════════════════════════════════════════════════════════════╣"
    echo "  ║                                                                 ║"
    
    [ $NMAP -eq 1 ] && echo "  ║  [1] NMAP                      [INSTALLED]              ║" || echo "  ║  [1] NMAP                      [NOT INSTALLED]          ║"
    [ $HYDRA -eq 1 ] && echo "  ║  [2] HYDRA                     [INSTALLED]              ║" || echo "  ║  [2] HYDRA                     [NOT INSTALLED]          ║"
    [ $SQLMAP -eq 1 ] && echo "  ║  [3] SQLMAP                    [INSTALLED]              ║" || echo "  ║  [3] SQLMAP                    [NOT INSTALLED]          ║"
    [ $JOHN -eq 1 ] && echo "  ║  [4] JOHN THE RIPPER           [INSTALLED]              ║" || echo "  ║  [4] JOHN THE RIPPER           [NOT INSTALLED]          ║"
    [ $AIRCRACK -eq 1 ] && echo "  ║  [5] AIRCRACK-NG               [INSTALLED]              ║" || echo "  ║  [5] AIRCRACK-NG               [NOT INSTALLED]          ║"
    [ $MSF -eq 1 ] && echo "  ║  [6] METASPLOIT               [INSTALLED]              ║" || echo "  ║  [6] METASPLOIT               [NOT INSTALLED]          ║"
    [ $NIKTO -eq 1 ] && echo "  ║  [7] NIKTO                     [INSTALLED]              ║" || echo "  ║  [7] NIKTO                     [NOT INSTALLED]          ║"
    [ $GOBUSTER -eq 1 ] && echo "  ║  [8] GOBUSTER                 [INSTALLED]              ║" || echo "  ║  [8] GOBUSTER                 [NOT INSTALLED]          ║"
    
    echo "  ╠═══════════════════════════════════════════════════════════════╣"
    echo "  ║  [I] Install tools yang belum terinstall                       ║"
    echo "  ║  [U] Masuk ke Ubuntu (Kali Environment)                        ║"
    echo "  ║  [R] Refresh tool status                                       ║"
    echo "  ║  [0] Exit                                                      ║"
    echo "  ╚═══════════════════════════════════════════════════════════════╝"
    echo ""
    read -p "  Pilih menu: " menu
    
    case $menu in
        1) [ $NMAP -eq 1 ] && read -p "Target: " t && nmap -sV -sC $t || echo "Not installed!" ;;
        2) [ $HYDRA -eq 1 ] && read -p "Target: " t && read -p "Service: " s && hydra -l admin -p pass $t $s || echo "Not installed!" ;;
        3) [ $SQLMAP -eq 1 ] && read -p "URL: " t && sqlmap -u $t --batch || echo "Not installed!" ;;
        4) [ $JOHN -eq 1 ] && read -p "Hash file: " f && john $f || echo "Not installed!" ;;
        5) [ $AIRCRACK -eq 1 ] && aircrack-ng --help || echo "Not installed!" ;;
        6) [ $MSF -eq 1 ] && msfconsole || echo "Not installed!" ;;
        7) [ $NIKTO -eq 1 ] && read -p "URL: " t && nikto -h $t || echo "Not installed!" ;;
        8) [ $GOBUSTER -eq 1 ] && read -p "URL: " t && gobuster dir -u $t -w /usr/share/wordlists/dirb/common.txt || echo "Not installed!" ;;
        I|i) 
            clear
            echo "Installing tools..."
            proot-distro login ubuntu -- bash -c "apt update && apt install -y nmap hydra sqlmap john aircrack-ng nikto gobuster"
            check_tools
            echo "Installation complete!"
            sleep 2
            ;;
        U|u) proot-distro login ubuntu ;;
        R|r) check_tools ;;
        0) exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    
    [ "$menu" != "0" ] && read -p "Tekan Enter..."
done
EOFMENU

cat > ~/install-tools << 'EOFINSTALL'
#!/bin/bash
echo "Installing hacking tools..."
proot-distro login ubuntu -- bash -c "
    apt update
    apt install -y nmap hydra sqlmap john aircrack-ng nikto gobuster
"
echo "All tools installed!"
EOFINSTALL

cat > ~/update-anonymous << 'EOFUPD'
#!/bin/bash
cd ~/AnonCli
git pull
cp menu.sh ~/anonymous-menu
cp install-tools.sh ~/install-tools
echo "Update complete!"
EOFUPD

chmod +x ~/anonymous-menu ~/install-tools ~/update-anonymous

# Add alias to bashrc
echo "" >> ~/.bashrc
echo "# Terminal Anonymous" >> ~/.bashrc
echo "alias menu='bash ~/anonymous-menu'" >> ~/.bashrc
echo "alias install-tools='bash ~/install-tools'" >> ~/.bashrc
echo "alias update-anonymous='bash ~/update-anonymous'" >> ~/.bashrc
echo "if [ -z \"\$ANON_STARTED\" ] && [ -f \"\$HOME/anonymous-menu\" ]; then" >> ~/.bashrc
echo "    export ANON_STARTED=1" >> ~/.bashrc
echo "    clear" >> ~/.bashrc
echo "    bash ~/anonymous-menu" >> ~/.bashrc
echo "fi" >> ~/.bashrc

# Setup termux properties
mkdir -p ~/.termux
cat > ~/.termux/termux.properties << 'EOF'
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
bell-character = ignore
use-black-ui = true
EOF

termux-reload-settings

clear
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                                                                ║"
echo "║   ✅ TERMINAL ANONYMOUS v2.0 BERHASIL DIINSTALL!               ║"
echo "║                                                                ║"
echo "║   📌 Cara pake:                                                ║"
echo "║      - Menu otomatis muncul setiap buka Termux                 ║"
echo "║      - Ketik 'menu' jika ingin buka manual                     ║"
echo "║      - Ketik 'install-tools' buat install tools                ║"
echo "║      - Ketik 'update-anonymous' buat update                    ║"
echo "║                                                                ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

read -p "Tekan Enter untuk memulai Terminal Anonymous..."
bash ~/anonymous-menu
