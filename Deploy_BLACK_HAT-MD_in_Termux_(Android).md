# Deploy BLACK HAT-MD in Termux (Android)

This guide is for [`clevertechn/black-hat-md`](https://github.com/clevertechn/black-hat-md). The repository README lists hosting options and WhatsApp pairing links, but does not provide Termux-specific installation steps. Its `package.json` requires **Node.js 20 or newer** and **npm 10 or newer** and includes native dependencies such as `sharp`, `sqlite3`, and `ffmpeg-static`.

## Recommended method: Debian inside Termux (no root required)

Use a Debian userland through `proot-distro` rather than installing the bot directly into Termux. The bot uses native modules, and the published `sharp` and `ffmpeg-static` binaries do not list Android/Termux as a supported target.

### 1. Install Termux and Debian

Install Termux from [F-Droid](https://f-droid.org/en/packages/com.termux/) or the [official Termux GitHub releases](https://github.com/termux/termux-app/releases). Open Termux and run:

```sh
pkg update -y && pkg upgrade -y
pkg install -y proot-distro tmux
proot-distro install debian
proot-distro login debian
```

The last command opens a Debian shell. Run the remaining setup commands **inside Debian** unless a step explicitly says “Termux shell.”

### 2. Install build tools, FFmpeg, and Node.js 22

```sh
apt update && apt upgrade -y
apt install -y ca-certificates curl git python3 make g++ ffmpeg
```

Install Node.js 22 from NodeSource. You can inspect the setup script before running it:

```sh
curl -fsSL https://deb.nodesource.com/setup_22.x -o /tmp/nodesource_setup.sh
sed -n '1,160p' /tmp/nodesource_setup.sh
bash /tmp/nodesource_setup.sh
apt install -y nodejs
rm -f /tmp/nodesource_setup.sh
```

Check the versions:

```sh
node --version
npm --version
```

Use a Node version **at least 20** and npm **at least 10**. Node 22 is a good choice for the repository’s dependencies.

### 3. Download and install the bot

```sh
git clone https://github.com/clevertechn/black-hat-md.git
cd black-hat-md
npm install --omit=dev --no-audit --no-fund
```

Use `npm install`, not `npm ci`: the repository does not include a `package-lock.json`.

### 4. Pair WhatsApp and start the bot

Use the pairing instructions linked in the repository’s [README](https://github.com/clevertechn/black-hat-md#readme) (Pair 1, Pair 2, or QR Code) to create your **own** session. The README’s pairing links include:

- [Pairing page](https://sessions.clevertech.qzz.io/pair/)
- [QR page](https://sessions.clevertech.qzz.io/qr)

Treat the resulting `SESSION_ID` like a password. Do not send it to anyone or commit it to GitHub. The repository currently tracks a `.env` file; its `SESSION_ID` and `DATABASE_URL` values were empty when checked, but do **not** put your live session into a commit.

To enter your session privately in the terminal and start the bot:

```sh
read -r -s -p 'Paste your private SESSION_ID: ' SESSION_ID
printf '\n'
export SESSION_ID
npm start
```

The input is hidden while you type. Keep this terminal open. If WhatsApp asks you to link a device, use **WhatsApp → Linked devices → Link a device** and follow the pairing instructions. Leave `DATABASE_URL` unset unless you have intentionally configured your own PostgreSQL database.

## Keep it running in the background

For a Termux shell that you can detach from and return to, run these commands in the **outer Termux shell** before logging into Debian:

```sh
termux-wake-lock
tmux new -s blackhat-md
proot-distro login debian
cd ~/black-hat-md
```

Then enter the session and start the bot using Step 4. To detach from the running bot without stopping it, press **Ctrl+B**, then **D**. To return later:

```sh
tmux attach -t blackhat-md
```

To stop the bot, attach to its `tmux` session and press **Ctrl+C**. When you no longer need the wake lock, run `termux-wake-unlock` in the Termux shell.

Also set Android’s battery use for Termux to **Unrestricted** (wording varies by device), and allow background activity. Android manufacturers may still kill background processes, and the bot will not automatically resume after a phone reboot unless you set up a separate Termux:Boot script.

## If you want to try native Termux instead

Native Termux has Node.js packages and build tools:

```sh
pkg update -y && pkg upgrade -y
pkg install -y git nodejs-lts python build-essential clang binutils pkg-config ffmpeg
node --version
npm --version
```

Then clone the repo and run `npm install --omit=dev --no-audit --no-fund`. However, installation or startup may fail on Android because this project’s native packages do not list Android/Termux as a supported platform. If you see `sharp`, `ffmpeg-static`, or native `sqlite3` errors, use the Debian PRoot method above instead of forcing Linux binaries into Termux.

## Common checks

- **`Unsupported engine`**: check `node --version` and `npm --version`; use Node 20+ and npm 10+.
- **`sharp` or `ffmpeg-static` platform error**: run the project inside Debian PRoot, not native Termux.
- **`sqlite3` build error**: confirm `python3`, `make`, and `g++` were installed inside Debian, then rerun the npm install command.
- **WhatsApp disconnects or fails to pair**: create a fresh session using the README’s pairing flow. Do not run the same WhatsApp session in two bot instances at once.
- **Bot stops when the phone sleeps**: enable Termux’s unrestricted battery/background setting and use `termux-wake-lock`; this still cannot guarantee 24/7 uptime on every Android device.

For dependable 24/7 uptime, a small Linux VPS or supported cloud host is generally more reliable than keeping a phone awake.

## References

- [BLACK HAT-MD README and pairing/deployment links](https://github.com/clevertechn/black-hat-md#readme)
- [BLACK HAT-MD `package.json` (Node requirements and dependencies)](https://github.com/clevertechn/black-hat-md/blob/main/package.json)
- [Termux on F-Droid](https://f-droid.org/en/packages/com.termux/)
- [Termux Node.js package guidance](https://wiki.termux.com/index.php?title=Node.js)
- [Termux `proot-distro`](https://github.com/termux/proot-distro)
- [Sharp installation and supported platforms](https://sharp.pixelplumbing.com/install/)
- [`ffmpeg-static` supported platforms](https://github.com/eugeneware/ffmpeg-static)
- [Termux wake-lock reference](https://wiki.termux.com/wiki/Termux-wake-lock)
- [NodeSource distributions](https://github.com/nodesource/distributions)
