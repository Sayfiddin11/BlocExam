part of 'new_invoice_bloc.dart';

abstract class NewInvoiceState extends Equatable {
  const NewInvoiceState();

  @override
  List<Object> get props => [];
}

class NewInvoiceLoading extends NewInvoiceState {}

class NewInvoiceLoaded extends NewInvoiceState {
  final List<Invoice> invoices;

  const NewInvoiceLoaded({this.invoices = const <Invoice>[]});

    @override
  List<Object> get props => [invoices];
}
