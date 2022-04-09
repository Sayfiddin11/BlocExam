import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/date_bloc.dart';
import '../../utils/compare_by_date.dart';
import 'package:jiffy/jiffy.dart';

class TableItem extends StatelessWidget {
  final String day;
  final DateTime dayNum;
  const TableItem(this.day, this.dayNum, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DateBloc>().add(ContractLoad(activeDay: dayNum));
      },
      child: BlocBuilder<DateBloc, DateState>(builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: dayNum.compareToByDate(state.activeDay)
                ? Colors.teal[400]
                : Colors.transparent,
          ),
          child: Column(
            children: [
              Text(
                day.toString(),
                style: TextStyle(
                    color: dayNum.compareToByDate(state.activeDay)
                        ? Colors.white
                        : Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                Jiffy(dayNum, "dd.MM.yyyy").date.toString(),
                style: TextStyle(
                    color: dayNum.compareToByDate(state.activeDay)
                        ? Colors.white
                        : Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                width: 10,
                color: dayNum.compareToByDate(state.activeDay)
                    ? Colors.white
                    : Colors.grey,
              )
            ],
          ),
        );
      }),
    );
  }
}
