import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_item.dart';
import 'package:flutter/material.dart';

import 'custom_book_details_app_bar.dart';
import 'custom_book_details_button.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          const SizedBox(
            height: 36,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.height / 4.5,
              child: const CustomListItem()),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "The Jungle Book",
            style: Styles.textStyle30Regualr,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Rudyard Kipling",
            style: Styles.textStyle18Medium
                .copyWith(color: kSecondryFontColorDark),
          ),
          const SizedBox(
            height: 14,
          ),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(
            height: 37,
          ),
          const CustomBookDetailsButton()
        ],
      ),
    );
  }
}

