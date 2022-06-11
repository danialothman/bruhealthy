import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:no_scroll_glow/no_scroll_glow.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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
      appBar: AppBar(
        toolbarHeight: 40,
        shadowColor: Colors.white12,
        foregroundColor: Colors.white12,
        backgroundColor: Colors.white12,
        flexibleSpace: topBar(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xff00cdbc),
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(LineIcons.medicalClinic),
                label: 'HOME',
                backgroundColor: Color(0xff170626)),
            BottomNavigationBarItem(
                icon: Icon(LineIcons.alternateShare),
                label: 'DYNAMIC',
                backgroundColor: Color(0xff170626)),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'CODE',
                backgroundColor: Color(0xff170626)),
            BottomNavigationBarItem(
                icon: Icon(LineIcons.cube),
                label: 'ARTICLE',
                backgroundColor: Color(0xff170626)),
            BottomNavigationBarItem(
                icon: Icon(LineIcons.userNinja),
                label: 'HEALTH',
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
                color: Colors.white12, // white12
                child: Column(
                  children: [
                    cardContent(),
                    contentBottom(),
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

  Widget cardContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                        150,
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
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 24.0, bottom: 10.0),
                                  child: Text(
                                    'CODE GREEN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ),
                                Text(
                                  'Hideo Bojima, Male, 58',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text('IC Number 00420420',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 24.0, bottom: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Expiration time',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 12.0)),
                                Text('24 Apr 2022 23:59:59',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 12.0))
                              ],
                            ),
                          )
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
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
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
                                    EdgeInsets.only(top: 24.0, bottom: 8.0),
                                child: Text(
                                  'COVID-19 Test',
                                  style: TextStyle(
                                      color: Color(0xffd1d1d1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                              Row(
                                children: const [
                                  FaIcon(
                                    FontAwesomeIcons.solidCircleQuestion,
                                    size: 18.0,
                                    color: Color(0xffd1d1d1),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    'Result not available',
                                    style: TextStyle(color: Color(0xffd1d1d1)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24.0,
                              )
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

  int ordinalIndex = 0;

  doseMeUp(var numberOfDoses) {
    return Wrap(
      runSpacing: 10,
      children: [
        for (int i = 0; i < numberOfDoses; i++) doseCookie(i + 1, ordinalIndex),
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

  Widget contentBottom() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
                'Healthy and Safe. Please continue to monitor your health condition and stay safe.'),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xff00c9c1), Color(0xff67e7c8)]),
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 35,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(MdiIcons.lineScan),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Scan Code',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          OutlinedButton(
            style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              primary: Colors.white,
              side: const BorderSide(color: Color(0xff18beb5)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {},
            child: Wrap(
              children: const <Widget>[
                FaIcon(
                  FontAwesomeIcons.qrcode,
                  color: Color(0xff18beb5),
                  size: 18.0,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("My Code",
                    style: TextStyle(color: Color(0xff18beb5), fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
              '''Participate in activities with caution. Please practise safe social distancing.
                
Disclaimer: A preliminary assessment of your individual epidemic risk is provided for your reference based on your self-reported information, medical records. border control information, disease-control reported information as well as app-generated information such as Bluetooth proximity and GPS location. Given the complexity in epidemic tracking and assessment, we do not rule out that there maybe factors that turn out to be critical that we have not considered. Hence, please pay close attention to your own physical health and seek medical attention if unsure.
                
                ''',
              style: TextStyle(color: Color(0xff99999b), fontSize: 13.0)),
        ],
      ),
    );
  }
}
