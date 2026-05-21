
---

### 📄 **FILE 2: installer.sh (Main Installer)**

```bash
#!/bin/bash
# =============================================
# TERMINAL ANONYMOUS INSTALLER
# Author: @Whois_Marz?
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

# Copy scripts to home
echo "[5/5] Installing Terminal Anonymous scripts..."

# Copy menu script
cat > ~/anonymous-menu << 'EOF'
# Isi dengan menu.sh dari bawah
EOF

# Copy install-tools script
cat > ~/install-tools << 'EOF'
# Isi dengan install-tools.sh dari bawah
EOF

# Copy update script
cat > ~/update-anonymous << 'EOF'
# Isi dengan update.sh dari bawah
EOF

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
