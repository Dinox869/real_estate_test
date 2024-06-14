import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:real_estate/common/constants.dart';
import 'package:real_estate/common/pallets.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> with TickerProviderStateMixin {
  bool showText = false;
  bool _isExpanded = false, _showContainer = false, showPrice = false;
  late AnimationController animateController,
      animateController2,
      animateController3,
      animateController4,
      animateController5,
      animateController6;

  @override
  void initState() {
    animateController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController5 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animateController6 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animation();
    super.initState();
  }

// starts the animation for all the widgets 
  void animation() async {
    await Future.delayed(const Duration(milliseconds: 200), () async {
      setState(() {
        _isExpanded = true;
      });
      await Future.delayed(const Duration(milliseconds: 1100), () {
        animateController.forward();
        animateController2.forward();
        animateController3.forward();
        animateController4.forward();
        animateController5.forward();
        animateController6.forward();
        showText = true;
      });
    });
  }

 // Animates the icon to text change
  void animatePrice() async {
    setState(() {
      animateController.reverse();
      animateController2.reverse();
      animateController3.reverse();
      animateController4.reverse();
      animateController5.reverse();
      animateController6.reverse();
      _showContainer = false;
    });
    await Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        debugPrint('step B');
        showPrice = false;
        animateController.forward();
        animateController2.forward();
        animateController3.forward();
        animateController4.forward();
        animateController5.forward();
        animateController6.forward();
      });
    });
  }


// Animates the text to icon change
  void animateLayers() async {
    setState(() {
      animateController.reverse();
      animateController2.reverse();
      animateController3.reverse();
      animateController4.reverse();
      animateController5.reverse();
      animateController6.reverse();
      _showContainer = false;
    });
    await Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        showPrice = true;
        animateController.forward();
        animateController2.forward();
        animateController3.forward();
        animateController4.forward();
        animateController5.forward();
        animateController6.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallets.black,
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              Constants.map,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: 55,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedScale(
                      duration: const Duration(
                          seconds: 2), // Duration of the animation
                      curve: Curves.ease, // Curve of the animation
                      scale: _isExpanded ? 1 : 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: TextFormField(
                            onTap: () {},
                            textAlign: TextAlign.start,
                            readOnly: true,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 14,
                                      color: Pallets.black,
                                    ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              fillColor: Colors.white,
                              errorStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 11, color: Colors.red[400]),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 16,
                                    color: Pallets.black,
                                  ),
                              hintText: Constants.location,
                              prefixIcon: Icon(
                                Icons.search,
                                size: 24,
                                color: Pallets.black,
                              ),
                            ),
                            onChanged: (value) {},
                            onSaved: (value) {},
                            validator: (String? value) {
                              return null;
                            }),
                      ),
                    ),
                    const SizedBox(width: 10),
                    AnimatedScale(
                      duration: const Duration(
                          seconds: 2), // Duration of the animation
                      curve: Curves.ease, // Curve of the animation
                      scale: _isExpanded ? 1 : 0,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Pallets.white,
                        child: Icon(
                          Symbols.page_info,
                          color: Pallets.buttonColor,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 105,
              left: 40,
              child: GestureDetector(
                onTap: () {},
                child: AnimatedScale(
                  duration: const Duration(seconds: 2),
                  curve: Curves.ease,
                  scale: _isExpanded ? 1 : 0,
                  child: SizedBox(
                    height: 48,
                    width: 48,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            child: Icon(Icons.near_me_outlined,
                                color: Pallets.white.withOpacity(0.8),
                                size: 20),
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 157,
              left: 40,
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    _showContainer = true;
                  });
                },
                child: AnimatedScale(
                  duration:
                      const Duration(seconds: 2), // Duration of the animation
                  curve: Curves.ease, // Curve of the animation
                  scale: _isExpanded ? 1 : 0,
                  child: SizedBox(
                    height: 48,
                    width: 48,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            child: Icon(Symbols.stacks,
                                color: Pallets.white.withOpacity(0.8),
                                size: 20),
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 105,
              right: 40,
              child: AnimatedScale(
                duration:
                    const Duration(seconds: 2), // Duration of the animation
                curve: Curves.ease, // Curve of the animation
                scale: _isExpanded ? 1 : 0,
                child: SizedBox(
                  height: 48,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          side: const BorderSide(
                            width: 1,
                            color: Colors.transparent,
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.sort,
                          size: 20.0,
                          color: Pallets.white.withOpacity(0.8),
                        ),
                        label: Text(Constants.list,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 14,
                                  color: Pallets.white.withOpacity(0.8),
                                )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 2.1,
                  left: MediaQuery.of(context).size.width / 1.5,
                ),
                child: AnimatedContainer(
                  duration:
                      const Duration(seconds: 2), // Duration of the animation
                  curve: Curves.ease, // Curve of the animation
                  height: _isExpanded ? 48 : 0,
                  width: _isExpanded
                      ? showPrice
                          ? 45
                          : 78
                      : 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Pallets.deepOrange,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Center(
                      child: FadeIn(
                          animate: showText,
                          manualTrigger: true,
                          controller: (controller) =>
                              animateController = controller,
                          child: showPrice
                              ? Icon(Symbols.apartment,
                                  color: Pallets.white, size: 20)
                              : Text(Constants.distance1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: 12,
                                        color: Pallets.white,
                                      ))),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 3.3,
                  left: MediaQuery.of(context).size.width / 1.7,
                ),
                child: AnimatedContainer(
                  duration:
                      const Duration(seconds: 2), // Duration of the animation
                  curve: Curves.ease, // Curve of the animation
                  height: _isExpanded ? 48 : 0,
                  width: _isExpanded
                      ? showPrice
                          ? 45
                          : 78
                      : 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Pallets.deepOrange,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Center(
                      child: FadeIn(
                          animate: showText,
                          manualTrigger: true,
                          controller: (controller) =>
                              animateController2 = controller,
                          child: showPrice
                              ? Icon(Symbols.apartment,
                                  color: Pallets.white, size: 20)
                              : Text(Constants.distance2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: 12,
                                        color: Pallets.white,
                                      ))),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 2.3,
                    left: MediaQuery.of(context).size.width / 4),
                child: AnimatedContainer(
                  duration:
                      const Duration(seconds: 2), // Duration of the animation
                  curve: Curves.ease, // Curve of the animation
                  height: _isExpanded ? 48 : 0,
                  width: _isExpanded
                      ? showPrice
                          ? 45
                          : 78
                      : 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Pallets.deepOrange,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Center(
                      child: FadeIn(
                          animate: showText,
                          manualTrigger: true,
                          controller: (controller) =>
                              animateController3 = controller,
                          child: showPrice
                              ? Icon(Symbols.apartment,
                                  color: Pallets.white, size: 20)
                              : Text(Constants.distance3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: 12,
                                        color: Pallets.white,
                                      ))),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 1.6,
                    left: MediaQuery.of(context).size.width / 1.5),
                child: AnimatedContainer(
                  duration:
                      const Duration(seconds: 2), // Duration of the animation
                  curve: Curves.ease, // Curve of the animation
                  height: _isExpanded ? 48 : 0,
                  width: _isExpanded
                      ? showPrice
                          ? 45
                          : 78
                      : 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Pallets.deepOrange,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Center(
                      child: FadeIn(
                          animate: showText,
                          manualTrigger: true,
                          controller: (controller) =>
                              animateController4 = controller,
                          child: showPrice
                              ? Icon(Symbols.apartment,
                                  color: Pallets.white, size: 20)
                              : Text(Constants.distance4,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: 12,
                                        color: Pallets.white,
                                      ))),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 1.35,
                  left: MediaQuery.of(context).size.width / 3.5,
                ),
                child: AnimatedContainer(
                  duration:
                      const Duration(seconds: 2), // Duration of the animation
                  curve: Curves.ease, // Curve of the animation
                  height: _isExpanded ? 48 : 0,
                  width: _isExpanded
                      ? showPrice
                          ? 45
                          : 78
                      : 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Pallets.deepOrange,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Center(
                      child: FadeIn(
                          animate: showText,
                          manualTrigger: true,
                          controller: (controller) =>
                              animateController5 = controller,
                          child: showPrice
                              ? Icon(Symbols.apartment,
                                  color: Pallets.white, size: 20)
                              : Text(Constants.distance5,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: 12,
                                        color: Pallets.white,
                                      ))),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 1.5,
                  left: MediaQuery.of(context).size.width / 2.9,
                ),
                child: AnimatedContainer(
                  duration:
                      const Duration(seconds: 2), // Duration of the animation
                  curve: Curves.ease, // Curve of the animation
                  height: _isExpanded ? 48 : 0,
                  width: _isExpanded
                      ? showPrice
                          ? 45
                          : 78
                      : 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Pallets.deepOrange,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Center(
                      child: FadeIn(
                          animate: showText,
                          manualTrigger: true,
                          controller: (controller) =>
                              animateController6 = controller,
                          child: showPrice
                              ? Icon(Symbols.apartment,
                                  color: Pallets.white, size: 20)
                              : Text(Constants.distance6,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: 12,
                                        color: Pallets.white,
                                      ))),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 157,
                  left: 40,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                  height: _showContainer ? 158 : 0,
                  width: _showContainer ? 180 : 0,
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Pallets.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: _showContainer ? 158 : 0,
                      width: _showContainer ? 180 : 0,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        // primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Row(
                            children: [
                              Icon(Icons.security,
                                  color: Pallets.grey, size: 20),
                              const SizedBox(width: 10),
                              Flexible(
                                  child: Text(Constants.cosy,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontSize: 14,
                                              color: Pallets.grey)))
                            ],
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              animatePrice();
                            },
                            child: Container(
                              color: Pallets.transparent,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Icon(Icons.wallet,
                                      color: !showPrice
                                          ? Pallets.deepOrange
                                          : Pallets.grey,
                                      size: 20),
                                  const SizedBox(width: 10),
                                  Flexible(
                                      child: Text(Constants.price,
                                          overflow: TextOverflow.clip,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontSize: 14,
                                                  color: !showPrice
                                                      ? Pallets.deepOrange
                                                      : Pallets.grey)))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(Symbols.shopping_basket,
                                  color: Pallets.grey, size: 20),
                              const SizedBox(width: 10),
                              Flexible(
                                  child: Text(Constants.infrastructure,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontSize: 14,
                                              color: Pallets.grey)))
                            ],
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              animateLayers();
                            },
                            child: Row(
                              children: [
                                Icon(Icons.layers,
                                    color: showPrice
                                        ? Pallets.deepOrange
                                        : Pallets.grey,
                                    size: 20),
                                const SizedBox(width: 10),
                                Flexible(
                                    child: Text(Constants.layer,
                                        overflow: TextOverflow.clip,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontSize: 14,
                                                color: showPrice
                                                    ? Pallets.deepOrange
                                                    : Pallets.grey)))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
