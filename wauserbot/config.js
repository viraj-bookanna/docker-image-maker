const { Client, LocalAuth } = require('whatsapp-web.js');

client_config = {
    puppeteer: {
        /*executablePath: 'C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe',
        args: ['--no-sandbox', '--proxy-server=socks5://127.0.0.1:1080'],*/
        headless: true,
        args: ['--no-sandbox'],
    },
    authStrategy: new LocalAuth({
        clientId: "wauserbot"
    })
}
module.exports = {
	client: new Client(client_config),
}