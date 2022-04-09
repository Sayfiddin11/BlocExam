import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cubit/nextweek/nextweek_cubit.dart';
import '../custom%20calendar/calendar_item.dart';
import 'package:jiffy/jiffy.dart';

class TabCalendar extends StatelessWidget {
  final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  TabCalendar({Key? key}) : super(key: key);

  List<DateTime> generateDateTable(int week) {
    var daylist = List.generate(
        6,
        (index) => Jiffy(Jiffy().subtract(days: Jiffy().day - 2))
            .add(days: index)
            .add(weeks: week)
            .dateTime);
    return daylist;
  }

  String updateMonth(int week) {
    return Jiffy().add(weeks: week).yMMM;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextweekCubit, int>(builder: (nexnweekContext, state) {
      return Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.grey[900], borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 32,
                child: Row(
                  children: [
                    Text(
                      updateMonth(state),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: () {
                        context.read<NextweekCubit>().decrement();
                      },
                      color: Colors.white,
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_right),
                        onPressed: () {
                          BlocProvider.of<NextweekCubit>(context).increment();
                        },
                        color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  generateDateTable(state).length,
                  (index) =>
                      TableItem(days[index], generateDateTable(state)[index]),
                ),
              )
            ],
          ));
    });
  }
}
