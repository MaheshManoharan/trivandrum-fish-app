import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trivandrum_fish_task/config/paths.dart';
import 'package:trivandrum_fish_task/config/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivandrum_fish_task/screens/login_screen.dart';
import 'screens.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? firstName, lastName, email, password, repassword;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  BottomAppBar _buildBottomNavigationBar() {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: Colors.black54,
            ),
            //color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/location.svg',
              color: Colors.black54,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/fish.svg',
              color: Colors.black54,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: Colors.black54,
            ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }

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
                key: _formKey,
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter your name';
          }
          return null;
        },
        onSaved: (newValue) {
          firstName = newValue;
        },
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
      onPressed: () {
        _saveFormValues();
        //Navigator.pushNamed(context, LoginScreen.routeName);
      },
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter the last name';
          }
          return null;
        },
        onSaved: (newValue) {
          lastName = newValue;
        },
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
        keyboardType: TextInputType.emailAddress,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please a Enter';
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return 'Please a valid Email';
          }
          return null;
        },
        onSaved: (newValue) {
          email = newValue;
        },
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
        obscureText: true,
        controller: passwordController,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please Enter password';
          }
          if (value.length < 4) {
            return 'Password should be more than 4 characters';
          }
          return null;
        },
        // onSaved: (newValue) {
        //   password = newValue;
        // },
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
        obscureText: true,
        controller: confirmPasswordController,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please re-enter password';
          }

          if (passwordController.text != confirmPasswordController.text) {
            return "Pasword does not match";
          }

          return null;
        },
        onSaved: (newValue) {
          password = newValue;
        },
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

  void _saveFormValues() {
    final _isTrue = _formKey.currentState!.validate();

    if (!_isTrue) {
      return;
    }
    _formKey.currentState!.save();
    //print(password);
    _createFirebaseUser();
  }

  void _createFirebaseUser() async {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection(Paths.users);

    await userCollection.doc().set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    }).then((value) {
      Navigator.pushNamed(
        context,
        VerifyEmailScreen.routeName,
      ); // arguments: email);
    });
  }
}
