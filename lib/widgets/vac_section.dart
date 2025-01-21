import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:squircle/squircle.dart';
import '../constants.dart';

class VacSection extends StatelessWidget {
  const VacSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Vaccination',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: cardShadowColor,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Material(
                              elevation: 1,
                              color: appointmentIconColor,
                              shape: SquircleBorder(
                                side: BorderSide(
                                  color: appointmentIconColor,
                                  width: 1.9,
                                ),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.syringe,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: heightSizedBox),
                          Text(
                            "Vaccination Appointment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: vacFontSize,
                              color: textColorOne,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Material(
                              elevation: 1,
                              color: certificateIconColor,
                              shape: SquircleBorder(
                                side: BorderSide(
                                  color: certificateIconColor,
                                  width: 1.9,
                                ),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.creditCard,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: heightSizedBox),
                          Text(
                            "Vaccination Certificate",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: vacFontSize,
                              color: textColorOne,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Material(
                              elevation: 1,
                              color: reportingIconColor,
                              shape: SquircleBorder(
                                side: BorderSide(
                                  color: reportingIconColor,
                                  width: 1.9,
                                ),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.calendar,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: heightSizedBox),
                          Text(
                            "Vaccine ADR Reporting",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: vacFontSize,
                              color: textColorOne,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
