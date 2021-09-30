import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivandrum_fish_task/config/size_config.dart';

class VerifyEmailScreen extends StatefulWidget {
  static const String routeName = '/verify';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const VerifyEmailScreen(),
    );
  }

  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email, otp;

  @override
  Widget build(BuildContext context) {
    //email = ModalRoute.of(context)!.settings.arguments as String?;

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
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 13,
                    ),
                    Image.asset(
                      'assets/images/appLogo.png',
                      // fit: BoxFit.cover,
                      width: SizeConfig.blockSizeHorizontal * 48,
                      height: SizeConfig.blockSizeHorizontal * 55,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Please verify your Email',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildEmailTextField(),
                    _buildSizedBox(),
                    _buildOtpTextField(),
                    _buildSizedBox(),
                    _buildVerifyCircleButton(),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 13,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildVerifyCircleButton() {
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
          'Verify',
          style: TextStyle(fontSize: 14),
        ),
      ),
      onPressed: () {
        // _verifyOtp();
        
      },
    );
  }

  _buildOtpTextField() {
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
          otp = newValue;
        },
        decoration: const InputDecoration(
          hintText: 'Enter Password',
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

  _buildEmailTextField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: SizeConfig.blockSizeVertical * 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white.withOpacity(0.5),
      ),
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) {
          email = newValue;
        },
        decoration: InputDecoration(
          hintText: 'Email',
          suffixIcon: TextButton(
            child: Text('Send OTP'),
            onPressed: () => sendOTP(),
          ),
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  void sendOTP() {
    print('hi');
  }
}
