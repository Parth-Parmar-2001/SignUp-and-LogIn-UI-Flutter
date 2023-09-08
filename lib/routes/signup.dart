import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _nameError = "";
  String _emailError = "";
  String _usernameError = "";
  String _passwordError = "";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: screenHeight / 24,
            color: Colors.white,
          ),
          Container(
            height: screenHeight / 5.5,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 24),
                // decoration: BoxDecoration(color: Colors.amber[100]),
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: 'Enter your name',
                                errorText: _nameError,
                                icon: Icon(
                                  Icons.person,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Name is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: 'Enter your email',
                                errorText: _emailError,
                                icon: Icon(
                                  Icons.email,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is required';
                                } else if (!value.contains('@') ||
                                    (value.length < 5)) {
                                  return 'Invalid email format';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: 'Enter your username',
                                errorText: _usernameError,
                                icon: Icon(
                                  Icons.account_circle_sharp,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: 'Enter your password',
                                errorText: _passwordError,
                                icon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is required';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ))),
          ),
          Container(
              height: screenHeight / 6 * 1.5,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(24.0),
              // decoration: BoxDecoration(color: Colors.amber[100]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Sign Up Successful!");
                      } else {
                        print("Sign Up Error Occured!");
                      }
                    },
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      "Or",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    )),
                    style: OutlinedButton.styleFrom(),
                  ),
                ],
              )),
          SizedBox(
            height: 25,
          )
        ],
      ),
    ));
  }
}
