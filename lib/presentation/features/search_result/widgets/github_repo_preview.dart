import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/components/constants.dart';
import 'package:github_searcher/data/models/base_github_repo.dart';
import 'package:github_searcher/domain/models/github_repo.dart';
import 'package:github_searcher/domain/repositories/favourites_github_repo_repository.dart';
import 'package:github_searcher/presentation/common/widget/favourite_button.dart';
import 'package:github_searcher/presentation/features/details/pages/details_page.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_state.dart';

extension GitHubRepoToGitHubRepoPreviewModel on GitHubRepo {
  GitHubRepoPreviewModel toGitHubRepoPreviewModel() => GitHubRepoPreviewModel(
        id: id,
        owner: owner,
        name: name,
        stargazers: stargazers,
        watchers: watchers,
        url: url,
      );
}

extension GitHubRepoPreviewModelToDomain on GitHubRepoPreviewModel {
  GitHubRepo toDomain() => BaseGitHubRepo(
        id: id,
        owner: owner,
        name: name,
        stargazers: stargazers,
        watchers: watchers,
        url: url,
      );
}

class GitHubRepoPreviewModel {
  const GitHubRepoPreviewModel({
    required this.id,
    required this.owner,
    required this.name,
    required this.stargazers,
    required this.watchers,
    required this.url,
  });

  final int id;

  final String owner;

  final String name;

  final int stargazers;

  final int watchers;

  final String url;
}

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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
