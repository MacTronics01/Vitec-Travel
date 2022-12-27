import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:set_up1/utils/dartz.x.dart';
import 'package:set_up1/view_models/base_view_model/base.vm.dart';

import '../core/services/appcache_services.dart';
import '../core/services/web_services/auth_api.dart';
import '../locator.dart';
import '../model/res_model.dart';
import '../model/travel_responsees.dart';
import '../utils/initializer.dart';
import '../widgets/toast.dart';

class HomeScreenViewModel extends BaseViewModel{
  Initializer initializer = getIt<Initializer>();
  AppCacheService appCacheService = getIt<AppCacheService>();
  Map<String, dynamic>? data;
  List<Close>? nearby;
  List<Famous>? popular;
  List<Map<String,dynamic>>? populars;
  TravelResponse? travelResponse;
  bool seeMore =false;


  updateViewMore(){
    seeMore=!seeMore;
    notifyListeners();
  }



getData()async{
  startLoader();
  final use= await storageService.readItem(key: "data");
  use ==null? fetchTravelData():data =json.decode(use);
  print("++++++++++++++++$use");
  nearby = getCloseListFromJson(jsonEncode(data?["data"]["nearby"]));
  populars= jsonDecode(jsonEncode(data?["data"]["popular"])).cast<Map<String,dynamic>>();
  // use==null?fetchTravelData():data=jsonDecode(jsonEncode(use.toString()));
  // print(data);

  stopLoader();
}

  void refresh() async{
    if (appCacheService.travelResponse.data?.nearby ==null) {
      fetchTravelData();
    }  else{
      travelResponse =appCacheService.travelResponse;
      notifyListeners();
    }
  }



  Future <String?> fetchTravelData() async{
    startLoader();
    try {
      final get = await getIt<ApiService>().fetchTravelDatas();
      print("+++++++++++${get}");
      get!=null||get!="null"?storageService.storeItem(key: "data", value: get):(){};
      await storageService.readItem(key: "data");
      stopLoader();
      getData();
    } catch (e) {
      stopLoader();
       showCustomToast(e.toString());
      print("==++===++==${e.toString()}");
    }
  }
  HomeScreenViewModel(){
    refresh();
  }

}