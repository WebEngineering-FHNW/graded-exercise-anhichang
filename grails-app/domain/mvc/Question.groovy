package mvc

class Question {

    String question
    Answer answer1
    Answer answer2
    Answer answer3
    Answer answer4

    String toString() {
        return question + answer1.toString() + answer2.toString() + answer3.toString() + answer4.toString()
    }
    static constraints = {

    }
}
