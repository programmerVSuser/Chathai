import 'package:chathai/models/modal_addmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AddminHome_login_And_delete.dart';

class adminLogin extends StatefulWidget {
  @override
  _adminLoginState createState() => _adminLoginState();
}

class _adminLoginState extends State<adminLogin> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<AddminModal> productModals2 = [];
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
                        top: 100, left: 50, right: 50, bottom: 250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 100,
                            width: 100,
                            child: new Image(
                                image: new AssetImage(
                                    'image/AddminLogin.png'))),
                        Container(
                          child: Text(
                            'Log in Admin',
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
                              if (_value.isEmpty||_value==null) {
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
                              if (_value.isEmpty || _value == null) {
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
                            child: Text("Login"),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                 _signInWithEmailAndPasswordADDMIN();
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
                )),
          ),
        ),
      ),
    );
  }

  Future<void>_signInWithEmailAndPasswordADDMIN()async{
      final data = await Firebase.initializeApp().then((value) async {
        await FirebaseFirestore.instance
            .collection('userAddmin')
            .snapshots()
            .listen((event) {
          for (var snap in event.docs) {
            Map<String, dynamic> map = snap.data();
            AddminModal modalAddmin = AddminModal.fromMapAddmin(map);
            productModals2.add(modalAddmin);
            //nane product
            var A = modalAddmin;
            print('name  = ${A.email}');
            print('pass  = ${A.passwort}');
            setState(() {
              if ( A.email == _emailController.text && A.passwort == _passwordController.text ) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeAddminAddpro())
                  );
                }else{
                  String title = "wrong information";
                  String message = "Please fill out the correct information.";
                  _dialogSing(title, message);
              }
            });
          }
        });
      }
      ); //get the data
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
