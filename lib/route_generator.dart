import 'package:flutter/material.dart';
import 'package:ido_edu/main.dart';
import 'package:ido_edu/screens/first_screen.dart';
import 'package:ido_edu/screens/second_screen.dart';
import 'package:ido_edu/screens/third_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstScreen());
      case '/second':
      // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondScreen(
              data: args,
            ),
          );
        }
        return _errorRoute();

      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdScreen());

      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}