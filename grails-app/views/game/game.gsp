<!doctype html>
<html>
<head>
    <title>
        Who Wants to Be a Millionaire?
    </title>

    <style>
    body{
        background-size: cover;
        background-attachment: fixed;
    }
    div {
        border: 1px solid black;
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
        height:100%;
        font-size : 20px;
        border: 1px ;
        border-radius: 100px;
        margin: 50px 50px 50px 50px;
        background-color: #ededed;
        margin: 0 auto;

    }
    #timer{
        font-size: 120px;
        color: deepskyblue;
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

<body style="background-image:url('${resource(dir: "images/", file: "background.jpg")}')">
<!-- End und start game -->
<div class="row">
    <div class="col span-8" style="height: 5vh"></div>
    <div class="col span-2" style="height: 5vh"><button type="button" onClick="startTimer(60)">Start game</button></div>
    <div class="col span-2" style="height: 5vh"><button type="button" onclick="alert('Hello world!')">End game</button></div>
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
                <tr>
                    <td>15</td>
                    <td>$1 Million</td>
                </tr>
                <tr>
                    <td>14</td>
                    <td>$500'000</td>
                </tr>
                <tr>
                    <td>13</td>
                    <td>$250'000</td>
                </tr>
                <tr>
                    <td>12</td>
                    <td>$125'000</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td>$64'000</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>$32'000</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>$16'000</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>$8'000</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>$4'000</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>$2'000</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>$1'000</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>$500</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>$300</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>$200</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>$100</td>
                </tr>
            </table>
        </div>
</div>
<!-- Show question -->
<div class="row" style="text-align:center">
    <div class="col span-12" style="height: 10vh; font-size: 30px; text-align: center" >${question}</div>
</div>
<!-- Show answers -->
<div class="row">
    <div class="col span-2" style="height: 10vh"></div>
    <div class="col span-4" style="height: 10vh"><button type="button" onclick="alert('Hello world!')">${answer1}</button></div>
    <div class="col span-4" style="height: 10vh"><button type="button" onclick="alert('Hello world!')">${answer2}</button></div>
    <div class="col span-2" style="height: 10vh"></div>
</div>
<div class="row">
    <div class="col span-2" style="height: 10vh"></div>
    <div class="col span-4" style="height: 10vh"><button type="button" onclick="alert('Hello world!')">${answer3}</button></div>
    <div class="col span-4" style="height: 10vh"><button type="button" onclick="alert('Hello world!')">${answer4}</button></div>
    <div class="col span-2" style="height: 10vh"></div>
</div>


<script type = "text/javascript">

    var time;
    var ticker;

    function startTimer(secs){
        time = parseInt(secs)-1;
        ticker = setInterval("tick()",1000);
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
</script>

</body>
</html>