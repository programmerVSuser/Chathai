import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass {
  Future<UserCredential> signWithGoogleTEST() async {
    final GoogleSignInAccount googleUser =
    await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    final GoogleAuthCredential credential =
    GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
