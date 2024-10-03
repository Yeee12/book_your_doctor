import 'package:book_your_doctor/authenticate/sign_in.dart';
import 'package:book_your_doctor/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:book_your_doctor/home/splash.dart';
import 'package:provider/provider.dart';
import 'package:book_your_doctor/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensures binding before initialization

  // Initialize Firebase before running the app
  await Firebase.initializeApp();  // This needs to be awaited

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(  // Change to CustomUser?
      value: AuthService().user,  // This should be a stream of CustomUser?
      initialData: null,  // Initial data
      child: MaterialApp(
        initialRoute: '/',  // Set the initial route
        routes: {
          '/': (context) => const Splash(),  // Define the initial route
          '/Sign In': (context) => const SignIn(),  // Define the route for Sign In
          // Add other routes here if needed
          // '/Home': (context) => const HomePage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
