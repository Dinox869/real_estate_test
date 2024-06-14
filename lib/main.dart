import 'package:flutter/material.dart';
import 'package:real_estate/common/constants.dart';
import 'package:real_estate/pages/root.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    // to preload the assets images
    precacheImage(AssetImage(Constants.profile), context);
    precacheImage(AssetImage(Constants.kitchen), context);
    precacheImage(AssetImage(Constants.livingArea), context);
    precacheImage(AssetImage(Constants.livingArea2), context);
    precacheImage(AssetImage(Constants.room), context);
    precacheImage(AssetImage(Constants.map), context);

   
    return MaterialApp(
      title: 'Real Estate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RootPage(),
    );
  }
}