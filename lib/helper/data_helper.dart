import 'package:flutter/material.dart';
import 'package:universityavggpacalculator/model/lesson.dart';

class DataHelper {
  static List<Lesson> allAddedLessons = [];
  static addLesson(Lesson lesson) {
    allAddedLessons.add(lesson);
  }

  static double findAverage() {
    double totalPoint = 0;
    double totalCredit = 0;

    allAddedLessons.forEach((element) {
      totalPoint = totalPoint + (element.Credit * element.GPA);
      totalCredit += element.Credit;
    });
    return totalPoint / totalCredit;
  }

  static List<String> _GPA() {
    return ["AA", "BA", "BB", "CB", "CC", "CD", "DD", "FD", "FF"];
  }

  static double _GPAconverter(String character) {
    switch (character) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "CD":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allGPAs() {
    return _GPA()
        .map(
          (e) => DropdownMenuItem<double>(
            child: Text(e),
            value: _GPAconverter(e),
          ),
        )
        .toList();
  }

  static List<int> _Credits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCredits() {
    return _Credits()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
