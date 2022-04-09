import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/cubit/main_page/main_page_cubit.dart';
import '../themes/colors.dart';
import 'contract_page.dart';
import 'history_page.dart';
import 'profile_page.dart';
import 'saved_page.dart';
import '../widgets/choose_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit(),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({Key? key}) : super(key: key);

  final _widgetOptions = const [
    ContractPage(),
    HistoryPage(),
    ChooseType(),
    SavedPage(),
    ProfilePage()
  ];

  void _onItemTapped(BuildContext context, int index) async {
    if (index == 2) {
      await showDialog(
        context: context,
        builder: (ctx) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: const ChooseType(),
          );
        },
      );
    } else {
      context.read<MainPageCubit>().changeIndex(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _widgetOptions.elementAt(state),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: BillingColor.darkWorld,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            onTap: (index) => _onItemTapped(context, index),
            currentIndex: state,
            showUnselectedLabels: true,
            unselectedItemColor: BillingColor.greyColor,
            items: [
              BottomNavigationBarItem(
                label: 'contracts'.tr(),
                icon: state == 0
                    ? SvgPicture.asset('assets/icons/Bookmark1.svg')
                    : SvgPicture.asset('assets/icons/Bookmark2.svg'),
              ),
              BottomNavigationBarItem(
                label: 'history'.tr(),
                icon: state == 1
                    ? SvgPicture.asset('assets/icons/clock1.svg')
                    : SvgPicture.asset('assets/icons/clock2.svg'),
              ),
              BottomNavigationBarItem(
                label: 'new'.tr(),
                icon: state == 2
                    ? SvgPicture.asset('assets/icons/Plus1.svg')
                    : SvgPicture.asset('assets/icons/Plus2.svg'),
              ),
              BottomNavigationBarItem(
                label: 'saved'.tr(),
                icon: state == 3
                    ? SvgPicture.asset('assets/icons/Bookmark1.svg')
                    : SvgPicture.asset('assets/icons/Bookmark2.svg'),
              ),
              BottomNavigationBarItem(
                label: 'profile'.tr(),
                icon: state == 4
                    ? SvgPicture.asset('assets/icons/Profile1.svg')
                    : SvgPicture.asset('assets/icons/Profile2.svg'),
              ),
            ],
          ),
        );
      },
    );
  }
}
