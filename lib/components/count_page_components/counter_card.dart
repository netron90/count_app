import 'package:count_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  CounterCard(
      {required this.onTap,
      required this.cardColor,
      required this.cardColorBorder,
      required this.number,
      required this.icon,
      required this.fontSize,
      required this.stateCheckBg,
      required this.stateIconColor,
      required this.stateResetBg,
      required this.iconRadius,
      required this.dividerWidth});
  Color cardColor, cardColorBorder, stateCheckBg, stateIconColor, stateResetBg;
  int number;
  final IconData icon;
  final double fontSize, iconRadius, dividerWidth;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: kCardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: kBorderColor, width: 1.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 18, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      number.toString(),
                      style: TextStyle(
                          fontSize: fontSize,
                          color: kTextColor,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      width: dividerWidth,
                      child: Divider(
                        height: 1.0,
                        color: kBorderColor,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: iconRadius,
                      height: iconRadius,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: kBorderColor, width: 2.0),
                      ),
                      child: Icon(
                        icon,
                        color: kBorderColor,
                        size: 24,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
