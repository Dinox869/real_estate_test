import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/common/pallets.dart';

class GlobalWidget {

  Widget slideContainer( bool canSlide, double padding, double widthEnd, double widthStart ,[double height = 50] ){
    return AnimatedPositioned(
                            duration:  const Duration(seconds: 4),
                            curve: Curves.easeInOut,
                            height: height,
                            width: canSlide ? widthEnd : widthStart,
                            bottom: 10,
                            child:  Padding(
                              padding:  EdgeInsets.symmetric(horizontal: padding),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(23),
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color:Colors.grey.withOpacity(0.1),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
  }

  Widget slideIcon(bool canSlide, double widthEnd, double widthStart,[double radius = 23]) {
    return AnimatedPositioned(
                            duration: const Duration(seconds: 4),
                            curve: Curves.easeInOut,
                            left: canSlide ? widthEnd : widthStart,
                            bottom: 12,
                            child: CircleAvatar(
                              radius: radius,
                              backgroundColor: Pallets.white,
                              child: Icon(Icons.arrow_forward_ios, color: Pallets.buttonColor, size: 10,),
                            ),
                          );
  }

  Widget fadeInText( double width,bool canSlide, AnimationController animateController, String text, BuildContext context) {
    return  Positioned(
                            bottom: 10,
                            child: SizedBox(
                               height: 50,
                               width: width,
                              child: Center(
                                child: FadeIn(
                                  animate: canSlide,
                                  manualTrigger: true,
                                  controller: (controller) => animateController = controller,
                                   child: Text(text, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16, color: Pallets.textColor5, fontWeight: FontWeight.w500))),
                              ),
                            )
                          );
  }

}