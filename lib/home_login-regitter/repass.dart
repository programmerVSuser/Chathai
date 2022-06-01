import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class repass extends StatefulWidget {
  @override
  _repassState createState() => _repassState();
}

class _repassState extends State<repass> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _REemailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size A = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 0, right: 0),
            child: Form(
                key: _formKey,
                child: Card(
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 70, left: 25, right: 25, bottom: 250),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  height: 100,
                                  width: 100,
                                  child: new Image(
                                      image:
                                          new AssetImage('image/passwordreset.png'))),
                              Container(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'Reset Password',
                                  style: TextStyle(
                                      color: Colors.red[900], fontSize: 20),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  controller: _REemailController,
                                  cursorColor: Theme.of(context).cursorColor,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange[800],
                                            width: 2.0)),
                                    icon: Icon(Icons.email),
                                    labelText: 'Email :',
                                    labelStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  validator: (String _value) {
                                    if (_value.isEmpty) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 30),
                                width: A.width * 0.5,
                                child: ElevatedButton(
                                  child: Text("Reset"),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      _REpass();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepOrange[600],
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ),
                              ),
                            ])))),
          ),
        ],
      ))),
    );
  }

  void _REpass() {
    print(_REemailController.text);
    _firebaseAuth
        .sendPasswordResetEmail(email: _REemailController.text)
        .then((value) {
      _dialogOKRESET();
    }).catchError((erroe) {
      _dialogNORESET();
    });
  }

  void _dialogNORESET() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.highlight_remove_sharp,
                color: Colors.red[400],
                size: 48.0,
              ),
              title: Container(
                  height: 30,
                  width: 200,
                  child: AutoSizeText('Failed reset password',
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),
            content: Container(
                height: 40,
                width: 200,
                child: Center(
                  child: AutoSizeText(
                      ' - check internet\n - Check the entered email\n - Check you have registered the app?'),
                )),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK',
                      style: TextStyle(fontSize: 16, color: Colors.green[400])),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  void _dialogOKRESET() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.green[400],
                size: 48.0,
              ),
              title: Container(
                  height: 30,
                  width: 200,
                  child: AutoSizeText('Successfully reset password',
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),
            content: Container(
                height: 30,
                width: 200,
                child: Center(
                  child: AutoSizeText(
                      'We send a link to change password\n to Your email is complete.'),
                )),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK',
                      style: TextStyle(fontSize: 16, color: Colors.green[400])),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(builder: (context) => login()),
                    );
                  })
            ],
          );
        });
  }
}
