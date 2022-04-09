import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class AppBar1 extends StatelessWidget {
  final String title;
  const AppBar1({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: BillingColor.darkWorld,
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/gradient.png'),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title.tr(),
            style: const TextStyle(fontSize: 18.0, fontFamily: "Ubuntu"),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/filter.svg',
          ),
          color: BillingColor.whiteColor,
          onPressed: () {},
        ),
        const Center(
            child: Text(
          '|',
          style: TextStyle(fontSize: 18),
        )),
        IconButton(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            color: BillingColor.whiteColor,
            onPressed: () {}),
      ],
    );
  }
}
