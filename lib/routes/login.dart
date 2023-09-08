import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
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
              "Welcome Back",
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
                padding: EdgeInsets.all(24.0),
                // decoration: BoxDecoration(color: Colors.amber[100]),
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight / 10,
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
                          SizedBox(
                            height: screenHeight / 16,
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
                        print("Log In Successful!");
                      } else {
                        print("Log In Error Occured!");
                      }
                    },
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        "Log In",
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
                      Navigator.pushReplacementNamed(context, "/signup");
                    },
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        "Sign Up",
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
