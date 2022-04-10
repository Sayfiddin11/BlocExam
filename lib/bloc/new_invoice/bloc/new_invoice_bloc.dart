import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/invoice_model.dart';

part 'new_invoice_event.dart';
part 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, NewInvoiceState> {
  final List<Invoice> invoicelist = [];
  NewInvoiceBloc() : super(NewInvoiceLoading()) {
    on<LoadNewInvoice>(_onLoadNewInvoice);
    on<CreateNewInvoice>(_onCreateNewInvoice);
    on<UpdateNewInvoice>(_onUpdateNewInvoice);
  }
  void _onLoadNewInvoice(LoadNewInvoice event, emit) {
    emit(NewInvoiceLoaded(invoices: event.invoices));  
  }

  void _onCreateNewInvoice(CreateNewInvoice event, emit) {
    final state = this.state;
    if (state is NewInvoiceLoaded) {
      emit(NewInvoiceLoaded(
          invoices: List.from(state.invoices)..add(event.invoice)));
    }
  }

  void _onUpdateNewInvoice(event, emit) {}
}
