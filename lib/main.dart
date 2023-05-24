import 'package:flutter/material.dart';
import 'package:petpilot/utils/auth_util.dart';
import 'pages/explore_page.dart';
import 'pages/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petpilot/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petpilot/db/firestore.dart';

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
  const PetPilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthUtil(),
    );
  }
}

class Main extends StatefulWidget {

  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          ExplorePage(),
          ProfilePage(),
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
        onPressed: Firestore().addToLocationsDB,
        tooltip: 'Increment',
        backgroundColor: themeColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: themeColor,
        actions: const [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}