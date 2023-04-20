import 'package:bookly_app/features/home/presentation/views_models/best_seller_books_cuibt/best_seller_books_cuibt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_list_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCuibtCubit, BestSellerBooksCuibtState>(
      builder: (context, state) {
        if (state is BestSellerBooksLoading) {
          return SliverToBoxAdapter(
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 3.6,
                child: const Center(child: CircularProgressIndicator())),
          );
        } else if (state is BestSellerBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (context, index) {
                return  Padding(
                  padding: const EdgeInsets.only(top: 20, right: 50),
                  child: BookListItem(book: state.books[index],),
                );
              },
            ),
          );
        } else{
           if (state is BestSellerBooksFailure)
          print(state.errorMsg);
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3.6,
              child: const Center(
                child: Icon(Icons.error_outline, size: 48),
              ),
            ),
          );
        }
      },
    );
  }
}
