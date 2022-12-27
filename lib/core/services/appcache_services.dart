import 'package:set_up1/core/services/storage_services.dart';

import '../../locator.dart';
import '../../model/travel_responsees.dart';

class AppCacheService{
  StorageService storageService = getIt<StorageService>();
  TravelResponse travelResponse = TravelResponse();
  List<Close>? close =<Close>[];
  List<Famous>? famous =<Famous>[];
}