import 'package:flutter/material.dart';

import 'custom_list_item.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomListItem(borderRadius: 7,imageUrl: 'http://books.google.com/books/content?id=RxHbPxbBM1AC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
          );
        },
      ),
    );
  }
}
