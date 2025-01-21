import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:squircle/squircle.dart';
import '../constants.dart';
import '../screens/premise_page.dart';

class CardContentBottom extends StatelessWidget {
  const CardContentBottom({Key? key}) : super(key: key);

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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

  void _nextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PremisePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      onTap: () => _nextPage(context),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            bottom: 16.0,
                            left: 8.0,
                            right: 8.0,
                          ),
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
                                    bottomLeft: Radius.circular(12.0),
                                  ),
                                ),
                                child: Material(
                                  elevation: 1,
                                  color: scanCodeIconColor,
                                  shape: SquircleBorder(
                                    side: BorderSide(
                                      color: scanCodeIconColor,
                                      width: 2,
                                    ),
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
                          top: 16.0,
                          bottom: 16.0,
                          left: 8.0,
                          right: 8.0,
                        ),
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
                                  bottomLeft: Radius.circular(12.0),
                                ),
                              ),
                              child: Material(
                                elevation: 1,
                                color: healthCodeIconColor,
                                shape: SquircleBorder(
                                  side: BorderSide(
                                    color: healthCodeIconColor,
                                    width: 2,
                                  ),
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
                              style: TextStyle(fontSize: buttonFontSize),
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
                      onTap: () => _showMyDialog(context),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            bottom: 14.0,
                            left: 8.0,
                            right: 8.0,
                          ),
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
                                    bottomLeft: Radius.circular(32.0),
                                  ),
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
}
