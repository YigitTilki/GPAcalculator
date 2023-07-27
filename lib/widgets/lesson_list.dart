import 'package:flutter/material.dart';
import 'package:universityavggpacalculator/constants/app_constants.dart';
import 'package:universityavggpacalculator/helper/data_helper.dart';
import 'package:universityavggpacalculator/model/lesson.dart';

// ignore: must_be_immutable
class LessonList extends StatelessWidget {
  LessonList({super.key, required this.onDismiss});
  final Function onDismiss;

  List<Lesson> allLessons = DataHelper.allAddedLessons;

  @override
  Widget build(BuildContext context) {
    return allLessons.length > 0
        ? ListView.builder(
            itemCount: allLessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        allLessons[index].name,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text(
                          (allLessons[index].GPA * allLessons[index].Credit)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          "${allLessons[index].Credit} Credits,  ${allLessons[index].GPA} GPA"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                "Please Enter Lesson",
                style: Constants.titleStyle,
              ),
            ),
          );
  }
}
