import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../bloc/date_bloc.dart';
import '../../bloc/new_contract/bloc/new_contract_bloc.dart';
import '../../consts/class_const.dart';
import '../../models/user_model.dart';
import '../../themes/colors.dart';
import '../../themes/theme.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/checkbox.dart';
import '../../widgets/new_contract_textfield.dart';
import 'package:jiffy/jiffy.dart';
import 'package:easy_localization/easy_localization.dart';

class NewContract extends StatefulWidget {
  const NewContract({Key? key}) : super(key: key);

  @override
  _NewContractState createState() => _NewContractState();
}

class _NewContractState extends State<NewContract> {
  String? entityValue;
  String? statusValue;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController iNNcontroller = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar1(
          title: 'New Contract',
        ),
      ),
      body: BlocListener<NewContractBloc, NewContractState>(
        listener: (context, state) {
          if (state is NewContractLoaded) {
            context.read<DateBloc>().add(
                  ContractLoad(
                    activeDay: DateTime.now(),
                  ),
                );
            Navigator.of(context).pop();
          }
        },
        child: Container(
          color: BillingColor.darkWorld,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6, left: 30),
                child: Text(
                  "Лицо",
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                      color: const Color(0xFFF1F1F1),
                      style: BorderStyle.solid,
                      width: 1.2),
                ),
                margin: const EdgeInsets.only(left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField<String>(
                  dropdownColor: BillingColor.darkColor,
                  validator: (value) {
                    if (value == null) return 'Entity field is empty!!!';
                    return null;
                  },
                  isExpanded: true,
                  icon: SvgPicture.asset(
                    'assets/icons/down_circle.svg',
                    color: BillingColor.greyColor,
                  ),
                  value: entityValue,
                  onChanged: (newValue) {
                    setState(() {
                      entityValue = newValue!;
                    });
                  },
                  items: Titles.entity
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: TextCheckBox(
                        text: Text(
                          value,
                          style: BillingThemes.textTheme.bodyText2,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              NewContractTextfield(
                title: "Fisher's full name",
                controller: nameController,
              ),
              const SizedBox(height: 10),
              NewContractTextfield(
                title: "Address of the organization",
                controller: addressController,
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6, left: 30),
                    child: Text(
                      "ITN".tr(),
                      style: BillingThemes.textTheme.bodyText2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 44,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      cursorColor: BillingColor.whiteColor,
                      controller: iNNcontroller,
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
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 6, left: 30),
                child: Text(
                  "Status of the contract",
                  style: BillingThemes.textTheme.bodyText2,
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                      color: const Color(0xFFF1F1F1),
                      style: BorderStyle.solid,
                      width: 1.2),
                ),
                margin: const EdgeInsets.only(left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null) return 'Entity field is empty!!!';
                    return null;
                  },
                  dropdownColor: BillingColor.darkColor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1.2,
                        color: Color(0xFFF1F1F1),
                      ),
                    ),
                  ),
                  isExpanded: true,
                  icon: SvgPicture.asset(
                    'assets/icons/down_circle.svg',
                    color: BillingColor.greyColor,
                  ),
                  value: statusValue,
                  onChanged: (newValue) {
                    setState(() {
                      statusValue = newValue!;
                    });
                  },
                  items: Titles.statuses
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: TextCheckBox(
                        text: Text(
                          value,
                          style: BillingThemes.textTheme.bodyText2,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 25),
              MaterialButton(
                onPressed: () {
                  final usermodel = UserModel(
                      name: nameController.value.text,
                      amount: amountController.value.text,
                      lastInvoice: "5",
                      numberOfInvoice: "2",
                      status: "in_process".tr(),
                      date: Jiffy(DateTime.now()).format('dd.MM.yyyy'),
                      num: "200");
                  context
                      .read<NewContractBloc>()
                      .add(CreateNewContract(userModel: usermodel));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(122, 13, 122, 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: BillingColor.lightGreenColor),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
