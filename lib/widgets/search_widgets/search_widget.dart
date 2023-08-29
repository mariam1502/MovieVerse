import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix/providers/providers.dart';

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      searchController.dispose();
      super.dispose();
    }

    void _onSearchTextChanged(String newText) {
      ref.read(SearchInputProvider.notifier).state = searchController.text;
    }

    return Container(
      margin: EdgeInsets.all(10),

      height: 40, // Set the desired height here
      child: TextField(
        onChanged: _onSearchTextChanged,
        controller: searchController,
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
