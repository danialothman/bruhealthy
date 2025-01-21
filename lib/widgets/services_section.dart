import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:squircle/squircle.dart';
import '../constants.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 16.0,
        bottom: 26.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Services',
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                    color: homeIsoIconColor,
                                    shape: SquircleBorder(
                                      side: BorderSide(
                                        color: homeIsoIconColor,
                                        width: 1.9,
                                      ),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.houseChimneyMedical,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: heightSizedBox),
                                Text(
                                  "Home Isolation",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: serviceFontSize,
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
                                    color: epidemicMapIconColor,
                                    shape: SquircleBorder(
                                      side: BorderSide(
                                        color: epidemicMapIconColor,
                                        width: 1.9,
                                      ),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.mapLocation,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: heightSizedBox),
                                Text(
                                  "Epidemic Map",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: serviceFontSize,
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
                                    color: selfAssessIconColor,
                                    shape: SquircleBorder(
                                      side: BorderSide(
                                        color: selfAssessIconColor,
                                        width: 1.9,
                                      ),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.bullseye,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: heightSizedBox),
                                Text(
                                  "Self-Assessment",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: serviceFontSize,
                                    color: textColorOne,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                    color: tipIconColor,
                                    shape: SquircleBorder(
                                      side: BorderSide(
                                        color: tipIconColor,
                                        width: 1.9,
                                      ),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.message,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: heightSizedBox),
                                Text(
                                  "COVID-19 Tips",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: serviceFontSize,
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
                                  height: 42,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    color: bruneiIconColor,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      bottomLeft: Radius.circular(12.0),
                                    ),
                                  ),
                                  child: Material(
                                    elevation: 1,
                                    color: bruneiIconColor,
                                    shape: SquircleBorder(
                                      side: BorderSide(
                                        color: bruneiIconColor,
                                        width: 1.9,
                                      ),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.tv,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: heightSizedBox),
                                Text(
                                  "COVID-19 in Brunei",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: serviceFontSize,
                                    color: textColorOne,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              children: [],
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
