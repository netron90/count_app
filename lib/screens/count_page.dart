import 'package:count_app/components/count_page_components/counter_card.dart';
import 'package:count_app/components/count_page_components/home_header.dart';
import 'package:count_app/components/count_page_components/reset_section.dart';
import 'package:count_app/constants/constants.dart';
import 'package:count_app/screens/result_page.dart';
import 'package:count_app/services/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CountPage extends StatefulWidget {
  CountPage({required this.appTitle});
  String appTitle;
  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int maleNumber = 0, femaleNumber = 0, childNumber = 0;
  Color cardColor = kCardColor,
      cardColorBorder = kBorderColor,
      stateCheckBg = kInactiveDoneBgColor,
      stateIconColor = kInactiveDoneIconColor,
      stateResetBg = kCardColor,
      resetTextColor = kBorderColor;

  InterstitialAd? _interstitialAd;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              resetData();
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  void incrementNumber(PersonType personType) {
    setState(() {
      if (personType == PersonType.male) {
        maleNumber++;
      } else if (personType == PersonType.female) {
        femaleNumber++;
      } else if (personType == PersonType.child) {
        childNumber++;
      } else {}

      if ((maleNumber != 0 || femaleNumber != 0 || childNumber != 0) &&
          stateCheckBg == kInactiveDoneBgColor) {
        resetTextColor = kActiveResetText;
        stateCheckBg = kActiveDoneBgColor;
        stateIconColor = kActiveDoneIconColor;
        stateResetBg = kResetBgColor;
      }
    });
  }

  void resetData() {
    if (maleNumber != 0 || femaleNumber != 0 || childNumber != 0) {
      setState(() {
        maleNumber = 0;
        femaleNumber = 0;
        childNumber = 0;
        stateResetBg = kCardColor;
        stateCheckBg = kInactiveDoneBgColor;
        stateIconColor = kInactiveDoneIconColor;
      });
    }
  }

  Future<dynamic> result(BuildContext context) {
    _loadInterstitialAd();
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          print('Text Male Data: $maleNumber');
          return ResultPage(
              appTitle: kResultPageName,
              maleTextData: maleNumber,
              femaleTextData: femaleNumber,
              childTextData: childNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: AppHeader(
            goToResult: () async {
              if (stateCheckBg == kActiveDoneBgColor) {
                var data = await result(context);
                print(data);
                if (_interstitialAd != null) {
                  _interstitialAd?.show();
                } else {
                  setState(() {
                    maleNumber = data['maleNumber'];
                    femaleNumber = data['femaleNumber'];
                    childNumber = data['childNumber'];
                    stateCheckBg = data['stateCheckBg'];
                    stateIconColor = data['stateIconColor'];
                    stateResetBg = data['stateResetBg'];
                  });
                }
                setState(() {
                  maleNumber = data['maleNumber'];
                  femaleNumber = data['femaleNumber'];
                  childNumber = data['childNumber'];
                  stateCheckBg = data['stateCheckBg'];
                  stateIconColor = data['stateIconColor'];
                  stateResetBg = data['stateResetBg'];
                });
              }
            },
            appTitle: widget.appTitle,
            checkButtonBg: stateCheckBg,
            checkIconColor: stateIconColor,
          ),
        ),
        Expanded(
          flex: 1,
          child: ResetSection(
            onTap: () => resetData(),
            buttonState: stateResetBg,
            maleNumberData: maleNumber,
            femaleNumberData: femaleNumber,
            childNumberData: childNumber,
            buttonTextState: resetTextColor,
            stateCheckBg: stateCheckBg,
            stateIconColor: stateIconColor,
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CounterCard(
                    onTap: () => incrementNumber(PersonType.male),
                    cardColor: kCardColor,
                    cardColorBorder: kBorderColor,
                    number: maleNumber,
                    icon: Icons.male,
                    fontSize: 100.0,
                    stateCheckBg: stateCheckBg,
                    stateIconColor: stateIconColor,
                    stateResetBg: kCardColor,
                    iconRadius: 60.0,
                    dividerWidth: 150.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CounterCard(
                      onTap: () => incrementNumber(PersonType.female),
                      cardColor: kCardColor,
                      cardColorBorder: kBorderColor,
                      number: femaleNumber,
                      icon: Icons.female,
                      fontSize: 60.0,
                      stateCheckBg: stateCheckBg,
                      stateIconColor: stateIconColor,
                      stateResetBg: kCardColor,
                      iconRadius: 55.0,
                      dividerWidth: 80.0),
                  SizedBox(
                    width: 8,
                  ),
                  CounterCard(
                      onTap: () => incrementNumber(PersonType.child),
                      cardColor: kCardColor,
                      cardColorBorder: kBorderColor,
                      number: childNumber,
                      icon: Icons.child_care,
                      fontSize: 60.0,
                      stateCheckBg: stateCheckBg,
                      stateIconColor: stateIconColor,
                      stateResetBg: kCardColor,
                      iconRadius: 55.0,
                      dividerWidth: 80.0)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
