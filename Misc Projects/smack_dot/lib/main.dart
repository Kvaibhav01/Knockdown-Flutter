import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

int sc = 0;
int _start = 30;
bool tt = false;
void main() => runApp(new MyApp());

class Spal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
        backgroundColor: Colors.teal,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/splash.jpeg"),
              fit: BoxFit.cover,
            ),
            new Container(
              alignment: Alignment(0, 0.9),
              child: MaterialButton(
                color: Colors.tealAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                      _start = 30;
                },
                child: new Text("START"),
              ),
            )
          ],
        ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.teal,
      home: new Spal(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double x = 0, y = 0;
  Timer _timer;
  Random rand = new Random();
  @override
  void initState() {
    starttimer();
    super.initState();
  }

  void starttimer() {
    const onesec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        onesec,
        (Timer timer) => setState(() {
              if (_start < 1) {
                _timer.cancel();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ScorePage()));
              } else {
                _start = _start - 1;
              }
            }));
  }

  void count() {
    setState(() {
      sc++;
      x = rand.nextDouble() - 0.3;
      y = rand.nextDouble() - 0.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (tt == true) {
      starttimer();
      tt = false;
    }
    return Scaffold(
        backgroundColor: Colors.tealAccent,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/smack3.jpeg"),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            new Container(
              child: new Text(
                "Score:$sc Time left:$_start",
                style: new TextStyle(
                    color: Colors.teal,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment(0, -0.9),
            ),
            new Container(
              alignment: Alignment(x, y),
              child: IconButton(
                icon: Icon(Icons.donut_large),
                onPressed: count,
                iconSize: 50,
                color: Colors.tealAccent,
              ),
            )
          ],
        ));
  }
}

class ScorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/GameOver1.gif"),
            fit: BoxFit.fill,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            child: new Text(
              "         Time's up !\n\nYour Score : $sc \n\nScore of a normal human : 58 \n\nScore of a gamer : 75\n\nScore of a pro :120",
              style: new TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment(-0.5, -0.85),
          ),
          new Container(
            child: MaterialButton(
              onPressed: () {
                tt = true;
                sc = 0;
                _start = 30;
                Navigator.pop(context);
              },
              child: new Text(
                "Try Again",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.tealAccent,
              textColor: Colors.black,
            ),
            alignment: Alignment(0, 0.92),
          )
        ],
      ),
    );
  }
}
