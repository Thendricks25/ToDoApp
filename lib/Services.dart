import 'package:get_it/get_it.dart';
import 'package:to_do/Model-Third%20Party/Firestore.dart';
import 'package:to_do/Model-Third%20Party/sharedPreferences.dart';
import 'package:to_do/View%20Model/UniqueDeviceID.dart';

GetIt serviceLocator = GetIt.instance;

setupServiceLocator() {
  serviceLocator.registerFactory<CreateDeviceID>(() => CreateDeviceID());
  serviceLocator.registerLazySingleton(() => SharedPreferencesForDeviceID());
  serviceLocator.registerLazySingleton(() => FireStore());
}
