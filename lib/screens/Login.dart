import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

//Stateful Widget
class LoginAuth extends StatefulWidget {
  @override
  _LoginAuthState createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  //Global Key declaration
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //for eamil
  TextEditingController _email = TextEditingController();
  //for password
  TextEditingController _password = TextEditingController();
  //instance of firebase
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //for background color
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            stops: [0.1, 0.4],
            colors: [
              Colors.white38,
              Colors.black38,
            ],
          ),
        ),
        child: Center(
          child: Card(
            margin: EdgeInsets.all(15),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              //form
              child: Form(
                  //global key
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: ValueKey('email'),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'email',
                        ),
                        controller: _email,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        key: ValueKey('Password'),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                        ),
                        controller: _password,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        child: Text(
                          "SingUp",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () async {
                          await auth.createUserWithEmailAndPassword(
                              email: _email.text, password: _password.text);
                        },
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
