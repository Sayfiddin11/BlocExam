class UserModel {
  final String name;
  final String amount;
  final String lastInvoice;
  final String numberOfInvoice;
  final String status;
  final String date;
  final String num;

  UserModel(
      {required this.name,
      required this.amount,
      required this.lastInvoice,
      required this.numberOfInvoice,
      required this.status,
      required this.date,
      required this.num});

  UserModel copyWith({
    String? name,
    String? amount,
    String? lastInvoice,
    String? numberOfInvoice,
    String? status,
    String? date,
    String? num,
  }) {
    return UserModel(
        name: "name",
        amount: "amount",
        lastInvoice: "lastInvoice",
        numberOfInvoice: "numberOfInvoice",
        status: "status",
        date: "date",
        num: "num");
  }

  List<Object?> get props =>
      [name, amount, lastInvoice, numberOfInvoice, status, date, num];

  static List<UserModel> usermodel = [
    UserModel(
        name: "David",
        amount: "1250000",
        lastInvoice: "2",
        numberOfInvoice: "2",
        status: "In Process",
        date: "2022.01.25",
        num: "185")
  ];
}
