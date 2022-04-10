part of 'new_contract_bloc.dart';

abstract class NewContractState extends Equatable {
  const NewContractState();

  @override
  List<Object> get props => [];
}

class NewContractLoading extends NewContractState {}

class NewContractLoaded extends NewContractState {
  final Future<bool> iscreated;

  const NewContractLoaded({required this.iscreated});

  @override
  List<Object> get props => [iscreated];
}
