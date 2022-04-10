import 'package:bloc/bloc.dart';

class NextweekCubit extends Cubit<int> {
  NextweekCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
