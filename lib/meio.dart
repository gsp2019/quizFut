import 'package:flutter/material.dart';
import 'fim.dart';

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => QuizPageState();
}

class Question {
  final String questiontext;
  final int opcaocorreta;
  final List<String> opcao;

  Question(this.questiontext, this.opcaocorreta, this.opcao);
}

class QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;
  int totalPerguntas = 0;
  int pontuacao = 0;

  List<Question> questions = [
    Question(
        'Qual é o time brasileiro com o maior número de títulos internacionais ? ',
        1,
        ['Flamengo', 'Sâo Paulo', ' Gremio', 'Palmeiras']),
    Question('Quem é o maior campeão do Brasileirão?', 0,
        [' Palmeiras', 'Flamengo', ' Coritiba', 'Corinthians']),
    Question('Em que ano o Palmeiras ganhou o Mundial de Clubes?', 2,
        ['1973', '1951', 'Nenhum', '1992']),
    Question('Em que ano o Brasil ganhou sua ultima Copa do mundo?', 1,
        ['2014', '2002', '2010', '1994']),
    Question('Qual jogador tem mais bolas de ouro?', 2,
        ['Cristiano', 'Ronaldinho', 'Messi', 'Maradona']),
    Question('Quem é o maior artilheiro da história das Copas?', 0,
        ['Klose', 'Maradona', ' Messi', 'Cristiano']),
    Question('Quem veste,atualmente,a camisa 10 da seleção brasileira?', 2,
        [' Neymar', 'Vini Jr', 'Rodrygo', 'Gabriel Martinelli']),
    Question(' Qual o maior time do Brasil ? ', 2,
        ['Flamengo', 'Santos', 'São Paulo', 'Palmeiras']),
    Question('Sem pergunta', 3, ['null', 'null', 'null', 'null']),
  ];

  void checkAnswer(int userAnswerIndex) {
    int correctAnswerIndex = questions[questionIndex].opcaocorreta;
    setState(() {
      if (userAnswerIndex == correctAnswerIndex) {
        score++;
      }
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      }
      if (questionIndex == questions.length - 1) {
        totalPerguntas = questions.length;
        pontuacao = score;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Resultado(totalPerguntas, resetQuiz, pontuacao),
          ),
        );
      }
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'lib/assets/images/meio.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color.fromARGB(239, 177, 9, 3),
                  ),
                  child: Text(
                    questions[questionIndex].questiontext,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Wrap(
              spacing: 40.0,
              runSpacing: 50.0,
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(
                questions[questionIndex].opcao.length,
                (index) => SizedBox(
                  width: 170.0,
                  height: 70.0,
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(index);
                    },
                    child: Text(questions[questionIndex].opcao[index]),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 15.0),
                      backgroundColor: Color.fromARGB(239, 177, 9, 3),
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
