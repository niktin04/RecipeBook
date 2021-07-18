import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Firebase plugins
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/pages/home_page.dart';
import 'package:recipe_book/pages/login_page.dart';
import 'package:recipe_book/pages/profile_page.dart';
import 'package:recipe_book/services/auth_service.dart';
import 'package:recipe_book/pages/signup_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Title",
      routes: {
        '/': (context) => AuthService().handleAuth(),

        '/login': (context) => LoginPage(),
        '/register': (context) => SignupPage(),

        '/profile': (context) => ProfilePage(),

        '/dash': (context) => HomePage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
