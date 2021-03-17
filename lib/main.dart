import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/resultpage.dart';
import 'package:life_expectancy/userdata.dart';

import 'WidgetSayfam.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double icilensigara = 15.0;
  double haftadayapilanspor = 3.0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haftada Kaç Gün Spor Yapıyorsunuz?',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    haftadayapilanspor.round().toString(),
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      divisions: 7,
                      min: 0,
                      max: 7,
                      value: haftadayapilanspor,
                      onChanged: (double newvalue) {
                        setState(() {
                          haftadayapilanspor = newvalue;
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Günde Kaç Sigara İçiyorsunuz?',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    icilensigara.round().toString(),
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      min: 0,
                      max: 30,
                      value: icilensigara,
                      onChanged: (double newvalue) {
                        setState(() {
                          icilensigara = newvalue;
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    myonPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: MyColumn(
                      myicon: FontAwesomeIcons.venus,
                      mystring: 'KADIN',
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    myonPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: MyColumn(
                      myicon: FontAwesomeIcons.mars,
                      mystring: 'ERKEK',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(UserData(
                                kilo: kilo,
                                boy: boy,
                                seciliCinsiyet: seciliCinsiyet,
                                haftadayapilanspor: haftadayapilanspor,
                                icilensigara: icilensigara))));
                  },
                  child: Text('Hesapla',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold))))
        ],
      ),
    );
  }

  Row buildRowOutlineButton(
    String label,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              label == 'BOY' ? boy.toString() : kilo.toString(),
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 15,
                  ),
                  onPressed: () {
                    print('++++');
                    setState(() {
                      label == 'BOY' ? boy++ : kilo++;
                    });
                  }),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  child: Icon(
                    FontAwesomeIcons.minus,
                    size: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      label == 'BOY' ? boy-- : kilo--;
                    });
                  }),
            )
          ],
        )
      ],
    );
  }
}
