import 'package:clubhub_app/modules/search/bloc/bloc/search_bloc.dart';
import 'package:clubhub_app/modules/search/presentation/search_view/details_view.dart';
import 'package:clubhub_app/modules/search/presentation/widgets/details_card.dart';
import 'package:clubhub_app/modules/search/presentation/widgets/title_section.dart';
import 'package:clubhub_app/theme/linear_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({
    required this.onBack,
    required this.term,
    Key? key,
  }) : super(key: key);
  final String term;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradientBackground.getBlueGrey(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            TextButton(
              onPressed: () {
                onBack();
              },
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Volver',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const TitleSection(title: 'Search Results'),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                if (state is SearchLoaded) {
                  if (state.searchResult.isEmpty) {
                    return const Text(
                      'No results found',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    );
                  }

                  final listUser = state.searchResult;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listUser.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, index) {
                      final user = listUser[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsView(userDetail: user),
                            ),
                          );
                        },
                        child: DetailsCard(
                          title: user.name.first,
                          subtitle: user.name.last,
                        ),
                      );
                    },
                  );
                }
                if (state is SearchError) {
                  return Text(
                    state.message,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  );
                }
                return Container(
                  child: Text(
                    state.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
