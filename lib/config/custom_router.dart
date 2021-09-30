import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivandrum_fish_task/screens/login_screen.dart';
import 'package:trivandrum_fish_task/screens/screens.dart';
import 'package:trivandrum_fish_task/screens/verify_email_screen.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const Scaffold(),
        );

      case SplashScreen.routeName:
        return SplashScreen.route();

      case RegistrationScreen.routeName:
        return RegistrationScreen.route();

      case VerifyEmailScreen.routeName:
        return VerifyEmailScreen.route();

      case LoginScreen.routeName:
        return LoginScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
