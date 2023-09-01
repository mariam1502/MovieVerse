import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/search-results-api.dart';
import '../models/search-results.dart';
import 'package:netflix/providers/providers.dart';
import '../widgets/search_widgets/movie_search.dart';

class SearchResultsuture extends ConsumerStatefulWidget {
  const SearchResultsuture({super.key});

  @override
  ConsumerState<SearchResultsuture> createState() => _SearchResultsutureState();
}

class _SearchResultsutureState extends ConsumerState<SearchResultsuture> {
  late Future<List<SearchResults>> searcgResultsData;
  @override
  void initState() {
    super.initState();
    searcgResultsData =
        SearchResultsAPI(string_query: ref.read(SearchInputProvider).toString())
            .getSearchResults();
  }

  FutureBuilder SearchResultaData() {
    return FutureBuilder(
        future: searcgResultsData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
                "Error fetching data: ${snapshot.error}"); // Handle error if fetching data fails
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          } else if (!snapshot.hasData) {
            return Text('Data is empty !');
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MovieSearch(
                  id: snapshot.data![index].id,
                  posterPath: snapshot.data![index].posterPath,
                  title: snapshot.data![index].title,
                  voteAverage: snapshot.data![index].voteAverage);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final newText = ref.watch(SearchInputProvider).toString();
        searcgResultsData = SearchResultsAPI(string_query: newText.toString())
            .getSearchResults();
        return SearchResultaData();
      },
    );
  }
}
