import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/components/constants.dart';
import 'package:github_searcher/data/mappers/github_repo_to_git_hub_repo.dart';
import 'package:github_searcher/domain/repositories/favourites_github_repo_repository.dart';
import 'package:github_searcher/presentation/common/widget/favorite_checked_transparent_button.dart';
import 'package:github_searcher/presentation/features/details/pages/details_page.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:github_searcher/presentation/features/search_result/widgets/models/github_repo_preview_model.dart';

class GitHubRepoPreview extends StatelessWidget {
  const GitHubRepoPreview({
    required GitHubRepoPreviewModel model,
    Key? key,
  })  : _model = model,
        super(key: key);

  final GitHubRepoPreviewModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailsPage.navigationPath,
            arguments: DetailsPageArgument(url: _model.url),
          );
        },
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            AppConstants.repositoryNameTitle,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Flexible(
                            child: Text(
                              _model.name,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            AppConstants.ownerTitle,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            _model.owner,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            AppConstants.stargazersCountTitle,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            '${_model.stargazers}',
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            AppConstants.watchersCountTitle,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            '${_model.watchers}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<FavouritesBloc, FavouritesState>(
                    builder: (context, state) =>
                        FavoriteCheckedTransparentButton(
                      alignment: Alignment.centerRight,
                      initialChecked: context
                          .read<FavouritesGitHubRepoRepository>()
                          .checkForFavouriteById(_model.id),
                      onPressed: () {
                        context.read<FavouritesBloc>().add(
                              ChangedFavourite(
                                model: _model.toDomain(),
                              ),
                            );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
