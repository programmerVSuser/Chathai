import 'package:chathai/admin/AddminHome_login_And_delete.dart';
import 'package:chathai/home_login-regitter/regitter.dart';
import 'package:chathai/home_menu/homeManu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size A = MediaQuery
        .of(context)
        .size;
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
                        top: 100, left: 50, right: 50, bottom: 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 100,
                            width: 100,
                            child: new Image(
                                image: new AssetImage(
                                    'image/lock-animation.gif'))),
                        Container(
                          child: Text(
                            'Login',
                            style:
                            TextStyle(color: Colors.red[900], fontSize: 20),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _emailController,
                            cursorColor: Theme
                                .of(context)
                                .cursorColor,
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
                                return 'Please enter a valid password.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: _passwordController,
                            cursorColor: Theme
                                .of(context)
                                .cursorColor,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange[800],
                                      width: 2.0)),
                              icon: Icon(Icons.lock),
                              labelText: 'Password :',
                              labelStyle: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            validator: (String _value) {
                              if (_value.isEmpty) {
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
                            child: Text("Sign in"),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _signInWithEmailAndPassword2();
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
                                child: Text('Member Registration'),
                                onPressed: () =>
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => regitter()),
                                    ))),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  //
  // void _signInWithEmailAndPassword() async {
  //   try {
  //     final User user = (await _auth.signInWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     ))
  //         .user;
  //     if (!user.emailVerified) {
  //       await user.sendEmailVerification();
  //     }
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
  //       return  homeMenu(uid: user.uid);
  //     }));
  //   } catch (e) {
  //     Scaffold.of(context).showSnackBar(SnackBar(
  //       content: Text("Failed to sign in with Email & Password"),
  //     ));
  //     print(e.code);
  //   }
  // }

  Future<void>_signInWithEmailAndPassword2()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ).then((response)async{
//***********************************************************************
//       print(_auth.currentUser.uid);
//       await FirebaseFirestore.instance
//           .collection('userAddmin')
//           .doc(_auth.currentUser.uid)
//           .get()
//           .then((value) {
//         Map<String, dynamic> data = value.data();
//         var position = data['position'];
//         String admin = 'admin';
//         String customer = 'customer';
//         print(position);
//         if (position == admin) {
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => HomeAddminAddpro()));
//         }
//         if (position == customer) {
//           MaterialPageRoute materialPageRoute =
//           MaterialPageRoute(builder: (BuildContext context) => homeMenu());
//           Navigator.of(context).pushAndRemoveUntil(
//               materialPageRoute, (Route<dynamic> route) => false);
//         }
//       });
//***********************************************************************
      print(_auth.currentUser.uid);
      var UID = _auth.currentUser.uid;
      print ('CWY');
      MaterialPageRoute materialPageRoute = MaterialPageRoute(
          builder: (BuildContext context) => homeMenu());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic>route) => false);
       }).catchError((response){
      String title = response.code;
      String message = response.message;
      _dialogSing(title, message);
    });
  }

  void _dialogSing(title, message) {
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

