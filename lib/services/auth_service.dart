import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {

  signInWithFacebook() async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();

      // final userData = await FacebookAuth.instance.getUserData();

      final credential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);

      // TODO store user data when registering users.
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      // TODO: add error handling
    }
  }

  signInWithGoogle() async {
    // begin interactive sign-in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    // sign-in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // signInWithApple() async {
  //   AppleAuthCredential
  //   final AppleSignInAccount? credential = AppleAuthProvider.credential(
  //     accessToken: 
  //   )

  //   FirebaseAuth.instance.
  // }

  /// Generates a cryptographically secure random nonce, to be included in a
/// credential request.
// String generateNonce([int length = 32]) {
//   const charset =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//   final random = Random.secure();
//   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//       .join();
// }

// signInWithApple() {
//   final appleCredential = await SignInWithApple.getAppleIDCredential(
//       scopes: [AppleIDAuthorizationScopes.email],
//       webAuthenticationOptions: WebAuthenticationOptions(
//         clientId: Environment.siwaServiceIdentifier,
//         redirectUri: Uri.parse("https://petpilot-379703.firebaseapp.com/__/auth/handler"),
//       ),
//       nonce: sha256ofString(rawNonce).toString(),
//       state: state,
//     );
//     debugPrint("appleCredential: $appleCredential");
//     if (state != appleCredential.state) {
//       throw AssertionError('state not matched!');
//     }
//     final credential = OAuthProvider(appleProviderID).credential(
//       idToken: appleCredential.identityToken,
//       accessToken: appleCredential.authorizationCode,
//       rawNonce: rawNonce,
//     );

//     return await FirebaseAuth.instance.signInWithCredential(credential);
// }

// /// Returns the sha256 hash of [input] in hex notation.
// String sha256ofString(String input) {
//   final bytes = utf8.encode(input);
//   final digest = sha256.convert(bytes);
//   return digest.toString();
// }

// Future<UserCredential> appleSignIn() async {
//   // To prevent replay attacks with the credential returned from Apple, we
//   // include a nonce in the credential request. When signing in in with
//   // Firebase, the nonce in the id token returned by Apple, is expected to
//   // match the sha256 hash of `rawNonce`.
//   final rawNonce = generateNonce();
//   final nonce = sha256ofString(rawNonce);

//   // Request credential for the currently signed in Apple account.
//   final appleCredential = await SignInWithApple.getAppleIDCredential(
//     scopes: [
//       AppleIDAuthorizationScopes.email,
//       AppleIDAuthorizationScopes.fullName,
//     ],
//     nonce: nonce,
//   );

//   // Create an `OAuthCredential` from the credential returned by Apple.
//   final oauthCredential = OAuthProvider("apple.com").credential(
//     idToken: appleCredential.identityToken,
//     rawNonce: rawNonce,
//   );

//   // Sign in the user with Firebase. If the nonce we generated earlier does
//   // not match the nonce in `appleCredential.identityToken`, sign in will fail.
//   return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
// }
}