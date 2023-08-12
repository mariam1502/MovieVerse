import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      height: 40, // Set the desired height here
      child: TextField(
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Colors.white70,
          ),
          suffixIcon: Icon(
            Icons.close,
            color: Colors.white70,
          ),
          filled: true,
          fillColor: Colors.red,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white70),
          contentPadding: EdgeInsets.only(left: 8, right: 8),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
