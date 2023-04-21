import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views%20model/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                onChanged: (text) {
                  
                  BlocProvider.of<SearchCubit>(context)
                      .fetchSearchResults(text);
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Results",
                  style: Styles.titleMedium,
                ),
              ),
              Expanded(child: searchStateWidget(state)),
            ],
          ),
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.onChanged}) : super(key: key);
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: "Search",
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.search_rounded))),
    );
  }
}

Widget searchStateWidget(SearchState state) {
  if (state is SearchSuccess) {
    return SearchListView(
      books: state.books,
    );
  } else if (state is SearchFailure) {
    return const Center(child: Icon(Icons.error_outline));
  } else if (state is SearchInitial ) {
    return const Center(child: Text("Start Search"));
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}
