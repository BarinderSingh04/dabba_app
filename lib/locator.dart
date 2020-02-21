import 'package:dabba_app/service/authentication_service.dart';
import 'package:dabba_app/service/cloud_storage_service.dart';
import 'package:dabba_app/service/dialog_service.dart';
import 'package:dabba_app/service/firestore_service.dart';
import 'package:dabba_app/service/navigation_service.dart';
import 'package:dabba_app/utils/image_selector.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => ImageSelector());

}