import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBookDetailsButton extends StatelessWidget {
  const CustomBookDetailsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.horizontal(
                        start: Radius.circular(15)),
                  ),
                ),
                child: const Text(
                  '19.99 €',
                  style: Styles.textStyle18Bold,
                )),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
                onPressed: () {},
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
