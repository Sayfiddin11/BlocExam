import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../themes/colors.dart';
import '../widgets/app_bar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar1(
          title: 'history',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: BillingColor.darkWorld,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/Document.svg',
              color: BillingColor.lightGreyColor,
            ),
            const SizedBox(height: 15),
            const Text(
              'No history for this  period',
              style: TextStyle(
                  color: BillingColor.lightGreyColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
