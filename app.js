var express = require('express')
var app = express.createServer()
var static = require('node-static');
var jquery = require('jquery');
var io = require('socket.io').listen(app);
var sys = require('util')
var exec = require('child_process').exec;

app.listen(8080);

app.use(express.static(__dirname + "/public"));

app.get('/', function (req, res) {
  res.sendfile(__dirname + '/public/index.html');
});


function puts(error, stdout, stderr) { sys.puts(stdout) }

io.sockets.on('connection', function (socket) {  
  socket.on('mouse', function(data){
      x = data['x']
      y = data['y']
      console.log(y);
      exec("./click -x " + x  + " -y " + y + "", puts);
  })
});