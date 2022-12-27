import 'package:flutter/cupertino.dart';
import 'package:set_up1/core/services/storage_services.dart';
import 'package:set_up1/core/services/storage_services.dart';

import '../../core/enum/viewState.enum.dart';
import '../../core/services/appcache_services.dart';
import '../../core/services/navigation_services.dart';
import '../../locator.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;
  NavigationService navigationService = getIt<NavigationService>();
  AppCacheService appCacheService = getIt<AppCacheService>();
  StorageService storageService = getIt<StorageService>();

  ViewState get viewState => _viewState;

  set viewState(ViewState newState) {
    _viewState = newState;
    notifyListeners();
  }

  bool isLoading = false;

  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      viewState = ViewState.busy;
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.idle;
      notifyListeners();
    }
  }
}
