import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../helpers/app_db.dart';

part 'viewscreens_state.dart';

class ViewScreensCubit extends Cubit<ViewScreensState> {
  ViewScreensCubit() : super(const ViewScreensState());

   Future<void> viewEmployee() async {
   List<UserDataData> bb= await AppDatabase.viewEmployee();
   emit(state.copyWith(employees: bb));
  }

  void deleteEmployee(int id) {
     print("index$id");
    AppDatabase.deleteEmployee(id);
    emit(state.copyWith(id:id));
    viewEmployee();
   }
}
