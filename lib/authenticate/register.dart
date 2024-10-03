import 'package:book_your_doctor/authenticate/sign_in.dart';
import 'package:book_your_doctor/helpers/basic_app_btn.dart';
import 'package:book_your_doctor/helpers/button_for_login.dart';
import 'package:book_your_doctor/home/create_profile.dart';
import 'package:book_your_doctor/models/user.dart';
import 'package:book_your_doctor/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? fullname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Image.asset("assets/images/Loogs.png"),
            ),
            const SizedBox(height: 5),
            const Text(
              "Create Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: "Inter",
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We are here to help you!",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: false,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter your full name";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        fullname = val;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: "Your Mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter your email";
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter a password";
                        } else if (val.length < 6) {
                          return "Enter a password 6+ characters long";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            BasicAppBtn(
              label: "Register",
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  // Call the register method
                  CustomUser? result = await _auth.registerWithEmailAndPassword(email!, password!);
                  if (result == null) {
                  } else {
                    // Handle successful registration
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CreateProfile()
                    ),
                    );// Navigate back or to another screen
                  }
                }
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Text(
                      'or',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: ButtonForLogin(
                label: "Sign In with Google",
                onPressed: () {
                  // Handle Google sign-in
                },
                imagePath: "assets/images/Google .png",
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: ButtonForLogin(
                label: "Sign In with Facebook",
                onPressed: () {
                  // Handle Facebook sign-in
                },
                imagePath: "assets/images/Faceboo.png",
              ),
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Do you have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const SignIn(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
