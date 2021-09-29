import 'package:flutter/material.dart';
import 'package:trivandrum_fish_task/config/size_config.dart';
import 'package:trivandrum_fish_task/screens/registration_screen.dart';
import 'package:trivandrum_fish_task/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushNamed(RegistrationScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/appLogo.png',
              // fit: BoxFit.cover,
              width: SizeConfig.blockSizeHorizontal * 48,
              height: SizeConfig.blockSizeHorizontal * 55,
            ),
          ),
        ),
      ),
    );
  }
}
