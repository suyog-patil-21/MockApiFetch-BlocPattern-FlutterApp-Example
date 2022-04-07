import '../../bussiness/cubit/companiesview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Companies',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CompaniesviewCubit, CompaniesviewState>(
        builder: (context, state) {
          if (state is CompaniesviewLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CompaniesviewLoadedState) {
            final list = state.list;
            return ListView.builder(
              itemCount: list.companiesList.length,
              itemBuilder: (context, index) {
                final listElement = list.companiesList[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(listElement.companyImageUrl),
                  ),
                  title: Text(
                    listElement.name + " [" + listElement.role + "]",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(listElement.company),
                  isThreeLine: true,
                );
              },
              // separatorBuilder: (BuildContext context, int index) {
              //   return Divider(
              //     indent: screenSize.width * 0.2,
              //     endIndent: screenSize.width * 0.2,
              //   );
              // },
            );
          } else if (state is CompaniesviewFaliourState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  ElevatedButton(
                      onPressed: () {
                        context.read<CompaniesviewCubit>().fetchData();
                      },
                      child: const Text('Try Again')),
                ],
              ),
            );
          }
          return const CircularProgressIndicator(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
