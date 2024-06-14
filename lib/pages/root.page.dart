import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:real_estate/common/pallets.dart';
import 'package:real_estate/pages/home.page.dart';
import 'package:real_estate/pages/maps.page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final PageController controller = PageController();
  bool isHome = true, buttonEffects = false, transitioning = false, raise = false;
  // Size of the avatars used in the bottom nav bar
  double size1 = 23, size2 = 27, size3 = 27, size4 = 27, size5 = 27;
  double size6 = 23, size7 = 27, size8 = 27, size9 = 27, size10 = 27;
  int timer1 = 100, timer2 = 105, timer3 = 105;


  @override
  void initState() {
    raiseBar();
    super.initState();
  }

  // Raises the nav bar 
  void raiseBar() async {
    await Future.delayed(const Duration(seconds: 9),(){
      setState(() {
          raise = true;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // Enables the easy transition between pages ... 
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: isHome ? const HomePage() : const MapsPage()),
              AnimatedPositioned(
                  duration: const Duration(seconds: 4),
                  curve: Curves.easeInOut,
                  bottom: raise ? 20 : -70,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Pallets.navigatorColor,
                          borderRadius: BorderRadius.circular(30)),
                      margin: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width < 370 ? 40 : 60 ),
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              timer1 = 100;
                              timer2 = 105;
                              timer3 = 105;
                              buttonEffects = true;
                              transitioning = true;

                              setState(() {
                                size1 = 11;
                                size2 = 12;
                                size3 = 23;
                                size5 = 21;
                                size4 = 18;
                              });

                              await Future.delayed(
                                  const Duration(milliseconds: 150), () {
                                buttonEffects = false;
                                setState(() {
                                  timer2 = 100;
                                  timer3 = 100;
                                  size3 = 27;
                                  size5 = 27;
                                });
                              });

                              await Future.delayed(
                                  const Duration(milliseconds: 180), () {
                                setState(() {
                                  timer1 = 100;
                                  size4 = 27;
                                  size1 = 23;
                                  size2 = 27;
                                });
                              });

                              await Future.delayed(
                                  const Duration(milliseconds: 182), () {
                                setState(() {
                                  transitioning = false;
                                  isHome = false;
                                });
                              });
                            },
                            child: CircleAvatar(
                              radius: 27,
                              backgroundColor: Pallets.navigatorColor,
                              child: AnimatedSize(
                                duration: Duration(milliseconds: timer3),
                                curve: Curves.ease,
                                child: CircleAvatar(
                                  radius: size3,
                                  backgroundColor: transitioning
                                      ? Pallets.white
                                      : Pallets.navigatorColor,
                                  child: AnimatedSize(
                                    duration: Duration(milliseconds: timer2),
                                    curve: Curves.decelerate,
                                    child: CircleAvatar(
                                      radius: size5,
                                      backgroundColor: buttonEffects
                                          ? Pallets.white
                                          : Pallets.navigatorColor,
                                      child: CircleAvatar(
                                        radius: size4,
                                        backgroundColor: transitioning
                                            ? Pallets.white
                                            : Pallets.navigatorColor,
                                        child: AnimatedSize(
                                          duration:
                                              Duration(milliseconds: timer1),
                                          curve: Curves.slowMiddle,
                                          child: CircleAvatar(
                                            radius: size2,
                                            backgroundColor:
                                                Pallets.navigatorColor,
                                            child: CircleAvatar(
                                              radius: isHome ? 23 : 27,
                                              backgroundColor: isHome
                                                  ? Pallets.textColor2
                                                  : Pallets.deepOrange,
                                              child: Icon(Symbols.search,
                                                  color: Pallets.white,
                                                  size: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: Pallets.textColor2,
                            child: Icon(Symbols.sms,
                                color: Pallets.white, size: 20),
                          ),
                          GestureDetector(
                            onTap: () async {
                              timer1 = 100;
                              timer2 = 105;
                              timer3 = 105;
                              buttonEffects = true;
                              transitioning = true;

                              setState(() {
                                size6 = 11;
                                size7 = 12;
                                size8 = 23;
                                size9 = 21;
                                size10 = 18;
                              });

                              await Future.delayed(
                                  const Duration(milliseconds: 150), () {
                                buttonEffects = false;
                                setState(() {
                                  timer2 = 100;
                                  timer3 = 100;
                                  size8 = 27;
                                  size10 = 27;
                                });
                              });

                              await Future.delayed(
                                  const Duration(milliseconds: 180), () {
                                setState(() {
                                  timer1 = 100;
                                  size9 = 27;
                                  size6 = 23;
                                  size7 = 27;
                                });
                              });

                              await Future.delayed(
                                  const Duration(milliseconds: 182), () {
                                setState(() {
                                  transitioning = false;
                                  isHome = true;
                                });
                              });
                            },
                            child: CircleAvatar(
                              radius: 27,
                              backgroundColor: Pallets.navigatorColor,
                              child: AnimatedSize(
                                duration: Duration(milliseconds: timer3),
                                curve: Curves.ease,
                                child: CircleAvatar(
                                  radius: size8,
                                  backgroundColor: transitioning
                                      ? Pallets.white
                                      : Pallets.navigatorColor,
                                  child: AnimatedSize(
                                    duration: Duration(milliseconds: timer2),
                                    curve: Curves.decelerate,
                                    child: CircleAvatar(
                                      radius: size10,
                                      backgroundColor: buttonEffects
                                          ? Pallets.white
                                          : Pallets.navigatorColor,
                                      child: CircleAvatar(
                                        radius: size9,
                                        backgroundColor: transitioning
                                            ? Pallets.white
                                            : Pallets.navigatorColor,
                                        child: AnimatedSize(
                                          duration:
                                              Duration(milliseconds: timer1),
                                          curve: Curves.slowMiddle,
                                          child: CircleAvatar(
                                            radius: size7,
                                            backgroundColor:
                                                Pallets.navigatorColor,
                                            child: CircleAvatar(
                                              radius: isHome ? 27 : 23,
                                              backgroundColor: isHome
                                                  ? Pallets.deepOrange
                                                  : Pallets.textColor2,
                                              child: Icon(Symbols.home,
                                                  color: Pallets.white,
                                                  size: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: Pallets.textColor2,
                            child: Icon(Icons.favorite,
                                color: Pallets.white, size: 20),
                          ),
                          SizedBox(width: 2,),
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: Pallets.textColor2,
                            child: Icon(Icons.person,
                                color: Pallets.white, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
