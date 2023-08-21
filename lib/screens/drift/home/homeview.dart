// import 'package:drift/drift.dart' as drift;
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../helpers/app_db.dart';
// import '../view/viewscreens.dart';
// import '../widgets/customtextfild.dart';
//
// class HomeView extends StatefulWidget {
//   final int id;
//   const HomeView({Key? key, required this.id}) : super(key: key);
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   TextEditingController userName = TextEditingController();
//   TextEditingController lastName = TextEditingController();
//   TextEditingController firstName = TextEditingController();
//   AppDatabase? database;
//   EmployeeData? employeeData;
//
//   void addData() {
//     final entity = EmployeeCompanion(
//       name: drift.Value(userName.text),
//       firstName: drift.Value(firstName.text),
//       lastName: drift.Value(lastName.text),
//     );
//     database?.insertEmployee(entity).then((value) {
//       return ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
//           backgroundColor: Colors.pink,
//           content: Text(
//             "new employee inserted:$value",
//             style: const TextStyle(color: Colors.white),
//           ),
//           actions: [
//             TextButton(
//                 onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
//                 child: const Text(
//                   "Close",
//                   style: TextStyle(color: Colors.white),
//                 ))
//           ]));
//     });
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => const ViewScreens(),
//     ));
//   }
//
//   Future<void> getEmployee() async {
//     employeeData = database != null ? await database!.getEmployee(widget.id) : null;
//     userName.text = employeeData != null ? employeeData!.name : "";
//     firstName.text = employeeData != null ? employeeData!.firstName : "";
//     lastName.text = employeeData != null ? employeeData!.lastName : "";
//   }
//
//   void editEmployee() {
//     final entity = EmployeeCompanion(
//       id: drift.Value(employeeData != null ? employeeData!.id : 0),
//       name: drift.Value(userName.text),
//       firstName: drift.Value(firstName.text),
//       lastName: drift.Value(lastName.text),
//     );
//     database!.updateEmployee(entity).then((value) {
//       return ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
//           backgroundColor: Colors.pink,
//           content: Text(
//             "new employee inserted:$value",
//             style: const TextStyle(color: Colors.white),
//           ),
//           actions: [
//             TextButton(
//                 onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
//                 child: const Text(
//                   "Close",
//                   style: TextStyle(color: Colors.white),
//                 ))
//           ]));
//     });
//     Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => const ViewScreens(),
//     ));
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // ignore: unnecessary_null_comparison
//     if (widget.id == null) {
//       database = AppDatabase();
//     } else {
//       database = AppDatabase();
//       getEmployee();
//     }
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     database?.close();
//     userName.dispose();
//     firstName.dispose();
//     lastName.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Drift")),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Text("User name"),
//             const SizedBox(
//               height: 3.0,
//             ),
//             CustomTxtField(
//               hintText: "User name",
//               user: userName,
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             const Text("first name"),
//             const SizedBox(
//               height: 3.0,
//             ),
//             CustomTxtField(
//               hintText: "first name",
//               user: firstName,
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             const Text("last name"),
//             const SizedBox(
//               height: 3.0,
//             ),
//             CustomTxtField(
//               hintText: "last name",
//               user: lastName,
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   // ignore: unnecessary_null_comparison
//                   widget.id == null ? addData() : editEmployee();
//                 },
//                 // ignore: unnecessary_null_comparison
//                 child: widget.id == null ? const Text("Submit") : const Text("Update"))
//           ],
//         ),
//       ),
//     );
//   }
// }
