part of 'new_contract_bloc.dart';

abstract class NewContractEvent extends Equatable {
  const NewContractEvent();

  @override
  List<Object> get props => [];
}

class LoadNewContract extends NewContractEvent {
  final List<UserModel> usermodels;

  const LoadNewContract({this.usermodels = const <UserModel>[]});
  @override
  List<Object> get props => [usermodels];
}

class CreateNewContract extends NewContractEvent {
  final UserModel userModel;

  const CreateNewContract({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class UpdateNewContract extends NewContractEvent {
  final UpdateNewContract userModel;

  const UpdateNewContract({required this.userModel});
  @override
  List<Object> get props => [userModel];
}
