import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/components/constants.dart';
import 'package:github_searcher/presentation/features/search/bloc/search_page_bloc.dart';
import 'package:github_searcher/presentation/features/search/bloc/search_page_event.dart';
import 'package:github_searcher/presentation/features/search/bloc/search_page_state.dart';
import 'package:github_searcher/presentation/features/search_result/pages/search_result_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const String navigationPath = '/searchPage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.searchPageTitle),
        backgroundColor: AppConstants.githubColor,
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<SearchPageBloc, SearchState>(
                builder: (context, state) {
                  return TextFormField(
                    onChanged: (e) {
                      context.read<SearchPageBloc>().add(ResetErrorMessage());
                      context
                          .read<SearchPageBloc>()
                          .add(SearchChangedEvent(search: e));
                    },
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: AppConstants.inputRequestTitle,
                      errorText: state.errorMessage,
                    ),
                    controller: _textController,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<SearchPageBloc>(context).add(
                    ValidateSearchEvent(
                      onSuccess: () {
                        Navigator.pushNamed(
                          context,
                          SearchResultPage.navigationPath,
                        );
                      },
                    ),
                  );
                },
                child: const Text(AppConstants.search)),
          ),
        ],
      ),
    );
  }
}
