package mvc


class GameController {


    def start() {
            render view: "start_page"
    }

    def playGame(String userName, int status, boolean useJoker) {
        int newStatus = status
        String name = userName
        boolean usedJoker = useJoker

        List<Question> questions = Question.list()
        Question currentQuestion = questions[newStatus]

        if (newStatus < 15) {
            render view: "game", model: [userName: name,
                                         question: currentQuestion.question,
                                         answer1 : currentQuestion.answer1,
                                         answer2 : currentQuestion.answer2,
                                         answer3 : currentQuestion.answer3,
                                         answer4 : currentQuestion.answer4,
                                         status  : newStatus,
                                         joker   : usedJoker
            ]
        } else {
            render view: "won", model: [userName: name]
        }
    }

}
