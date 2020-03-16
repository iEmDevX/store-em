import 'package:flutter/material.dart';

class HighlightUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Card(
            color: Colors.grey,
            child: Container(
              height: 150,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Card(
            color: Colors.grey,
            child: Container(
              height: 100,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Card(
                    color: Colors.grey,
                    child: Container(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Card(
                    color: Colors.grey,
                    child: Container(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
