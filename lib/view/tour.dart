import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:set_up1/utils/palette.dart';

class TourScreen extends StatefulWidget {
  const TourScreen({Key? key}) : super(key: key);

  @override
  State<TourScreen> createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Container(
            color: AppColors.black,
            child:  const Center(
              child: Text("Tour erstellen",style: TextStyle(color: AppColors.white),),
            ),
          ),
    );
  }
}
