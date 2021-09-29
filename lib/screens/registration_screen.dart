import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trivandrum_fish_task/config/size_config.dart';

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  BottomAppBar _buildBottomNavigationBar() {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/home.svg'),
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  // BottomNavigationBar _buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     backgroundColor: Colors.white,
  //     items: [
  //       BottomNavigationBarItem(
  //         icon: SvgPicture.asset('assets/icons/home.svg'),
  //         label: '',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: SvgPicture.asset('assets/icons/home.svg'),
  //         label: '',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: SvgPicture.asset('assets/icons/home.svg'),
  //         label: '',
  //       ),
  //     ],
  //   );
  // }

  Center _buildBody() {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 13,
                    ),
                    _buildFirstNameTextField(),
                    _buildSizedBox(),
                    _buildLastNameTextField(),
                    _buildSizedBox(),
                    _buildEmailTextField(),
                    _buildSizedBox(),
                    _buildPasswordTextField(),
                    _buildSizedBox(),
                    _buildRePasswordTextField(),
                    _buildSizedBox(),
                    _buildProceedCircleButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildSizedBox() {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 5,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text(
        'Registration',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  _buildFirstNameTextField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: SizeConfig.blockSizeVertical * 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white.withOpacity(0.5),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'First Name',
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  _buildProceedCircleButton() {
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
          'Proceed',
          style: TextStyle(fontSize: 14),
        ),
      ),
      onPressed: () {},
    );
  }

  _buildLastNameTextField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: SizeConfig.blockSizeVertical * 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white.withOpacity(0.5),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Last Name',
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
          border: InputBorder.none,
        ),
      ),
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
        decoration: const InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
          border: InputBorder.none,
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

  _buildRePasswordTextField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: SizeConfig.blockSizeVertical * 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white.withOpacity(0.5),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Re Enter Password',
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
