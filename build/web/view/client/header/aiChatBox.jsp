<%-- 
    Document   : aiChatBox
    Created on : Jun 3, 2025, 11:15:25 PM
    Author     : 12
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChatBot</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <!-- Material Design CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/4.0.2/bootstrap-material-design.css">
    <!-- Material Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!-- Custom Styles -->
    <style>
        html, body {
            background: #efefef;      
            height:100%;  
        }
        #chat-circle {
            position: fixed;
            bottom: 150px; /* Tăng khoảng cách từ bottom để tránh chồng lên */
            right: 50px;
            background: #5A5EB9;
            width: 80px;
            height: 80px;  
            border-radius: 50%;
            color: white;
            padding: 28px;
            cursor: pointer;
            box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
            z-index: 1000; /* Đảm bảo chat circle luôn ở trên cùng */
        }
        .chat-box {
            display:none;
            background: #efefef;
            position:fixed;
            right:30px;
            bottom:150px; /* Điều chỉnh để tránh chồng lên phần tử khác */
            width:350px;
            max-width: 85vw;
            max-height:70vh; /* Giới hạn chiều cao để không chiếm hết màn hình */
            border-radius:5px;  
            box-shadow: 0px 5px 35px 9px #ccc;
            z-index: 1001; /* Đảm bảo chat box luôn ở trên cùng */
        }
        .chat-box-toggle {
            float:right;
            margin-right:15px;
            cursor:pointer;
        }
        .chat-box-header {
            background: #5A5EB9;
            height:70px;
            border-top-left-radius:5px;
            border-top-right-radius:5px; 
            color:white;
            text-align:center;
            font-size:20px;
            padding-top:17px;
        }
        .chat-box-body {
            position: relative;  
            height:370px;  
            height:auto;
            border:1px solid #ccc;  
            overflow: hidden;
        }
        .chat-box-body:after {
            content: "";
            opacity: 0.1;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            height:100%;
            position: absolute;
            z-index: -1;   
        }
        #chat-input {
            background: #f4f7f9;
            width:100%; 
            position:relative;
            height:47px;  
            padding-top:10px;
            padding-right:50px;
            padding-bottom:10px;
            padding-left:15px;
            border:none;
            resize:none;
            outline:none;
            border:1px solid #ccc;
            color:#888;
            border-top:none;
            border-bottom-right-radius:5px;
            border-bottom-left-radius:5px;
            overflow:hidden;  
        }
        .chat-input > form {
            margin-bottom: 0;
        }
        .chat-submit {  
            position:absolute;
            bottom:3px;
            right:10px;
            background: transparent;
            box-shadow:none;
            border:none;
            border-radius:50%;
            color:#5A5EB9;
            width:35px;
            height:35px;  
        }
        .chat-logs {
            padding:15px; 
            height:300px; /* Giảm chiều cao để phù hợp với max-height của chat-box */
            overflow-y:scroll;
        }
        .chat-logs::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            background-color: #F5F5F5;
        }
        .chat-logs::-webkit-scrollbar {
            width: 5px;  
            background-color: #F5F5F5;
        }
        .chat-logs::-webkit-scrollbar-thumb {
            background-color: #5A5EB9;
        }
        
        /* Responsive adjustments */
        @media only screen and (max-width: 500px) {
            .chat-logs {
                height:30vh;
            }
            .chat-box {
                right: 10px;
                bottom: 120px;
                width: calc(100vw - 20px);
                max-width: none;
            }
            #chat-circle {
                right: 20px;
                bottom: 120px;
            }
        }
        
        /* Thêm media query để xử lý trên tablet */
        @media only screen and (max-width: 768px) {
            .chat-box {
                bottom: 130px;
                right: 20px;
            }
            #chat-circle {
                bottom: 130px;
                right: 30px;
            }
        }
        
        .chat-msg.user > .msg-avatar img {
            width:45px;
            height:45px;
            border-radius:50%;
            float:left;
            width:15%;
        }
        .chat-msg.self > .msg-avatar img {
            width:45px;
            height:45px;
            border-radius:50%;
            float:right;
            width:15%;
        }
        .cm-msg-text {
            background:white;
            padding:10px 15px 10px 15px;  
            color:#666;
            max-width:75%;
            float:left;
            margin-left:10px; 
            position:relative;
            margin-bottom:20px;
            border-radius:30px;
        }
        .chat-msg {
            clear:both;    
        }
        .chat-msg.self > .cm-msg-text {  
            float:right;
            margin-right:10px;
            background: #5A5EB9;
            color:white;
        }
    </style>
</head>
<body>
    <!-- Chat Circle Button -->
    <div id="chat-circle" class="btn btn-raised">
        <div id="chat-overlay"></div>
        <i class="material-icons">speaker_phone</i>
    </div>
    
    <!-- Chat Box -->
    <div class="chat-box">
        <div class="chat-box-header">
            ChatBot
            <span class="chat-box-toggle"><i class="material-icons">close</i></span>
        </div>
        <div class="chat-box-body">
            <div class="chat-box-overlay"></div>
            <div class="chat-logs"></div>
        </div>
        <div class="chat-input">
            <form>
                <input type="text" id="chat-input" placeholder="Gửi tin nhắn..."/>
                <button type="submit" class="chat-submit" id="chat-submit"><i class="material-icons">send</i></button>
            </form>
        </div>
    </div>
    
    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
    <script>
        var INDEX = 0;
        
        function generate_message(msg, type) {
            INDEX++;
            var str = "";
            str += "<div id='cm-msg-" + INDEX + "' class=\"chat-msg " + type + "\">";
            str += "          <span class=\"msg-avatar\">";
            str += "            <img src=\"https://image.crisp.im/avatar/operator/196af8cc-f6ad-4ef7-afd1-c45d5231387c/240/?1483361727745\">";
            str += "          </span>";
            str += "          <div class=\"cm-msg-text\">";
            str += msg;
            str += "          </div>";
            str += "        </div>";
            $(".chat-logs").append(str);
            $("#cm-msg-" + INDEX).hide().fadeIn(300);
            if (type == 'self') {
                $("#chat-input").val('');
            }
            $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight }, 1000);
        }
        
        $("#chat-submit").click(function(e) {
            e.preventDefault();
            var msg = $("#chat-input").val();
            if (msg.trim() == '') {
                return false;
            }
            generate_message(msg, 'self');
            sendMessageToAPI(msg);
        });
        
        async function sendMessageToAPI(msg) {
            generate_message('Đang tải...', 'user');
            const loadingIndex = INDEX;
            try {
                const response = await fetch(
                    'https://openrouter.ai/api/v1/chat/completions',
                    {
                        method: 'POST',
                        headers: {
                            Authorization: 'Bearer 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',
                            'HTTP-Referer': 'http://localhost:9900/',
                            'X-Title': 'SiteName',
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({
                            model: 'deepseek/deepseek-r1:free',
                            messages: [{ role: 'user', content: msg }],
                        }),
                    }
                );
                const data = await response.json();
                const markdownText = data.choices?.[0]?.message?.content || 'Không nhận được phản hồi.';
                const parsedResponse = marked.parse(markdownText);
                // Xóa thông báo đang tải
                $("#cm-msg-" + loadingIndex).remove();
                // Thêm phản hồi của bot
                generate_message(parsedResponse, 'user');
            } catch (error) {
                // Xóa thông báo đang tải
                $("#cm-msg-" + loadingIndex).remove();
                generate_message('Lỗi: ' + error.message, 'user');
            }
        }
        
        // Chuyển đổi hiển thị hộp chat
        $("#chat-circle").click(function() {
            $("#chat-circle").hide();
            $(".chat-box").show();
        });
        
        $(".chat-box-toggle").click(function() {
            $("#chat-circle").show();
            $(".chat-box").hide();
        });
    </script>
</body>
</html>