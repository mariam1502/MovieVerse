import 'dart:ui';

import 'package:flutter/material.dart';

class actorList extends StatelessWidget {
  const actorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // provide a fixed height
      child: ListView(scrollDirection: Axis.horizontal, children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              height: 300,
              width: 130,
              // color: Colors.pink,
            ),
            Positioned(
              top: 10,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                width: 120,
                height: 120,
                child: ClipOval(
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5HPKGcp3NyYgYypfFfjJKVcPRuxC2KfWEQXMxEGtCllgxk2XIvcM9TWUZeihBV2wiWjM&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              width: 130,
              height: 40,
              // color: Colors.blue,
              child: Text(
                "Rayan Renolds",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
