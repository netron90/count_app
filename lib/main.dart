import 'package:count_app/constants/constants.dart';
import 'package:count_app/screens/count_page.dart';
import 'package:count_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(MaterialApp(
      title: kAppName,
      home: SplashScreen(),
    )),
  );
}

// Future initialization(BuildContext? context) async {
//   await Future.delayed(Duration(seconds: 3));
// }

class CountApp extends StatelessWidget {
  String appTitle = kAppName;
  int maleNumber = 0, femaleNumber = 0, childNumber = 0;
  // Color doneCheckBg = kInactiveDoneBgColor,
  //     doneIconColor = kInactiveDoneIconColor,
  //     resetBg = kCardColor;
  @override
  Widget build(BuildContext context) {
    return HomePage(appTitle: appTitle);
  }
}

class HomePage extends StatelessWidget {
  HomePage({required this.appTitle});
  final String appTitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          child: CountPage(
            appTitle: appTitle,
          ),
        ),
      ),
    );
  }
}
