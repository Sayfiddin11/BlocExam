import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/screens/home_page.dart';
import 'bloc/cubit/nextweek/nextweek_cubit.dart';
import 'bloc/date_bloc.dart';
import 'bloc/new_contract/bloc/new_contract_bloc.dart';
import 'bloc/new_invoice/bloc/new_invoice_bloc.dart';
import 'models/invoice_model.dart';
import 'repositories/contract_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        path: 'assets/lang',
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = ContractRepositoryImpl();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DateBloc(repository)
            ..add(
              ContractLoad(activeDay: DateTime.now()),
            ),
        ),
        BlocProvider(create: (_) => NextweekCubit()),
        BlocProvider(create: (context) => NewContractBloc(repository)),
        BlocProvider(
          create: (context) => NewInvoiceBloc()
            ..add(
              LoadNewInvoice(invoices: [
                Invoice(
                    servicename: "servicename",
                    amount: "amount",
                    status: "status",
                    date: "date",
                    num: "num")
              ]),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const HomeScreen(),
      ),
    );
  }
}
