import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lmsadmin/pages/dashboard.dart';
import 'package:lmsadmin/pages/login.dart';

import '../model/user_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //username feild
    final userNameField = TextFormField(
        controller: usernameEditingController,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            errorStyle: TextStyle(
              fontSize: 9,
            ),
            suffixIcon: Icon(Icons.person),
            fillColor: Colors.black12,
            labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            labelText: 'User Name'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Usrname cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          usernameEditingController.text = value!;
        });

    //first name field
    final firstNameField = TextFormField(
        controller: firstNameEditingController,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            errorStyle: TextStyle(
              fontSize: 9,
            ),
            suffixIcon: Icon(Icons.person),
            fillColor: Colors.black12,
            labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            labelText: 'First Name'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        });

    //second name field
    final secondNameField = TextFormField(
      controller: secondNameEditingController,
      style: const TextStyle(fontSize: 14),
      decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 9,
          ),
          suffixIcon: Icon(Icons.person),
          fillColor: Colors.black12,
          labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          labelText: 'Second Name'),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
    );

    //email field
    final emailSignupField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 9,
          ),
          suffixIcon: Icon(Icons.email),
          fillColor: Colors.black12,
          labelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          labelText: 'Email'),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return 'Please Enter a valid email';
        }
        return null;
      },
    );

    //password field
    final passwordSignUpField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordEditingController,
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontSize: 14),
      decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 9,
          ),
          suffixIcon: Icon(Icons.vpn_key),
          fillColor: Colors.black12,
          labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          labelText: 'Password'),

      // The validator receives the text that the user has entered.
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
        return null;
      },
    );

    //confirm password
    final confirmPasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: confirmEditingController,
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      style: const TextStyle(fontSize: 14),
      decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 8,
          ),
          suffixIcon: Icon(Icons.vpn_key),
          fillColor: Colors.black12,
          labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          labelText: 'Confirm Password'),

      // The validator receives the text that the user has entered.
      validator: (value) {
        if (confirmEditingController.text != passwordEditingController.text) {
          return "Password don't match";
        }
        return null;
      },
    );

    //signup
    final signUpButton = Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: SizedBox(
            height: 20,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ))),
              onPressed: () {
                signUp(emailEditingController.text,
                    passwordEditingController.text);
              },
              child: const Text('Sign Up!'),
            )));

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back, color: Colors.white70),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          )),
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Admin',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white70),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Colors.white70,
                      fontSize: 20),
                ),
              )
            ],
          ),
          Card(
            shadowColor: Colors.black54,
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Sign in to start your session',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                        )),
                  ),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            firstNameField,
                            secondNameField,
                            userNameField,
                            emailSignupField,
                            passwordSignUpField,
                            confirmPasswordField,
                            signUpButton,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        // ignore: avoid_print
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    AdminModel userModel = AdminModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    userModel.username = usernameEditingController.text;
    userModel.isAdmin = true;
    await firebaseFirestore
        .collection("Admin")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const DashBoard()),
        (route) => false);
  }
}
