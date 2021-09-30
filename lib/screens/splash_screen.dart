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

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () => Navigator.of(context).pushNamed(RegistrationScreen.routeName),
    // );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.1,
      upperBound: 2.0,
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushNamed(RegistrationScreen.routeName);
      }
    });

    _animationController.forward();
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
            child: ScaleTransition(
              scale: _animationController,
              child: Image.asset(
                'assets/images/appLogo.png',
                // fit: BoxFit.cover,
                width: SizeConfig.blockSizeHorizontal * 48,
                height: SizeConfig.blockSizeHorizontal * 55,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
