import 'package:chathai/home_login-regitter/home_login_and_regitter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeMenuChathai()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size B = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 200),
              width: B.width * 0.8,
              child: Expanded(
                child: Column(children: <Widget>[
                  Container(
                      height: 100,
                      width: 100,
                      child: new Image(
                          image:
                              new AssetImage('image/favourite-app-icon.gif'))),
                  Text(
                    "Speed Vev",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                    //style: TextStyle(fontSize: 18),
                  ),
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
