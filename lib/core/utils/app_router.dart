import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/Splash/presentation/views/splash_view.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/views_models/similar_books_cubit/similar_books_cubit.dart';

abstract class AppRouter {
  static const homeView = '/home';
  static const bookDetails = '/book_details';
  static const search = '/search';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: search,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: bookDetails,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              child: BookDetailsView(
                book: state.extra as BookModel,
              ),
              create: (context) =>
                  SimilarBooksCubit(getIt.get<HomeRepoImpl>()));
        },
      ),
    ],
  );
}
