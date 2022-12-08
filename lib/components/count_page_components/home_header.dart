import 'package:count_app/constants/constants.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  AppHeader(
      {required this.goToResult,
      required this.appTitle,
      required this.checkButtonBg,
      required this.checkIconColor});
  final String appTitle;
  final Color checkButtonBg;
  final Color checkIconColor;
  final VoidCallback goToResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 75.0),
            child: Text(
              appTitle,
              style: const TextStyle(
                  color: kAppTitleTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: FloatingActionButton(
            onPressed: goToResult,
            backgroundColor: checkButtonBg,
            child: Icon(
              Icons.check,
              color: checkIconColor,
            ),
          ),
        )
      ],
    );
  }
}
