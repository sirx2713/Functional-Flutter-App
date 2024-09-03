import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int cardLeftNumber = 1;
  int cardRightNumber = 1;
  int playerScore = 0;
  int cpuScore = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background-plain.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: AssetImage("images/logo.png")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage("images/card$cardLeftNumber.png")),
                  Image(image: AssetImage("images/card$cardRightNumber.png"))
                ],
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    cardRightNumber = Random().nextInt(14) + 1;
                    cardLeftNumber = Random().nextInt(14) + 1;
                    if(cardRightNumber > cardLeftNumber){
                      playerScore += 5;
                    }
                    else if(cardLeftNumber > cardRightNumber){
                      cpuScore += 5;
                    }
                    else if(cardRightNumber == cardLeftNumber){
                      playerScore += 1;
                      cpuScore += 1;
                    }
                  });
                },
                child: Image(image: AssetImage("images/button.png")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Player",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      Text(
                          "$playerScore",
                        style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cpu".toUpperCase(),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      Text(
                        "$cpuScore",
                        style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
