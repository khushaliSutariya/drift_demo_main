part of 'viewscreens_cubit.dart';

class ViewScreensState extends Equatable {
  final List<UserDataData> employees;
  final int id;
  const ViewScreensState({this.employees = const [], this.id = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [employees,id];

  ViewScreensState copyWith({
    List<UserDataData>? employees,
    int? id,
  }) {
    return ViewScreensState(
      employees: employees ?? this.employees,
      id: id ?? this.id,
    );
  }
}
