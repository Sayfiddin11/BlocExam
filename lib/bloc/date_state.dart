part of 'date_bloc.dart';

class DateState extends Equatable {
  final List<UserModel> paymentList;
  final DateTime activeDay;
  const DateState({required this.paymentList, required this.activeDay});

  DateState copyWith({List<UserModel>? paymentList, DateTime? activeDay}) {
    return DateState(
        paymentList: paymentList ?? this.paymentList,
        activeDay: activeDay ?? this.activeDay);
  }

  @override
  List<Object?> get props => [paymentList, activeDay];
}
