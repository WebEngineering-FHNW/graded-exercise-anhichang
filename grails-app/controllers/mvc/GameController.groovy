package mvc


class GameController {

    static String name
    static boolean usedJoker = false

    def start(String name) {
        this.name = name
        if(name==null){render view: "start_page"
        } else
        {redirect(action:"playGame")}
    }

    def playGame(int status)  {
        int newStatus = status

        List<Question> questions = Question.list()
        Question currentQuestion = questions[newStatus]
        if (newStatus < 15) {
            render view: "game", model: [name    : name,
                                         question: currentQuestion.question,
                                         answer1 : currentQuestion.answer1,
                                         answer2 : currentQuestion.answer2,
                                         answer3 : currentQuestion.answer3,
                                         answer4 : currentQuestion.answer4,
                                         status  : newStatus,
                                         joker   : usedJoker
                                        ]
        } else {
            usedJoker = false
            render view: "won",  model:[name:name]
        }
    }

    def useJoker(){
        usedJoker = true
        redirect(controller: 'game', action:'playGame')
    }

}
