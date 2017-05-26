package mvc


class GameController {

    //this is the first page to see and there is a name input field
    def start() {
            render view: "start_page"
    }

    // this is the logic of the game
    def playGame(String userName, int status, boolean useJoker) {
        
        List<Quiz> quizzes = Quiz.list()
        Quiz quiz = quizzes[status]

        if (status < 15) {
            render view: "game", model: [userName: userName,
                                         question: quiz.question,
                                         answer1 : quiz.answer1,
                                         answer2 : quiz.answer2,
                                         answer3 : quiz.answer3,
                                         answer4 : quiz.answer4,
                                         status  : status,
                                         joker   : useJoker
            ]
        } else {
            // if the status reach 15, the won page will appear
            render view: "won", model: [userName: userName]
        }
    }

}
