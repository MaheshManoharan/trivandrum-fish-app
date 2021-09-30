import 'package:flutter/material.dart';
import 'package:trivandrum_fish_task/config/size_config.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginScreen(),
    );
  }

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email, otp;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/appLogo.png',
                    // fit: BoxFit.cover,
                    width: SizeConfig.blockSizeHorizontal * 48,
                    height: SizeConfig.blockSizeHorizontal * 55,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  _buildUserNameTextField(),
                  _buildSizedBox(),
                  _buildPasswordTextField(),
                  _buildSizedBox(),
                  _buildLoginCircleButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPasswordTextField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: SizeConfig.blockSizeVertical * 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white.withOpacity(0.5),
      ),
      child: TextFormField(
        onSaved: (newValue) {
//          password = newValue;
        },
        decoration: const InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  _buildUserNameTextField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: SizeConfig.blockSizeVertical * 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white.withOpacity(0.5),
      ),
      child: TextFormField(
        onSaved: (newValue) {
          //firstName = newValue;
        },
        decoration: const InputDecoration(
          hintText: 'User Name',
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  SizedBox _buildSizedBox() {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 5,
    );
  }

  _buildLoginCircleButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(
            side: BorderSide(
          color: Colors.white,
        )),
        primary: Colors.black54,
      ),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 15,
        height: SizeConfig.blockSizeVertical * 20,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 14),
        ),
      ),
      onPressed: () {
        //_saveFormValues();
      },
    );
  }
}
