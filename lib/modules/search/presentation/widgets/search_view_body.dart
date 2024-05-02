import 'package:clubhub_app/modules/search/bloc/bloc/search_bloc.dart';
import 'package:clubhub_app/modules/search/data/user_repository.dart';
import 'package:clubhub_app/modules/search/presentation/widgets/search_text_field.dart';
import 'package:clubhub_app/modules/search/presentation/widgets/title_section.dart';
import 'package:clubhub_app/theme/linear_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({
    required this.userRepository,
    required this.onSearch,
    Key? key,
  }) : super(key: key);
  final UserRepository userRepository;
  final TextEditingController _term = TextEditingController();
  final VoidCallback onSearch;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradientBackground.getBlueGrey(),
      ),
      child: ListView(
        children: [
          const TitleSection(title: 'Search Users'),
          SearchTextField(
            onChanged: (String v) {},
            controller: _term,
            onTap: () {
              context.read<SearchBloc>().add(PerformSearch(query: _term.text));
              onSearch();
            },
          ),
        ],
      ),
    );
  }
}
