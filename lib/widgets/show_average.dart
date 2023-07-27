import 'package:flutter/material.dart';
import 'package:universityavggpacalculator/constants/app_constants.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int numberOfLessons;

  const ShowAverage(
      {super.key, required this.average, required this.numberOfLessons});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfLessons > 0
              ? "$numberOfLessons lessons entered"
              : "Enter Lesson",
          style: Constants.showAverageBodyStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: Constants.showAverageStyle,
        ),
        Text(
          "Average",
          style: Constants.showAverageBodyStyle,
        ),
      ],
    );
  }
}
