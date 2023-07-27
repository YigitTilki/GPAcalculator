import 'package:flutter/material.dart';
import 'package:universityavggpacalculator/constants/app_constants.dart';
import 'package:universityavggpacalculator/widgets/avg_gpa_calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Average GPA Calculator",
      theme: ThemeData(
        primarySwatch: Constants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AvgGPAcalculator(),
    );
  }
}
