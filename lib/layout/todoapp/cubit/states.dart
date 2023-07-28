// abstract class AppStates{}
// class AppInitialState extends AppStates{}
// class AppChangeBottomNabBarState extends AppStates{}
// class AppCreateDatabase extends AppStates{}
// class AppGetDatabase extends AppStates{}
// class AppInsertDatabaseState extends AppStates{}
// class AppChangeBottomSheetState extends AppStates{}
// class AppGetDatabaseLoadingState extends AppStates {}
//
// // class AppInsertDatabaseState extends AppStates {}
//
// class AppUpdateDatabaseState extends AppStates {}
//
// class AppDeleteDatabaseState extends AppStates {}
//
// // class AppChangeBottomSheetState extends AppStates {}
abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppCreateDatabaseState extends AppStates{}
class AppChangeBottomNabBarState extends AppStates{}
class AppChangeBottomSheetState extends AppStates{}
class AppGetDatabaseState extends AppStates{}
class AppUpdateDatabaseState extends AppStates{}
class AppDeleteDatabaseState extends AppStates{}

class AppGetDatabaseLoadingState extends AppStates{}
class AppInsertDatabaseState extends AppStates{}
class AppChangeModeState extends AppStates{}
// class AppInsertDatabaseState extends AppStates {
//   final Map<String, dynamic>? applicationData;
//
//   AppInsertDatabaseState({this.applicationData});
//
//   @override
//   List<Object?> get props => [applicationData];
// }