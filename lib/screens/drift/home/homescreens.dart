import 'package:drift_demo_main/screens/drift/home/homeview_cubit.dart';
import 'package:drift_demo_main/screens/drift/home/homeview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/customtextfild.dart';

class HomeScreens extends StatefulWidget {
  int? id;
   HomeScreens({Key? key,this.id}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drift")),
      body: BlocProvider(
        create: (context) => HomeViewCubit()..getEmployee(widget.id),
        child: BlocBuilder<HomeViewCubit, HomeViewState>(
          builder: (context, state) {
            print("in=======${widget.id}");
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Text("User name"),
                  const SizedBox(
                    height: 3.0,
                  ),
                  CustomTxtField(
                    hintText: "User name",
                    user: state.userName,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text("first name"),
                  const SizedBox(
                    height: 3.0,
                  ),
                  CustomTxtField(
                    hintText: "first name",
                    user: state.firstName,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text("last name"),
                  const SizedBox(
                    height: 3.0,
                  ),
                  CustomTxtField(
                    hintText: "last name",
                    user: state.lastName,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 25.0, bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("hobbies:",
                       ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.hobby.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: Text(
                            state.hobby[index].text.toString(),
                          ),
                          value: state.hobby[index].value,
                          onChanged: (newValue) {
                            context.read<HomeViewCubit>().handleHobby(index, newValue, state.hobby);
                          },
                        );
                      },
                    ),
                  ),

                  ElevatedButton(
                      onPressed: () {
                        widget.id == null ? context.read<HomeViewCubit>().addData(context) : context.read<HomeViewCubit>().editEmployee(context);
                      },
                      child: widget.id == null ? const Text("Submit") : const Text("Update"),
                      )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
