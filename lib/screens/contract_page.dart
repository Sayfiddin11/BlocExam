import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/date_bloc.dart';
import '../bloc/new_invoice/bloc/new_invoice_bloc.dart';
import '../themes/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/contract_card.dart';
import '../widgets/custom%20calendar/calendar.dart';
import '../widgets/invoice_card.dart';
import 'package:easy_localization/easy_localization.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({Key? key}) : super(key: key);

  @override
  State<ContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  int _contractOrInvoice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar1(
            title: 'contracts',
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: BillingColor.darkWorld,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 147,
                  decoration: const BoxDecoration(
                    color: BillingColor.darkerColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: BillingColor.darkColor,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: TabCalendar(),
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 16.0,
                        ),
                        ButtonExample(
                          colorBox: _contractOrInvoice == 1
                              ? BillingColor.lightGreenColor
                              : BillingColor.darkWorld,
                          title: "contracts".tr(),
                          onTap: () {
                            setState(() {
                              _contractOrInvoice = 1;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        ButtonExample(
                          colorBox: _contractOrInvoice == 0
                              ? BillingColor.lightGreenColor
                              : BillingColor.darkWorld,
                          title: "invoice".tr(),
                          onTap: () {
                            setState(() {
                              _contractOrInvoice = 0;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InvoicesShow(
                      isActive: _contractOrInvoice,
                    ),
                    ContractsShow(
                      isActive: _contractOrInvoice,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class InvoicesShow extends StatelessWidget {
  const InvoicesShow({Key? key, required this.isActive}) : super(key: key);
  final int isActive;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewInvoiceBloc, NewInvoiceState>(
      builder: (context, state) {
        if (isActive == 0 && state is NewInvoiceLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: state.invoices.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InvoiceCard(invoice: state.invoices[index]);
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}

class ContractsShow extends StatelessWidget {
  const ContractsShow({Key? key, required this.isActive}) : super(key: key);
  final int isActive;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateBloc, DateState>(
      builder: (event, state) {
        if (isActive == 1) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.paymentList.length,
              itemBuilder: (BuildContext context, int index) {
                return ContractCard(
                  userpayment: state.paymentList[index],
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}

class ButtonExample extends Container {
  final Color colorBox;
  final String title;
  final VoidCallback onTap;

  ButtonExample({
    Key? key,
    required this.colorBox,
    required this.title,
    required this.onTap,
  }) : super(
          key: key,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: colorBox,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(7),
            color: colorBox,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(7),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        );
}
