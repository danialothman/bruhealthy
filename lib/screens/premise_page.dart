import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import '../widgets/dose_cookie.dart';

class PremisePage extends StatefulWidget {
  const PremisePage({Key? key}) : super(key: key);

  @override
  State<PremisePage> createState() => _PremisePageState();
}

class _PremisePageState extends State<PremisePage> {
  String updatedDateTime() {
    now = DateTime.now();
    return DateFormat('dd MMM yyyy hh:mm a').format(now).toString();
  }

  Widget doseMeUpAll(int numberOfDoses) {
    return Wrap(
      runSpacing: 10,
      children: [
        for (int i = 0; i < numberOfDoses; i++) doseCookie(i + 1, ordinalIndex),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Scan In',
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xff18beb5)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Wrap(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: Color(0xff18beb5),
                      size: 18.0,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Leave",
                      style: TextStyle(
                        color: Color(0xff18beb5),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        clipBehavior: Clip.antiAlias,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: WaveWidget(
                          config: CustomConfig(
                            gradients: greenWave,
                            durations: [35000, 19440, 12800, 10000],
                            heightPercentages: [0.80, 0.83, 0.85, 0.88],
                            gradientBegin: Alignment.topRight,
                            gradientEnd: Alignment.bottomLeft,
                          ),
                          backgroundColor: greenBackground,
                          duration: 32000,
                          waveAmplitude: 0,
                          heightPercentage: 1,
                          size: const Size(
                            double.infinity,
                            200,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Center(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 16.0),
                                    const FaIcon(
                                      FontAwesomeIcons.circleArrowUp,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Text(
                                      "Welcome to",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      premiseName,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                    const SizedBox(height: 35),
                                    Row(
                                      children: [
                                        const Text(
                                          "Entered:",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          updatedDateTime(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10.0),
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundColor: artIconColor,
                                      child: FaIcon(
                                        FontAwesomeIcons.userShield,
                                        color: bottomInnerIconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        "Myself | $idNumber",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      doseMeUpAll(initialDose)
                                    ],
                                  ),
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
          ),
        ),
      ),
    );
  }
}
