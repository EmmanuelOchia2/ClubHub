import 'package:bloc/bloc.dart';
import 'package:clubhub_app/modules/search/data/user_repository.dart';
import 'package:clubhub_app/modules/search/model/user_results.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final UserRepository userRepository;

  SearchBloc({required this.userRepository}) : super(SearchInitial()) {
    on<PerformSearch>((event, emit) async {
      emit(SearchLoading());
      try {
        final searchResult =
            await userRepository.getUsers(searchTerm: event.query);
        if (searchResult != null) {
          if (searchResult.results.isNotEmpty) {
            final resultsFiltrered = searchResult.results
                .where((element) => _containsTermInName(element, event.query))
                .toList();
            emit(SearchLoaded(searchResult: resultsFiltrered));
          } else {
            emit(SearchLoaded(searchResult: const []));
          }
        } else {
          throw Exception();
        }
      } catch (e) {
        emit(SearchError(message: 'Failed to perform search ${e.toString()}'));
      }
    });
  }

  bool _containsTermInName(Result element, String query) {
    final name = element.name;
    return name.first.toLowerCase().contains(query.toLowerCase()) ||
        name.last.toLowerCase().contains(query.toLowerCase());
  }
}
