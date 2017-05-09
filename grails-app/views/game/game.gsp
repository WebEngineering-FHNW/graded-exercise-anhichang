<!doctype html>
<html>
<head>
    <title>
        Who Wants to Be a Millionaire?
    </title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/knockout/3.3.0/knockout-min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <g:javascript library="jquery" />

    <style>
    body{
        background-size: cover;
        background-attachment: fixed;
    }
    div {
        border: 1px black;
        text-align: center;
    }
    div.col {
        float: left;
        margin: 0;
        box-sizing: border-box; /* calculate size including the border */
        text-align: center;

    }
    div.row {
        clear: both;
        border-width: 0;
        text-align: center;
        margin: 0 auto;
    }

    button{
        width:80%;
        height:80%;
        font-size : 20px;
        border: 1px ;
        border-radius: 100px;
        background-color: #ededed;
        margin: 0 auto;

    }
    #timer{
        font-size: 120px;
        color: deepskyblue;
    }

    body:before {

        content: '';
        position: fixed;
        width: 100vw;
        height: 100vh;
        background: url('${resource(dir: "images/", file: "background.jpg")}');
        background-position: center center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
        -webkit-filter: blur(5px);
        -moz-filter: blur(5px);
        -o-filter: blur(5px);
        -ms-filter: blur(5px);
        filter: blur(5px);
        z-index: -9;
    }
    div.span-1  { width: calc(100% *  1 / 12); }
    div.span-2  { width: calc(100% *  2 / 12); }
    div.span-3  { background-color: #402878; width: calc(100% *  3 / 12); }
    div.span-4  { width: calc(100% *  4 / 12); }
    div.span-5  { width: calc(100% *  5 / 12); }
    div.span-6  { background-color: #f1f1f1; width: calc(100% *  6 / 12); }
    div.span-7  { width: calc(100% *  7 / 12); }
    div.span-8  { width: calc(100% *  8 / 12); }
    div.span-9  { width: calc(100% *  9 / 12); }
    div.span-10 { width: calc(100% * 10 / 12); }
    div.span-11 { width: calc(100% * 11 / 12); }
    div.span-12 { width: calc(100% * 12 / 12); }

    table {
        align-content: center;
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 90%;
        background-color: #f2f2f2;
        border-radius: 20px 20px 20px 20px;
    }
    tr:nth-child(even) {background-color: #f2f2f2}



    </style>
</head>

<body onload="javascript: status()">

<!-- End und start game -->
<div class="row">
    <div class="col span-8" style="height: 5vh"></div>
    <div class="col span-2" style="height: 5vh"><button id="startButton" type="button" onClick="startTimer(60)">Start game</button></div>
    <div class="col span-2" style="height: 5vh"><button type="button" onclick="alert('Hello world!')">End game</button></div>
    <g:form controller="game" action="playGame">
        <g:submitButton name="Next Question"/>
    </g:form>
</div>
<!-- Name -->
<div class="row" >
    <div class="col span-12" style="height: 10vh"><output>${name}</output></div>
</div>
<!-- Table and Jokers -->
<div class="row">
        <div class="col span-4" style="height: 45vh">
            <div class="row">
                <div class="col span-12" style="height: 15vh">
                    <img src="${resource(dir:"images", file: "5050.png") }" alt="50/50" style="width: 45vh;height:15vh;">
                </div>
            </div>

            <div class="row">
                <div class="col span-12" style="height: 15vh">QQQ</div>
            </div>

            <div class="row">
                <div class="col span-12" style="height: 15vh">3</div>
            </div>
        </div>
    <!-- Timer -->
    <div class="col span-4" style="height: 45vh"><p id="timer"></p></div>

        <div class="col span-4" style="height: 45vh">

            <table style="height: 45vh">
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
                <tr id="row1" >
                    <td>1</td>
                    <td>$100</td>
                </tr>
            </table>
        </div>
</div>
<!-- Show question -->
<div class="row" style="text-align:center">
    <div  class="col span-12" id="textQuestion" style="height: 10vh ;font-size: 30px; text-align: center; visibility: hidden" >${question}</div>
</div>
<!-- Show answers -->
<div class="row" >
    <div class="col span-2" style="height: 10vh"></div>

    <div  class="col span-4" style="height: 10vh;visibility: hidden"><button id="button1" type="button" onclick="validate(${answer1.correctIncorrect})">${answer1.answer}</button></div>
    <div class="col span-4" style="height: 10vh;visibility: hidden"><button id="button2" type="button" onclick="validate(${answer2.correctIncorrect})" >${answer2.answer}</button></div>

    <div class="col span-2" style="height: 10vh"></div>
</div>
<div class="row">
    <div class="col span-2" style="height: 10vh"></div>

   <div class="col span-4" style="height: 10vh ;visibility: hidden"><button id="button3" type="button" onclick="validate(${answer3.correctIncorrect})">${answer3.answer}</button></div>
   <div class="col span-4" style="height: 10vh; visibility: hidden "><button id="button4" type="button" onclick="validate(${answer4.correctIncorrect})">${answer4.answer}</button></div>

    <div class="col span-2" style="height: 10vh"></div>
</div>


<script>

    var time;
    var ticker;

    function startTimer(secs){
        showQuestionButtons();
        hideStartButton();
        time = parseInt(secs)-1;
        ticker = setInterval('tick()',1000);
    }

    function tick() {
        var secs = time;
        if (secs>0) {
            time--;
        }
        else {
            clearInterval(ticker);
        }
        document.getElementById("timer").innerHTML = secs;
    }

    function validate(bool) {

        if(bool && time >0){
            window.alert("Correct");
            time = 0;
            <g:remoteFunction controller="game" action="incCounter"/>
        }else{
            time = 0
            window.alert("Wrong\nStart again");
            <g:remoteFunction controller="game" action="lost"/>
        }
    }

    function showQuestionButtons()
    {
        document.getElementById("button1").style.visibility='visible';
        document.getElementById("button2").style.visibility='visible';
        document.getElementById("button3").style.visibility='visible';
        document.getElementById("button4").style.visibility='visible';
        document.getElementById("textQuestion").style.visibility='visible';
    }

    function hideStartButton()
    {
        document.getElementById("startButton").style.visibility='hidden';
    }

    function status() {
        console.log('row' + ${status})
        document.getElementById("row" + ${status}).style.backgroundColor = "lightblue";
    }


</script>

</body>
</html>