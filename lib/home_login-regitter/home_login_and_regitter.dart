import 'package:chathai/admin/adminLogin.dart';
import 'package:chathai/home_login-regitter/regitter.dart';
import 'package:chathai/home_login-regitter/repass.dart';
import 'package:chathai/home_menu/homeManu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'classgoogle.dart';
import 'login.dart';

class HomeMenuChathai extends StatefulWidget {
  @override
  _HomeMenuChathaiState createState() => _HomeMenuChathaiState();
}

class _HomeMenuChathaiState extends State<HomeMenuChathai> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void GoLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size A = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 75,
                  width: 75,
                  child: new Image(image: new AssetImage('image/kuu.jpg'))),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Expanded(
                        child: Column(children: <Widget>[
                          Container(
                              height: 100,
                              width: 100,
                              child: new Image(image: new AssetImage('image/Cha.png'))),
                        ]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            'CHATHAI CLUB',
                            style:
                                TextStyle(color: Colors.red[600], fontSize: 20),
                            //style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      width: A.width * 0.8,
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(300, 35)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      side: BorderSide(
                                          color: Colors.deepOrange[800]))),
                            ),
                            child: new Text(
                              "Sign in",
                              style: TextStyle(color: Colors.deepOrange[700]),
                            ),
                            onPressed: () {
                              GoLogin();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      // child: Column(
                      //   children: [
                      //     Text(
                      //       'OR',
                      //       style: TextStyle(fontSize: 16),
                      //     ),
                      //   ],
                      // ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: A.width * 0.8,
                      child: ElevatedButton(
                        child: Text("Register"),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => regitter()),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange[700],
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(children: [
                        TextButton(
                          child: Text(
                            'Reset Password',
                            style: TextStyle(color: Colors.red),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.teal,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => repass()));
                          },
                        )
                      ]),
                    ),
                    Container(
                      child: Column(
                          children: [
                         Container(
                              child: Text(
                                  'or',
                                  style: TextStyle(color: Colors.black,
                                  fontSize: 18
                                  ),
                                ),
                         ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      width: A.width * 0.8,
                      child: ElevatedButton(
                        child: Text("Sign in with google"),
                        onPressed: () {
                          AuthClass()
                              .signWithGoogleTEST()
                              .then((UserCredential value) {
                            final displayName = value.user.displayName;
                            print("test $displayName");

                            MaterialPageRoute materialPageRoute =
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        homeMenu());
                            Navigator.of(context).pushAndRemoveUntil(
                                materialPageRoute,
                                (Route<dynamic> route) => false);
                          }).catchError((response) {
                            String title = "can't register";
                            String message = "Please check your internet.";
                            _dialogSinngin(title, message);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[600],
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(children: [
                        TextButton(
                          child: Text(
                            ' For Admin Only ',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.teal,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => adminLogin()));
                          },
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
  void _dialogSinngin(title, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.highlight_remove_sharp,
                color: Colors.deepOrange[400],
                size: 48.0,
              ),
              title: Text(title,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK',
                      style: TextStyle(fontSize: 16, color: Colors.red[400])),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
