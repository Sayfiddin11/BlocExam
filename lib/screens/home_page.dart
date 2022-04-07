import 'package:final_exam/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/Document.svg",
            ),
            label: 'Contracts',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Time Circle.svg"),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Plus.svg"),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/Bookmark.svg"),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/Profile.svg",
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
