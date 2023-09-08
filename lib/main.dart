import 'package:flutter/material.dart';

// Routes

import 'routes/signup.dart';
import 'routes/login.dart';
import 'routes/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.deepOrange[900]),
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => SignUpPage(),
      "/login": (context) => LogInPage(),
      "/signup": (context) => SignUpPage(),
      "/home": (context) => HomePage()
    },
  ));
}
