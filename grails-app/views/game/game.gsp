<!doctype html>
<html>
<head>
    <title>
        Who Wants to Be a Millionaire?
    </title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/knockout/3.3.0/knockout-min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <g:javascript library="jquery"/>
    <asset:stylesheet src="gameStyle.css"/>

</head>

<body onload="javascript: latestStatus()">

<div id="header">
    <!-- End und start game -->
    <div class="col span-8"></div>
    <div class="col span-4"><g:submitButton id="startButton" onClick="startTimer(60)" class="buttons" name="Start"/></div>
</div>

<!-- Name -->
<div>
    <div id="main-wrap">
        <div class="col span-12" id="nameOutput"><output>${userName}</output></div>
        <!-- Table and Jokers -->
        <div class="row">
            <div class="col span-4">
                <img src="${resource(dir: "images", file: "5050.png")}" onclick="useJoker()" id="joker" alt="50/50">
            </div>
            <!-- Timer -->
            <div class="col span-4"><p id="timer"></p></div>

            <div class="col span-4">
                <table>
                    <tr id="row15">
                        <td>15</td>
                        <td>$1 Million</td>
                    </tr>
                    <tr id="row14">
                        <td>14</td>
                        <td>$500'000</td>
                    </tr>
                    <tr id="row13">
                        <td>13</td>
                        <td>$250'000</td>
                    </tr>
                    <tr id="row12">
                        <td>12</td>
                        <td>$125'000</td>
                    </tr>
                    <tr id="row11">
                        <td>11</td>
                        <td>$64'000</td>
                    </tr>
                    <tr id="row10">
                        <td>10</td>
                        <td>$32'000</td>
                    </tr>
                    <tr id="row9">
                        <td>9</td>
                        <td>$16'000</td>
                    </tr>
                    <tr id="row8">
                        <td>8</td>
                        <td>$8'000</td>
                    </tr>
                    <tr id="row7">
                        <td>7</td>
                        <td>$4'000</td>
                    </tr>
                    <tr id="row6">
                        <td>6</td>
                        <td>$2'000</td>
                    </tr>
                    <tr id="row5">
                        <td>5</td>
                        <td>$1'000</td>
                    </tr>
                    <tr id="row4">
                        <td>4</td>
                        <td>$500</td>
                    </tr>
                    <tr id="row3">
                        <td>3</td>
                        <td>$300</td>
                    </tr>
                    <tr id="row2">
                        <td>2</td>
                        <td>$200</td>
                    </tr>
                    <tr id="row1">
                        <td>1</td>
                        <td>$100</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <!-- Show question -->
    <div class="row" style="text-align:center">
        <div class="col span-12" id="textQuestion">${question}</div>
    </div>
    <!-- Show answers -->
    <div id="footer">

        <div class="row">
            <div class="col span-2"></div>
            <div class="col span-4"><button id="button1" class="buttons" type="button" onclick="validate(${answer1.correctIncorrect})">${answer1.answer}</button></div>
            <div class="col span-4"><button id="button2" class="buttons" type="button" onclick="validate(${answer2.correctIncorrect})">${answer2.answer}</button></div>
            <div class="col span-2"></div>
        </div>

        <div class="row">
            <div class="col span-2"></div>
            <div class="col span-4"><button id="button3" class="buttons" type="button" onclick="validate(${answer3.correctIncorrect})">${answer3.answer}</button></div>
            <div class="col span-4"><button id="button4" class="buttons" type="button" onclick="validate(${answer4.correctIncorrect})">${answer4.answer}</button></div>
            <div class="col span-2"></div>
        </div>

    </div>
    <!-- For getting a new Question, called by Javascript -->
    <form style="display:none" id="numberInput" name="myform" action="/game/playGame" method="post">
        <div>
            <input type="hidden" id="status" name="status">
            <input type="hidden" id="useJoker" name="useJoker">
            <input type="hidden" id="userName" name="userName" value="${userName}">
        </div>
    </form>

    <!-- After wrong answer, the modal will appear and disappear automatically -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>Wrong Answer, the game will start again</p>
        </div>
    </div>

</div>

<script>
    var sendJoker = ${joker};
    var time;
    var ticker;
    <!-- when start button clicked, it will call startTimer -->
    function startTimer(secs){
        showQuestionButtons();
        hideStartButton();
        time = parseInt(secs) - 1;
        ticker = setInterval('tick()', 1000);
    }
    <!-- to decrease the timer form 60 -->
    function tick() {
        var secs = time;
        if (secs > 0) {
            time--;
        }
        else {
            clearInterval(ticker);
        }
        document.getElementById("timer").innerHTML = secs;
    }
    <!-- when choose the answer, it will valide the answer and get a new answer from controller, else start new game directly-->
    function validate(bool) {

        if (bool && time > 0) {
            var stat = ${status};
            var newNum = parseInt(stat) + 1;
            document.getElementById("status").value = newNum;
            document.getElementById("useJoker").value = sendJoker;
            var form = document.getElementById("numberInput");
            form.submit();

        } else {
            time = 0;
            f();
            setTimeout(function(){
                document.getElementById("status").value = 0;
                document.getElementById("useJoker").value = false;
                var form = document.getElementById("numberInput");
                form.submit()
            }, 3000)

        }
    }
    <!-- all answer-button plus question are invisible, after clicking start button, all will appear -->
    function showQuestionButtons() {
        document.getElementById("button1").style.visibility = 'visible';
        document.getElementById("button2").style.visibility = 'visible';
        document.getElementById("button3").style.visibility = 'visible';
        document.getElementById("button4").style.visibility = 'visible';
        document.getElementById("textQuestion").style.visibility = 'visible';
    }
    <!-- startButton will disappear, afer klicking -->
    function hideStartButton() {
        document.getElementById("startButton").style.visibility = 'hidden';
    }
    <!-- load the latest status, like "used" or "unused" joker -->
    function latestStatus() {
        var status = "row" + (parseInt(${status}) + 1);
        document.getElementById(status).style.backgroundColor = "lightblue";
        if (${joker}) {
            document.getElementById("joker").style.visibility = 'hidden';
        }
    }
    <!-- after clicking the joker-button, 2 buttons will disappear -->
    function useJoker() {
        var joker = sendJoker;
        if (!joker) {
            var x = Math.floor((Math.random() * 4) + 1);
            var y = Math.floor((Math.random() * 4) + 1);
                while (x === y) {
                    x++;
                    if (x > 4) {
                        x = 1;
                    }
                }
            var check1 = true;
            var check2 = true;
            var count = 2;
            while(count>0){
                while(check1){

                    if(1 === x && !${answer1.correctIncorrect}){
                        document.getElementById("button1").style.visibility = 'hidden';
                        check1 = false;
                        count--;
                    }

                    if(2 === x && !${answer2.correctIncorrect}){
                        document.getElementById("button2").style.visibility = 'hidden';
                        check1 = false;
                        count--;
                    }

                    if(3 === x && !${answer3.correctIncorrect}){
                        document.getElementById("button3").style.visibility = 'hidden';
                        check1 = false;
                        count--;
                    }

                    if(4 === x && !${answer4.correctIncorrect}){
                        document.getElementById("button4").style.visibility = 'hidden';
                        check1 = false;
                        count--;
                    }

                    x++;
                    if(x>4){
                        x = 1;
                    }
                }

                if( x===y){
                    y++;
                    if(y>4){
                        y= 1;
                    }
                }

                while(check2){
                    if(1 === y && !${answer1.correctIncorrect}){
                        document.getElementById("button1").style.visibility = 'hidden';
                        check2 = false;
                        count--;
                    }

                    if(2 === y && !${answer2.correctIncorrect}){
                        document.getElementById("button2").style.visibility = 'hidden';
                        check2 = false;
                        count--;
                    }

                    if(3 === y && !${answer3.correctIncorrect}){
                        document.getElementById("button3").style.visibility = 'hidden';
                        check2 = false;
                        count--;
                    }

                    if(4 === y && !${answer4.correctIncorrect}){
                        document.getElementById("button4").style.visibility = 'hidden';
                        check2 = false;
                        count--;
                    }
                    y++;
                    if(y>4 || y===x){
                        y=1;
                    }
                    if(y===x){
                        y++;
                    }
                }
            }
                sendJoker = true;
            document.getElementById("joker").style.visibility = 'hidden';
        } else {
            window.alert("Joker is already used")
        }
    }
    <!-- call modal-popup when wrong answer -->
    var modal = document.getElementById('modal');
    function f() {
        modal.style.display = "block";
    }
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }

</script>

</body>
</html>