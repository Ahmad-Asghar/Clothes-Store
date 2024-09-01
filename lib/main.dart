import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app/screens/get_started_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return  MaterialApp(
          home: GetStartedScreen(),
          debugShowCheckedModeBanner: false
      );
    });
  }
}
