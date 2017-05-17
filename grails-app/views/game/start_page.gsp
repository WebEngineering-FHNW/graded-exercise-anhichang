<html>
<head>
    <title>
        Welcome to the game
    </title>
    <asset:stylesheet src="startPageStyle.css"/>
</head>

<body>
<div id="header">
    <div class="col span-12"><h1>Welcome to Who Wants To be Millionaire</h1></div>
</div>
    %{--input the name for playing--}%
<div id="main-wrap">
    <div class="col span-12">
        <form action="/game/playGame" method="post">
            <div>
                <input id="userName" type="text" name="userName" value="${userName}" required="true"/>
                <input type="hidden" id="status" type="text" name="status" value=0/>
                <input type="hidden" id="useJoker" type="text" name="useJoker" value=false/>
            </div>
            <div>
                <input id="submitName" type="submit" value="Submit"/>
            </div>
        </form>
    </div>
</div>
</body>
</html>

