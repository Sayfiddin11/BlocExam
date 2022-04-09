import 'package:flutter/material.dart';
import '../themes/colors.dart';

class TextCheckBox extends StatefulWidget {
  final Widget text;
  const TextCheckBox({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<TextCheckBox> createState() => _TextCheckBoxState();
}

class _TextCheckBoxState extends State<TextCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return BillingColor.lightGreenColor;
    }

    return Row(
      children: [
        DefaultTextStyle(
            style: Theme.of(context).textTheme.headline2!, child: widget.text),
        const Spacer(),
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
      ],
    );
  }
}
