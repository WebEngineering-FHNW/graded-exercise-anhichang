package mvc

class GameController {

    static String name = "Anhi"
    static int status = 0
    List<Question> questions = Question.findAll() // note that this is to be executed at Object construction time. You most likely want to do this in your action method.

    def playGame =  {

        Question currentQuestion = questions[status]
        questions.findAll()
        if (status < 10) {
                render view: "game", model: [name    : name,
                                             question: currentQuestion.question,
                                             answer1 : currentQuestion.answer1,
                                             answer2 : currentQuestion.answer2,
                                             answer3 : currentQuestion.answer3,
                                             answer4 : currentQuestion.answer4]
            } else {
                render view: "game"
            }
        questions.size()
    }

    def incCounter = {
        status++
    }
}
