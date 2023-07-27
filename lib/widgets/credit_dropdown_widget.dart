import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class CreditDropDown extends StatefulWidget {
  const CreditDropDown({super.key, required this.onCreditSelected});
  final Function onCreditSelected;

  @override
  State<CreditDropDown> createState() => _CreditDropDownState();
}

class _CreditDropDownState extends State<CreditDropDown> {
  double selectedCreditValue = 1;

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
        value: selectedCreditValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        items: DataHelper.allCredits(),
        underline: Container(),
        onChanged: (value) {
          setState(() {
            selectedCreditValue = value!;
            widget.onCreditSelected();
          });
        },
      ),
    );
  }
}
