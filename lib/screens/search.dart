import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/providers/providers.dart';
import 'package:netflix/widgets/home_widgets/movie_list.dart';
import '../widgets/search_widgets/movie_search.dart';
import '../widgets/search_widgets/search_widget.dart';
import '../futureBuilder/search-results-future.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).go('/home');
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white)),
            ],
          )),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          SearchWidget(),
          SizedBox(
            height: 25,
          ),
          SearchResultsuture(),
        ],
      ),
    );
  }
}


//  Consumer(
//                     builder: (context, ref, child) {
//                       String data = ref
//                           .watch(SearchInputProvider.notifier)
//                           .state
//                           .toString();
//                       return Text(data);
//                     },
//                   ),