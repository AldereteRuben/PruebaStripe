import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Auth {
  Auth._internal();

  static Auth get instance => Auth._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> facebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == 200) {
        print('Intento de login con Facebook correctamente');
        //final userData = await FacebookAuth.instance.getUserData();
        //print(userData);
        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token);
        final AuthResult authResult =
            await _firebaseAuth.signInWithCredential(credential);

        final FirebaseUser user = authResult.user;
        print("usuario Facebook: ${user.displayName}");
      } else if (result.status == 403) {
        print('canceló el intento de login con Facebook');
      } else {
        print('Fallo el intento de login con Facebook');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> google() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication autentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: autentication.idToken,
          accessToken: autentication.accessToken);

      final AuthResult result =
          await _firebaseAuth.signInWithCredential(credential);

      final FirebaseUser user = result.user;
      print("usuario: ${user.displayName}");
    } catch (e) {
      print(e);
    }
  }

  Future<void> logOut() async {}
}
