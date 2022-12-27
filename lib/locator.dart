import 'package:get_it/get_it.dart';
import 'package:set_up1/utils/initializer.dart';
import 'package:set_up1/view_models/home_screen.vm.dart';
import 'package:set_up1/view_models/welcome_screen.vm.dart';

import 'core/services/appcache_services.dart';
import 'core/services/navigation_services.dart';
import 'core/services/storage_services.dart';
import 'core/services/web_services/auth_api.dart';

GetIt getIt = GetIt.I;

dependenciesInjectorSetup(){
  //View Models:
  getIt.registerFactory<HomeScreenViewModel>(() => HomeScreenViewModel());
  getIt.registerFactory<WelcomeScreenViewModel>(() => WelcomeScreenViewModel());


  // Services:
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  getIt.registerLazySingleton<AppCacheService>(() => AppCacheService());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton(() => Initializer());


}