import 'package:companieslist/bussiness/cubit/companiesview_cubit.dart';
import 'package:companieslist/data/repository/network_repository.dart';
import 'package:companieslist/presentation/pages/companies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    networkRepository: NetworkRepository(),
  ));
}

class MyApp extends StatelessWidget {
  final NetworkRepository networkRepository;
  const MyApp({Key? key, required this.networkRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => networkRepository,
      child: BlocProvider(
        create: (context) => CompaniesviewCubit(
            networkRepository:
                RepositoryProvider.of<NetworkRepository>(context)),
        child: MaterialApp(
          title: 'Companies List',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const CompaniesPage(),
        ),
      ),
    );
  }
}
