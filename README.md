🖤 BLACK HAT-MD

<p align="center">
  <img
    src="https://raw.githubusercontent.com/clevertechn/Update/main/file_000000008a7c81f48210c3d702b3858e.png"
    alt="BLACK HAT-MD - WhatsApp Multi-Device Bot"
    width="100%"
  />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/BLACK%20HAT--MD-WhatsApp%20Bot-25D366?style=for-the-badge&logo=whatsapp&logoColor=white" alt="BLACK HAT-MD">
</p><p align="center">
  <strong>A Powerful WhatsApp Multi-Device Bot</strong>
</p><p align="center">
  Built with ❤️ by <strong>Clever Tech Nexus</strong>
</p><p align="center">
  <a href="https://github.com/clevertechn/black-hat-md/fork">
    <img src="https://img.shields.io/github/forks/clevertechn/black-hat-md?style=flat-square&logo=github" alt="Forks">
  </a>
  <a href="https://github.com/clevertechn/black-hat-md/stargazers">
    <img src="https://img.shields.io/github/stars/clevertechn/black-hat-md?style=flat-square&logo=github" alt="Stars">
  </a>
  <a href="https://github.com/clevertechn/black-hat-md/issues">
    <img src="https://img.shields.io/github/issues/clevertechn/black-hat-md?style=flat-square" alt="Issues">
  </a>
  <img src="https://img.shields.io/badge/WhatsApp-Multi--Device-25D366?style=flat-square&logo=whatsapp&logoColor=white" alt="WhatsApp Multi Device">
</p>---

📖 About

BLACK HAT-MD is a WhatsApp Multi-Device bot designed by Clever Tech Nexus to enhance WhatsApp communication through automation, commands, utilities, and customizable features.

The project is designed to be easy to deploy on popular cloud platforms and can also be run locally or with Docker.

---

✨ Features

- 🤖 WhatsApp Multi-Device support
- ⚡ Fast command processing
- 🔐 Session-based authentication
- 🌍 Configurable timezone
- 🗄️ PostgreSQL database support
- 🌐 HTTP health and readiness endpoints
- 🐳 Docker support
- ☁️ Cloud deployment support
- 🔧 Environment-based configuration
- 🛠️ Easy setup and customization

---

🚀 Quick Actions

Action| Description
🍴 Fork Repository| "Fork BLACK HAT-MD" (https://github.com/clevertechn/black-hat-md/fork)
📦 Download ZIP| "Download Source Code" (https://github.com/clevertechn/black-hat-md/archive/refs/heads/main.zip)
🐛 Report Issue| "Open an Issue" (https://github.com/clevertechn/black-hat-md/issues)

---

☁️ Deployment

BLACK HAT-MD can be deployed on several platforms.

Platform| Deployment
🟣 Heroku| "Deploy on Heroku" (https://dashboard.heroku.com/new?template=https://github.com/clevertechn/black-hat-md)
🚂 Railway| "Deploy on Railway" (https://railway.app/)
🟢 Render| "Deploy on Render" (https://render.com/)
🐳 Docker| Use the included "Dockerfile"
💻 Local| Run directly with Node.js

---

📱 Session Setup

BLACK HAT-MD uses a session ID to authenticate your WhatsApp connection.

1. Generate a Session ID

Open the pairing page:

👉 "Generate Session ID" (https://session.clevertech.qzz.io/pair)

2. Session Prefix

Your session ID should start with:

BlackHat~

Example:

BlackHat~xxxxxxxxxxxxxxxx

3. Add the Session ID

Add the session ID to your hosting platform as an environment variable:

SESSION_ID=BlackHat~your_session_id_here

«⚠️ Never share your "SESSION_ID" publicly. Treat it like a private authentication credential.»

---

⚙️ Configuration

BLACK HAT-MD uses environment variables for configuration.

Basic Configuration

SESSION_ID=BlackHat~your_session_id_here
MODE=public
TIME_ZONE=Africa/Nairobi

PostgreSQL

If your deployment requires PostgreSQL, configure:

DATABASE_URL=your_postgresql_connection_url

Example ".env"

SESSION_ID=BlackHat~your_session_id_here
MODE=public
TIME_ZONE=Africa/Nairobi
DATABASE_URL=your_postgresql_connection_url

«💡 Do not commit your ".env" file or private credentials to GitHub.»

---

💻 Local Installation

Requirements

Before running BLACK HAT-MD locally, make sure you have:

- Node.js
- npm
- A valid WhatsApp account
- A generated Session ID

Clone the Repository

git clone https://github.com/clevertechn/black-hat-md.git

Enter the Project Directory

cd black-hat-md

Install Dependencies

npm install

Configure Environment Variables

Create a ".env" file and add:

SESSION_ID=BlackHat~your_session_id_here
MODE=public
TIME_ZONE=Africa/Nairobi

Start the Bot

npm start

For development:

npm run dev

---

🐳 Docker

If you prefer Docker, the repository includes a "Dockerfile".

Build the image:

docker build -t black-hat-md .

Run the container:

docker run -d \
  --name black-hat-md \
  --env-file .env \
  black-hat-md

Check the container:

docker ps

---

❤️ Health & Readiness

BLACK HAT-MD provides HTTP endpoints that can be used by hosting platforms and monitoring services.

Health Check

/health

Used to check whether the application is running.

Readiness Check

/readyz

Used to determine whether the application is ready to receive traffic.

Example:

https://your-domain.com/health

---

🛠️ Available Scripts

Depending on your "package.json", commonly available commands include:

Command| Purpose
"npm install"| Install project dependencies
"npm start"| Start the bot
"npm run dev"| Start in development mode
"npm run setup"| Install/setup project dependencies

---

🔐 Security

Please keep the following information private:

- "SESSION_ID"
- "DATABASE_URL"
- API keys
- Passwords
- Authentication tokens
- Private deployment credentials

Never post credentials in:

- GitHub issues
- WhatsApp groups
- Public repositories
- Screenshots
- Public logs

If a credential is accidentally exposed, revoke or regenerate it as soon as possible.

---

💬 Support & Community

Need help with BLACK HAT-MD?

Resource| Link
📱 WhatsApp Support Group| "Join Group" (https://chat.whatsapp.com/COYNDC7v8iDHNWpweEVp2L)
🔑 Session Generator| "Open Pairing Page" (https://session.clevertech.qzz.io/pair)
🐛 GitHub Issues| "Report a Problem" (https://github.com/clevertechn/black-hat-md/issues)

---

🤝 Contributing

Contributions, bug reports, feature requests, and improvements are welcome.

Before submitting a pull request:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Test your changes locally.
5. Commit your changes.
6. Open a Pull Request.

---

📜 Disclaimer

BLACK HAT-MD is provided for educational and automation purposes.

Users are responsible for how they configure and use the bot. Make sure your usage complies with applicable laws, WhatsApp's terms, and the rights of other users.

---

👨‍💻 Developer

<p align="center">
  <strong>Clever Tech Nexus</strong>
</p><p align="center">
  <a href="https://github.com/clevertechn">
    GitHub
  </a>
</p>---

<p align="center">
  <strong>BLACK HAT-MD</strong><br>
  WhatsApp Multi-Device Bot
</p><p align="center">
  Made with ❤️ by <strong>Clever Tech Nexus</strong>
</p>