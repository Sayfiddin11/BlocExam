import 'package:final_exam/screens/home_page.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  static routerGenerator(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => MyHomePage(),
        );
     
    }
  }
}