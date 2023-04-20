import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'custom_list_item.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({Key? key, required this.book}) : super(key: key);
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(book.volumeInfo!.categories![0]);
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksLoading) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 3.6,
              child: const Center(child: CircularProgressIndicator()));
        } else if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () => GoRouter.of(context)
                        .push(AppRouter.bookDetails, extra: state.books[index]),
                    child: CustomListItem(
                        borderRadius: 7,
                        imageUrl: (state.books[index].volumeInfo?.imageLinks?.thumbnail)
                        ),
                  ),
                );
              },
            ),
          );
        } else {
          if (state is SimilarBooksFailure) print(state.errorMsg);
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3.6,
            child: const Center(
              child: Icon(Icons.error_outline, size: 48),
            ),
          );
        }
      },
    );
  }
}
