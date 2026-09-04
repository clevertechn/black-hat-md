const { getSetting } = require("./database/settings");

async function getContextInfo(mentionedJid = []) {
    const botName = await getSetting("BOT_NAME") || "𝐁𝐋𝐀𝐂𝐊 𝐇𝐀𝐓-𝐌𝐃";
    const channelJid = await getSetting("NEWSLETTER_JID") || "120363422524788798@newsletter";
    return {
        mentionedJid,
        forwardingScore: 1,
        isForwarded: true,
        forwardedNewsletterMessageInfo: {
            newsletterJid: channelJid,
            newsletterName: botName,
            serverMessageId: -1
        }
    };
}

module.exports = { getContextInfo };
