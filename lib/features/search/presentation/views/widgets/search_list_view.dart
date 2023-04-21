import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_item.dart';
import 'package:flutter/material.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key, required this.books}) : super(key: key);
  final List<BookModel> books ;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        
        return  Padding(
          padding:const EdgeInsets.symmetric(vertical: 10),
          child: BookListItem(book: books[index],),
        );
      },
    );
  }
}
