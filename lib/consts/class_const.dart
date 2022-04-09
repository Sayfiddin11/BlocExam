import 'package:flutter/material.dart';
import '../screens/contract_page.dart';
import '../screens/create/new_contract.dart';
import '../screens/history_page.dart';

import 'package:easy_localization/easy_localization.dart';

import '../screens/profile_page.dart';
import '../screens/saved_page.dart';

class Pages {
  static var pages = <Widget>[
    const ContractPage(),
    const HistoryPage(),
    const NewContract(),
    const SavedPage(),
    const ProfilePage(),
  ];
}

class Titles {
  static List<String> labels = <String>[
    'contracts'.tr(),
    'history'.tr(),
    'new_contract'.tr(),
    'saved'.tr(),
    'profile'.tr(),
    'new_invoice'.tr(),
  ];

  static List<String> statuses = <String>[
    'paid'.tr(),
    'in_process'.tr(),
    'rejected_by_IQ'.tr(),
    'rejected_by_payme'.tr(),
  ];

  static List<String> entity = <String>[
    'individual'.tr(),
    'legal_entity'.tr(),
  ];
}
