import 'package:flutter/material.dart';
import '../themes/colors.dart';
import '../themes/theme.dart';

class NewContractTextfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const NewContractTextfield({required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6, left: 30),
          child: Text(
            title,
            style: BillingThemes.textTheme.bodyText2,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          width: MediaQuery.of(context).size.width,
          height: 44,
          child: TextField(
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.text,
            cursorColor: BillingColor.whiteColor,
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1.2,
                    color: Color(0xFFF1F1F1),
                  ),
                  borderRadius: BorderRadius.circular(4.0)),
            ),
          ),
        )
      ],
    );
  }
}
