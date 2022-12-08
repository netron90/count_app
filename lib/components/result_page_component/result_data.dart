import 'package:count_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ResultData extends StatelessWidget {
  ResultData({required this.icon, required this.data});
  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: kCardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: kBorderColor, width: 1.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: kBorderColor, width: 2.0),
                          ),
                          child: Icon(
                            icon,
                            color: kBorderColor,
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kBorderColor)),
                        child: Divider(
                          height: 40.0,
                          thickness: 3.0,
                          color: kBorderColor,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        data,
                        style: TextStyle(
                            fontSize: 60.0,
                            color: kTextColor,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          kResultText,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: kTextColor,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
