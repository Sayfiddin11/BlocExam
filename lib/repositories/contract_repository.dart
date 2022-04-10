import 'dart:math';

import 'package:jiffy/jiffy.dart';

import '../models/user_model.dart';

abstract class ContractRepository {
  Future<List<UserModel>> getContracts();
  Future<bool> createContract(UserModel newContract);
  void getC();
}

class ContractRepositoryImpl extends ContractRepository {
  List<UserModel> _contracts = [];

  void setContract() {
    _contracts = List.generate(
      100,
      (index) => UserModel(
        num: dataImplementation(index, '152', '156', '154', '158'),
        name: dataImplementation(index, 'Klay Thompson', 'LeBron James',
            'Steph Curry', 'Blake Griffin '),
        status: dataImplementation(
            index, 'Paid', 'In process', 'Rejected by payme', 'Rejected by IQ'),
        amount: dataImplementation(
            index, '3 000 000', '5 000 000', '6 000 000', '8 000 000'),
        lastInvoice: dataImplementation(index, '125', '153', '180', '164'),
        numberOfInvoice: dataImplementation(index, '6', '7', '5', '4'),
        date: generateDateTime(DateTime(2022, 01, 01))[index],
      ),
    );
  }

  @override
  void getC() {
    if (_contracts.length < 100) {
      setContract();
    }
  }

  List<String> generateDateTime(DateTime startDate) {
    List<String> datelist = [];
    for (int i = 0; i < 200; i++) {
      datelist.add(Jiffy(startDate).add(days: i).format('dd.MM.yyyy'));
    }
    return datelist;
  }

  String dataImplementation(int index, String first, second, third, fourth) {
    int status;
    status = index % 4;
    if (status == 0) {
      return first;
    } else if (status == 1) {
      return second;
    } else if (status == 2) {
      return third;
    } else if (status == 3) {
      return fourth;
    } else {
      return first;
    }
  }

  @override
  Future<List<UserModel>> getContracts() async {
    Future.delayed(Duration(milliseconds: Random().nextInt(500) + 1000));

    return _contracts;
  }

  @override
  Future<bool> createContract(UserModel newContract) async {
    try {
      Future.delayed(Duration(milliseconds: Random().nextInt(150) + 500));
      _contracts.add(newContract);
      return true;
    } catch (e) {
      return false;
    }
  }
}
