import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../view_models/welcome_screen.vm.dart';
import 'base_view/base.ui.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<WelcomeScreenViewModel>(
      color: Colors.white,
      onModelReady: (m) {
        print("model ready welcome ui");
      },
      builder: (context, model, child) => VisibilityDetector(
        key: const Key('welcome'),
        onVisibilityChanged: (visibilityInfo) {
          print("visibility info is ${visibilityInfo.visibleFraction}");
          if (visibilityInfo.visibleFraction == 1) {
            print("====> refreshing user data");
            // model.refresh();
          }
        },
        child: const Center(
          child: Text("WELCOME SCREEN"),
        ),
      ),
    );
  }
}
