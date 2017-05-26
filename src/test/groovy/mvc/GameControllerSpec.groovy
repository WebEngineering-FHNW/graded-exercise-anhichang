package mvc

import geb.spock.GebSpec
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * Created by anhichang on 17.05.17.
 */

@TestFor(GameController)
@Mock([Quiz,Answer])
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



}
