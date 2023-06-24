import 'package:flutter/material.dart';
import 'package:petpilot/pages/post_content_page.dart';
import 'package:petpilot/utils/auth_util.dart';
import 'pages/explore_page.dart';
import 'pages/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petpilot/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

const themeColor = Color(0xFF76c893);

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PetPilotApp());
}

class PetPilotApp extends StatelessWidget {
  const PetPilotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme( 
          brightness: Brightness.light, 
          primary: themeColor, onPrimary: Colors.white, 
          secondary: Colors.grey, onSecondary: Colors.white, 
          error: Colors.red, onError: Colors.black, 
          background: themeColor, onBackground: Colors.white, 
          surface: Colors.white, onSurface: Colors.grey)
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthUtil(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  bool _overlayVisible = false; // Track the visibility of the overlay

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showOverlay() {
    setState(() {
      _overlayVisible = true;
    });
  }

  void _hideOverlay() {
    setState(() {
      _overlayVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          IndexedStack(
            index: _selectedIndex,
            children: const [
              ExplorePage(),
              ProfilePage(),
            ],
          ),
          if (_overlayVisible)
            GestureDetector(
              onTap: _hideOverlay,
              child: Container(
                color: Colors.black54.withOpacity(0.5),
              ),
            ),
          if (_overlayVisible)
            const PostContentPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: themeColor,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showOverlay,
        tooltip: 'Increment',
        backgroundColor: themeColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
