import 'package:flutter/material.dart';
import 'package:universityavggpacalculator/constants/app_constants.dart';
import 'package:universityavggpacalculator/helper/data_helper.dart';
import 'package:universityavggpacalculator/model/lesson.dart';
import 'package:universityavggpacalculator/widgets/character_dropdown_widget.dart';
import 'package:universityavggpacalculator/widgets/credit_dropdown_widget.dart';
import 'package:universityavggpacalculator/widgets/lesson_list.dart';
import 'package:universityavggpacalculator/widgets/show_average.dart';

class AvgGPAcalculator extends StatefulWidget {
  const AvgGPAcalculator({super.key});

  @override
  State<AvgGPAcalculator> createState() => _AvgGPAcalculatorState();
}

class _AvgGPAcalculatorState extends State<AvgGPAcalculator> {
  var formKey = GlobalKey<FormState>();
  double selectedGPAValue = 4;
  double selectedCreditValue = 1;
  String enteredLessonName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Constants.title,
            style: Constants.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(
                    average: DataHelper.findAverage(),
                    numberOfLessons: DataHelper.allAddedLessons.length),
              ),
            ],
          ),
          Expanded(
            child: LessonList(onDismiss: (index) {
              DataHelper.allAddedLessons.removeAt(index);
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.horizantalPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.horizantalPadding8,
                  child: CharDropDown(
                    onCharSelected: (character) {
                      selectedGPAValue = character;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.horizantalPadding8,
                  child: CreditDropDown(
                    onCreditSelected: (credit) {
                      selectedCreditValue = credit;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _addLessonandFindAverage,
                icon: Icon(Icons.arrow_forward_ios_rounded),
                color: Constants.mainColor,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      onSaved: (value) {
        setState(() {
          enteredLessonName = value!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Please Enter Lesson";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Enter Lesson",
        border: OutlineInputBorder(
            borderRadius: Constants.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Constants.mainColor.shade100,
      ),
    );
  }

  void _addLessonandFindAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var lessonToBeAdded = Lesson(
          name: enteredLessonName,
          GPA: selectedGPAValue,
          Credit: selectedCreditValue);
      DataHelper.addLesson(lessonToBeAdded);
    }
  }
}
