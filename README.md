<div align="center">
  <img src="https://github.com/clevertechnexus.png" alt="Clever Tech Nexus" width="140" />
  <h1>BLACK HAT-MD</h1>
  <p><strong>Powerful Multi-Device WhatsApp Bot</strong></p>
  <p>Automation, media tools, group utilities, games and useful commands in one modern bot.</p>

  <a href="https://github.com/clevertechn/black-hat-md/releases/latest">
    <img src="https://img.shields.io/github/v/release/clevertechn/black-hat-md?style=for-the-badge&logo=github&label=Latest%20Release" alt="Latest release" />
  </a>
  <a href="https://github.com/clevertechn/black-hat-md/stargazers">
    <img src="https://img.shields.io/github/stars/clevertechn/black-hat-md?style=for-the-badge&logo=github" alt="GitHub stars" />
  </a>
  <a href="https://github.com/clevertechn/black-hat-md/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/clevertechn/black-hat-md?style=for-the-badge" alt="License" />
  </a>
</div>

<br />

<div align="center">
  <a href="https://github.com/clevertechn/black-hat-md/fork"><strong>Fork Repository</strong></a>
  ·
  <a href="https://github.com/clevertechn/black-hat-md/releases/latest"><strong>Download Latest Release</strong></a>
  ·
  <a href="https://sessions.clevertech.qzz.io/pair/"><strong>Get Session ID</strong></a>
</div>

---

## About BLACK HAT-MD

**BLACK HAT-MD** is a multi-device WhatsApp bot created by **Clever Tech Nexus**. It is designed for users who want a flexible bot that can be deployed on common hosting platforms and managed through environment variables.

The project combines everyday WhatsApp automation with media utilities, group-management tools, games and a broad command system. Its modular structure also makes it suitable for experimentation and community-driven improvements.

> BLACK HAT-MD is an independent community project and is not affiliated with, endorsed by or sponsored by WhatsApp or Meta.

## Highlights

- Multi-device WhatsApp connection with session pairing and QR support.
- Media downloading, conversion and upload utilities.
- Group-management and moderation commands.
- Auto-reply, presence, status and other configurable automation features.
- Built-in games and interactive command features.
- SQLite by default, with optional PostgreSQL support through `DATABASE_URL`.
- Docker support for deployments that provide a Docker runtime.
- Environment-based configuration so each deployment can use its own settings.

## Quick Start

### 1. Fork or download

Fork the repository on GitHub, or download the [latest release](https://github.com/clevertechn/black-hat-md/releases/latest) as a ZIP archive.

### 2. Configure the environment

Create a `.env` file in the project root. At minimum, provide a session ID:

```env
SESSION_ID=your_session_id_here
```

You can generate a session ID from the [pairing page](https://sessions.clevertech.qzz.io/pair/). Keep your session ID private and never commit it to GitHub.

For an optional PostgreSQL database, add:

```env
DATABASE_URL=postgresql://user:password@host:5432/database
```

If `DATABASE_URL` is omitted, the bot uses its local SQLite database.

### 3. Run locally

```bash
npm install
npm start
```

For development, use:

```bash
npm run dev
```

## Deployment

BLACK HAT-MD includes deployment files for container-based and Node.js hosting environments. Choose the platform that best fits your needs:

| Platform | Deploy or learn more |
| --- | --- |
| Heroku | [Deploy with Heroku](https://dashboard.heroku.com/new?template=https://github.com/clevertechn/black-hat-md) |
| Koyeb | [Deploy with Docker on Koyeb](https://app.koyeb.com/deploy?type=git&amp;repository=clevertechn/black-hat-md/&amp;branch=main&amp;builder=dockerfile) |
| Railway | [Open Railway](https://railway.app/new) |
| Render | [Open Render](https://render.com) |
| CypherXHost | [Open CypherXHost](https://platform.cypherx.store/register?ref=CLEVER15B2F1) |

After deployment, add the required environment variables in the platform's settings and restart the service. Do not place credentials or session IDs directly in source files.

## Session and Pairing

Use any of the following official project tools to connect the bot:

- [Pairing page 1](https://sessions.clevertech.qzz.io/pair/)
- [Pairing page 2](https://sessions.clevertech.qzz.io/pair)
- [QR code page](https://sessions.clevertech.qzz.io/qr)

A session ID grants access to a WhatsApp account. Treat it like a password and rotate it if it becomes exposed.

## Configuration Examples

The bot supports environment-based switches for common behavior. For example:

```env
# Basic connection
SESSION_ID=your_session_id_here

# Optional database
DATABASE_URL=

# Optional status features
AUTO_READ_STATUS=false
AUTO_LIKE_STATUS=false
```

For the special target-reaction feature in the current core runtime, use:

```env
AUTO_REACT_TARGETS_ENABLED=true
```

When enabled, the bot reacts with `🥷` to every message received from the configured target numbers in the runtime. Set it to `false` to disable the feature.

## Updating

Download the newest release from the [GitHub Releases page](https://github.com/clevertechn/black-hat-md/releases/latest). If you deploy from the repository, pull the latest changes and restart the bot:

```bash
git pull origin main
npm install
npm restart
```

## Support and Community

- [WhatsApp Channel](https://whatsapp.com/channel/0029Vb73SRl1CYoLWtyr4u1X)
- [YouTube](https://www.youtube.com/@clevertechn)
- [Telegram](https://t.me/clevertechn)
- [GitHub Issues](https://github.com/clevertechn/black-hat-md/issues)

If you find the project useful, star the repository and share it with other developers.

## License

This project is distributed under the [MIT License](https://github.com/clevertechn/black-hat-md/blob/main/LICENSE).

<div align="center">
  <sub>Built and maintained by <a href="https://github.com/clevertechn">Clever Tech Nexus</a>.</sub>
</div>

[1]: https://github.com/clevertechn/black-hat-md "BLACK HAT-MD GitHub repository"
[2]: https://github.com/clevertechn/black-hat-md/releases/latest "BLACK HAT-MD latest release"
[3]: https://sessions.clevertech.qzz.io/pair/ "BLACK HAT-MD session pairing page"
[4]: https://github.com/clevertechn/black-hat-md/issues "BLACK HAT-MD issue tracker"
