import 'package:clubhub_app/modules/search/bloc/bloc/search_bloc.dart';
import 'package:clubhub_app/modules/search/data/user_repository.dart';
import 'package:clubhub_app/modules/search/presentation/search_view/results_view.dart';
import 'package:clubhub_app/modules/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  SearchView({
    required this.userRepository,
    Key? key,
  }) : super(key: key);
  final UserRepository userRepository;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(
          userRepository: userRepository,
        ),
        child: PageView(
          controller: controller,
          children: [
            SearchViewBody(
              userRepository: userRepository,
              onSearch: () {
                controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
            SearchResultsView(
              term: '',
              onBack: () {
                controller.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
