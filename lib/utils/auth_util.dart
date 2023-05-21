import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petpilot/main.dart';
import 'package:petpilot/pages/authentication_page.dart';

class AuthUtil extends StatelessWidget {
  const AuthUtil({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if (snapshot.hasData) {
              return const Main();
          } else {
            // user NOT logged in
            return const AuthenticationPage();
          }
        }
      )
    );
  }
}

