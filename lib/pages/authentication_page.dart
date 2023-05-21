import 'package:flutter/material.dart';
import 'package:petpilot/pages/login_page.dart';
import 'package:petpilot/pages/register_page.dart';

class AuthenticationPage extends StatefulWidget {

  const AuthenticationPage({super.key});

  @override
  State<StatefulWidget> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  // initially show Login Page
  bool showRegisterPage = true;

  // toggle between login and register pages
  void togglePages() {
    setState(() {
      showRegisterPage = !showRegisterPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (showRegisterPage) {
      return RegisterPage(
        onTap: togglePages
      );
    } else {
      return LoginPage(
        onTap: togglePages
      );
    }
  }
}