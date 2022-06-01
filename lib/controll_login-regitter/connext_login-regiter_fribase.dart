import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Colors.black;
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);

class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// final TextEditingController _emailController = TextEditingController();
// final TextEditingController _passwordController = TextEditingController();

final gooleSignIn = GoogleSignIn();
FirebaseAuth auth = FirebaseAuth.instance;

Future<bool> googleSignIn() async {
  GoogleSignInAccount googleSignInAccount = await gooleSignIn.signIn();

  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(credential);

    return Future.value(true);
  }
}
// Future<void> _register() async {
//   FirebaseAuth _RG = FirebaseAuth.instance;
//   await _RG
//       .createUserWithEmailAndPassword(
//     email: _emailController.text,
//     password: _passwordController.text,
//   ).then((response) {
//     //shodialog OK
//     print('สมัคสมาชิกสำเร็จ $_emailController');
//     //shodialog OK
//     print('สมัคสมาชิกสำเร็จ $_emailController');
//   }).catchError((response) {
//     String _titel = response.code;
//     String _masess = response.message;
//     print('_titel=$_titel,_masess = $_masess');
//   });
// }



