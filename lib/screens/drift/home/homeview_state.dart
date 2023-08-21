part of 'homeview_cubit.dart';

class HomeViewState extends Equatable {
  TextEditingController userName;
  TextEditingController lastName;
  TextEditingController firstName;
  UserDataData? employeeData;
  final int id;
  List<HobbyModelList> selectedHobbys = [];
  List<HobbyModelList> hobby = [];
  HomeViewState(
      {required this.hobby,required this.selectedHobbys,required this.id, required this.userName, required this.firstName, required this.lastName, this.employeeData});
  @override
  List<Object?> get props => [employeeData, id,hobby,selectedHobbys];

  HomeViewState copyWith({
    TextEditingController? userName,
    TextEditingController? lastName,
    TextEditingController? firstName,
    UserDataData? employeeData,
    int? id,
    List<HobbyModelList>? selectedHobbys,
    List<HobbyModelList>? hobby,
  }) {
    return HomeViewState(
      userName: userName ?? this.userName,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      employeeData: employeeData ?? this.employeeData,
      id: id ?? this.id,
      selectedHobbys: selectedHobbys ?? this.selectedHobbys,
      hobby: hobby ?? this.hobby,
    );
  }
}
