import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'meio.dart';

class comeco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'lib/assets/images/comeco.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPage()),
                    );
                  },
                  child: Text('Iniciar Quiz'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
