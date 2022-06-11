import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:no_scroll_glow/no_scroll_glow.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

// Card Content
bool _onlyShowLastVac = true;
String _name = "Danial Seaside";
String _gender = "Male";
String _idNumber = "00999999";
String _age = "94";

// Bottom Card Section
double _buttonFontSize = 12.0;
// _scanCodeIconColor
// _healthCodeIconColor
// _artIconColor

// Vaccination Section
double _vacFontSize = 10.0;
// _appointmentIconColor
// _certificateIconColor
// _reportingIconColor

// Services Section
double _serviceFontSize = 11.0;
// _homeIsoIconColor
// _epidemicMapIconColor
// _selfAssessIconColor
// _tipIconColor
// _bruneiIconColor

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _val = 0;
  final int _selectedIndex = 2;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff00cdbc),
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.house,
                  color: Colors.grey,
                ),
                label: 'Home',
                backgroundColor: Color(0xff170626)),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidCalendar,
                  color: Colors.grey,
                ),
                label: 'Plan',
                backgroundColor: Color(0xff170626)),
            BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety),
                label: '',
                backgroundColor: Color(0xff170626)),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidFileLines,
                  color: Colors.grey,
                ),
                label: 'Article',
                backgroundColor: Color(0xff170626)),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: Colors.grey,
                ),
                label: 'Me',
                backgroundColor: Color(0xff170626)),
          ]),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: SizedBox(
          width: 40,
          child: GestureDetector(
            onLongPress: _resetDose,
            child: FloatingActionButton(
              splashColor: const Color(0xffcccccc),
              backgroundColor: const Color(0xff170626),
              onPressed: _moreDose,
              child: const FaIcon(
                FontAwesomeIcons.syringe,
                size: 18,
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
                color: const Color(0xffe8e8e8), // white12
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

  int initialDose = 3;
  List<String> ordinals = ['st', 'nd', 'rd', 'th'];

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

  int ordinalIndex = 0;

  doseMeUp(var numberOfDoses) {
    return Wrap(
      runSpacing: 10,
      children: [
        if (_onlyShowLastVac) (doseCookie(initialDose, ordinalIndex)),
        if (!_onlyShowLastVac)
          for (int i = 0; i < numberOfDoses; i++)
            doseCookie(i + 1, ordinalIndex),
      ],
    );
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

  Widget topBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 8.0, top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'CODE',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                Transform.scale(
                  scale: 0.7,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey),
                        value: 0,
                        groupValue: _val,
                        onChanged: (value) {
                          setState(() {
                            _val = 0;
                          });
                        }),
                  ),
                ),
                const Text(
                  'EN',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey),
                        value: 1,
                        groupValue: _val,
                        onChanged: (value) {
                          setState(() {
                            _val = 1;
                          });
                        }),
                  ),
                ),
                const Text('BM',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    )),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Myself',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
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
                        gradients: const [
                          [Color(0xEE4bae78), Color(0xff357b54)],
                          [Color(0xEE4cb27a), Color(0xff2b6545)],
                          [Color(0xEE6dffc2), Color(0xff2a6143)],
                          [Color(0xEE57cc9b), Color(0xff367f60)],
                        ],
                        durations: [35000, 19440, 12800, 10000],
                        heightPercentages: [0.80, 0.83, 0.85, 0.88],
                        gradientBegin: Alignment.topRight,
                        gradientEnd: Alignment.bottomLeft,
                      ),
                      backgroundColor: const Color(0xff4bae78),
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
                        // color: Color(0xff4bae78),
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
                                  _name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text('$_gender, $_age, $_idNumber',
                                    style:
                                        const TextStyle(color: Colors.white)),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.0, bottom: 0.0),
                                  child: Text(
                                    'GREEN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0),
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
              Card(
                elevation: 3,
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.black12,
                    //       blurRadius: 6,
                    //       offset: Offset(0, 2))
                    // ],
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(10.0),
                    //     bottomRight: Radius.circular(10.0)),
                  ),
                  // color: Colors.white,
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
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 18.0, bottom: 8.0),
                                child: Text(
                                  'COVID-19 Test',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                ),
                              ),
                              Row(
                                children: const [
                                  FaIcon(
                                    FontAwesomeIcons.circleMinus,
                                    size: 18.0,
                                    color: Color(0xff4bae78),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    'Negative',
                                    style: TextStyle(color: Color(0xff4bae78)),
                                  ),
                                  Spacer(),
                                  Text('07 Jun 2022 23:59',
                                      style: TextStyle(
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
      padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 110,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 8.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0),
                                  bottomLeft: Radius.circular(16.0)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.barcode,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Scan Code",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: _buttonFontSize),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 8.0, right: 8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0),
                                  bottomLeft: Radius.circular(16.0)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.qrcode,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Health Code",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: _buttonFontSize,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 14.0, left: 8.0, right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                  topLeft: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.vial,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Antigen Rapid Test",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: _buttonFontSize),
                          )
                        ],
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
      padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 16.0),
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(16.0),
                                bottomLeft: Radius.circular(16.0)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.syringe,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "Vaccination Appointment",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: _vacFontSize),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(16.0),
                                bottomLeft: Radius.circular(16.0)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.creditCard,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "Vaccination Certificate",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: _vacFontSize),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(16.0),
                                bottomLeft: Radius.circular(16.0)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.calendar,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "Vaccine ADR Reporting",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: _vacFontSize),
                        )
                      ],
                    ),
                  )
                ],
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
          left: 28.0, right: 28.0, top: 16.0, bottom: 26.0),
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                      topLeft: Radius.circular(16.0),
                                      bottomLeft: Radius.circular(16.0)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.houseChimneyMedical,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "Home Isolation",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: _serviceFontSize),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                      topLeft: Radius.circular(16.0),
                                      bottomLeft: Radius.circular(16.0)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.mapLocation,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "Epidemic Map",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: _serviceFontSize),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                      topLeft: Radius.circular(16.0),
                                      bottomLeft: Radius.circular(16.0)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.bullseye,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "Self-Assessment",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: _serviceFontSize),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                      topLeft: Radius.circular(16.0),
                                      bottomLeft: Radius.circular(16.0)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.message,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "COVID 19 Tips",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: _serviceFontSize),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0),
                                      topLeft: Radius.circular(16.0),
                                      bottomLeft: Radius.circular(16.0)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.tv,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "COVID-19 in Brunei",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: _serviceFontSize),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: const [],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
