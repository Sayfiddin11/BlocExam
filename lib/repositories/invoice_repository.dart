import 'dart:math';

import '../models/invoice_model.dart';

abstract class InvoiceRepository {
  Future<List<Invoice>> getInvoice();
  Future<bool> createinvoice(Invoice invoice);
}

class InvoiceRepositoryImpl extends InvoiceRepository {
  final List<Invoice> _invoices = [];
  @override
  Future<bool> createinvoice(Invoice invoice) async {
    try {
      Future.delayed(Duration(milliseconds: Random().nextInt(150) + 500));
      _invoices.add(invoice);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Invoice>> getInvoice() async {
    Future.delayed(Duration(milliseconds: Random().nextInt(500) + 1000));

    return _invoices;
  }
}
