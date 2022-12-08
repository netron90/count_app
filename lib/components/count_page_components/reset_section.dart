import 'package:count_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ResetSection extends StatelessWidget {
  ResetSection(
      {required this.onTap,
      required this.buttonState,
      required this.maleNumberData,
      required this.femaleNumberData,
      required this.childNumberData,
      required this.buttonTextState,
      required this.stateCheckBg,
      required this.stateIconColor});

  Color buttonState, buttonTextState;
  final int maleNumberData, femaleNumberData, childNumberData;
  Color stateCheckBg, stateIconColor;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1.0,
          thickness: 1.0,
          color: kDividerColor,
        ),
        SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onTap,
                child: Text(
                  "RESET",
                  style: TextStyle(
                      color: buttonTextState,
                      letterSpacing: 2.0,
                      fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: buttonState,
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: kBorderColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.0,
        ),
        Divider(
          height: 1.0,
          thickness: 1.0,
          color: kDividerColor,
        )
      ],
    );
  }
}
