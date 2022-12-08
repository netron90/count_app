import 'package:count_app/constants/constants.dart';
import 'package:flutter/material.dart';

class GoToHome extends StatelessWidget {
  Map<dynamic, dynamic> data = {};
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
                onPressed: () {
                  data['maleNumber'] = 0;
                  data['femaleNumber'] = 0;
                  data['childNumber'] = 0;
                  data['stateCheckBg'] = kInactiveDoneBgColor;
                  data['stateIconColor'] = kInactiveDoneIconColor;
                  data['stateResetBg'] = kCardColor;
                  Navigator.pop(context, data);
                },
                child: Text(
                  "RESET",
                  style: TextStyle(
                      color: kBorderColor, letterSpacing: 2.0, fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: kCardColor,
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
