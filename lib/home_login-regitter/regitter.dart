import 'package:auto_size_text/auto_size_text.dart';
import 'package:chathai/extends_page_homeManu/manu_in_home.dart';
import 'package:email_auth/email_auth.dart';
//import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'login.dart';

class regitter extends StatefulWidget {
  const regitter({Key key}) : super(key: key);
  @override
  _regitterState createState() => _regitterState();
}

class _regitterState extends State<regitter> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _OTP = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void sendOTP() async {
    EmailAuth.sessionName = "Chathai club OTP";
    var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
    if (res) {
      print("OTP SEND$res");
    } else {
      print("We could not send the OTP");
      String _titel= "OTP Wrong";
      String _masess= "We could not send the OTP";
      _dialogSrndOTP(_titel, _masess);
    }
  }

  void verifyOTP() {
    var res = EmailAuth.validate(
        receiverMail: _emailController.text, userOTP: _OTP.text);
    if (res) {
      _register();
      print("OK");
    } else {
      //Show dialod Invalit
      print("กรุณาใส่ OTP ให้ถูกต้อง");
    }
  }
  void _dialogSrndOTP(_titel, _masess) {
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
              title: Text(_titel,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            content: Text(_masess),
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
  @override
  Widget build(BuildContext context) {
    Size A = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Form(
                key: _formKey,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 100, left: 50, right: 50, bottom: 250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 120,
                            width: 120,
                            child: new Image(
                                image:
                                    new AssetImage('image/login-screen.gif'))),
                        Container(
                          child: Text(
                            'Register',
                            style:
                                TextStyle(color: Colors.red[900], fontSize: 20),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _emailController,
                            cursorColor: Theme.of(context).cursorColor,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red[800], width: 2.0)),
                              icon: Icon(Icons.email),
                              labelText: 'Email :',
                              labelStyle: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid email address.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: _passwordController,
                            cursorColor: Theme.of(context).cursorColor,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red[800], width: 2.0)),
                              icon: Icon(Icons.lock),
                              labelText: 'Password :',
                              labelStyle: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid password.';
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: A.width * 0.5,
                          child: ElevatedButton(
                            child: Text("Next"),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _showDialogOTP();
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
                        Container(
                            child: TextButton(
                                child: Text('Sing in'),
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => login()),
                                    )))
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return Alert(
      context: context,
      title: "OTP",
      content: Column(
        children: <Widget>[
          Container(
            child: TextFormField(
              controller: _OTP,
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.red[800], width: 2.0)),
                labelText: 'OTP',
                labelStyle: TextStyle(
                  color: Colors.black54,
                ),
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter the OTP sent to the email.';
                }
                return null;
              },
              obscureText: true,
            ),
          ),
          SizedBox(height: 15,),
          Container(
            child: ElevatedButton(
              child: Text("Send OTP"),
              onPressed: () async {
                sendOTP();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange[900],
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          )
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "REGITEER",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            verifyOTP();
          },
          gradient: LinearGradient(colors: [
            Color.fromRGBO(128,255,0,10),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }
  Future<void> _showDialogOTP() async {
    Size A = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Center(
              child: AlertDialog(
                title: ListTile(
                  leading: Icon(
                    Icons.admin_panel_settings_rounded,
                    color: Colors.green[400],
                    size: 40.0,
                  ),
                  title: Container(
                      height: 30,
                      width: 50,
                      child: Column(
                        children: [
                          Container(
                            child: Expanded(
                              child: AutoSizeText('Enter OTP from email',
                                  style:
                                      TextStyle(fontSize: 20, color: Colors.black)),
                            ),
                          ),
                        ],
                      )),
                ),
                content: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 35,
                          width: 200,
                          child: Container(
                            child: TextFormField(
                              controller: _OTP,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red[800], width: 2.0)),
                                // icon: Icon(Icons.admin_panel_settings_rounded,color:Colors.green ,),
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter a valid Email.';
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),),
                          Container(
                            child: TextButton(
                              child: Text('Send OTP',style: TextStyle(color: Colors.blue),),
                              style: TextButton.styleFrom(
                                primary: Colors.teal,
                              ),
                              onPressed: () {sendOTP();},
                            )
                          ),
                        Container(
                          padding: EdgeInsets.only(top: 20),),
                        Container(
                          padding: EdgeInsets.only(right: 50, left: 50),
                          width: A.width * 1,
                          child: ElevatedButton(
                            child: Text("Next"),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                verifyOTP();
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
                      ],
                    ),
                  ),
              ),
            ),
          );
        });
  }
  Future<void> _register() async {
    FirebaseAuth _RG = FirebaseAuth.instance;
    final User user = (await _RG
        .createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
        .then((response) {
      // set_displayName();
      _dialogRegitOK();
      print('สมัคสมาชิกสำเร็จ $_emailController');
      //shodialog OK
      print('สมัคสมาชิกสำเร็จ $_emailController');
    }).catchError((response) {
      String _titel = response.code;
      String _masess = response.message;
      print('_titel=$_titel,_masess = $_masess');
      _dialogRegitBUG(_titel, _masess);
    }));
  }
  // Future<void> set_displayName() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   await firebaseAuth.currentUser.updateProfile();
  // }
  void _dialogRegitBUG(_titel, _masess) {
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
              title: Text(_titel,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            content: Text(_masess),
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
//dialog regitter ok
  void _dialogRegitOK() {
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
                  child: AutoSizeText('Successfully registered',
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),
            content: Container(
                height: 30,
                width: 200,
                child: Center(
                  child: AutoSizeText('Press the OK button to login.'),
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
