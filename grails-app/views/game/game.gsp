<!doctype html>
<html>
<head>
    <title>
        Who Wants to Be a Millionaire?
    </title>
    <asset:stylesheet src="gameStyle.css"/>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/knockout/3.3.0/knockout-min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <g:javascript library="jquery" />
</head>

<body onload="javascript: status()">

<!-- End und start game -->
<div class="row" >
    <div class="col span-8" style="height: 5vh"></div>
    <div class="col span-2" style="height: 5vh"><g:form class="formStyle" controller="game" action="playGame"><g:submitButton class="buttons" name="Next Question"/></g:form></div>
    <div class="col span-2" style="height: 5vh"><g:submitButton id="startButton" onClick="startTimer(60)" class="buttons" name="Start"/></div>
</div>
<!-- Name -->
<div class="row" >
    <div class="col span-12" id="nameOutput" style="height: 10vh"><output>${name}</output></div>
</div>
<!-- Table and Jokers -->
<div class="row">
        <div class="col span-4" style="height: 45vh">
            <div class="row">
                <div class="col span-12" style="height: 15vh">
                    <img src="${resource(dir:"images", file: "5050.png") }" onclick="useJoker()" id="5050joker" alt="50/50" style="width: 25vw;height:15vh; border-radius: 20px 20px 20px 20px">
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

            <table style="height: 100%">
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

    <div  class="col span-4" style="height: 10vh;visibility: hidden"><button id="button1" class="buttons" type="button" onclick="validate(${answer1.correctIncorrect})">${answer1.answer}</button></div>
    <div class="col span-4" style="height: 10vh;visibility: hidden"><button id="button2" class="buttons" type="button" onclick="validate(${answer2.correctIncorrect})" >${answer2.answer}</button></div>

    <div class="col span-2" style="height: 10vh"></div>
</div>
<div class="row">
    <div class="col span-2" style="height: 10vh"></div>

   <div class="col span-4" style="height: 10vh ;visibility: hidden"><button id="button3" class="buttons" type="button" onclick="validate(${answer3.correctIncorrect})">${answer3.answer}</button></div>
   <div class="col span-4" style="height: 10vh; visibility: hidden "><button id="button4" class="buttons" type="button" onclick="validate(${answer4.correctIncorrect})">${answer4.answer}</button></div>

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
        if(${joker}){
        document.getElementById("5050joker").style.visibility = 'hidden';}
    }

    function useJoker(){
        var joker =${joker};
        var count = 2;
        if(!joker){
            var x = Math.floor((Math.random() * 4) + 1);
            var y = Math.floor((Math.random() * 4) + 1);
            if(count !==0) {
                while (x === y) {
                    x++;
                    if (x > 4) {
                        x = 0
                    }
                }
                var getBoolean;

                switch (x) {

                    case 1:
                        getBoolean =${answer1.correctIncorrect}
                        if (!getBoolean) {
                            document.getElementById("button1").style.visibility = 'hidden';
                            count++
                        }else{
                            x = x+1;
                            count++;
                            document.getElementById("button2").style.visibility = 'hidden';
                        }
                        break;
                    case 2:
                        getBoolean =${answer2.correctIncorrect}
                        if (!getBoolean) {
                            document.getElementById("button2").style.visibility = 'hidden';
                            count++
                        }else{
                            document.getElementById("button3").style.visibility = 'hidden';
                            x++;
                            count++
                        }
                        break;
                    case 3:
                        getBoolean =${answer3.correctIncorrect}
                        if (!getBoolean) {
                            document.getElementById("button3").style.visibility = 'hidden';
                            count++
                        }else{
                            document.getElementById("button4").style.visibility = 'hidden';
                            x++;
                            count++

                        }
                        break;
                    case 4:
                        getBoolean = ${answer4.correctIncorrect}
                        if (!getBoolean) {
                            document.getElementById("button4").style.visibility = 'hidden';
                            count++;
                        }
                        else{
                            document.getElementById("button1").style.visibility = 'hidden';
                            x = x+1;
                            count++;
                        }
                        break;
                }
                if(x===y){
                    y++;
                    if(y>4){
                        y=0
                    }
                }
                switch (y) {

                    case 1:
                        getBoolean = ${answer1.correctIncorrect}
                        if (!getBoolean) {
                            document.getElementById("button1").style.visibility = 'hidden';
                            count++
                        }else{
                            document.getElementById("button2").style.visibility = 'hidden';
                            count++
                        }
                        break;
                    case 2:
                        getBoolean = ${answer2.correctIncorrect}
                        if (!getBoolean) {
                            document.getElementById("button2").style.visibility = 'hidden';
                            count++
                        }else{
                            document.getElementById("button3").style.visibility = 'hidden';
                            count++
                        }
                        break;
                    case 3:
                        getBoolean = ${answer3.correctIncorrect}
                        if (!getBoolean) {
                            document.getElementById("button3").style.visibility = 'hidden';
                            count++
                        }else{
                            document.getElementById("button4").style.visibility = 'hidden';
                            count++
                        }
                        break;
                    case 4:
                        getBoolean = ${answer4.correctIncorrect}
                        if (!getBoolean) {
                            document.getElementById("button4").style.visibility = 'hidden';
                        }else{
                            document.getElementById("button1").style.visibility = 'hidden';
                            count++
                        }
                        break;
                }
                document.getElementById("5050joker").style.visibility = 'hidden';
            }
            <g:remoteFunction controller="game" action="useJoker"/>
        }else{
            window.alert("Joker is already used")
        }
    }


</script>

</body>
</html>