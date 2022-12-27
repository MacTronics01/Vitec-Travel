import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:set_up1/view/base_view/base.ui.dart';
import 'package:set_up1/view_models/home_screen.vm.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../utils/palette.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Container(
            color: AppColors.black,
            child:  const Center(
              child: Text("Profil",style: TextStyle(color: AppColors.white),),
            ),
          ),
    );
  }
}
