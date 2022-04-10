class Invoice {
  final String servicename;
  final String amount;
  final String status;
  final String date;
  final String num;

  Invoice(
      {required this.servicename,
      required this.amount,
      required this.status,
      required this.date,
      required this.num});

  Invoice copyWith({
    String? servicename,
    String? amount,
    String? status,
    String? date,
    String? num,
  }) {
    return Invoice(
        servicename: "name",
        amount: "amount",
        status: "status",
        date: "date",
        num: "num");
  }

  List<Object?> get props => [servicename, amount, status, date, num];

  static List<Invoice> invoices = [
    Invoice(
        servicename: "Expand",
        amount: "1250000",
        status: "Paid",
        date: "2022.01.25",
        num: "185")
  ];
}
