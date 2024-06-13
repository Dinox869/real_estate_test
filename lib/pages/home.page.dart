import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool showText = false;
  late AnimationController animateController, animateController2, animateController3, animateController4;

  String formatNumberWithSpaces(int number) {
  String numStr = number.toString();
  String result = '';
  int count = 0;
  for (int i = numStr.length - 1; i >= 0; i--) {
    result = numStr[i] + result;
    count++;
    if (count == 3 && i != 0) {
      result = ' ' + result;
      count = 0;
    }
  }

  return result;
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    animateController = AnimationController(vsync: this, duration: const Duration(milliseconds: 10));
    animateController4 = AnimationController(vsync: this, duration: const Duration(milliseconds: 10));
    animateController2 = AnimationController(vsync: this, duration: const Duration(milliseconds: 10));
    animateController3 = AnimationController(vsync: this, duration: const Duration(milliseconds: 10));
  }

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
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
          gradient:  RadialGradient(
            center: Alignment.centerRight, 
            radius: 1.6, 
            colors: [
              Color(0xFFFAD7AF),
              Color(0xFFFADBB7),
              Color(0xFFFADFBF),
              Color(0xFFFADFBF),
              Color(0xFFFADFBF),
              Color(0xFFF9EBDA),
              Color(0xFFF9EBDA),
              Color(0xFFF9EBDA),
              Color(0xFFF9EBDA),
              Color(0xFFF9EEE2),
              Color(0xFFF9EFE4),
              Color(0xFFF8F0E7), 
              Color(0xFFF8F2EB), 
              Color(0xFFF8F3ED), 
              Color(0xFFF8F4EF),
              Color(0xFFF8F5F2),
              Color(0xFFF8F6F3),
              Color(0xFFF8F7F5),
              Color(0xFFF8F8F8),
            ],
          ),
        ),
          child: Column(
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
                        OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                                backgroundColor: Pallets.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                      onPressed: () {
                                                 setState(() {
                                    isButtonAtEnd = !isButtonAtEnd;
                                  });
                                startTextAnimation();
                      },
                      icon: Icon( Icons.location_on, size: 16.0, color: Pallets.textColor1, ),
                      label: Text(Constants.location, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14, color: Pallets.textColor1,)),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(Constants.profile),
                      radius: 20,
                    ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(Constants.name, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 24, color: Pallets.textColor1,)),
                    Text(Constants.title, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 35, color: Pallets.textColor2,)),
                    Text(Constants.subTitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 35, color: Pallets.textColor2,)),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Pallets.deepOrange,
                          radius: 93,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                const SizedBox(height: 20),
                                Text(Constants.buy, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14, color: Pallets.textColor3,)),
                                const SizedBox(height: 35),
                                Text(formatNumberWithSpaces(Constants.number1), style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 38, color: Pallets.textColor3, fontWeight: FontWeight.bold)),
                                Text(Constants.offers, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14, color: Pallets.textColor3,)),
                            ],
                          ),
                        ),
                        Container(
                          width: 185,
                          height: 185,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Pallets.white,
                          ),
                          child: Column(
                            children: [
                               const SizedBox(height: 20),
                                Text(Constants.rent, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14, color: Pallets.textColor1,)),
                                const SizedBox(height: 37),
                                Text(formatNumberWithSpaces(Constants.number2), style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 38, color: Pallets.textColor1, fontWeight: FontWeight.bold)),
                                Text(Constants.offers, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14, color: Pallets.textColor1,)),
                          ],),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                      color: Pallets.white,
                    ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(Constants.kitchen, height: 200, fit: BoxFit.fitWidth,)),
                        ),
                        GlobalWidget().slideContainer(isButtonAtEnd, 10, 400, 71),
                        GlobalWidget().slideIcon(isButtonAtEnd, 341, 12.5),
                          Positioned(
                            bottom: 10,
                            child: SizedBox(
                               height: 50,
                               width: 400,
                              child: Center(
                                child: FadeIn(
                                  animate: showText,
                                  manualTrigger: true,
                                  controller: (controller) => animateController = controller,
                                   child: Text(Constants.home1, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16, color: Pallets.textColor5, fontWeight: FontWeight.w500))),
                              ),
                            )
                          )
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width/2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(Constants.livingArea,  fit: BoxFit.fitHeight,)
                                ),
                              ),
                              GlobalWidget().slideContainer(isButtonAtEnd, 10, 205, 61, 40),
                              GlobalWidget().slideIcon(isButtonAtEnd, 155, 12.5, 18),
                              Positioned(
                                  bottom: 5,
                                  child: SizedBox(
                                    height: 50,
                                    width: 205,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        FadeIn(
                                          animate: showText,
                                          manualTrigger: true,
                                          controller: (controller) => animateController2 = controller,
                                            child: Text(Constants.home3, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16, color: Pallets.textColor5, fontWeight: FontWeight.w500))
                                          )
                                        ],
                                    ),
                                  )
                                )
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
                                width: 185, height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(Constants.room, fit: BoxFit.fill, )),
                              ),
                              GlobalWidget().slideContainer(isButtonAtEnd, 10, 190, 61, 40),
                              GlobalWidget().slideIcon(isButtonAtEnd, 141, 12.5, 18),
                              Positioned(
                                  bottom: 5,
                                  child: SizedBox(
                                    height: 50,
                                    width: 190,
                                    child: Row(
                                      children: [ 
                                        const SizedBox(width: 20),
                                        FadeIn(
                                          animate: showText,
                                          manualTrigger: true,
                                          controller: (controller) => animateController3 = controller,
                                          child: Text(Constants.home2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16, color: Pallets.textColor5, fontWeight: FontWeight.w500))),
                                      ]
                                    ),
                                  )
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            children:[ 
                              SizedBox(
                                width: 185, height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(Constants.livingArea2, fit: BoxFit.fill,)),
                                ),
                                GlobalWidget().slideContainer(isButtonAtEnd, 10, 190, 61, 40),
                                GlobalWidget().slideIcon(isButtonAtEnd, 141, 12.5, 18),
                                Positioned(
                                  bottom: 5,
                                  child: SizedBox(
                                    height: 50,
                                    width: 190,
                                    child: Row(
                                      children: [ 
                                        const SizedBox(width: 20),
                                        FadeIn(
                                          animate: showText,
                                          manualTrigger: true,
                                          controller: (controller) => animateController4 = controller,
                                          child: Text(Constants.home4, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16, color: Pallets.textColor5, fontWeight: FontWeight.w500))),
                                      ]
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    ],),
                    const SizedBox(height: 10),
                  ],
                ),
              )
          
            ],
          ),
        ),
      ),
    );
  }
}