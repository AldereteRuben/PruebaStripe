import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:pruebastripe/pages/login/login_page.dart';

class Auth {
  Auth._internal();

  static Auth get instance => Auth._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> get user async {
    return await (_firebaseAuth.currentUser());
  }

  Future<FirebaseUser> facebook() async {
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
        return user;
      } else if (result.status == 403) {
        print('canceló el intento de login con Facebook');
      } else {
        print('Fallo el intento de login con Facebook');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<FirebaseUser> google() async {
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
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    final List<UserInfo> providers = (await user).providerData;
    String providerID = "firebase";
    for (final p in providers) {
      if (p.providerId != 'firebase') {
        providerID = p.providerId;
        break;
      }
      print("providers ${p.providerId}");
    }
    print('provider ID $providerID');
    switch (providerID) {
      case "facebook.com":
        await FacebookAuth.instance.logOut();
        break;
      case "google.com":
        await _googleSignIn.signOut();
        break;
      case "password":
        break;
      case "phone":
        break;
    }
    await _firebaseAuth.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }
}
