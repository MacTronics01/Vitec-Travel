import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:oktoast/oktoast.dart';
import 'package:set_up1/routes/router.dart';
import 'package:set_up1/routes/routes.dart';
import 'package:set_up1/utils/palette.dart';

import 'core/services/navigation_services.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
   dotenv.load(fileName: ".env");
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  //setup dependency injector
  dependenciesInjectorSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: const Size(390, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (child, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: getIt<NavigationService>().navigatorKey,
            scaffoldMessengerKey: getIt<NavigationService>().snackBarKey,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Inter',
              colorScheme:
              ThemeData().colorScheme.copyWith(primary: AppColors.green),
              primaryColor: Colors.blue,
              backgroundColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            onGenerateRoute: Routers.generateRoute,
            initialRoute:BottomNav,
            // home: child,
            navigatorObservers: [FlutterSmartDialog.observer],
            // here
            builder: FlutterSmartDialog.init(),
          );
        },
      ),
    );

  }
}


