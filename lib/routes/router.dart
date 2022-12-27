import 'package:flutter/material.dart';
import 'package:set_up1/routes/routes.dart';
import 'package:set_up1/view/home_screen.ui.dart';
import '../view/bottom_nav.dart';
import '../view/welcome_screen.ui.dart';


class Routers{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name) {
      // set all the route for all screens
      case HomeWelcome:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case BottomNav:
        return MaterialPageRoute(builder: (_) => const Nav());

       default:
         return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    }
  }
}