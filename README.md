# 🔥 TERMINAL ANONYMOUS v2.0 🔥

Custom Terminal untuk Termux dengan tools hacking lengkap + auto-detect system.

![Version](https://img.shields.io/badge/version-2.0-red)
![Termux](https://img.shields.io/badge/Termux-Android-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## ✨ FITUR

| Fitur | Keterangan |
|-------|-------------|
| 🔧 **Auto-Detect Tools** | Tools yang terinstall muncul di menu, yang belum muncul ❌ |
| 📦 **Install Menu** | Install tools satuan atau sekaligus |
| 🚀 **Auto-Start** | Menu otomatis muncul setiap buka Termux |
| 🐉 **Ubuntu Environment** | Masuk ke Ubuntu buat install tools kompleks |
| 💀 **8+ Tools Hacking** | Nmap, Hydra, SQLMap, John, Aircrack, Metasploit, Nikto, Gobuster |
| 🎨 **Tampilan Keren** | ASCII art + border + warna |

---

## 📋 TOOLS YANG DIDUKUNG

| No | Tools | Fungsi | Size |
|----|-------|--------|------|
| 1 | Nmap | Network scanner | ~15MB |
| 2 | Hydra | Password cracker | ~10MB |
| 3 | SQLMap | SQL injection | ~20MB |
| 4 | John | Hash cracker | ~12MB |
| 5 | Aircrack-ng | WiFi security | ~8MB |
| 6 | Metasploit | Exploitation framework | ~400MB |
| 7 | Nikto | Web scanner | ~10MB |
| 8 | Gobuster | Directory buster | ~8MB |

---

## 🚀 CARA INSTALL (1 JALUR)

### Step 1: Install Termux
Download Termux dari [F-Droid](https://f-droid.org/repo/com.termux_118.apk) (JANGAN dari Play Store, udah outdated)

### Step 2: Buka Termux, kasih izin storage

### Step 3 Install The Client
pkg update && pkg upgrade -y
pkg install git -y
git clone https://github.com/ANONYMOUS/Terminal-Anonymous
cd Terminal-Anonymous
chmod +x installer.sh
bash installer.sh

```
termux-setup-storage
