import 'package:bookly_app/features/home/presentation/views_models/featurd_books_cubit/featurd_book_cuibt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturdBookCuibtCubit, FeaturdBookCuibtState>(
      builder: (context, state) {
        if (state is FeaturdBookCuibtLoading) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 3.6,
              child: const Center(child: CircularProgressIndicator()));
        } else if (state is FeaturdBookCuibtSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3.6,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomListItem(imageUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail!),
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3.6,
            child: const Center(
              child: Icon(Icons.error_outline,size: 48),
            ),
          );
        }
      },
    );
  }
}
