import 'package:flutter/material.dart';

import 'best_seller_list_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 20,
      itemBuilder: (context, index) {
      return const Padding(
        padding:  EdgeInsets.only(top: 20),
        child: BestSellerListItem(),
      );
    },
    );
  }
}
