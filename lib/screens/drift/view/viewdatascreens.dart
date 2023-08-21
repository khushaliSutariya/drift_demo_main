import 'package:drift_demo_main/screens/drift/home/homeview_cubit.dart';
import 'package:drift_demo_main/screens/drift/view/viewscreens_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/app_db.dart';
import '../home/homescreens.dart';

class ViewDataScreens extends StatelessWidget {
  const ViewDataScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewScreensCubit()..viewEmployee(),
      child: Scaffold(
        appBar: AppBar(title: const Text("View")),
        body: BlocBuilder<ViewScreensCubit, ViewScreensState>(builder: (context, state) {
          return state.employees.length == null
              ? const Text("No data found")
              : ListView.builder(
                  itemCount: state.employees.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        isThreeLine: true,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.employees[index].firstName.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          state.employees[index].lastName.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              context.read<ViewScreensCubit>().deleteEmployee(state.employees[index].id);
                            },
                            icon: const Icon(Icons.delete)),
                        leading: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreens(id: state.employees[index].id),
                              )).then((value) {
                                if(value != null){
                                  context.read<ViewScreensCubit>().viewEmployee();
                                }
                              });
                            },
                            icon: const Icon(Icons.edit)),
                      ),
                    );
                  });
        }),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreens(),
                  )).then((data) {
                if (data != null) {
                  context.read<ViewScreensCubit>().viewEmployee();
                }
              });
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
