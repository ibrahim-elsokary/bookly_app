import 'package:bookly_app/core/utils/functions/launchUrl.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/book_model/book_model.dart';

class CustomBookDetailsButton extends StatelessWidget {
  const CustomBookDetailsButton({
    Key? key, required this.book,
  }) : super(key: key);
  final BookModel book ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
                onPressed: () async{
                   urlLauncher(context, book.saleInfo?.buyLink);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.horizontal(
                        start: Radius.circular(15)),
                  ),
                ),
                child: const Text(
                  'Free',
                  style: Styles.textStyle18Bold,
                )),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
                onPressed: () async{
                  await urlLauncher(context, book.volumeInfo?.previewLink);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xf0EF8262),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.horizontal(
                        end: Radius.circular(15)),
                  ),
                ),
                child: const Text(
                  'Free preview',
                  style: Styles.textStyle16Bold,
                )),
          ),
        ),
      ],
    );
  }
}
