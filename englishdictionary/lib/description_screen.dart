import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3A5BE),
      appBar: AppBar(
        title: Text('Description'),
        backgroundColor: Color(0xff360E58),
        foregroundColor: Color(0xff82ABE1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}