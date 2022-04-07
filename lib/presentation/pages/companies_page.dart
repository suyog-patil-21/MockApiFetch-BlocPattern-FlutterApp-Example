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
            return ListView.separated(
              itemCount: list.companiesList.length,
              itemBuilder: (context, index) {
                final listElement = list.companiesList[index];
                /**
                 * {
      "name": "Aaron King", done
      "company": "The Notary App", done
      "role": "Program manager", done
      "verified": true, 
      "status": "active", done
      "companyImageURL": "https://i0.wp.com/anderworx.com/wp-content/uploads/2018/09/cropped-Avatar-Round.png?ssl=1"
    }
                 */
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(listElement.companyImageUrl),
                      ),
                      CircleAvatar(
                        radius: 6.0,
                        backgroundColor:
                            listElement.status.toLowerCase() == 'active'
                                ? Colors.green
                                : Colors.red,
                      )
                    ],
                  ),
                  title: Row(
                    children: [
                      Text(
                        listElement.name,
                        // listElement.name + " [" + listElement.role + "]",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 9),
                      Chip(label: Text(listElement.role))
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listElement.company),
                      if (listElement.verified)
                        Row(
                          children: const [
                            Icon(
                              Icons.check_circle_outlined,
                              color: Colors.green,
                            ),
                            Text('Verified')
                          ],
                        ),
                    ],
                  ),
                  // isThreeLine: true,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 2,
                  indent: screenSize.width * 0.10,
                  endIndent: screenSize.width * 0.1,
                );
              },
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
