<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.2.0/socket.io.dev.js"></script>
<style>
	#messages {
    	height:300px;
    }
</style>
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3 col-sm-12">
                <h1 class="text-center">
                	채팅방
                    <button id="clear" class="btn btn-danger">내용삭제</button>
                </h1>
                <div id="status"></div>
                <div id="chat">
                    <input type="text" id="userName" class="form-control"
                    placeholder="이름 입력">
                    <br>
                    <div class="card">
                        <div id="messages" class="card-block">

                        </div>
                    </div>
                    <br>
                    <textarea id="textarea" class="form-control" 
                    placeholder="메세지 입력"></textarea>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        (function() {
            var element = function(id) {
                return document.getElementById(id);
            }
            //Get Elements
            var status = element('status');
            var messages = element('messages');
            var textarea = element('textarea');
            var username = element('userName');
            var clearBtn = element('clear');

            //Set default status
            var statusDefault = status.textContent;
            var setStatus = function(s) {
                //Set status
                status.textContent = s;

                if(s !== statusDefault) {
                    var delay = setTimeout(function() {
                        setStatus(statusDefault);
                    }, 4000);
                }
            }

            //Connect to socket.io
            var socket = io.connect('http://127.0.0.1:4000');

            //Check for connection
            if(socket !== undefined) {
                console.log('Connected to socket');

                //Handle output
                socket.on('output', function(data) {
                    //console.log(data);
                    if(data.length) {
                        for(var x = 0; x < data.length; x++) {
                            //Build out message div
                            var message = document.createElement('div');
                            message.setAttribute('class', 'chat-message');
                            message.textContent = "[ " + data[x].name + " ] : " 
                            + data[x].message;
                            messages.appendChild(message);
                            messages.append(message, messages.lastChild);
                        }
                    }
                });

                //Get Status from server
                socket.on('status', function(data) {
                    //get message status
                    setStatus((typeof data == 'object')? data.message: data);

                    //If status is clear, clear text
                    if(data.clear) {
                        textarea.value = '';
                    }
                });

                //Handle Input
                textarea.addEventListener('keydown', function(event) {
                    if(event.which === 13 && event.shiftKey == false) {
                        //Emit to server input
                        socket.emit('input', {
                            name:username.value,
                            message:textarea.value
                        });

                        event.preventDefault();
                    }
                });

                //Handle chat clear
                clearBtn.addEventListener('click', function() {
                    socket.emit('clear');
                });

                //Clear Message
                socket.on('cleared', function() {
                    messages.textContent = '';
                });

            }
        })();
    </script>
</body>
</html>