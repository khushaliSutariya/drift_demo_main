// import 'package:drift_demo_main/screens/drift/home/homeview.dart';
// import 'package:flutter/material.dart';
// import 'package:drift/drift.dart' as drift;
//
// import '../helpers/app_db.dart';
// import '../helpers/todos.dart';
//
// class ViewScreens extends StatefulWidget {
//   const ViewScreens({Key? key}) : super(key: key);
//
//   @override
//   State<ViewScreens> createState() => _ViewScreensState();
// }
//
// class _ViewScreensState extends State<ViewScreens> {
//    AppDatabase? database;
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       database = AppDatabase();
//     });
//   }
//
//       void deleteEmployee(int id){
//         database!.deleteEmployee(id);
//       }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("View")),
//       body: FutureBuilder<List<EmployeeData>>(
//         future: database?.viewEmployee(),
//         builder: (context, AsyncSnapshot snapshot) {
//           final List<EmployeeData>? employees = snapshot.data;
//           if (snapshot.hasData) {
//             if (employees!.isEmpty) {
//               return const Text("No data found");
//             }
//             else{
//               return ListView.builder(
//                   itemCount: employees.length,
//                   physics: const BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return Card(
//                       elevation: 3,
//                       margin: const EdgeInsets.all(8),
//                       child: ListTile(
//                         isThreeLine: true,
//                         title: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "User Name: ${employees[index].name.toString()}",
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                           ],
//                         ),
//                         subtitle: Text(
//                           "First Name: ${employees[index].firstName.toString()}\nLast Name: ${employees[index].lastName.toString()}",
//                           style: const TextStyle(color: Colors.black),
//                         ),
//                         trailing:    IconButton(onPressed: () {
//                           deleteEmployee(employees[index].id);
//                           setState(() {
//
//                           });
//                         }, icon: const Icon(Icons.delete)),
//                         leading: IconButton(onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HomeView(id:employees[index].id),));
//                         }, icon: const Icon(Icons.edit)),
//
//                       ),
//                     );
//                   });
//             }
//           }
//
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const HomeView(id: 0),));
//       },child: const Icon(Icons.add)),
//     );
//   }
// }
