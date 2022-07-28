import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/blocs/error_bloc/error_bloc.dart';
import 'package:github_searcher/blocs/error_bloc/error_event.dart';
import 'package:github_searcher/components/constants.dart';
import 'package:github_searcher/data/repositories/dio/dio_api_git_hub_repository.dart';
import 'package:github_searcher/data/repositories/drift/drift_favourites_github_repo_repository.dart';
import 'package:github_searcher/data/services/dio/api_github_service.dart';
import 'package:github_searcher/domain/repositories/favourites_github_repo_repository.dart';
import 'package:github_searcher/domain/repositories/github_repo_repository.dart';
import 'package:github_searcher/presentation/features/details/pages/details_page.dart';
import 'package:github_searcher/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:github_searcher/presentation/features/favourites/pages/favourites_page.dart';
import 'package:github_searcher/presentation/features/not_found_page/pages/not_found_page.dart';
import 'package:github_searcher/presentation/features/search/bloc/search_page_bloc.dart';
import 'package:github_searcher/presentation/features/search/pages/search_page.dart';
import 'package:github_searcher/presentation/features/search_result/bloc/search_result_page_bloc.dart';
import 'package:github_searcher/presentation/features/search_result/pages/search_result_page.dart';
import 'package:github_searcher/presentation/features/splash_screeen/pages/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<FavouritesGitHubRepoRepository>(
      lazy: false,
      create: (_) => DriftFavouritesGitHubRepoRepository(),
      child: BlocProvider<FavouritesBloc>(
        lazy: false,
        create: (context) => FavouritesBloc(
          repository: context.read<FavouritesGitHubRepoRepository>(),
        ),
        child: BlocProvider<SearchPageBloc>(
          lazy: false,
          create: (_) => SearchPageBloc(),
          child: MaterialApp(
            title: 'Flutter GitHub Test Task',
            theme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: AppConstants.githubBrandColor,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreenPage.navigationPath,
            onGenerateRoute: (RouteSettings settings) {
              if (settings.name == SplashScreenPage.navigationPath) {
                return MaterialPageRoute(
                  builder: (_) {
                    return const SplashScreenPage();
                  },
                );
              }

              if (settings.name == SearchPage.navigationPath) {
                return MaterialPageRoute(
                  builder: (_) {
                    return const SearchPage();
                  },
                );
              }

              if (settings.name == FavouritesPage.navigationPath) {
                return MaterialPageRoute(
                  builder: (_) {
                    return const FavouritesPage();
                  },
                );
              }


              if (settings.name == SearchResultPage.navigationPath) {
                return MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider<ErrorBloc>(
                      lazy: false,
                      create: (context) => ErrorBloc(context: context),
                      child: RepositoryProvider<GitHubRepoRepository>(
                        lazy: false,
                        create: (context) => DioApiGitHubRepository(
                          apiGitHubService: ApiGitHubService(
                              onErrorHandler: (String code, String message) {
                            context.read<ErrorBloc>().add(
                                ShowDialogEvent(title: code, message: message));
                          }),
                        ),
                        child: BlocProvider<SearchResultPageBloc>(
                          lazy: false,
                          create: (context) => SearchResultPageBloc(
                              repository: context.read<GitHubRepoRepository>(),
                              searchPageBloc: context.read<SearchPageBloc>()),
                          child: const SearchResultPage(),
                        ),
                      ),
                    );
                  },
                );
              }

              if (settings.name == DetailsPage.navigationPath) {
                final DetailsPageArgument model =
                    settings.arguments as DetailsPageArgument;
                return MaterialPageRoute(
                  builder: (_) {
                    return DetailsPage(model: model);
                  },
                );
              }

              return MaterialPageRoute(
                builder: (_) => const NotFoundPage(),
              );
            },
          ),
        ),
      ),
    );
  }
}
