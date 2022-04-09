import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';

import '../themes/colors.dart';
import '../themes/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

enum Language { rus, eng }

class _ProfilePageState extends State<ProfilePage> {
  Language _language = Language.eng;
  var lang = {
    'English (USA)': SvgPicture.asset('assets/icons/us.svg'),
    'Русский': SvgPicture.asset('assets/icons/ru.svg'),
  };

  @override
  Widget build(BuildContext context) {
    final initialLang = context.locale;
    return Scaffold(
      backgroundColor: BillingColor.darkWorld,
      appBar: AppBar(
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
              "profile".tr(),
              style: const TextStyle(fontSize: 18.0, fontFamily: "Ubuntu"),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, top: 10, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: BillingColor.darkColor,
            ),
            height: 170,
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    SvgPicture.asset('assets/icons/profile_card.svg'),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Otabek Abdusamatov',
                          style: TextStyle(
                            color: BillingColor.lightGreenColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Graphic designer • IQ Education',
                          style: TextStyle(
                            color: Color(0xffE7E7E7),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      'date_of_birth'.tr(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 14),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '16.09.2001',
                      style: BillingThemes.textTheme.bodyText2,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      'phone_number'.tr(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 14),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '+998 97 721 06 88',
                      style: BillingThemes.textTheme.bodyText2,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      'email'.tr(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 14),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'predatorhunter041@gmail.com',
                      style: BillingThemes.textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    StatefulBuilder(builder: (context, StateSetter setState) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SingleChildScrollView(
                          child: Material(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: BillingColor.darkColor,
                                //borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(24, 26, 26, 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'choose_language'.tr(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  RadioListTile<dynamic>(
                                    value: Language.rus,
                                    groupValue: _language,
                                    toggleable: true,
                                    onChanged: (value) {
                                      setState(() => _language = value);
                                    },
                                    title: Text(
                                      'Русский',
                                      style: BillingThemes.textTheme.headline6,
                                    ),
                                    secondary: SvgPicture.asset(
                                      'assets/icons/ru.svg',
                                      color: Colors.white,
                                    ),
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                  RadioListTile<dynamic>(
                                    value: Language.eng,
                                    groupValue: _language,
                                    toggleable: true,
                                    onChanged: (value) {
                                      setState(() => _language = value);
                                    },
                                    title: Text(
                                      'English (USA)',
                                      style: BillingThemes.textTheme.headline6,
                                    ),
                                    secondary:
                                        SvgPicture.asset('assets/icons/us.svg'),
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          context.setLocale(initialLang);
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          padding: const EdgeInsets.all(9),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: BillingColor.darkGreenColor,
                                          ),
                                          child: Text(
                                            'cancel'.tr(),
                                            style: BillingThemes
                                                .textTheme.headline6
                                                ?.copyWith(
                                                    color: const Color(
                                                        0xff11dbee)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          context.setLocale(Locale(
                                              _language == Language.rus
                                                  ? 'ru'
                                                  : 'en'));
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          padding: const EdgeInsets.all(9),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: BillingColor.lightGreenColor,
                                          ),
                                          child: Text(
                                            'done'.tr(),
                                            style: BillingThemes
                                                .textTheme.headline6
                                                ?.copyWith(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.only(left: 13),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: BillingColor.darkColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'language'.tr(),
                      style: BillingThemes.textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
