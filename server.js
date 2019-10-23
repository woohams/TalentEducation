const express = require('express');
const app = express();
const https = require('https');
const RTCMultiConnectionServer = require('rtcmulticonnection-server');
const fs = require('fs');
const ejs = require('ejs');
const bodyParser = require('body-parser');
const oracledb = require('oracledb');
oracledb.autoCommit = true;

const options = {
  key: fs.readFileSync('./keys/private.pem'), 
  cert: fs.readFileSync('./keys/public.pem')
};

const jsonPath = {
  config: 'config.json',
  logs: 'logs.json'
};

const BASH_COLORS_HELPER = RTCMultiConnectionServer.BASH_COLORS_HELPER;
const getValuesFromConfigJson = RTCMultiConnectionServer.getValuesFromConfigJson;
const getBashParameters = RTCMultiConnectionServer.getBashParameters;

var config = getValuesFromConfigJson(jsonPath);
config = getBashParameters(config, BASH_COLORS_HELPER);

const server = https.createServer(options, app);

app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.engine('ejs', ejs.renderFile);
app.use(express.static(__dirname + '/public'));
app.use(express.static(__dirname + '/views'));
app.use(express.static(__dirname + '/node_modules'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Socket.io ===================================================================
const io = require('socket.io')(server);

io.on('connection', (socket) => {
  RTCMultiConnectionServer.addSocket(socket, config);
});

// Routes ======================================================================
require('./controllers/route.js')(app, oracledb);

RTCMultiConnectionServer.beforeHttpListen(server, config);
server.listen(3000, function () {
  console.log("HTTPS server is running...");
  RTCMultiConnectionServer.afterHttpListen(server, config);
});
