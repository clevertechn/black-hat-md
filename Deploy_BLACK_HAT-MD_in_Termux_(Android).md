BLACK HAT-MD - Termux Deployment

[clevertechn/black-hat-md](https://github.com/clevertechn/black-hat-md) on Android using Termux.

The upstream repository does not include Termux-specific instructions. This guide covers a stable method using Debian PRoot, which is required because native dependencies (`sharp`, `sqlite3`, `ffmpeg-static`) do not provide official binaries for Android/Termux.

Requirements
- **OS:** Android 8+
- **Node.js:** >= 20.0.0
- **npm:** >= 10.0.0
- **Packages:** git, ffmpeg, python3, make, g++

Method 1: Recommended (Debian PRoot - No Root)

This isolates the bot in a Debian environment, avoiding native module failures.

**1. Setup Termux & Debian**

Install Termux from [F-Droid](https://f-droid.org/en/packages/com.termux/) and run:

```sh
pkg update -y && pkg upgrade -y
pkg install -y proot-distro tmux
proot-distro install debian
proot-distro login debian
> All commands below should be executed *inside Debian*.

*2. Install Dependencies*
apt update && apt upgrade -y
apt install -y ca-certificates curl git python3 make g++ ffmpeg
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt install -y nodejs
node -v && npm -v
*3. Install Bot*
git clone https://github.com/clevertechn/black-hat-md.git
cd black-hat-md
npm install --omit=dev --no-audit --no-fund
*4. Configure & Start*

Get your `SESSION_ID` from the official pairing site:
- Pairing: https://sessions.clevertech.qzz.io/pair/
- QR: https://sessions.clevertech.qzz.io/qr

Never commit your `SESSION_ID`. Treat it as a password.
read -r -s -p 'Paste your private SESSION_ID: ' SESSION_ID
export SESSION_ID
npm start
Method 2: Native Termux (Experimental)

This may fail with `sharp` / `ffmpeg-static` platform errors.
pkg update -y && pkg upgrade -y
pkg install -y git nodejs-lts python build-essential clang ffmpeg
git clone https://github.com/clevertechn/black-hat-md.git
cd black-hat-md
npm install --omit=dev --no-audit --no-fund
npm start
If it fails, use *Method 1*.

Keeping the Bot Alive

Run in the outer Termux shell:
termux-wake-lock
tmux new -s blackhat-md
proot-distro login debian
cd ~/black-hat-md && export SESSION_ID="your_session" && npm start
- Detach: `Ctrl + B` then `D`
- Reattach: `tmux attach -t blackhat-md`
- Stop: `Ctrl + C` inside tmux
- Disable wake-lock: `termux-wake-unlock`

Set Termux battery optimization to *Unrestricted* in Android settings. For 24/7 uptime, a VPS is recommended.

Troubleshooting
Error	Solution
`Unsupported engine`	Upgrade to Node 20+ and npm 10+
`sharp` / `ffmpeg-static` error	You are in native Termux. Switch to Debian PRoot
`sqlite3` build failed	`apt install python3 make g++` inside Debian and reinstall
`Connection Closed` / `479`	This is a Baileys retry issue. Do not run the same session in two places. Generate a new SESSION_ID
Bot stops on sleep	Enable `termux-wake-lock` and unrestricted battery usage
Security Notice

- Do not share your `SESSION_ID`
- Do not push `.env` with live credentials
- The repository tracks `.env` by default; add your real values only locally

Credits

- Base Project: https://github.com/clevertechn/black-hat-md
- Termux: https://github.com/termux/termux-app / https://github.com/termux/proot-distro
- NodeSource: https://github.com/nodesource/distributions
- 