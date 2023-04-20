import 'package:bookly_app/features/home/presentation/views/widgets/book_list_item.dart';
import 'package:flutter/material.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const  BouncingScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListItem(),
        );
      },
    );
  }
}
