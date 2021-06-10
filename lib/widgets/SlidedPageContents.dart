import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageSlidedContents extends StatelessWidget {
  final String title;
  final String description;
  final String imagepath;

  PageSlidedContents(
      {required this.imagepath,
        required this.title,
        required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset('assets/$imagepath'),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              )),
        ],
      ),
    );
  }
}
