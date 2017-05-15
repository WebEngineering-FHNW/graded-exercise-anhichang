<!doctype html>
<html>
<head onload="javascript: status()">
    <title>
        Who Wants to Be a Millionaire?
    </title>
    <asset:stylesheet src="gameStyle.css"/>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/knockout/3.3.0/knockout-min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <g:javascript library="jquery" />
</head>

<body>

<div id="header">
<!-- End und start game -->
    <div class="col span-8" ></div>
    <div class="col span-2" ><g:form class="formStyle" controller="game" action="playGame"><g:submitButton class="buttons" name="Next Question"/></g:form></div>
    <div class="col span-2" ><g:submitButton id="startButton" onClick="startTimer(60)" class="buttons" name="Start"/></div>
</div>

<!-- Name -->
<div>
<div id="main-wrap">
    <div class="col span-12" id="nameOutput">
        <output>${name}</output>
    </div>

<!-- Table and Jokers -->
    <div class="row">
        <div class="col span-4">
           <img src="${resource(dir:"images", file: "5050.png") }" onclick="useJoker()" id="joker" alt="50/50">
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
                <tr id="row1" >
                    <td>1</td>
                    <td>$100</td>
                </tr>
            </table>
        </div>
    </div>
</div>
<!-- Show question -->
<div class="row" style="text-align:center">
    <div  class="col span-12" id="textQuestion" >${question}</div>
</div>
<!-- Show answers -->
<div id="footer">

<div class="row">
    <div class="col span-2"></div>
    <div class="col span-4"><button id="button1" class="buttons" type="button" onclick="validate(${answer1.correctIncorrect})" >${answer1.answer}</button></div>
    <div class="col span-4"><button id="button2" class="buttons" type="button" onclick="validate(${answer2.correctIncorrect})" >${answer2.answer}</button></div>
    <div class="col span-2"></div>
</div>

<div class="row">
    <div class="col span-2"></div>
    <div class="col span-4"><button id="button3" class="buttons" type="button" onclick="validate(${answer3.correctIncorrect})" >${answer3.answer}</button></div>
    <div class="col span-4"><button id="button4" class="buttons" type="button" onclick="validate(${answer4.correctIncorrect})" >${answer4.answer}</button></div>
    <div class="col span-2"></div>
</div>

</div>

    <form style="display: none" action="/game/playGame" id="numberinput" method="post">
        <div>
            <input type="hidden" id="incNumber">
        </div>
        <div>
            <input type="submit" value="Submit"/>
        </div>
    </form>
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
            var a = ${status}
            console.log(a)
            var newNum = (parseInt(a) + 1).toString()
            console.log(newNum)
            document.getElementById("numberinput").value =  newNum;
            var form = document.getElementById("numberinput");
            form.submit()
        }else{
            time = 0
            window.alert("Wrong\nStart again");
            document.getElementById("numberinput").value =  0;
            var form = document.getElementById("numberinput");
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
        var aas = ${status}
        var ee  = "row"+ aas
        console.log(ee)
        document.getElementById(ee).style.backgroundColor = "lightblue";
        if(${joker}){
        document.getElementById("joker").style.visibility = 'hidden';}
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
                document.getElementById("joker").style.visibility = 'hidden';
            }
            <g:remoteFunction controller="game" action="useJoker"/>
        }else{
            window.alert("Joker is already used")
        }
    }


</script>

</body>
</html>