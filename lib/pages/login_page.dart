import 'package:flutter/material.dart';
import 'package:petpilot/components/my_button.dart';
import 'package:petpilot/components/my_textfield.dart';
import 'package:petpilot/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petpilot/main.dart';
import 'package:petpilot/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn(BuildContext context) async {
    // show a loading screen while we sign in.
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator()
      );
    });

    // try signing in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, 
      password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String errorMsg = '';

      if (e.code == 'user-not-found') {
        errorMsg = 'Did not find user with this email.';
      } else if (e.code == 'wrong-password') {
        errorMsg = 'Wrong password.';
      }

      displayErrorMessage(errorMsg);
    }
  }

  void skipUserSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Main()));
  }

  void displayErrorMessage(String errorMsg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(errorMsg),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                const Image(image: AssetImage('lib/images/petpilot_logo.png')),

                const SizedBox(height: 5),

                // welcome back, you've been missed!
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // sign in button
                MyButton(onTap: () => signUserIn(context), buttonText: 'Sign In'),

                const SizedBox(height: 15),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'lib/images/google.png', onTap: () => AuthService().signInWithGoogle(),),

                    const SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'lib/images/apple.png', onTap: () => {},),

                    const SizedBox(width: 25),

                    // facebook button
                    SquareTile(imagePath: 'lib/images/facebook.png', onTap: () => AuthService().signInWithFacebook(),)
                  ],
                ),

                const SizedBox(height: 15),

                // Register here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Here',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )

                // // skip for now
                // GestureDetector(
                //   onTap: skipUserSignIn,
                //   child: const Text(
                //     'Skip for now',
                //     style: TextStyle(
                //       color: Colors.blue,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import '../main.dart';

// class AuthenticationPage extends StatefulWidget {
//   const AuthenticationPage({Key? key}) : super(key: key);

//   @override
//   AuthenticationPageState createState() => AuthenticationPageState();
// }

// class AuthenticationPageState extends State<AuthenticationPage> {
//   bool _isLoggedIn = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _login() {
//     // Perform your login logic here
//     setState(() {
//       _isLoggedIn = true;
//     });
//   }

//   void _logout() {
//     // Perform your logout logic here
//     setState(() {
//       _isLoggedIn = false;
//     });
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoggedIn) {
//       return Main(logoutCallback: _logout);
//     } else {
//       return Scaffold(
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: _login,
//                   style: ElevatedButton.styleFrom(backgroundColor: themeColor),
//                   child: const Text('Sign-Up')
//                 ),
//               ],
//             ),
//           )
//         )
//       );
//     }
//   }
// }