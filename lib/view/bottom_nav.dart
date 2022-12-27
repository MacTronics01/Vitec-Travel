import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/palette.dart';
import 'home_screen.ui.dart';
import 'profile.dart';
import 'tour.dart';


class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}
bool _isShown = true;

final ValueNotifier<int>pageIndex = ValueNotifier(0);

class _NavState extends State<Nav> {


  final List _children = [
    const HomeScreen(),
    const TourScreen(),
    const ProfileScreen()
  ];
  @override
  void initState() {
    pageIndex.value = 0;
    super.initState();
  }

  void _onNavigationItem(index){
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        _close(context);
        return false;
      },
      child:
      Scaffold(
        backgroundColor: AppColors.black,
        body: ValueListenableBuilder(
            valueListenable: pageIndex,
            builder: (BuildContext context, int value, _){
              return _children[value];
            }
        ),
        bottomNavigationBar: _BottomNavigationBar(
          onItemSelected: _onNavigationItem,
        ),
      ),);
  }
  void _close(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return
            AlertDialog(
              actionsPadding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              title: const Text('Close Travel App?',style:
              TextStyle(fontSize: 22,fontFamily: 'Inter', color: AppColors.black,fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
              content:  SizedBox(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Clicking yes would close the Travel App', style:
                      TextStyle(fontSize: 14,fontFamily: 'Inter', color: AppColors.black,fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
                      const SizedBox(height: 1,),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  primary: AppColors.green,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                              ),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  primary: AppColors.red,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                              ),
                              onPressed: (){
                                setState(() {
                                  _isShown = false;
                                });
                                // Close the dialog
                                pop();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            );
        });
  }
  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key, required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {

  var selectedIndex = 0;

  void handleItemSelected(int index){
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          width: 1,
          color: AppColors.lightGray,
        ),

      ),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavigationBarItem(
                  icon: 'assets/images/compass.png',
                  label: 'Entdecken',
                  isSelected: (selectedIndex == 0),
                  index: 0,
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  icon: 'assets/images/add.png',
                  label: 'Tour erstellen',
                  isSelected: (selectedIndex == 1),
                  index: 1,
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  icon: 'assets/images/profiile.png',
                  label: 'Profil',
                  isSelected: (selectedIndex == 2),
                  index: 2,
                  onTap: handleItemSelected,
                ),
              ]
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  _NavigationBarItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.index,
    this.isSelected = false,
    required this.onTap
  }) : super(key: key);

  final String label;
  final String icon;
  final int index;
  final bool isSelected;
  ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          onTap(index);
        },
        child: Container(
          height: 90,
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(margin: const EdgeInsets.symmetric(horizontal: 15),height: 1.5, color: isSelected? AppColors.green: Colors.transparent,),
              SizedBox(
                height: 68.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 40 ,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: isSelected? AppColors.green.withOpacity(0.05): Colors.transparent,
                        ),
                        child: Image.asset(icon, height: 30, color: isSelected? AppColors.green:Colors.grey,)
                    ),
                    const SizedBox(height: 5,),
                    Text(label, style: TextStyle(fontSize: 10,fontFamily: 'Inter', color: isSelected? AppColors.black:Colors.grey, fontWeight: FontWeight.w700),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}