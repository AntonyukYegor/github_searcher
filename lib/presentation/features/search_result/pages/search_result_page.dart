import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/components/constants.dart';
import 'package:github_searcher/domain/models/search_github_repositories.dart';
import 'package:github_searcher/presentation/common/widget/empty.dart';
import 'package:github_searcher/presentation/common/widget/error.dart';
import 'package:github_searcher/presentation/features/favourites/pages/favourites_page.dart';
import 'package:github_searcher/presentation/features/search_result/bloc/search_result_page_bloc.dart';
import 'package:github_searcher/presentation/features/search_result/bloc/search_result_page_event.dart';
import 'package:github_searcher/presentation/features/search_result/bloc/search_result_page_state.dart';
import 'package:github_searcher/presentation/features/search_result/widgets/github_repo_preview.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);
  static const String navigationPath = '/searchResultPage';

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  void didChangeDependencies() {
    context.read<SearchResultPageBloc>().add(LoadDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.searchResultPageTitle),
        backgroundColor: AppConstants.githubColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            tooltip: AppConstants.favouritesPageTitle,
            onPressed: () {
              Navigator.pushNamed(
                context,
                FavouritesPage.navigationPath,
                arguments: const FavouritesPage(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<SearchResultPageBloc, SearchResultState>(
        buildWhen: (oldState, newState) => oldState.data != newState.data,
        builder: (context, state) {
          return FutureBuilder<SearchGitHubRepositories>(
            future: state.data,
            builder: (BuildContext context,
                AsyncSnapshot<SearchGitHubRepositories?> data) {
              return data.connectionState != ConnectionState.done
                  ? const Center(
                      child: Center(child: CircularProgressIndicator()))
                  : data.hasData
                      ? data.data?.items.isNotEmpty == true
                          ? Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<SearchResultPageBloc>()
                                            .add(
                                              PrevPageLoadEvent(),
                                            );
                                      },
                                      icon: const Icon(Icons.arrow_left),
                                    ),
                                    Text('${state.page}'),
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<SearchResultPageBloc>()
                                            .add(
                                              NextPageLoadEvent(),
                                            );
                                      },
                                      icon: const Icon(Icons.arrow_right),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final model = data.data?.items[index]
                                          .toGitHubRepoPreviewModel();

                                      if (model != null) {
                                        return GitHubRepoPreview(
                                          model: model,
                                        );
                                      }

                                      return const Error();
                                    },
                                    itemCount: data.data?.items.length ?? 0,
                                  ),
                                ),
                              ],
                            )
                          : const Empty()
                      : const Error();
            },
          );
        },
      ),
    );
  }
}
