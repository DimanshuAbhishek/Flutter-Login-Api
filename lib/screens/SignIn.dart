import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_api/screens/Login.dart';

class SignInAuth extends StatefulWidget {
  @override
  _SignInAuthState createState() => _SignInAuthState();
}

class _SignInAuthState extends State<SignInAuth> {
  //Form Key
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //Email
  TextEditingController email = TextEditingController();
  //Password
  TextEditingController password = TextEditingController();
  //Initializing Firebase
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            stops: [0.1, 0.9],
            colors: [Colors.greenAccent, Colors.redAccent],
          ),
        ),
        child: Center(
          child: Card(
            margin: EdgeInsets.all(15),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      key: ValueKey("email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        // ignore: missing_return
                        if (value.isEmpty) {
                          return 'Please Enter Email';
                        }
                      },
                      onSaved: (value) => email == value,
                      decoration: InputDecoration(
                        labelText: 'email',
                        hintText: "Email",
                      ),
                    ),
                    TextFormField(
                      controller: password,
                      key: ValueKey("Password"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        // ignore: missing_return
                        if (value.length < 4) {
                          return 'Please Enter Password';
                        }
                      },
                      onSaved: (value) => password == value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: "Password",
                      ),
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
                      onPressed: () {
                        Signin();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> Signin() async {
    final formstate = _formkey.currentState;
    if (formstate.validate()) {
      formstate.save();
      try {
        await auth.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginAuth()));
      } catch (e) {
        print(e);
      }
    }
  }
}
