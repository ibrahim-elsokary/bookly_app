import 'package:flutter/material.dart';

import 'book_list_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(childCount: 20,(context, index) {
      
      return const Padding(
        padding:  EdgeInsets.only(top: 20 ,right: 50),
        child: BookListItem(),
      );
    },));
  }
}
