import 'package:count_app/components/result_page_component/go_to_home.dart';
import 'package:count_app/components/result_page_component/result_data.dart';
import 'package:count_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.appTitle,
      required this.maleTextData,
      required this.femaleTextData,
      required this.childTextData});

  final String appTitle;
  final int maleTextData, femaleTextData, childTextData;
  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        data['maleNumber'] = 0;
        data['femaleNumber'] = 0;
        data['childNumber'] = 0;
        data['stateCheckBg'] = kInactiveDoneBgColor;
        data['stateIconColor'] = kInactiveDoneIconColor;
        data['stateResetBg'] = kCardColor;
        Navigator.pop(context, data);
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kStartGradientColor, kEndGradientColor],
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        appTitle,
                        style: const TextStyle(
                            color: kAppTitleTextColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ResultData(
                      icon: Icons.male,
                      data: maleTextData.toString(),
                    ),
                    ResultData(
                      icon: Icons.female,
                      data: femaleTextData.toString(),
                    ),
                    ResultData(
                      icon: Icons.child_care,
                      data: childTextData.toString(),
                    )
                  ],
                ),
                GoToHome()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
