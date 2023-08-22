import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/popular_movies.dart';

final PopularMovieDataByID = StateProvider<int>((ref) => 0);

class PopularMoviesProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
