<!doctype html>
<html>
<head>
    <title>
        Welcome to the game
    </title>
    <asset:stylesheet src="wonStyle.css"/>
</head>

<body>

<div id="header">
    <!-- Display Name -->
    <div class="col span-12"><h1>You just won 1,000,000 Million $ ${name}</h1></div>
</div>
    <!-- Playing game again -->
<div id="main-wrap">
    <div class="col span-12">
        <form action="/game/playGame" method="post">
            <div>
                <input type="hidden" id="nameInput" type="text" name="name" value="${name}" required="true"/>
            </div>

            <div>
                <input id="submitName" type="submit" value="Play Again?"/>
            </div>
        </form>
    </div>
</div>

</body>
</html>