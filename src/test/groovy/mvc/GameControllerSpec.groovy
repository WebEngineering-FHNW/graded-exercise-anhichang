package mvc

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * Created by anhichang on 17.05.17.
 */

@TestFor(GameController)
@Mock([Question,Answer])
class GameControllerSpec extends Specification {
    GameController gameController

    def setup() {
        gameController = new GameController()
    }

    def cleanup() {
    }

    @Unroll
    void "call the starting page"() {
        when:
        gameController.start()

        then:
        view == '/game/start_page'
    }

    @Unroll
    void "call gamePage"() {
        given:
            params.userName = 'name'
            params.status = 0
            params.useJoker = false
        Answer quest1Answer1 = new Answer(answer: "...einen draufmachen" , correctIncorrect: false)
        Answer quest1Answer2 = new Answer(answer: "...die Nacht durchzechen" , correctIncorrect: false)
        Answer quest1Answer3 = new Answer(answer: "...die Sau rauslassen" , correctIncorrect: true)
        Answer quest1Answer4 = new Answer(answer: "...auf die Kacke hauen", correctIncorrect:false)
        Question q = new Question(question: "Wenn das Wetter gut ist, wird der Bauer bestimmt den Eber, das Ferkel und...?",quest1Answer1:quest1Answer1, quest1Answer2: quest1Answer2, quest1Answer3: quest1Answer3, quest1Answer4:quest1Answer4)

        model.question == q.question
        model.answer1 == q.answer1
        model.answer2 == q.answer2
        model.answer3 == q.answer3
        model.answer4 == q.answer4
        when:
        gameController.playGame()
        then:
        view == '/game/playGame'
    }

    @Unroll
    void "win the game"() {
        given:
        params.userName = 'name'
        params.status = 15
        params.useJoker = false

        when:
        gameController.playGame()
        then:
        view == '/game/won'
    }

    @Unroll
    void "redirect to playGame"() {
        given:
        params.userName = 'name'

        when:
        gameController.playGame()
        then:
        view == '/game/playGame'
    }
}
