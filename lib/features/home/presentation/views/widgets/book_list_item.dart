import 'dart:math';

import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({Key? key, required this.book}) : super(key: key);
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.bookDetails , extra: book),

      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bookItem(imageUrl: book.volumeInfo!.imageLinks!.thumbnail!),
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
                  child: Text(
                    book.volumeInfo!.title!,
                    style: Styles.textStyle20Regualr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  book.volumeInfo!.authors![0],
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
      children: [
        const Text(
          'Free',
          style: Styles.textStyle20Regualr,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        BookRating(
          book: book,
        ),
      ],
    );
  }

  SizedBox bookItem({required String imageUrl}) {
    return SizedBox(
      height: 105,
      child: AspectRatio(
          aspectRatio: 2 / 3,
          child: CustomListItem(
            imageUrl: imageUrl,
            borderRadius: 7,
          )),
    );
  }
}

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        ),
        const SizedBox(width: 6.3),
        Text(
          book.volumeInfo?.averageRating != null
              ? book.volumeInfo!.averageRating.toString()
              : '---',
          style: Styles.textStyle16Medium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: 9),
        Text(
          book.volumeInfo?.averageRating != null
              ?  Random().nextInt(10000).toString()
              : '0',
         
          style: Styles.textStyle14Regualr,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
