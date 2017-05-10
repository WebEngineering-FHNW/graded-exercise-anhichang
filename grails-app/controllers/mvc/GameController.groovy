package mvc


class GameController {

    static String name = "Anhi"
    static int status = 0
    static boolean usedJoker = false

    def playGame()  {
        List<Question> questions = Question.list()
        Question currentQuestion = questions[status]

            if (status < 15) {
                render view: "game", model: [name    : name,
                                             question: currentQuestion.question,
                                             answer1 : currentQuestion.answer1,
                                             answer2 : currentQuestion.answer2,
                                             answer3 : currentQuestion.answer3,
                                             answer4 : currentQuestion.answer4,
                                             status  : status +1,
                                             joker   : usedJoker
                                            ]
            } else if (status == 15) {
                usedJoker = false
                status = 0
                redirect(controller: 'gameController', action:'playGame')

            }else{
                status = 0
                usedJoker = false
                render view: "won", model: [name : name]
            }
        }

    def incCounter() {
        status++
        redirect(controller: 'game', action:'playGame')
    }

    def lost() {
        status = 0
        usedJoker = false
        render view: "won", model: [name    : name]
    }

    def useJoker(){
        usedJoker = true
        redirect(controller: 'game', action:'playGame')
    }
}
