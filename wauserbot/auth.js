const { Client, LocalAuth } = require('whatsapp-web.js');
const { write, clean } = require("./session");
const qrcode = require('qrcode-terminal');
const config = require('./config');

clean();
const client = new Client(config.client_config);
client.on('qr', (qr) => {
    console.log('QR received');
	qrcode.generate(qr, {small: true});
});
client.on('ready', () => {
    console.log('Client is ready!');
    client.destroy();
    console.log("Please wait...");
    setTimeout(async () => {
        console.log("Session has been created");
        await write(process.env.SESSION_PASSWORD);
        process.exit();
    }, 3000);
});
client.initialize();
