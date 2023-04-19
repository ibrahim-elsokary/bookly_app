import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListItem extends StatelessWidget {
  const BestSellerListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.bookDetails),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bookItem(),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const Text(
                    "Harry Potter\nand the Goblet of Fire",
                    style: Styles.textStyle20Regualr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "J.K. Rowling",
                  style: Styles.textStyle14Medium
                      .copyWith(color: kSecondryFontColorDark),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                ratingAndPrice()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row ratingAndPrice() {
    return Row(
              children: const [
                Text(
                  "19.99 €",
                  style: Styles.textStyle20Regualr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),  
                Icon(Icons.star_rounded , color: Colors.yellow,),
                  
                SizedBox(width: 6.3),
                  
                 Text(
                  "4.8",
                  style: Styles.textStyle16Medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                  
                SizedBox(width:9),
                 Text(
                  "(2390)",
                  style: Styles.textStyle14Regualr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                
              ],
            );
  }

  SizedBox bookItem() {
    return SizedBox(
      height: 105,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            image: const DecorationImage(
                image: AssetImage(AssetsData.testImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}