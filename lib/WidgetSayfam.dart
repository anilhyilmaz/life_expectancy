import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyColumn extends StatelessWidget {
  final String mystring;
  final IconData myicon;
  MyColumn(
      {this.mystring = 'Default', this.myicon = FontAwesomeIcons.addressBook});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myicon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          mystring,
          style: TextStyle(
              fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget child;
  final Function myonPress;
  MyContainer({this.renk = Colors.white, this.child, this.myonPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myonPress();
      },
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
      ),
    );
  }
}
