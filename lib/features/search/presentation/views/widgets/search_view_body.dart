import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomTextField(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Results",
              style: Styles.titleMedium,
            ),
          ),
          Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.search_rounded))),
    );
  }
}
