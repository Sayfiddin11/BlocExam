import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/date_bloc.dart';
import '../themes/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/contract_card.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar1(
          title: 'saved',
        ),
      ),
      body: BlocBuilder<DateBloc, DateState>(
        builder: (context, state) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: BillingColor.darkWorld,
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
        },
      ),
    );
  }
}
