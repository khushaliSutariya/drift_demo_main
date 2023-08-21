import 'package:bloc/bloc.dart';
import 'package:drift_demo_main/screens/drift/view/viewdatascreens.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;

import '../helpers/app_db.dart';
import '../model/hobbymodellist.dart';

part 'homeview_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit()
      : super(HomeViewState(
            id: 0,
            selectedHobbys: const [],
            hobby: [
              HobbyModelList(value: false, text: "Drawing"),
              HobbyModelList(value: false, text: "Singing"),
              HobbyModelList(value: false, text: "Writting"),
              HobbyModelList(value: false, text: "Reading"),
            ],
            userName: TextEditingController(),
            firstName: TextEditingController(),
            lastName: TextEditingController()));

  void handleHobby(int index, bool? newValue, List list) {
    List<HobbyModelList>? data = List.from(list)..[index].value = newValue!;
    List<HobbyModelList>? tempdata = data.where((element) => element.value == true).toList();
    emit(
      state.copyWith(
        selectedHobbys: tempdata,
      ),
    );
  }

  void addData(BuildContext context) {
    String hobby = state.selectedHobbys.where((element) => element.value == true).map((e) => e.text).join(",");
    final entity = UserDataCompanion(
      name: drift.Value(state.userName.text),
      firstName: drift.Value(state.firstName.text),
      lastName: drift.Value(state.lastName.text),
      hobby: drift.Value(hobby),
    );
    AppDatabase.insertEmployee(entity).then((value) => Navigator.pop(context,true),);
  }

  Future<void> getEmployee(int? id) async {
    if (id != null) {
      state.employeeData = await AppDatabase.getEmployee(id);
      state.userName.text = state.employeeData!.name;
      state.firstName.text = state.employeeData!.firstName;
      state.lastName.text = state.employeeData!.lastName;
      String hobby = state.employeeData!.hobby;
      List<String> addHobby = hobby.split(",");
      List<HobbyModelList> tempList = state.hobby;
      for (var newValue in addHobby) {
        int index = tempList.indexWhere((element) => element.text == newValue);
        if (index != -1) {
          tempList[index] = tempList[index].copyWith(value: true);
        }
      }
      emit(state.copyWith(id: id,selectedHobbys: tempList));
    }
  }

  void editEmployee(BuildContext context) {
    var hobbyData =
    state.selectedHobbys.where((element) => element.value == true).map((e) => e.text).toList().join(",");
    final entity = UserDataCompanion(
      id: drift.Value(state.employeeData != null ? state.employeeData!.id : 0),
      name: drift.Value(state.userName.text),
      firstName: drift.Value(state.firstName.text),
      lastName: drift.Value(state.lastName.text),
     hobby: drift.Value(hobbyData),
    );
   AppDatabase.updateEmployee(entity).then((value) => Navigator.pop(context,true));

  }


}
