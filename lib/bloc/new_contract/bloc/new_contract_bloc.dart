import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/user_model.dart';
import '../../../repositories/contract_repository.dart';

part 'new_contract_event.dart';
part 'new_contract_state.dart';

class NewContractBloc extends Bloc<NewContractEvent, NewContractState> {
  final ContractRepository repository;

  NewContractBloc(this.repository) : super(NewContractLoading()) {
    on<LoadNewContract>(_onLoadNewContract);
    on<CreateNewContract>(_onCreateNewContract);
    on<UpdateNewContract>(_onUpdateNewContract);
  }
  void _onLoadNewContract(event, emit) {}

  void _onCreateNewContract(CreateNewContract event, emit) {
    emit(NewContractLoading());

    final isCreated = repository.createContract(event.userModel);
    emit(NewContractLoaded(iscreated: isCreated));
  }

  void _onUpdateNewContract(event, emit) {}
}
