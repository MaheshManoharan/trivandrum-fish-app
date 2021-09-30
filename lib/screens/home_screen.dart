import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trivandrum_fish_task/config/size_config.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        extendBody: true,

        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationBar(),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 15,
                ),
                _buildSizedBox(),
                _homeButton1(),
                _buildSizedBox(),
                _homeButton2(),
                _buildSizedBox(),
                _homeButton3(),
                _buildSizedBox(),
                _homeButton4(),
              ],
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

  ElevatedButton _homeButton1() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Colors.white,
            )),
        primary: Colors.black87,
      ),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 50,
        height: SizeConfig.blockSizeVertical * 10,
        alignment: Alignment.center,
        child: const Text(
          'Log a Fishing Spot',
          style: TextStyle(fontSize: 14),
        ),
      ),
      onPressed: () {
        //_saveFormValues();
        //Navigator.pushNamed(context, LoginScreen.routeName);
      },
    );
  }

  ElevatedButton _homeButton2() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Colors.white,
            )),
        primary: Colors.black87,
      ),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 50,
        height: SizeConfig.blockSizeVertical * 10,
        alignment: Alignment.center,
        child: const Text(
          'View my spots',
          style: TextStyle(fontSize: 14),
        ),
      ),
      onPressed: () {
        //_saveFormValues();
        //Navigator.pushNamed(context, LoginScreen.routeName);
      },
    );
  }

  ElevatedButton _homeButton3() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Colors.white,
            )),
        primary: Colors.black87,
      ),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 50,
        height: SizeConfig.blockSizeVertical * 10,
        alignment: Alignment.center,
        child: const Text(
          'View my matches',
          style: TextStyle(fontSize: 14),
        ),
      ),
      onPressed: () {
        //_saveFormValues();
        //Navigator.pushNamed(context, LoginScreen.routeName);
      },
    );
  }

  ElevatedButton _homeButton4() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Colors.white,
            )),
        primary: Colors.black87,
      ),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 50,
        height: SizeConfig.blockSizeVertical * 10,
        alignment: Alignment.center,
        child: const Text(
          'My Gear',
          style: TextStyle(fontSize: 14),
        ),
      ),
      onPressed: () {
        //_saveFormValues();
        //Navigator.pushNamed(context, LoginScreen.routeName);
      },
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
          ),
        ],
      ),
    );
  }
}
