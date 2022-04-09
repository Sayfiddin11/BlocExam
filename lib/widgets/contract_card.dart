import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/user_model.dart';
import '../themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class ContractCard extends StatelessWidget {
  final UserModel userpayment;

  // ignore: use_key_in_widget_constructors
  const ContractCard({required this.userpayment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148,
      width: 343,
      color: BillingColor.darkColor,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/paper.svg'),
              const SizedBox(
                width: 10,
              ),
              Text(
                '№ ${userpayment.num}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Container(
                child: Text(
                  userpayment.status,
                  style: TextStyle(
                      color: userpayment.status == 'Paid'
                          ? const Color.fromRGBO(73, 183, 165, 1)
                          : (userpayment.status == 'In process'
                              ? const Color.fromRGBO(253, 171, 42, 1)
                              : const Color.fromRGBO(255, 66, 109, 1))),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: userpayment.status == 'Paid'
                        ? const Color.fromRGBO(73, 183, 165, 0.15)
                        : (userpayment.status == 'In process'
                            ? const Color.fromRGBO(253, 171, 42, 0.15)
                            : const Color.fromRGBO(248, 83, 121, 0.15))),
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 2, bottom: 2),
              )
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Row(
            children: [
              const Text(
                'Fish: ',
                style: TextStyle(
                    fontSize: 14.0, fontFamily: 'Ubuntu', color: Colors.white),
              ),
              const SizedBox(width: 5),
              Text(
                userpayment.name,
                style: const TextStyle(
                    color: Color(0xFF999999),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Text(
                'amount'.tr(),
                style: const TextStyle(
                    fontSize: 14.0, fontFamily: 'Ubuntu', color: Colors.white),
              ),
              const SizedBox(width: 5),
              Text(
                userpayment.amount + ' UZS',
                style: const TextStyle(
                    color: Color(0xFF999999),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Text(
                'last_invoice'.tr(),
                style: const TextStyle(
                    fontSize: 14.0, fontFamily: 'Ubuntu', color: Colors.white),
              ),
              const SizedBox(width: 5),
              Text(
                '№ ' + userpayment.lastInvoice.toString(),
                style: const TextStyle(
                    color: Color(0xFF999999),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Text(
                'number_of_invoice'.tr(),
                style: const TextStyle(
                    fontSize: 14.0, fontFamily: 'Ubuntu', color: Colors.white),
              ),
              const SizedBox(width: 5),
              Text(
                userpayment.numberOfInvoice.toString(),
                style: const TextStyle(
                    color: Color(0xFF999999),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0),
              ),
              const Spacer(),
              Text(
                userpayment.date,
                style: const TextStyle(
                    color: Color(0xFF999999),
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
