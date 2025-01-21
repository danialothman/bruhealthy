import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:no_scroll_glow/no_scroll_glow.dart';
import '../constants.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/card_content.dart';
import '../widgets/card_content_bottom.dart';
import '../widgets/vac_section.dart';
import '../widgets/services_section.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final int _selectedIndex = 2;
  bool _isVisible = false;

  void _showFAB() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: _selectedIndex),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: SizedBox(
          width: 50,
          child: GestureDetector(
            onLongPress: _resetDose,
            child: FloatingActionButton(
              splashColor: const Color(0xffcccccc),
              backgroundColor: const Color.fromARGB(255, 225, 225, 225),
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
                color: const Color(0xfffcfafb),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CardContent(
                      showFAB: _showFAB,
                      moreDose: _moreDose,
                      resetDose: _resetDose,
                    ),
                    const CardContentBottom(),
                    const VacSection(),
                    const ServicesSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
}
