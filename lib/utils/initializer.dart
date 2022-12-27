import 'package:dio/dio.dart';

class Initializer {
  // UserService userService = getIt<UserService>();
  // StorageService storageService = getIt<StorageService>();
  // UserApiService userApi = getIt<UserApiService>();

  // Future initialCalls() async {
  //   try {
  //     String? value = await storageService.readItem(key: token);
  //     if (value != null && value.isNotEmpty) {
  //       await Future.wait(<Future>[
  //         await getIt<UserService>().getLocalUser(),
  //         getIt<UserApiService>().getUser(),
  //         getUserCalls(),
  //       ]);
  //     }
  //   } on DioError catch (e) {
  //     return e.response.toString();
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
  //
  // getUserCalls() async {
  //   await getIt<UserService>().getLocalUser();
  // }
  //
  // init() async {
  //   userService.resetAllCredentials();
  //   await checkForCachedUserData();
  // }
  //
  // checkForCachedUserData() async {
  //   String? value = await storageService.readItem(key: accessToken);
  //   if (value != null && value.isNotEmpty) {
  //     isLoggedIn = true;
  //     await getIt<UserService>().getLocalUser();
  //   }
  // }
  //
  // Future getRemoteSettings() async {
  //   // await getIt<UserApiService>().getSettings();
  // }
  //
  // Future getRemoteUserData() async {
  //   Future getUser = userApi.getUser();
  //   FutureGroup futureGroup = FutureGroup();
  //   futureGroup.add(getUser);
  //   futureGroup.close();
  //   futureGroup.future
  //       .then((value) => null)
  //       .onError((error, stackTrace) => throw NetworkException());
  // }
}