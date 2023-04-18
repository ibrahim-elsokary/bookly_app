import 'package:flutter/material.dart';

import 'custom_list_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/3.6,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomListItem(),
        );
      },),
    );
  }
}