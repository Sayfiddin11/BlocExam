part of 'new_invoice_bloc.dart';

abstract class NewInvoiceEvent extends Equatable {
  const NewInvoiceEvent();

  @override
  List<Object> get props => [];
}

class LoadNewInvoice extends NewInvoiceEvent {
  final List<Invoice> invoices;

  const LoadNewInvoice({required this.invoices});
  @override
  List<Object> get props => [invoices];
}

class CreateNewInvoice extends NewInvoiceEvent {
  final Invoice invoice;

  const CreateNewInvoice({required this.invoice});
  @override
  List<Object> get props => [invoice];
}

class UpdateNewInvoice extends NewInvoiceEvent {
  final Invoice invoice;

  const UpdateNewInvoice({required this.invoice});
  @override
  List<Object> get props => [invoice];
}
