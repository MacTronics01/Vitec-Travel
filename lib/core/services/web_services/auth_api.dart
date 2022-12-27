import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../locator.dart';
import '../../../widgets/toast.dart';
import '../appcache_services.dart';
import '../storage_services.dart';
import 'base_api.dart';

class ApiService {
   StorageService storageService = getIt<StorageService>();
   AppCacheService appCacheService = getIt<AppCacheService>();
//Api call
   Future <String?> fetchTravelDatas() async {
      try {
         Response response = await connect().get("getRoutes.php");
         if(response.statusCode==200) {
            print(response.data);
            return response.data;
         }else{
            print(response.statusCode);
         }
      } catch (e) {
         errorHandler(e);
      }
   }

   void errorHandler(dynamic error) {
      var errorString = error.response.toString();
      if (error is DioError) {
         switch (error.type) {
            case DioErrorType.cancel:
               showCustomToast("Request to API server was cancelled");
               break;
            case DioErrorType.connectTimeout:
               showCustomToast("Connection timeout with API server");
               break;
            case DioErrorType.other:
               showCustomToast("Failed due to internet connection");
               break;
            case DioErrorType.receiveTimeout:
               showCustomToast("Receive timeout in connection with API server");
               break;
            case DioErrorType.response:
               final errorMessage = "${error.response?.statusCode}, ${error.response?.statusMessage}";
               showCustomToast(errorMessage);
               break;
            case DioErrorType.sendTimeout:
               showCustomToast("Timeout in connection with API server");
               break;
            default:
               showCustomToast("Something went wrong try again ");
               break;
         }
      } else {
         var json = jsonDecode(errorString);
         var nameJson = json['message'];
         throw nameJson;
      }
   }
   // Future<Either<ResModel, TravelResponse>> fetchTravelData() async {
   //    try {
   //       Response response = await connect().get("getRoutes.php"
   //       );
   //       print(response.data);
   //       appCacheService.travelResponse =
   //           getTravelModelFromJson(response.data);
   //       return Right(getTravelModelFromJson(response.data));
   //    } on DioError catch (e) {
   //       final decoded = jsonDecode(e.response!.data) as Map;
   //       return Left(ResModel(message: decodeErrorMessage(decoded)));
   //    } catch (e) {
   //       return Left(ResModel(message: e.toString()));
   //    }
   // }
}