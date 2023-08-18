import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:no_scroll_glow/no_scroll_glow.dart';
import 'package:squircle/squircle.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

void main() {
  runApp(const BruHealthyApp());
}

class BruHealthyApp extends StatelessWidget {
  const BruHealthyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BruHealthy',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // BottomNav Selected Icon
  final int _selectedIndex = 2;

  // FAB control
  bool _isVisible = false;

  void _showFAB() {
    if (_isVisible == false) {
      setState(() {
        _isVisible = true;
      });
    } else {
      setState(() {
        _isVisible = false;
      });
    }
  }

  // ART Test Control
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

  // ID show-hide Control
  showIdFunc() {
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

  hideIdFunc(String id) {
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

  // Alert Dialog - Change Content
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Content'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Name'),
                TextField(),
                Text('Gender'),
                TextField(),
                Text('Age'),
                TextField(),
                Text('ID Number'),
                TextField(),
                Text('Premise'),
                TextField(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 11.0,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff00cdbc),
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.house,
                  size: 16,
                  color: unselectedIconColor,
                ),
                label: 'Home',
                backgroundColor: const Color(0xff170626)),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidCalendar,
                  size: 16,
                  color: unselectedIconColor,
                ),
                label: 'Plan',
                backgroundColor: const Color(0xff170626)),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.health_and_safety,
                  size: 32,
                ),
                label: '',
                backgroundColor: Color(0xff170626)),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidFileLines,
                  size: 16,
                  color: unselectedIconColor,
                ),
                label: 'Article',
                backgroundColor: const Color(0xff170626)),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  size: 16,
                  color: unselectedIconColor,
                ),
                label: 'Me',
                backgroundColor: const Color(0xff170626)),
          ]),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: SizedBox(
          width: 50,
          child: GestureDetector(
            onLongPress: _resetDose,
            child: FloatingActionButton(
              splashColor: const Color(0xffcccccc),
              backgroundColor: const Color(0xff170626),
              onPressed: _moreDose,
              child: const FaIcon(
                FontAwesomeIcons.syringe,
                size: 24.0,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: RawScrollbar(
          thumbColor: Colors.grey,
          thickness: 5.0,
          radius: const Radius.circular(5.0),
          child: NoScrollGlow(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                color: const Color(0xfffcfafb), // white12
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    cardContent(),
                    cardContentBottom(),
                    vacSection(),
                    servicesSection()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Dose Control
  void _moreDose() {
    setState(() {
      initialDose++;
    });
  }

  void _resetDose() {
    setState(() {
      initialDose = 3;
    });
  }

  doseMeUp(var numberOfDoses) {
    return Wrap(
      runSpacing: 10,
      children: [
        if (onlyShowLastVac) (doseCookie(initialDose, ordinalIndex)),
        if (!onlyShowLastVac)
          for (int i = 0; i < numberOfDoses; i++)
            doseCookie(i + 1, ordinalIndex),
      ],
    );
  }

  Widget cardContent() {
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

                    // color: Colors.green,
                    child: WaveWidget(
                      config: CustomConfig(
                        gradients: initialWaveColor,
                        durations: [35000, 19440, 12800, 10000],
                        heightPercentages: [0.80, 0.83, 0.85, 0.88],
                        gradientBegin: Alignment.topRight,
                        gradientEnd: Alignment.bottomLeft,
                      ),
                      backgroundColor: initialBackground, // Card Color
                      duration: 32000,
                      waveAmplitude: 0,
                      heightPercentange: 1,
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
                            topRight: Radius.circular(10.0))),
                    // color: Colors.green,
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
                                    Text('$gender, $age,',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    ((() {
                                      // immediate anonymous function
                                      if (idIsVisible) {
                                        return showIdFunc();
                                      } else if (!idIsVisible) {
                                        return hideIdFunc(idNumber);
                                      }
                                    })()),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 0.0),
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
                                          fontSize: 24.0),
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
                      color: initialBackground, // Card Color
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
                                    top: 18.0, bottom: 8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onDoubleTap: _showFAB,
                                      child: const Text(
                                        'COVID-19 Vaccination',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Wrap(runSpacing: 8.0, children: [
                                doseMeUp(initialDose),
                              ]),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, bottom: 8.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'COVID-19 Test',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14.0),
                                    ),
                                    const SizedBox(width: 5.0),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0)),
                                          border: Border.all(
                                              color: const Color(0xff5481a0))),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Text(
                                          "ART",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.0,
                                              color: Color(0xff5481a0)),
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
                                  Text(dateTime,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
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

  Widget cardContentBottom() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: cardShadowColor,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: _nextPage,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 16.0, left: 8.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: bruneiIconColor,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      bottomLeft: Radius.circular(12.0)),
                                ),
                                child: Material(
                                  elevation: 1,
                                  color: scanCodeIconColor,
                                  shape: SquircleBorder(
                                    side: BorderSide(
                                        color: scanCodeIconColor, width: 2),
                                  ),
                                  child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.barcode,
                                      color: bottomInnerIconColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Scan Code",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: buttonFontSize),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 8.0, right: 8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: bruneiIconColor,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    bottomLeft: Radius.circular(12.0)),
                              ),
                              child: Material(
                                elevation: 1,
                                color: healthCodeIconColor,
                                shape: SquircleBorder(
                                  side: BorderSide(
                                      color: healthCodeIconColor, width: 2),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.qrcode,
                                    color: bottomInnerIconColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "Health Code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: buttonFontSize,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: cardShadowColor,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: _showMyDialog,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 14.0, left: 8.0, right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: artIconColor,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(32.0),
                                      bottomRight: Radius.circular(32.0),
                                      topLeft: Radius.circular(32.0),
                                      bottomLeft: Radius.circular(32.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Transform.rotate(
                                    angle: 270 * pi / 180,
                                    child: FaIcon(
                                      FontAwesomeIcons.vial,
                                      color: bottomInnerIconColor,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Antigen Rapid Test",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: buttonFontSize),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget vacSection() {
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
                                    color: appointmentIconColor, width: 1.9),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.syringe,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ), // Squircle
                          ),
                          SizedBox(height: heightSizedBox),
                          Text(
                            "Vaccination Appointment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: vacFontSize, color: textColorOne),
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
                                    color: certificateIconColor, width: 1.9),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.creditCard,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ), // Squircle
                          ),
                          SizedBox(height: heightSizedBox),
                          Text(
                            "Vaccination Certificate",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: vacFontSize, color: textColorOne),
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
                                    color: reportingIconColor, width: 1.9),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.calendar,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ), // Squircle
                          ),
                          SizedBox(height: heightSizedBox),
                          Text(
                            "Vaccine ADR Reporting",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: vacFontSize, color: textColorOne),
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

  Widget servicesSection() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 16.0, bottom: 26.0),
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
                                          color: homeIsoIconColor, width: 1.9),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.houseChimneyMedical,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ), // Squircle
                                ),
                                SizedBox(height: heightSizedBox),
                                Text(
                                  "Home Isolation",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: serviceFontSize,
                                      color: textColorOne),
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
                                          width: 1.9),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.mapLocation,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ), // Squircle
                                ),
                                SizedBox(height: heightSizedBox),
                                Text(
                                  "Epidemic Map",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: serviceFontSize,
                                      color: textColorOne),
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
                                          width: 1.9),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.bullseye,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ), // Squircle
                                ),
                                SizedBox(height: heightSizedBox),
                                Text(
                                  "Self-Assessment",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: serviceFontSize,
                                      color: textColorOne),
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
                                          color: tipIconColor, width: 1.9),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.message,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ), // Squircle
                                ),
                                SizedBox(height: heightSizedBox),
                                Text(
                                  "COVID-19 Tips",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: serviceFontSize,
                                      color: textColorOne),
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
                                        bottomLeft: Radius.circular(12.0)),
                                  ),
                                  child: Material(
                                    elevation: 1,
                                    color: bruneiIconColor,
                                    shape: SquircleBorder(
                                      side: BorderSide(
                                          color: bruneiIconColor, width: 1.9),
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
                                      color: textColorOne),
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

  void _nextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PremisePage()));
  }
}

class PremisePage extends StatefulWidget {
  const PremisePage({Key? key}) : super(key: key);

  @override
  State<PremisePage> createState() => _PremisePageState();
}

class _PremisePageState extends State<PremisePage> {
  updatedDateTime() {
    now = DateTime.now();
    String _enteredDateTime =
        DateFormat('dd MMM yyyy hh:mm a').format(now).toString();
    return _enteredDateTime;
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
                    SizedBox(
                      width: 10,
                    ),
                    Text("Leave",
                        style:
                            TextStyle(color: Color(0xff18beb5), fontSize: 14)),
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
                              bottomRight: Radius.circular(10.0)),
                        ),

                        // color: Colors.green,
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
                          heightPercentange: 1,
                          size: const Size(
                            double.infinity,
                            200,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          // color: Color(0xff4bae78),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                        ),
                        // color: Colors.green,
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
                                          fontSize: 24.0),
                                    ),
                                    const SizedBox(height: 35),
                                    Row(
                                      children: [
                                        const Text(
                                          "Entered:",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          updatedDateTime(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        "Myself | $idNumber",
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12.0),
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

  doseMeUpAll(var numberOfDoses) {
    return Wrap(
      runSpacing: 10,
      children: [
        for (int i = 0; i < numberOfDoses; i++) doseCookie(i + 1, ordinalIndex),
      ],
    );
  }
}

Wrap doseCookie(int dose, int ordinalIndex) {
  return Wrap(children: [
    const FaIcon(
      FontAwesomeIcons.solidCircleCheck,
      size: 18.0,
      color: Color(0xff4bae78),
    ),
    const SizedBox(width: 2.0),
    Text(
      '$dose' + ordinal(dose) + ' Dose',
      style: const TextStyle(height: 1.35, color: Color(0xff4bae78)),
    ),
    const SizedBox(width: 8.0),
  ]);
}

String ordinal(int number) {
  if (!(number >= 1 && number <= 1000)) {
    //here you change the range
    throw Exception('Invalid number');
  }

  if (number >= 11 && number <= 13) {
    return 'th';
  }

  switch (number % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
