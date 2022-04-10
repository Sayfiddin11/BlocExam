part of 'date_bloc.dart';

@immutable
abstract class DateEvent extends Equatable {
  const DateEvent();

  @override
  List<Object> get props => [];
}

class DateActive extends DateEvent {
  final String activeDay;
  const DateActive(this.activeDay);

  @override
  List<Object> get props => [activeDay];
}

class ContractLoad extends DateEvent {
  final DateTime activeDay;
  const ContractLoad({required this.activeDay});
}
