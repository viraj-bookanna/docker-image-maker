const { MongoClient } = require('mongodb');
const config = require('./config');
const fs = require('fs');
require("dotenv").config();
const dbClient = new MongoClient(process.env.MONGODB_URL);

function loadJsonFile(filePath) {
    try {
        const data = fs.readFileSync(filePath, 'utf8');
        const jsonData = JSON.parse(data);
        return jsonData;
    } catch (err) {
        console.error('Error reading or parsing file:', err);
        return null;
    }
}
const responses = loadJsonFile(`${__dirname}/responses.json`);
const client = config.client;
var db;
client.on('ready', async () => {
	await dbClient.connect();
	db = dbClient.db('wauserbot').collection('users');
    console.log('Client is ready!');
});
client.on('message', async msg => {
	let chat = await msg.getChat();
	var user = await db.findOne({id: chat.id});
	if(user==null){
		user = {id: chat.id, number: (await chat.getContact()).number}
		await db.insertOne(user);
	}
	user.lastAutoResp = user.lastAutoResp==null ? {time:0, reacted:0} : user.lastAutoResp;
	if(chat.isGroup || (user.lastAutoResp.time+60*60*1000>Date.now() && user.lastAutoResp.reacted==1)){
		return;
	}
	else if(user.lastAutoResp.time+60*60*1000>Date.now() && user.lastAutoResp.reacted==0){
		msg.react('❤️');
		user.lastAutoResp.reacted = 1;
		await db.updateOne({id: chat.id},{$set: user});
		return;
	}
	const message = msg.body.toLowerCase();
    if(message in responses.direct){
        await chat.sendMessage(responses.direct[message]);
		return;
    }
	for(const key in responses.regex){
		if(responses.regex.hasOwnProperty(key) && new RegExp(key).test(message)){
			await chat.sendMessage(responses.regex[key]);
			return;
		}
	}
	await chat.sendMessage(responses.default);
	user.lastAutoResp = {time: Date.now(), reacted:0};
	await db.updateOne({id: chat.id},{$set: user});
});
client.initialize();
