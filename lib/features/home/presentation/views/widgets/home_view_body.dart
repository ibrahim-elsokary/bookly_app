import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          const CustomAppBar(),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      FeaturedListView(),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Best Seller",
                        style: Styles.titleMedium,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                const BestSellerListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
