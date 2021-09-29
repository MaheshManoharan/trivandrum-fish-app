import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/registraiton';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RegistrationScreen(),
    );
  }

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        body: Center(
          child: Text('inside registraiton'),
        ),
      ),
    );
  }
}
