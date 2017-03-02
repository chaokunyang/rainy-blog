<%--
  Created by IntelliJ IDEA.
  User: chaokunyang
  Date: 2017/2/26
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%--@elvariable id="chatSessionId" type="long"--%>
<template:basic htmlTitle="聊天" bodyTitle="聊天 Chat">
    <jsp:attribute name="extraHeadContent">
        <link rel="stylesheet"
              href="<c:url value="/resource/stylesheet/chat.css" />" />
        <script src="//cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap.min.js"></script>
    </jsp:attribute>
    <jsp:body>
        <div id="chatContainer">
            <div id="chatLog">

            </div>
            <div id="messageContainer">
                <textarea id="messageArea"></textarea>
            </div>
            <div id="buttonContainer">
                <button class="btn btn-primary" onclick="send();">发送</button>
                <button class="btn" onclick="disconnect();">断开</button>
            </div>
        </div>
        <div id="modalError" class="modal hide fade">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>Error</h3>
            </div>
            <div class="modal-body" id="modalErrorBody">A blah error occurred.</div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
        <script type="text/javascript" language="javascript">
            var send, disconnect;
            $(document).ready(function() {
                var modalError = $("#modalError");
                var modalErrorBody = $("#modalErrorBody");
                var chatLog = $('#chatLog');
                var messageArea = $('#messageArea');
                var username = '${sessionScope.username}';
                var otherJoined = false;

                if(!("WebSocket" in window)) {
                    modalErrorBody.text('WebSockets are not supported in this ' +
                        'browser. Try Internet Explorer 10 or the latest ' +
                        'versions of Mozilla Firefox or Google Chrome.');
                    modalError.modal('show');
                    return;
                }

                var infoMessage = function(m) {
                    chatLog.append($('<div>').addClass('informational')
                        .text(moment().format('h:mm:ss a') + ': ' + m));
                };
                infoMessage('正在连接聊天服务器...');

                var objectMessage = function(message) {
                    var log = $('<div>');
                    var date = message.timestamp == null ? '' :
                        moment.unix(message.timestamp).format('h:mm:ss a');
                    if(message.user != null) {
                        var c = message.user == username ? 'user-me' : 'user-you';
                        log.append($('<span>').addClass(c)
                            .text(date+' '+message.user+':\xA0'))
                            .append($('<span>').text(message.content));
                    } else {
                        log.addClass(message.type == 'ERROR' ? 'error' :
                            'informational')
                            .text(date + ' ' + message.content);
                    }
                    chatLog.append(log);
                };

                var server;
                try {
                    server = new WebSocket('ws://' + window.location.host +
                        '<c:url value="/chat/${chatSessionId}" />');
                    server.binaryType = 'arraybuffer'; <%-- 新建chat的时候ChatServlet会设置属性chatSessionId的值为0 --%>
                } catch(error) {
                    modalErrorBody.text(error);
                    modalError.modal('show');
                    return;
                }

                server.onopen = function(event) {
                    infoMessage('已连接到聊天服务器.');
                };

                server.onclose = function(event) {
                    if(server != null)
                        infoMessage('从聊天服务器断开.');
                    server = null;
                    if(!event.wasClean || event.code != 1000) {
                        modalErrorBody.text('Code ' + event.code + ': ' +
                            event.reason);
                        modalError.modal('show');
                    }
                };

                server.onerror = function(event) {
                    modalErrorBody.text(event.data);
                    modalError.modal('show');
                };

                server.onmessage = function(event) {
                    // 使用文本消息要简单得多，这里仅做研究，才使用二进制消息
                    if(event.data instanceof ArrayBuffer) {
                        /*
                        * Although most common Unicode values can be represented with one 16-bit number (as expected early on during JavaScript standardization) and fromCharCode() can be used to return a single character for the most common values (i.e., UCS-2 values which are the subset of UTF-16 with the most common characters), in order to deal with ALL legal Unicode values (up to 21 bits), fromCharCode() alone is inadequate. Since the higher code point characters use two (lower value) "surrogate" numbers to form a single character, String.fromCodePoint() (part of the ES2015 standard) can be used to return such a pair and thus adequately represent these higher valued characters.
                        * *****************************************/
                        var message = JSON.parse(String.fromCharCode.apply(
                            null, new Uint8Array(event.data)
                        ));
                        /*******************************************/
                        objectMessage(message);
                        if(message.type == 'JOINED') {
                            otherJoined = true;
                            if(username != message.user)
                                infoMessage('您正在和h ' +
                                    message.user + '聊天.');
                        }


                    } else {
                        modalErrorBody.text('Unexpected data type [' +
                            typeof(event.data) + '].');
                        modalError.modal('show');
                    }
                };

                send = function() {
                    if(server == null) {
                        modalErrorBody.text('您未连接到聊天服务器!');
                        modalError.modal('show');
                    } else if(!otherJoined) {
                        modalErrorBody.text(
                            '管理员还未加入聊天.');
                        modalError.modal('show');
                    } else if(messageArea.get(0).value.trim().length > 0) {
                        var message = {
                            timestamp: new Date(), type: 'TEXT', user: username,
                            content: messageArea.get(0).value
                        };
                        try {
                            /*
                             * Although most common Unicode values can be represented with one 16-bit number (as expected early on during JavaScript standardization) and fromCharCode() can be used to return a single character for the most common values (i.e., UCS-2 values which are the subset of UTF-16 with the most common characters), in order to deal with ALL legal Unicode values (up to 21 bits), fromCharCode() alone is inadequate. Since the higher code point characters use two (lower value) "surrogate" numbers to form a single character, String.fromCodePoint() (part of the ES2015 standard) can be used to return such a pair and thus adequately represent these higher valued characters.
                             * *****************************************/
                            var json = JSON.stringify(message);
                            var length = json.length;
                            var buffer = new ArrayBuffer(length);
                            var array = new Uint8Array(buffer);
                            for(var i = 0; i < length; i++) {
                                array[i] = json.charCodeAt(i);
                            }

                            /*// To base64 encode a Uint8Array:
                            var u8 = new Uint8Array([65, 66, 67, 68]);
                            var b64encoded = btoa(String.fromCharCode.apply(null, u8));
                            // And to decode the base64 string back to a Uint8Array:
                            var u8_2 = new Uint8Array(atob(b64encoded).split("").map(function(c) { return c.charCodeAt(0); }));*/
                            /*******************************************/
                            server.send(buffer);
                            messageArea.get(0).value = '';
                        } catch(error) {
                            modalErrorBody.text(error);
                            modalError.modal('show');
                        }
                    }
                };

                disconnect = function() {
                    if(server != null) {
                        infoMessage('从聊天服务器断开.');
                        server.close();
                        server = null;
                    }
                };

                window.onbeforeunload = disconnect;
            });
        </script>
    </jsp:body>
</template:basic>

