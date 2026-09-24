# BLACK HAT-MD

> **WhatsApp Multi-Device bot deployment repository by Clever Tech Nexus.**
>
> This repository is the deployment wrapper for the Black Hat-MD runtime. The runtime source and release build are maintained in [`clevertechn/black-hat-md-core`](https://github.com/clevertechn/black-hat-md-core).

[![Deploy on Heroku](https://img.shields.io/badge/Deploy%20on-Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)](https://dashboard.heroku.com/new?template=https://github.com/clevertechn/black-hat-md)
[![Deploy on Railway](https://img.shields.io/badge/Deploy%20on-Railway-111111?style=for-the-badge&logo=railway&logoColor=white)](https://railway.app/)
[![Deploy on Render](https://img.shields.io/badge/Deploy%20on-Render-46E3B7?style=for-the-badge&logo=render&logoColor=111111)](https://render.com/)
[![Docker](https://img.shields.io/badge/Run%20with-Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docs.docker.com/get-started/)

## Quick actions

| Action | Link |
| --- | --- |
| **Fork this repository** | [Fork on GitHub](https://github.com/clevertechn/black-hat-md/fork) |
| **Download the source** | [Download ZIP](https://github.com/clevertechn/black-hat-md/archive/refs/heads/main.zip) |
| **Core runtime** | [`black-hat-md-core`](https://github.com/clevertechn/black-hat-md-core) |
| **Report a bug** | [Open an issue](https://github.com/clevertechn/black-hat-md/issues) |

## What this repository does

`black-hat-md` is the deployment-facing repository. At startup, it loads the published Black Hat-MD core release and starts the bot. This keeps deployment files and runtime source separate while allowing the core release to be updated independently.

For contributors who need to change bot behavior, commands, database logic, connection handling, or media utilities, work in [`black-hat-md-core`](https://github.com/clevertechn/black-hat-md-core). For ordinary deployment, use this repository.

## Requirements

- Node.js **20 or newer**
- A WhatsApp session ID or a phone number for pairing
- A PostgreSQL database for hosted deployments that use `DATABASE_URL`
- FFmpeg for media features; the included Docker image installs it automatically

## Session and pairing

Create a session ID using one of the available pairing services:

| Method | Link |
| --- | --- |
| **Session / pairing service 1** | [Open session service](https://sessionn.clevertech.qzz.io) |
| **Pairing service 2** | [Open pairing service](https://pair.clevertech.qzz.io) |

Your session ID should begin with:

```text
BlackHat~
```

Keep your session ID private. Do not publish it in issues, screenshots, README files, or public logs.

## Environment variables

The minimum configuration is:

```env
SESSION_ID=BlackHat~your_session_id_here
MODE=public
TIME_ZONE=Africa/Nairobi
```

| Variable | Required | Default | Description |
| --- | ---: | --- | --- |
| `SESSION_ID` | Recommended | Empty | Compressed WhatsApp session. Must start with `BlackHat~`. |
| `PAIRING_PHONE` | Alternative | Empty | International phone number used for pairing when `SESSION_ID` is not set. Example: `2557XXXXXXXX`. |
| `MODE` | No | `public` | Set to `public` or `private`. |
| `TIME_ZONE` | No | `Africa/Nairobi` | IANA timezone used by bot features. |
| `DATABASE_URL` | Hosted database | Empty | PostgreSQL connection string. If omitted, the bot uses its local JSON fallback. |
| `AUTO_READ_STATUS` | No | `false` | Set to `true` to automatically read statuses. |
| `AUTO_LIKE_STATUS` | No | `false` | Set to `true` to automatically like statuses. |
| `RUN_MODE` | No | `local` | Set to `production` on hosted deployments. |
| `WA_CONNECT_TIMEOUT_MS` | No | `60000` | WhatsApp socket connection timeout in milliseconds. |
| `WA_QUERY_TIMEOUT_MS` | No | `60000` | WhatsApp query timeout in milliseconds. |
| `MAX_RECONNECT_ATTEMPTS` | No | `0` | Maximum reconnect attempts. `0` means keep retrying. |

## Deploy on a hosting platform

### Heroku

1. Click **Deploy to Heroku** using the button above.
2. Set `SESSION_ID`, `MODE`, and `TIME_ZONE` in the Heroku form.
3. Provision PostgreSQL, or provide your own `DATABASE_URL`.
4. Deploy the app and review the logs for `Connection Instance is Online`.

The repository includes `app.json`, Heroku buildpacks, and `heroku.yml` for deployment configuration.

### Railway

1. Create a new Railway project from this GitHub repository.
2. Add a PostgreSQL service and connect its `DATABASE_URL` to the bot service.
3. Add `SESSION_ID`, `MODE`, and `TIME_ZONE` as service variables.
4. Deploy using the included `Dockerfile` and health check at `/readyz`.

### Render

The included `render.yaml` defines a web service and PostgreSQL database. To deploy:

1. Create a new **Blueprint** on Render.
2. Select this repository.
3. Add the secret `SESSION_ID` when prompted.
4. Deploy and monitor the service health at `/readyz`.

### Docker

Build and run the included image:

```bash
docker build -t black-hat-md .
docker run -d \
  --name black-hat-md \
  --restart unless-stopped \
  -p 5000:5000 \
  -e SESSION_ID='BlackHat~your_session_id_here' \
  -e MODE=public \
  -e TIME_ZONE=Africa/Nairobi \
  black-hat-md
```

For production, provide `DATABASE_URL` and persist the authentication directory so a container restart does not require a new login:

```bash
-v black-hat-auth:/app/black_hat/session
```

### VPS or panel hosting

```bash
npm ci
npm start
```

If the panel runs a direct startup command, use:

```bash
node index.js
```

Do not commit `node_modules`, local auth files, database files, or real credentials.

## Health checks

The bot exposes these HTTP endpoints:

| Endpoint | Purpose |
| --- | --- |
| `/` | Status page |
| `/health` | Process liveness and current connection state |
| `/readyz` | Readiness check; returns success when WhatsApp is connected |

A `503` response from `/readyz` while the bot is reconnecting is expected. The process should remain alive and retry the connection.

## Troubleshooting

### `connection close due to 408`

A `408` is a WhatsApp connection timeout. Check that the host allows outbound WebSocket/HTTPS traffic, then restart or redeploy once. The current core release retries transient timeouts automatically. You can increase the timeouts if the host is slow:

```env
WA_CONNECT_TIMEOUT_MS=90000
WA_QUERY_TIMEOUT_MS=90000
```

### The bot asks for a phone number unexpectedly

Set either `SESSION_ID` or `PAIRING_PHONE`. Confirm that the variable is configured on the running service, not only in a local `.env` file.

### The bot logs out or reports a bad session

Generate a fresh session ID and replace the old one. Never share the session value publicly.

### PostgreSQL connection problems

Verify that `DATABASE_URL` is a valid PostgreSQL URL and that the provider accepts connections from the hosting platform. The local JSON fallback is intended for simple local use, not multi-instance production deployments.

### Media commands fail

Confirm that FFmpeg is installed and executable. The included Dockerfile installs FFmpeg; on a VPS, install it with the operating system package manager.

## Local development

```bash
git clone https://github.com/clevertechn/black-hat-md.git
cd black-hat-md
npm ci
cp .env.example .env  # if you maintain a local example file
npm run dev
```

The deployment repository is intentionally small. Runtime changes should be made in [`black-hat-md-core`](https://github.com/clevertechn/black-hat-md-core), then tested through the published release before redeploying this wrapper.

## Security notes

- Never commit real `SESSION_ID`, API keys, database URLs, or private tokens.
- Restrict access to deployment logs because startup errors can contain operational details.
- Use one WhatsApp session per bot instance unless the core documentation explicitly supports otherwise.
- Rotate a credential immediately if it is exposed in a public repository, issue, log, or screenshot.

## License and attribution

This project is maintained by [Clever Tech Nexus](https://github.com/clevertechn). See [LICENSE](https://github.com/clevertechn/black-hat-md/blob/main/LICENSE) in the core repository for licensing information.

Built for the Black Hat-MD community by [clevertechn](https://github.com/clevertechn).
