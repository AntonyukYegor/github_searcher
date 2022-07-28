import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/components/constants.dart';
import 'package:github_searcher/presentation/common/widget/empty.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:github_searcher/presentation/features/search_result/widgets/github_repo_preview.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);
  static const String navigationPath = '/favouritesPage';

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.favouritesPageTitle),
        backgroundColor: AppConstants.githubColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            tooltip: AppConstants.clearFavouritesTitle,
            onPressed: () {
              context.read<FavouritesBloc>().add(
                    ClearFavourites(),
                  );
            },
          ),
        ],
      ),
      body: BlocBuilder<FavouritesBloc, FavouritesState>(
        buildWhen: (oldState, newState) => oldState.repos != newState.repos,
        builder: (context, state) {
          if (state.repos.isEmpty) {
            return const Empty();
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final model = state.repos[index].toGitHubRepoPreviewModel();

                    return GitHubRepoPreview(
                      model: model,
                    );
                  },
                  itemCount: state.repos.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
