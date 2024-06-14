import 'package:animate_do/animate_do.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/common/constants.dart';
import 'package:real_estate/common/pallets.dart';
import 'package:real_estate/pages/widgets/global.widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isButtonAtEnd = false;
  bool showText = false,
      locationText = false,
      nameText = false,
      showDigits = false;
  bool _animate = false;
  double minimumValue = 0.0002;
  // controller for the scrolling images at the bottom
  final DraggableScrollableController dragScrollController =
      DraggableScrollableController();
  // controller for the fadeIn widgets    
  late AnimationController animateController,
      animateController2,
      animateController3,
      animateController4,
      animateController5,
      animateController6,
      animateController7,
      animateController8;

  // activated the top Bar animation
  void animateAppBar() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _animate = !_animate;
    });
    textAnimation();
  }

  // Activated the text animation in the top bar button
  void textAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1800));
    setState(() {
      locationText = !locationText;
      animateController5.forward();
    });
  }

  // Activated the digits count animation, draggablescroll animation 
  void nameAnimation() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
      nameText = !nameText;
      showDigits = !showDigits;
      animateController6.forward();
      animateController7.forward();
      animateController8.forward();
    });
    await Future.delayed(const Duration(milliseconds: 2000));
    _scrollToTop();
    await Future.delayed(const Duration(milliseconds: 1000));
    setMinimum();
  }

  @override
  void initState() {
    super.initState();
    animateController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController5 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController6 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController7 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController8 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    
    animateAppBar();
    nameAnimation();
    
  }

  // enable draggablescroll to scroll to top
  void _scrollToTop() {
    dragScrollController.animateTo(
      0.66,
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOut,
    );
  }

  // Change minimum value of the draggableScroll and enable text animation
  void setMinimum() {
    setState(() {
      minimumValue = MediaQuery.of(context).size.height < 650 ? 0.2 : 0.4;
      isButtonAtEnd = !isButtonAtEnd;
      startTextAnimation();
    });
  }

  //Starts the fadein text in the images
  void startTextAnimation() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      showText = true;
      animateController.forward();
      animateController2.forward();
      animateController3.forward();
      animateController4.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('${MediaQuery.of(context).size.width }');
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.centerRight,
              radius: 1.6,
              colors: Pallets.palletColors
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(
                                  seconds: 2), // Duration of the animation
                              curve: Curves.ease, // Curve of the animation
                              width: _animate ? 175 : 0,
                              height: 40,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Pallets.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(
                                    width: 1,
                                    color: Colors.transparent,
                                  ),
                                ),
                                onPressed: () {
                                  _scrollToTop();
                                },
                                child: FadeIn(
                                  animate: locationText,
                                  manualTrigger: true,
                                  controller: (controller) =>
                                      animateController5 = controller,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 16.0,
                                        color: Pallets.textColor1,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(Constants.location,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                fontSize: 14,
                                                color: Pallets.textColor1,
                                              )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AnimatedScale(
                              duration: const Duration(seconds: 2),
                              curve: Curves.ease,
                              scale: _animate ? 1 : 0,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(Constants.profile),
                                radius: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        FadeIn(
                            animate: nameText,
                            manualTrigger: true,
                            controller: (controller) =>
                                animateController6 = controller,
                            child: Text(Constants.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 24,
                                      color: Pallets.textColor1,
                                    ))),
                        const SizedBox(height: 5),
                        FadeInUp(
                            animate: nameText,
                            from: 5,
                            manualTrigger: true,
                            controller: (controller) =>
                                animateController7 = controller,
                            child: Text(Constants.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 35,
                                      color: Pallets.textColor2,
                                    ))),
                        FadeInUp(
                            animate: nameText,
                            from: 5,
                            manualTrigger: true,
                            controller: (controller) =>
                                animateController8 = controller,
                            child: Text(Constants.subTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 35,
                                      color: Pallets.textColor2,
                                    ))),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedScale(
                              duration: const Duration(
                                  seconds: 2), // Duration of the animation
                              curve: Curves.ease, // Curve of the animation
                              scale: showDigits ? 1 : 0,
                              child: CircleAvatar(
                                backgroundColor: Pallets.deepOrange,
                                radius: MediaQuery.of(context).size.width  < 370 ? 83 : 93,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 20),
                                    Text(Constants.buy,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: 14,
                                              color: Pallets.textColor3,
                                            )),
                                    const SizedBox(height: 35),
                                    Countup(
                                        begin: 0,
                                        end: showDigits
                                            ? Constants.number1.toDouble()
                                            : 0,
                                        duration: const Duration(seconds: 2),
                                        separator: ' ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                                fontSize: 38,
                                                color: Pallets.textColor3,
                                                fontWeight: FontWeight.bold)),
                                    Text(Constants.offers,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: 14,
                                              color: Pallets.textColor3,
                                            )),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedScale(
                              duration: const Duration(
                                  seconds: 2), // Duration of the animation
                              curve: Curves.ease, // Curve of the animation
                              scale: showDigits ? 1 : 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width  < 370 ? 160 : 185,
                                height: MediaQuery.of(context).size.height < 650 ? 160 : 185,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Pallets.white,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    Text(Constants.rent,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: 14,
                                              color: Pallets.textColor1,
                                            )),
                                    const SizedBox(height: 37),
                                    Countup(
                                        begin: 0,
                                        end: showDigits
                                            ? Constants.number2.toDouble()
                                            : 0,
                                        duration: const Duration(seconds: 2),
                                        separator: ' ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                                fontSize: 38,
                                                color: Pallets.textColor1,
                                                fontWeight: FontWeight.bold)),
                                    Text(Constants.offers,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: 14,
                                              color: Pallets.textColor1,
                                            )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DraggableScrollableSheet(
                    initialChildSize: minimumValue,
                    minChildSize: minimumValue,
                    maxChildSize: MediaQuery.of(context).size.height < 650 ?  0.58 : 0.66,
                    expand: false,
                    snap: true,
                    controller: dragScrollController,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.vertical,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Pallets.white,
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          Constants.kitchen,
                                          height: 235,
                                          fit: BoxFit.fitWidth,
                                        )),
                                  ),
                                  
                                  GlobalWidget().slideContainer(isButtonAtEnd, 10, MediaQuery.of(context).size.width < 370 ? 350 : 400, 71),

                                  GlobalWidget().slideIcon(isButtonAtEnd, MediaQuery.of(context).size.width < 370 ? 291 : 341, 12.5),

                                  Positioned(
                                      bottom: 10,
                                      child: SizedBox(
                                        height: 50,
                                        width:  MediaQuery.of(context).size.width < 370 ? 350 : 400,
                                        child: Center(
                                          child: FadeIn(
                                              animate: showText,
                                              manualTrigger: true,
                                              controller: (controller) =>
                                                  animateController =
                                                      controller,
                                              child: Text(Constants.home1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          fontSize: 14,
                                                          color: Pallets
                                                              .textColor5,
                                                          fontWeight: FontWeight
                                                              .w500))),
                                        ),
                                    )
                                  )
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: 308,    
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.asset(
                                                  Constants.livingArea,
                                                  fit: BoxFit.fitHeight,
                                                )),
                                          ),
                                          GlobalWidget().slideContainer(
                                              isButtonAtEnd, 10, MediaQuery.of(context).size.width < 370 ? 183 : 205, 61, 40),
                                          GlobalWidget().slideIcon(
                                              isButtonAtEnd,MediaQuery.of(context).size.width < 370 ? 135 : 155 , 12.5, 18),
                                          Positioned(
                                              bottom: 5,
                                              child: SizedBox(
                                                height: 50,
                                                width: MediaQuery.of(context).size.width < 370 ? 183 : 205,
                                                child: Row(
                                                  children: [
                                                    const SizedBox(width: 20),
                                                    FadeIn(
                                                        animate: showText,
                                                        manualTrigger: true,
                                                        controller: (controller) =>
                                                            animateController2 =
                                                                controller,
                                                        child: Text(
                                                            Constants.home3,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleLarge
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    color: Pallets
                                                                        .textColor5,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)))
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width < 370 ? 160 : 185,
                                            height: 150,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.asset(
                                                  Constants.room,
                                                  fit: BoxFit.fill,
                                                )),
                                          ),
                                          GlobalWidget().slideContainer(
                                              isButtonAtEnd, 10,  MediaQuery.of(context).size.width < 370 ? 165 : 190, 61, 40),
                                          GlobalWidget().slideIcon(
                                              isButtonAtEnd, MediaQuery.of(context).size.width < 370 ? 117 : 141, 12.5, 18),
                                          Positioned(
                                              bottom: 5,
                                              child: SizedBox(
                                                height: 50,
                                                width: MediaQuery.of(context).size.width < 370 ? 165 : 190,
                                                child: Row(children: [
                                                  const SizedBox(width: 20),
                                                  FadeIn(
                                                      animate: showText,
                                                      manualTrigger: true,
                                                      controller: (controller) =>
                                                          animateController3 =
                                                              controller,
                                                      child: Text(
                                                          Constants.home2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleLarge
                                                              ?.copyWith(
                                                                  fontSize: 12,
                                                                  color: Pallets
                                                                      .textColor5,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))),
                                                ]),
                                              ))
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Stack(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width < 370 ? 160 : 185,
                                            height: 150,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.asset(
                                                  Constants.livingArea2,
                                                  fit: BoxFit.fill,
                                                )),
                                          ),
                                          GlobalWidget().slideContainer(
                                              isButtonAtEnd, 10, MediaQuery.of(context).size.width < 370 ? 165 : 190 , 61, 40),
                                          GlobalWidget().slideIcon(
                                              isButtonAtEnd, MediaQuery.of(context).size.width < 370 ? 117 : 141 , 12.5, 18),
                                          Positioned(
                                              bottom: 5,
                                              child: SizedBox(
                                                height: 50,
                                                width:  MediaQuery.of(context).size.width < 370 ? 165 : 190,
                                                child: Row(children: [
                                                  const SizedBox(width: 20),
                                                  FadeIn(
                                                      animate: showText,
                                                      manualTrigger: true,
                                                      controller: (controller) =>
                                                          animateController4 =
                                                              controller,
                                                      child: Text(
                                                          Constants.home4,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleLarge
                                                              ?.copyWith(
                                                                  fontSize: 12,
                                                                  color: Pallets
                                                                      .textColor5,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))),
                                                ]),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
