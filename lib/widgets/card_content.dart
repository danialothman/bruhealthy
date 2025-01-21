import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../constants.dart';
import 'dose_cookie.dart';

class CardContent extends StatefulWidget {
  final VoidCallback showFAB;
  final VoidCallback moreDose;
  final VoidCallback resetDose;

  const CardContent({
    Key? key,
    required this.showFAB,
    required this.moreDose,
    required this.resetDose,
  }) : super(key: key);

  @override
  State<CardContent> createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  bool artTestNegativeBool = true;
  bool idIsVisible = true;

  Widget artTestNegative() {
    return Row(
      children: [
        const FaIcon(
          FontAwesomeIcons.circleMinus,
          size: 18.0,
          color: Color(0xff4bae78),
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: () {
            setState(() {
              artTestNegativeBool = false;
            });
          },
          child: const Text(
            'Negative',
            style: TextStyle(color: Color(0xff4bae78)),
          ),
        ),
      ],
    );
  }

  Widget artTestPositive() {
    return Row(
      children: [
        const FaIcon(
          FontAwesomeIcons.circlePlus,
          size: 18.0,
          color: Colors.red,
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: () {
            setState(() {
              artTestNegativeBool = true;
            });
          },
          child: const Text(
            'Positive',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget showIdFunc() {
    return Row(
      children: [
        Text(' $idNumber', style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: () {
            setState(() {
              idIsVisible = false;
            });
          },
          child: const FaIcon(
            FontAwesomeIcons.eye,
            color: Colors.white,
            size: 12.0,
          ),
        )
      ],
    );
  }

  Widget hideIdFunc(String id) {
    String hiderPlaceholder = "****";
    String censoredId = id.replaceRange(2, id.length - 2, hiderPlaceholder);
    return Row(
      children: [
        Text(' $censoredId', style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: () {
            setState(() {
              idIsVisible = true;
            });
          },
          child: const FaIcon(
            FontAwesomeIcons.eyeSlash,
            color: Colors.white,
            size: 12.0,
          ),
        )
      ],
    );
  }

  Widget doseMeUp(int numberOfDoses) {
    return Wrap(
      runSpacing: 10,
      children: [
        if (onlyShowLastVac) doseCookie(initialDose, ordinalIndex),
        if (!onlyShowLastVac)
          for (int i = 0; i < numberOfDoses; i++)
            doseCookie(i + 1, ordinalIndex),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 18.0, bottom: 8.0),
            child: Text(
              "Public Health",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Stack(
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: WaveWidget(
                      config: CustomConfig(
                        gradients: initialWaveColor,
                        durations: [35000, 19440, 12800, 10000],
                        heightPercentages: [0.80, 0.83, 0.85, 0.88],
                        gradientBegin: Alignment.topRight,
                        gradientEnd: Alignment.bottomLeft,
                      ),
                      backgroundColor: initialBackground,
                      duration: 32000,
                      waveAmplitude: 0,
                      heightPercentage: 1,
                      size: const Size(
                        double.infinity,
                        100,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16.0),
                                Text(
                                  name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '$gender, $age,',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    ((() {
                                      if (idIsVisible) {
                                        return showIdFunc();
                                      } else {
                                        return hideIdFunc(idNumber);
                                      }
                                    })()),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 0.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (initialCardCode ==
                                            cardCode.length - 1) {
                                          initialCardCode = 0;
                                        } else {
                                          initialCardCode++;
                                        }
                                        if (initialCardCode == 0) {
                                          initialWaveColor = greenWave;
                                          initialBackground = greenBackground;
                                          artTestNegativeBool = true;
                                        }
                                        if (initialCardCode == 1) {
                                          initialWaveColor = yellowWave;
                                          initialBackground = yellowBackground;
                                          artTestNegativeBool = true;
                                        }
                                        if (initialCardCode == 2) {
                                          initialWaveColor = redWave;
                                          initialBackground = redBackground;
                                          artTestNegativeBool = true;
                                        }
                                        if (initialCardCode == 3) {
                                          initialWaveColor = purpleWave;
                                          initialBackground = purpleBackground;
                                          artTestNegativeBool = false;
                                        }
                                        if (initialCardCode == 4) {
                                          initialWaveColor = blueWave;
                                          initialBackground = blueBackground;
                                          artTestNegativeBool = true;
                                        }
                                      });
                                    },
                                    child: Text(
                                      cardCode[initialCardCode],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      color: initialBackground,
                      offset: const Offset(0.0, 3),
                    ),
                  ],
                ),
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 18.0,
                                  bottom: 8.0,
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onDoubleTap: widget.showFAB,
                                      child: const Text(
                                        'COVID-19 Vaccination',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Wrap(
                                runSpacing: 8.0,
                                children: [
                                  doseMeUp(initialDose),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 18.0,
                                  bottom: 8.0,
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      'COVID-19 Test',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    const SizedBox(width: 5.0),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0),
                                        ),
                                        border: Border.all(
                                          color: const Color(0xff5481a0),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                        ),
                                        child: Text(
                                          "ART",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.0,
                                            color: Color(0xff5481a0),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  if (artTestNegativeBool) ...[
                                    artTestNegative(),
                                  ] else ...[
                                    artTestPositive(),
                                  ],
                                  const Spacer(),
                                  Text(
                                    dateTime,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
