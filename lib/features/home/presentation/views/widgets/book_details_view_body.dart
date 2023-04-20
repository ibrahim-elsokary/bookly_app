import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_item.dart';
import 'package:flutter/material.dart';

import 'custom_book_details_app_bar.dart';
import 'custom_book_details_button.dart';
import 'similar_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.book}) : super(key: key);
  final BookModel book ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const CustomBookDetailsAppBar(),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate(
                   [
                    const SizedBox(
                      height: 36,
                    ),
                    BookDetailsSection(book:book),
                    const Expanded(
                      child:  SizedBox(
                        height: 49,
                      ),
                    ),
                    const SimilarBooksSection(),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);
  final BookModel book ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.height / 4.5,
            child:  CustomListItem(imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,)),
        const SizedBox(
          height: 40,
        ),
         Text(
           book.volumeInfo!.title!,
          style: Styles.textStyle30Regualr,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
           book.volumeInfo!.authors![0],
          style:
              Styles.textStyle18Medium.copyWith(color: kSecondryFontColorDark),
        ),
        const SizedBox(
          height: 14,
        ),
         BookRating(mainAxisAlignment: MainAxisAlignment.center ,book: book ),
        const SizedBox(
          height: 37,
        ),
        const CustomBookDetailsButton(),
      ],
    );
  }
}

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("You can also like", style: Styles.textStyle16Bold),
        SizedBox(
          height: 15,
        ),
        SimilarListView(),
      ],
    );
  }
}
