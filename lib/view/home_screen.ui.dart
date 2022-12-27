import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_up1/utils/palette.dart';
import 'package:set_up1/utils/widget_extensions.dart';
import 'package:set_up1/view/base_view/base.ui.dart';
import 'package:set_up1/view_models/home_screen.vm.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/custom_btn.dart';
import '../widgets/search_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var gradient = const LinearGradient(colors: [
      Color.fromRGBO(0,150,200,1),
      Color.fromRGBO(80,200,204,1)
    ], begin: Alignment.topLeft, end: Alignment.bottomRight,);
    Size size = MediaQuery.of(context).size;
    return BaseView<HomeScreenViewModel>(
      color: Colors.white,
      onModelReady: (m) {
        m.getData();
      },
      builder: (context, model, child) => VisibilityDetector(
        key: const Key('home'),
        onVisibilityChanged: (visibilityInfo) {
          print("visibility info is ${visibilityInfo.visibleFraction}");
          if (visibilityInfo.visibleFraction == 1) {
            print("====> refreshing user data");
             // model.refresh();
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: RefreshIndicator(
            onRefresh: () async {
              return Future.delayed(const Duration(seconds: 3), () {
                setState(() {
                  //show a loader
                  model.fetchTravelData();
                  //make api calls
                });
              });
            },
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: 170,
                  decoration: BoxDecoration(gradient: gradient),
                  child:  Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 90,left: 30,right: 30,bottom: 20),
                      child: const Input(
                        hintText: "Was willst du erleben?",
                        prefixIcon: Icon(Icons.search,color: AppColors.green,),
                      )),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         30.0.sbH,
                         Container(
                           margin: const EdgeInsets.only(left: 20),
                           child:  Text.rich(
                               TextSpan(
                                   text: 'Touren in deiner ',
                                   style: TextStyle(color: Colors.black,
                                       fontFamily: 'Inter',
                                       fontWeight: FontWeight.w700,
                                       fontSize: 20.sp),
                                   children: <InlineSpan>[
                                     TextSpan(
                                       text: 'Nähe',
                                       style: TextStyle(color: AppColors.green,
                                           fontFamily: 'Inter',
                                           fontWeight: FontWeight.w700,
                                           fontSize: 20.sp),
                                     )
                                   ]
                               )
                           ),
                           ),
                         10.0.sbH,
                         SizedBox(
                           height: 200,
                           child: ListView.builder(
                               padding: const EdgeInsets.all(0),
                               itemCount: model.nearby?.length,
                               itemBuilder: (_, index) {
                                 final nearby =model.nearby?[index];
                                 return  LocationCard(
                                   descriptions: "${nearby?.name}",
                                     location: "${nearby?.location}",
                                     price: "${nearby?.price} € ",
                                     duration: "${nearby?.duration} m",
                                     distance: "${nearby?.distance} km",
                                     rate: "${nearby?.min} (0)",
                                     locationImage: nearby?.images == null?"https://picsum.photos/200/300":"${nearby?.images?[0].path}",
                                     locationflag: "assets/images/flag.png",
                                     mode: "assets/images/bike.png",

                                 );
                               }),
                         ),
                         10.0.sbH,
                         Center(
                           child: UiButtonOutlined(
                             text: 'MEHR ANZEIGEN',
                             onPressed:() {
                               setState(() {
                                 model.updateViewMore();
                               });
                             },),
                         ),
                         30.0.sbH,
                         Container(
                           margin: const EdgeInsets.only(left: 20),
                           child:  Text.rich(
                               TextSpan(
                                   text: 'Beliebte  ',
                                   style: TextStyle(color: AppColors.green,
                                       fontFamily: 'Inter',
                                       fontWeight: FontWeight.w700,
                                       fontSize: 20.sp),
                                   children: <InlineSpan>[
                                     TextSpan(
                                       text: 'Touren',
                                       style: TextStyle(color: AppColors.black,
                                           fontFamily: 'Inter',
                                           fontWeight: FontWeight.w700,
                                           fontSize: 20.sp),
                                     )
                                   ]
                               )
                           ),
                         ),
                         10.0.sbH,
                         SizedBox(
                           height: size.height,
                           child:  model.seeMore==false?Container(
                             alignment: Alignment.topCenter,
                             margin: EdgeInsets.only(top: 100),
                               child: Text("Click To View More")):
                           ListView.builder(
                               padding: const EdgeInsets.all(0),
                               itemCount: model.populars?.length,
                               itemBuilder: (_, index) {
                                 final popular =model.populars?[index];
                                 return  LocationCard(
                                   descriptions: "${popular?["name"]}",
                                   location: "${popular?["location"]}",
                                   price: "${popular?["price"]} € ",
                                   duration: "${popular?["duration"]} m",
                                   distance: "${popular?["distance"]} km",
                                   rate: "${popular?["min"]} (0)",
                                   locationImage: popular?["author"]["img_path"] == null?"":"${popular?["author"]["img_path"]}",
                                   locationflag: "assets/images/flag.png",
                                   mode: "assets/images/bike.png",

                                 );
                               }),
                         )
                       ],
                     ),
                   ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocationCard extends StatefulWidget {
  final String descriptions;
  final String location;
  final String price;
  final String duration;
  final String distance;
  final String rate;
  final String locationImage;
  final String locationflag;
  final String mode;
  const LocationCard({Key? key,
    required this.descriptions,
    required this.location,
    required this.price,
    required this.duration,
    required this.distance,
    required this.rate,
    required this.locationImage,
    required this.locationflag,
    required this.mode,

  }) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.fromLTRB(20,10,2,20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height:80,
                    width: 80,
                    padding:const EdgeInsets.all(5),
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(widget.locationImage))
                    ),
                  ),
                ),
                10.0.sbW,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(widget.descriptions, style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        color: AppColors.black,
                        fontWeight: FontWeight.w700),),
                    5.0.sbH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: AppColors.avatarColor,
                                  shape: BoxShape.circle,
                                ),height: 25,width: 25,
                                child: Image.asset(widget.mode),),
                            10.0.sbW,
                             Text(widget.location, style: const TextStyle(fontSize: 14,fontFamily: 'Inter', color: AppColors.black,fontWeight: FontWeight.w600),),
                          ],
                        ),
                        40.0.sbW,
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.avatarColor,
                                shape: BoxShape.circle,
                              ),height: 25,width: 25,
                              child: Image.asset(widget.locationflag),),
                            10.0.sbW,
                            const Icon(Icons.star,color: AppColors.green,),
                             Text(widget.rate, style: TextStyle(fontSize: 14,fontFamily: 'Inter', color: AppColors.black,fontWeight: FontWeight.w500),),
                          ],
                        ),                        ],
                    ),
                    10.0.sbH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.account_tree_rounded),
                            5.0.sbW,
                             Text(widget.price, style: TextStyle(fontSize: 12,fontFamily: 'Inter', color: AppColors.black,fontWeight: FontWeight.w600),),
                          ],
                        ),
                        10.0.sbW,
                        Row(
                          children: [
                            const Icon(Icons.timer_outlined),
                            5.0.sbW,
                             Text(widget.duration, style: const TextStyle(fontSize: 12,fontFamily: 'Inter', color: AppColors.black,fontWeight: FontWeight.w600),),
                          ],
                        ),
                        10.0.sbW,
                        Row(
                          children: [
                            const Icon(Icons.connecting_airports),
                            5.0.sbW,
                             Text(widget.distance, style: TextStyle(fontSize: 12,fontFamily: 'Inter', color: AppColors.black,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ],
                    ),
                    10.0.sbH,
                     Container(
                       color: AppColors.avatarColor,width:250,height: 1,)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

