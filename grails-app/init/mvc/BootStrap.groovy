package mvc

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.PRODUCTION) {
            return
        }
        // only in development and test
        Room upper = new Room(description: "5.3A17", capacity: 42).save(failOnError: true)
        Room lower = new Room(description: "5.1H19", capacity: 30).save(failOnError: true)

        Person dierk = new Person(name: "Dierk").save(failOnError: true)
        Person dieter = new Person(name: "Dieter").save(failOnError: true)

        Date today = new Date().clearTime()
        new Booking(room: upper, booker: dierk, day: today - 1, timeSlot: Booking.AM).save(failOnError: true)
        new Booking(room: lower, booker: dierk, day: today, timeSlot: Booking.AM).save(failOnError: true)
        new Booking(room: upper, booker: dierk, day: today + 1, timeSlot: Booking.AM).save(failOnError: true)
        new Booking(room: upper, booker: dieter, day: today, timeSlot: Booking.AM).save(failOnError: true)
        new Booking(room: upper, booker: dieter, day: today, timeSlot: Booking.PM1).save(failOnError: true)

        Answer quest1Answer1 = new Answer(answer: "...einen draufmachen" , correctIncorrect: false).save(failOnError:true)
        Answer quest1Answer2 = new Answer(answer: "...die Nacht durchzechen" , correctIncorrect: false).save(failOnError:true)
        Answer quest1Answer3 = new Answer(answer: "...die Sau rauslassen" , correctIncorrect: true).save(failOnError:true)
        Answer quest1Answer4 = new Answer(answer: "...auf die Kacke hauen", correctIncorrect:false).save(failOnError:true)

        Answer quest2Answer1 = new Answer(answer: "stolze Summe" , correctIncorrect: true).save(failOnError:true)
        Answer quest2Answer2 = new Answer(answer: "selbstbewusste Differenz" , correctIncorrect: false ).save(failOnError:true)
        Answer quest2Answer3 = new Answer(answer: "arroganter Quotient" , correctIncorrect:false ).save(failOnError:true)
        Answer quest2Answer4 = new Answer(answer: "hochmütiges Produkt" , correctIncorrect: false).save(failOnError:true)


        Answer quest3Answer1 = new Answer(answer: "...hinguckends" , correctIncorrect:false ).save(failOnError:true)
        Answer quest3Answer2 = new Answer(answer: "...anschauends" , correctIncorrect:false ).save(failOnError:true)
        Answer quest3Answer3 = new Answer(answer: "...zusehends" , correctIncorrect:true ).save(failOnError:true)
        Answer quest3Answer4 = new Answer(answer: "...glotzends" , correctIncorrect:false ).save(failOnError:true)


        Answer quest4Answer1 = new Answer(answer: "...Westsaxo Fon" , correctIncorrect:false ).save(failOnError:true)
        Answer quest4Answer2 = new Answer(answer: "...Nordklari Nette" , correctIncorrect:false ).save(failOnError:true)
        Answer quest4Answer3 = new Answer(answer: "...Südpo Saune" , correctIncorrect:false ).save(failOnError:true)
        Answer quest4Answer4 = new Answer(answer: "...Ostblock Flöte" , correctIncorrect:true ).save(failOnError:true)


        Answer quest5Answer1 = new Answer(answer: "Baumärkte" , correctIncorrect:false ).save(failOnError:true)
        Answer quest5Answer2 = new Answer(answer: "Möbelhäuser" , correctIncorrect:false ).save(failOnError:true)
        Answer quest5Answer3 = new Answer(answer: "Teppichgeschäfte" , correctIncorrect:false ).save(failOnError:true)
        Answer quest5Answer4 = new Answer(answer: "Fensterläden" , correctIncorrect:true ).save(failOnError:true)


        Answer quest6Answer1 = new Answer(answer: "Euronoten" , correctIncorrect:false ).save(failOnError:true)
        Answer quest6Answer2 = new Answer(answer: "Eurocheques" , correctIncorrect:true ).save(failOnError:true)
        Answer quest6Answer3 = new Answer(answer: "Euroscheine" , correctIncorrect:false ).save(failOnError:true)
        Answer quest6Answer4 = new Answer(answer: "Euromünzen" , correctIncorrect:false ).save(failOnError:true)


        Answer quest7Answer1 = new Answer(answer: "...Oettingers Sattelstange" , correctIncorrect:false ).save(failOnError:true)
        Answer quest7Answer2 = new Answer(answer: "...Veltins Fahrradkette" , correctIncorrect:false ).save(failOnError:true)
        Answer quest7Answer3 = new Answer(answer: "...Diebels Vorderreifen" , correctIncorrect:false ).save(failOnError:true)
        Answer quest7Answer4 = new Answer(answer: "...Becks Rücktritt" , correctIncorrect:true ).save(failOnError:true)

        Answer quest8Answer1 = new Answer(answer: "Baguette & Rotwein" , correctIncorrect:false ).save(failOnError:true)
        Answer quest8Answer2 = new Answer(answer: "Mascara & Lidschatten" , correctIncorrect:false ).save(failOnError:true)
        Answer quest8Answer3 = new Answer(answer: "Freunde & Bekannte" , correctIncorrect:true ).save(failOnError:true)
        Answer quest8Answer4 = new Answer(answer: "Sofa & Sessel" , correctIncorrect:false ).save(failOnError:true)

        Answer quest9Answer1 = new Answer(answer: "Vorname Ryan" , correctIncorrect:true ).save(failOnError:true)
        Answer quest9Answer2 = new Answer(answer: "Ex-Frau Megan Fox" , correctIncorrect:false ).save(failOnError:true)
        Answer quest9Answer3 = new Answer(answer: "Geburtsjahr 1978" , correctIncorrect:false ).save(failOnError:true)
        Answer quest9Answer4 = new Answer(answer: "irische Staatsbürgerschaft" , correctIncorrect:false ).save(failOnError:true)

        Answer quest10Answer1 = new Answer(answer: "Deutschland & Australien" , correctIncorrect:false ).save(failOnError:true)
        Answer quest10Answer2 = new Answer(answer: "Polen & Südafrika" , correctIncorrect:false ).save(failOnError:true)
        Answer quest10Answer3 = new Answer(answer: "Dänemark & Kanada" , correctIncorrect:true ).save(failOnError:true)
        Answer quest10Answer4 = new Answer(answer: "Österreich & Japan" , correctIncorrect:false ).save(failOnError:true)

        Answer quest11Answer1 = new Answer(answer: "Ferrari" , correctIncorrect:false ).save(failOnError:true)
        Answer quest11Answer2 = new Answer(answer: "Mercedes" , correctIncorrect:false ).save(failOnError:true)
        Answer quest11Answer3 = new Answer(answer: "Renault" , correctIncorrect:true ).save(failOnError:true)
        Answer quest11Answer4 = new Answer(answer: "Toyota" , correctIncorrect:false ).save(failOnError:true)

        Answer quest12Answer1 = new Answer(answer: "John Denver" , correctIncorrect:false ).save(failOnError:true)
        Answer quest12Answer2 = new Answer(answer: "Sam Houston" , correctIncorrect:true ).save(failOnError:true)
        Answer quest12Answer3 = new Answer(answer: "Michael Miami" , correctIncorrect:false ).save(failOnError:true)
        Answer quest12Answer4 = new Answer(answer: "Phil A. Delphia" , correctIncorrect:false ).save(failOnError:true)

        Answer quest13Answer1 = new Answer(answer: "Angie von den Stones" , correctIncorrect:false ).save(failOnError:true)
        Answer quest13Answer2 = new Answer(answer: "Manilows Mandy" , correctIncorrect:false ).save(failOnError:true)
        Answer quest13Answer3 = new Answer(answer: "Jacksons Billie Jean" , correctIncorrect:false ).save(failOnError:true)
        Answer quest13Answer4 = new Answer(answer: "Roxanne von The Police" , correctIncorrect:true ).save(failOnError:true)

        Answer quest14Answer1 = new Answer(answer: "Komposthaufen im Garten" , correctIncorrect:false ).save(failOnError:true)
        Answer quest14Answer2 = new Answer(answer: "Luftdruck der Autoreifen" , correctIncorrect:false ).save(failOnError:true)
        Answer quest14Answer3 = new Answer(answer: "Leberflecken auf der Haut" , correctIncorrect: true).save(failOnError:true)
        Answer quest14Answer4 = new Answer(answer: "Aktienfonds bei der Bank" , correctIncorrect:false ).save(failOnError:true)

        Answer quest15Answer1 = new Answer(answer: "Fahrlehrer" , correctIncorrect:false ).save(failOnError:true)
        Answer quest15Answer2 = new Answer(answer: "Karatemeister" , correctIncorrect:false ).save(failOnError:true)
        Answer quest15Answer3 = new Answer(answer: "Kellner" , correctIncorrect:true ).save(failOnError:true)
        Answer quest15Answer4 = new Answer(answer: "Landschaftsarchitekt" , correctIncorrect:false ).save(failOnError:true)

        new Question(question: "Wenn das Wetter gut ist, wird der Bauer bestimmt den Eber, das Ferkel und...?",
                answer1:  quest1Answer1,
                answer2:  quest1Answer2,
                answer3:  quest1Answer3,
                answer4:  quest1Answer4).save(failOnError: true)
        Question question2 = new Question(question: "Was ist meist ziemlich viel?",
                answer1:quest2Answer1,
                answer2:quest2Answer2,
                answer3:quest2Answer3,
                answer4:quest2Answer4,).save(failOnError: true)
        Question question3 = new Question(question: "Wessen Genesung schnell voranschreitet, der erholt sich...?",
                answer1:  quest3Answer1,
                answer2:  quest3Answer2,
                answer3:  quest3Answer3,
                answer4:  quest3Answer4).save(failOnError: true)
        Question question4 = new Question(question: "Natürlich spielten musikalische Menschen auch im...?",
                answer1: quest4Answer1,
                answer2: quest4Answer2,
                answer3: quest4Answer3,
                answer4: quest4Answer4).save(failOnError: true)
        Question question5 = new Question(question: "Wobei gibt es keine geregelten Öffnungszeiten?",
                answer1: quest5Answer1,
                answer2: quest5Answer2,
                answer3: quest5Answer3,
                answer4: quest5Answer4).save(failOnError: true)
        Question question6 = new Question(question: "Was war bereits seit Mai 1969 ein beliebtes Zahlungsmittel im europäischen Raum?",
                answer1: quest6Answer1,
                answer2: quest6Answer2,
                answer3: quest6Answer3,
                answer4: quest6Answer4).save(failOnError: true)
        Question question7 = new Question(question: "Malu Dreyer profitierte Anfang des Jahres von...?",
                answer1: quest7Answer1,
                answer2: quest7Answer2,
                answer3: quest7Answer3,
                answer4: quest7Answer4).save(failOnError: true)
        Question question8 = new Question(question: "Woraus besteht in der Regel eine Entourage?",
                answer1: quest8Answer1,
                answer2: quest8Answer2,
                answer3: quest8Answer3,
                answer4: quest8Answer4).save(failOnError: true)
        Question question9 = new Question(question: "Was haben die Hollywood-Stars Gosling, Reynolds und Phillippe gemeinsam?",
                answer1: quest9Answer1,
                answer2: quest9Answer2,
                answer3: quest9Answer3,
                answer4: quest9Answer4).save(failOnError: true)
        Question question10 = new Question(question: "Welche beiden Staaten einigten sich Ende 2012 über die Festsetzung eines Grenzverlaufs?",
                answer1: quest10Answer1,
                answer2: quest10Answer2,
                answer3: quest10Answer3,
                answer4: quest10Answer4).save(failOnError: true)
        Question question11 = new Question(question: "Seine drei Weltmeister-Titel erfuhr sich Sebastian Vettel mit Motoren von...?",
                answer1: quest11Answer1,
                answer2: quest11Answer2,
                answer3: quest11Answer3,
                answer4: quest11Answer4).save(failOnError: true)
        Question question12 = new Question(question: "Welcher General vertrieb im 19. Jahrhundert die Mexikaner aus dem heutigen US-Bundesstaat Texas?",
                answer1: quest12Answer1,
                answer2: quest12Answer2,
                answer3: quest12Answer3,
                answer4: quest12Answer4).save(failOnError: true)
        Question question13 = new Question(question: "Der Text welches dieser berühmten Songs ist ganz offensichtlich an eine Prostituierte gerichtet?",
                answer1: quest13Answer1,
                answer2: quest13Answer2,
                answer3: quest13Answer3,
                answer4: quest13Answer4).save(failOnError: true)
        Question question14 = new Question(question: "Was soll in bestimmten Abständen nach der sogenannten ABCDE-Regel kontrolliert werden?",
                answer1: quest14Answer1 ,
                answer2: quest14Answer2,
                answer3: quest14Answer3,
                answer4: quest14Answer4).save(failOnError: true)
        Question question15 = new Question(question: "Wer sollte sich mit der Zwanzig nach vier-Stellung auskennen?",
                answer1: quest15Answer1 ,
                answer2: quest15Answer2,
                answer3: quest15Answer3,
                answer4: quest15Answer4 ).save(failOnError: true)

    }

    def destroy = {
    }
}
