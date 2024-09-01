const { Client, LocalAuth } = require('whatsapp-web.js');

client_config = {
    puppeteer: {
        headless: true,
        args: ['--no-sandbox', '--disable-setuid-sandbox'],
    },
    authStrategy: new LocalAuth({
        clientId: "wauserbot"
    })
}
module.exports = {
	client: new Client(client_config),
}