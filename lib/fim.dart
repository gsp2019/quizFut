import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;
  final Function resetQuiz;

  Resultado(this.totalPerguntas, this.resetQuiz, this.pontuacao);

  @override
  Widget build(BuildContext context) {
    bool foiBem = pontuacao >= 5;
    String backgroundImage = foiBem
        ? 'lib/assets/images/fimfeliz.jpg'
        : 'lib/assets/images/fimtriste.jpg';

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(239, 177, 9, 3),
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                  foiBem
                      ? "Você foi bem no quiz!!\nParabéns.\nAcertou: $pontuacao de ${totalPerguntas - 1} "
                      : "Não foi bem no quiz!!\nTente novamente.\nAcertou: $pontuacao de ${totalPerguntas - 1}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      resetQuiz();
                      Navigator.pop(context);
                    },
                    child: Text("Recomeçar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(239, 177, 9, 3),
                      foregroundColor: Color.fromARGB(255, 252, 255, 254),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
