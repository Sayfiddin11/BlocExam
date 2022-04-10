import 'package:bloc/bloc.dart';

class MainPageCubit extends Cubit<int> {
  MainPageCubit() : super(0);

  void changeIndex(int index) {
    if (index >= 0 && index <= 4) {
      emit(index);
    }
  }
}
