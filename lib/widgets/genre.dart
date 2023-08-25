import 'package:flutter/material.dart';

class AddGenre extends StatelessWidget {
  AddGenre(
      {super.key,
      required this.id,
      required this.imagePath,
      required this.name});

  final String name;
  final int id;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // Adjust the radius as needed
              child: Container(
                child: Row(
                  children: [
                    Image.asset(
                      imagePath, // Use actual image path from snapshot data
                      width: 70,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(name), // Use actual movie name from snapshot data
                  ],
                ),
              ),
            ),
            Icon(
              Icons.navigate_next,
              size: 30,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
