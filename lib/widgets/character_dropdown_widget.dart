import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class CharDropDown extends StatefulWidget {
  const CharDropDown({super.key, required this.onCharSelected});
  final Function onCharSelected;

  @override
  State<CharDropDown> createState() => _CharDropDownState();
}

class _CharDropDownState extends State<CharDropDown> {
  double selectedGpaValue = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100,
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: selectedGpaValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        items: DataHelper.allGPAs(),
        underline: Container(),
        onChanged: (value) {
          setState(() {
            selectedGpaValue = value!;
            widget.onCharSelected(selectedGpaValue);
          });
        },
      ),
    );
  }
}
