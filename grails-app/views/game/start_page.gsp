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
        <form action="/game/start" method="post">
            <div>
                <input id="nameInput" type="text" name="name" value="${name}" required="true"/>
            </div>

            <div>
                <input id="submitName" type="submit" value="Submit"/>
            </div>
        </form>
    </div>
</div>
</body>
</html>

