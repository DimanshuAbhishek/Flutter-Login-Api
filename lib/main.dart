import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_api/screens/Login.dart';
import 'package:login_api/screens/SignIn.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Homepage());
}


class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInAuth(),
    );
  }
}
