import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trivandrum_fish_task/config/constants.dart';
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
              backgroundImage,
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
                _homeButton(logfishingspot, () {}),
                _buildSizedBox(),
                _homeButton(viewmyspots, () {}),
                _buildSizedBox(),
                _homeButton(viewmycatches, () {}),
                _buildSizedBox(),
                _homeButton(mygear, () {}),
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

  ElevatedButton _homeButton(String text, Function func) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: white,
            )),
        primary: Colors.black87,
      ),
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 50,
        height: SizeConfig.blockSizeVertical * 10,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      onPressed: () => func,
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
              homeSvg,
              color: blackTransparent,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              locationSvg,
              color: blackTransparent,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              fishSvg,
              color: blackTransparent,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              menuSvg,
              color: blackTransparent,
            ),
          ),
        ],
      ),
    );
  }
}
