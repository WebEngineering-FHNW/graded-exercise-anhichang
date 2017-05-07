package mvc

class GameController {

    static String name = "Anhi"
    static int timer = 60


    def playGame(){

        List<Question> question = Question.getAll()

        render view: "game", model: [name: name, timer:timer, question: question.first().question, answer1: question.first().answer1, answer2: question.first().answer2, answer3: question.first().answer3, answer4: question.first().answer4]
    }
}